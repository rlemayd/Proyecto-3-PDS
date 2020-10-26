extends Node2D

onready var grid = $Map
onready var player = preload("res://Game/player/Player.tscn").instance()
onready var http = $HTTPRequest
onready var http2 = $HTTPRequest2
onready var button = $Button
var camera

var greenPlayer = load("res://Game/player/Sprites/GreenPlayer.png")
var bluePlayer = load("res://Game/player/Sprites/BluePlayer.png")
var redPlayer = load("res://Game/player/Sprites/RedPlayer.png")
var yellowPlayer = load("res://Game/player/Sprites/YellowPlayer.png")
var orangePlayer = load("res://Game/player/Sprites/OrangePlayer.png")

var players = {}

var gameStarted = Background.currentGameData["isGameStarted"]["booleanValue"]

var request = ""
var request2 = ""
var last_position

var pastColor = 0

var _timer = null
var _timer2 = null

var colors = [ColorN("darkgreen",1),ColorN("blue",1),ColorN("darkred",1),ColorN("yellow",1),ColorN("orange",1)]

# Called when the node enters the scene tree for the first time.
func _ready():
	loadMap()
	if gameStarted:
		loadPlayers("started")
	else:
		loadPlayers()
	loadMyself()
	
	changeBackgroundColor()
	
	if(int(Background.currentColor) == 1 and !gameStarted):
		button.disabled = false
		button.visible = true
	button.set_position(Vector2(-456,-156))
	
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(5.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

func _on_Timer_timeout():
	if gameStarted:
		print(Background.currentColor)
		checkTurn()
	else:
		checkPlayers()

func changeBackgroundColor():
	VisualServer.set_default_clear_color(colors[int(Background.currentGameData.currentTurn.integerValue)-1])

func loadMap():
	for i in Background.currentMap.keys():
		for j in Background.currentMap[i]["mapValue"]["fields"]:
			var color = Background.currentMap[i]["mapValue"]["fields"][j]["mapValue"]["fields"]["color"].values()[0]
			grid.set_cell(int(i),int(j),grid.tile_set.find_tile_by_name(String(color)))

func loadPlayers(flag = ""):
	var sprite
	if Background.currentPlayers:
		for npc in Background.currentPlayers.keys():
			if npc in players.keys():
				continue
			if int(npc) == int(Background.currentColor):
				continue
			var NPC = preload("res://Game/player/NPC.tscn").instance()
			players[npc] = NPC
			add_child(NPC)
			for child in NPC.get_children():
				if child is Sprite:
					sprite = child
			match int(npc):
				1:
					sprite.texture = greenPlayer
				2:
					sprite.texture = bluePlayer
				3:
					sprite.texture = redPlayer
				4:
					sprite.texture = yellowPlayer
				5:
					sprite.texture = orangePlayer
			NPC.position = grid.map_to_world(Vector2(Background.currentPlayers[npc][0],Background.currentPlayers[npc][1]))
			grid.set_cellv(grid.world_to_map(NPC.position), grid.tile_set.find_tile_by_name(String(npc)))
			Background.currentMap[String(Background.currentPlayers[npc][0])]["mapValue"]["fields"][String(Background.currentPlayers[npc][1])]["mapValue"]["fields"]["color"]["integerValue"] = npc
			if flag == "":
				Background.currentGameData[Background.cellColors[int(npc)]]["integerValue"] = int(Background.currentGameData[Background.cellColors[int(npc)]]["integerValue"]) + 1
				Background.currentGameData[Background.cellColors[0]]["integerValue"] = int(Background.currentGameData[Background.cellColors[0]]["integerValue"]) - 1
	
func loadMyself():
	var sprite
	for child in player.get_children():
		if child is Camera2D:
			camera = child
		elif child is Sprite:
			sprite = child
	
	match int(Background.currentColor):
		1:
			sprite.texture = greenPlayer
		2:
			sprite.texture = bluePlayer
		3:
			sprite.texture = redPlayer
		4:
			sprite.texture = yellowPlayer
		5:
			sprite.texture = orangePlayer
	player.position = grid.map_to_world(Background.currentPosition)
	grid.set_cellv(grid.world_to_map(player.position), grid.tile_set.find_tile_by_name(String(Background.currentColor)))
	changeMap(Background.currentPosition)
	self.add_child(player)

func movePlayers():
	for player in Background.currentPlayers.keys():
		if player in players.keys():
			players[player].position = grid.map_to_world(Vector2(Background.currentPlayers[player][0],Background.currentPlayers[player][1]))
			grid.set_cellv(grid.world_to_map(players[player].position), grid.tile_set.find_tile_by_name(String(player)))
			Background.currentMap[String(Background.currentPlayers[player][0])]["mapValue"]["fields"][String(Background.currentPlayers[player][1])]["mapValue"]["fields"]["color"]["integerValue"] = player

func _input(event):
	if int(Background.currentGameData["currentTurn"]["integerValue"]) == int(Background.currentColor) and gameStarted:
		var player_position = grid.world_to_map(player.global_position)
		if event is InputEventMouseButton and event.pressed:
		#if event is InputEventScreenTouch and event.pressed:
			var touched_position = grid.world_to_map(camera.to_global(event.position-Vector2(512,288)))
			# If the player is pressing a tile near the player
			if player_position.distance_to(touched_position) < 2 and player_position.distance_to(touched_position) != 0 and grid.tile_set.tile_get_name(grid.get_cellv(touched_position)) and checkPosition(touched_position):
				player.position = grid.map_to_world(touched_position)
				grid.set_cellv(touched_position, grid.tile_set.find_tile_by_name(String(Background.currentColor)))
				last_position = touched_position
				endTurn()


func checkPosition(position:Vector2):
	return !Background.currentPlayers.values().has([String(position.x),String(position.y)])

func changeMap(position:Vector2):
	Background.currentMap[String(position.x)]["mapValue"]["fields"][String(position.y)]["mapValue"]["fields"]["color"]["integerValue"] = Background.currentColor
	request = "change_map"
	FireBase.update_document("Games/%s/Map/Cells" % Background.currentGameCode, Background.currentMap, http)

func changePosition(position:Vector2):
	Background.currentPlayerData["position"]["arrayValue"]["values"][0]["integerValue"] = position.x
	Background.currentPlayerData["position"]["arrayValue"]["values"][1]["integerValue"] = position.y
	request = "change_position"
	FireBase.update_document("Games/%s/Participants/%s" % [Background.currentGameCode, FireBase.profile.email], Background.currentPlayerData, http)
	
func endTurn():
	Background.currentGameData["currentTurn"]["integerValue"] = (int(Background.currentGameData["currentTurn"]["integerValue"]) % int(Background.currentGameData["playerQuantity"]["integerValue"])) + 1
	changeBackgroundColor()
	pastColor = Background.currentMap[String(last_position.x)]["mapValue"]["fields"][String(last_position.y)]["mapValue"]["fields"]["color"]["integerValue"]
	Background.currentGameData[Background.cellColors[int(Background.currentColor)]]["integerValue"] = int(Background.currentGameData[Background.cellColors[int(Background.currentColor)]]["integerValue"]) + 1
	Background.currentGameData[Background.cellColors[int(pastColor)]]["integerValue"] = int(Background.currentGameData[Background.cellColors[int(pastColor)]]["integerValue"]) - 1
	if int(Background.currentGameData[Background.cellColors[0]]["integerValue"]) == 0:
		finishGame()
	request = "end_turn"
	FireBase.update_document("Games/%s/Map/Info" % Background.currentGameCode, Background.currentGameData, http)
	
func checkTurn():
	request2 = "check_turn"
	FireBase.get_document("Games/%s/Map/Info" % Background.currentGameCode, http2)

func checkPlayers():
	request2 = "check_players"
	FireBase.get_document("Games/%s/Participants" % Background.currentGameCode, http2)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body = JSON.parse(body.get_string_from_ascii())
	print(request, response_code)
	if request == "end_turn":
		if response_code == 200:
			changePosition(last_position)
	elif request == "change_position":
		if response_code == 200:
			changeMap(last_position)
	elif request == "updateGameData":
		if response_code == 200:
			gameStarted = true
			button.visible = false
			button.disabled = true
	elif request == "checkStateGame":
		if response_code == 200:
			if response_body.result.fields.isGameStarted.booleanValue:
				print(response_body.result.fields.isGameStarted.booleanValue)
				Background.currentGameData["isGameStarted"]["booleanValue"] = true
				gameStarted = true
	elif request == "finish_game":
		if response_code == 200:
			checkWinner()

func finishGame():
	Background.currentGameData["isGameFinished"]["booleanValue"] = true
	Background.currentGameData["currentTurn"]["integerValue"] = -1
	request = "finish_game"
	FireBase.update_document("Games/%s/Map/Info" % Background.currentGameCode, Background.currentGameData, http)
	
func checkWinner():
	var maxValue = 0
	var winner = []
	for i in [1,2,3,4,5]:
		if int(Background.currentGameData[Background.cellColors[i]]["integerValue"]) > maxValue:
			maxValue = int(Background.currentGameData[Background.cellColors[i]]["integerValue"])
			winner = [i]
		elif int(Background.currentGameData[Background.cellColors[i]]["integerValue"]) == maxValue:
			winner.append(i)
	if int(Background.currentColor) in winner:
		if winner.size() == 1:
			print("GANADOR")
			player.showWinner()
		else:
			print("EMPATE")
			player.showTie()
	else:
		print("PERDEDOR")
		player.showLoser()
	_timer.disconnect("timeout", self, "_on_Timer_timeout")
	_timer2 = Timer.new()
	add_child(_timer2)
	_timer2.connect("timeout", self, "_on_Timer2_timeout")
	_timer2.set_wait_time(5.0)
	_timer2.set_one_shot(true)
	_timer2.start()

func _on_Timer2_timeout():
	deleteGame()
	
	
func deleteGame():
	Background.currentGames.erase(String(Background.currentGameCode))
	request2 = "delete_game"
	FireBase.update_document("MyGames/%s" % FireBase.profile.email, Background.currentGames, http2)

func _on_HTTPRequest2_request_completed(result, response_code, headers, body):
	var response_body = JSON.parse(body.get_string_from_ascii())
	print(request2)
	if request2 == "check_turn":
		if response_code == 200:
			if response_body.result.fields.isGameFinished.booleanValue:
				checkWinner()
			elif int(response_body.result.fields.currentTurn.integerValue) != int(Background.currentGameData["currentTurn"]["integerValue"]):
				Background.currentGameData = response_body.result.fields
				changeBackgroundColor()
				request2 = "get_players"
				FireBase.get_document("Games/%s/Participants" % Background.currentGameCode, http2)
	elif request2 == "get_players":
		if response_code == 200:
			var players = {}
			for player in response_body.result.documents:
				var player_pos = [player.fields.position.arrayValue.values[0].integerValue,player.fields.position.arrayValue.values[1].integerValue]
				players[player.fields.color.integerValue] = player_pos
			Background.currentPlayers = players
			movePlayers()
	elif request2 == "check_players":
		if response_code == 200:
			if Background.currentPlayers.size() < response_body.result.documents.size():
				print(response_code)
				var players = {}
				for player in response_body.result.documents:
					var player_pos = [player.fields.position.arrayValue.values[0].integerValue,player.fields.position.arrayValue.values[1].integerValue]
					players[player.fields.color.integerValue] = player_pos
					
				Background.currentPlayers = players
				loadPlayers()
			if int(Background.currentColor) != 1:
				checkIfGameHasStarted()
	elif request2 == "delete_game":
		if response_code == 200:
			get_tree().change_scene("res://Menus/LoggedMainMenu.tscn")

func _on_Button_pressed():
	print(Background.currentPlayers.size())
	if Background.currentPlayers.size() > 2:
		Background.currentGameData["isGameStarted"]["booleanValue"] = true
		Background.currentGameData["playerQuantity"]["integerValue"] = Background.currentPlayers.size()
		request = "updateGameData"
		FireBase.update_document("Games/%s/Map/Info" % Background.currentGameCode, Background.currentGameData, http)
		
func checkIfGameHasStarted():
	request = "checkStateGame"
	FireBase.get_document("Games/%s/Map/Info" % Background.currentGameCode, http)

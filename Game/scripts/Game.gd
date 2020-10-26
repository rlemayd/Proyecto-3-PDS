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
var last_position
var response_body = {}

var _timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	loadMap()
	loadPlayers()
	loadMyself()
	
	if(int(Background.currentColor) == 1):
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
		checkTurn()
	else:
		checkPlayers()

func loadMap():
	for i in Background.currentMap.keys():
		for j in Background.currentMap[i]["mapValue"]["fields"]:
			var color = Background.currentMap[i]["mapValue"]["fields"][j]["mapValue"]["fields"]["color"].values()[0]
			grid.set_cell(int(i),int(j),grid.tile_set.find_tile_by_name(String(color)))

func loadPlayers():
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
	request = "end_turn"
	FireBase.update_document("Games/%s/Map/Info" % Background.currentGameCode, Background.currentGameData, http)
	
func checkTurn():
	request = "check_turn"
	FireBase.get_document("Games/%s/Map/Info" % Background.currentGameCode, http2)

func checkPlayers():
	request = "check_players"
	FireBase.get_document("Games/%s/Participants" % Background.currentGameCode, http2)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body = JSON.parse(body.get_string_from_ascii())
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
	


func _on_HTTPRequest2_request_completed(result, response_code, headers, body):
	var response_body = JSON.parse(body.get_string_from_ascii())
	if request == "check_turn":
		if response_code == 200:
			if int(response_body.result.fields.currentTurn.integerValue) != int(Background.currentGameData["currentTurn"]["integerValue"]):
				Background.currentGameData = response_body.result.fields
				request = "get_players"
				FireBase.get_document("Games/%s/Participants" % Background.currentGameCode, http2)
	elif request == "get_players":
		if response_code == 200:
			var players = {}
			for player in response_body.result.documents:
				var player_pos = [player.fields.position.arrayValue.values[0].integerValue,player.fields.position.arrayValue.values[1].integerValue]
				players[player.fields.color.integerValue] = player_pos
			Background.currentPlayers = players
			movePlayers()
	elif request == "check_players":
		if response_code == 200:
			if Background.currentPlayers.size() < response_body.result.documents.size():
				var players = {}
				for player in response_body.result.documents:
					var player_pos = [player.fields.position.arrayValue.values[0].integerValue,player.fields.position.arrayValue.values[1].integerValue]
					players[player.fields.color.integerValue] = player_pos
					
				Background.currentPlayers = players
				loadPlayers()
				if int(Background.currentColor) != 1:
					checkIfGameHasStarted()
	elif request == "checkStateGame":
		if response_code == 200:
			if response_body.result.fields.isGameStarted.booleanValue:
				Background.currentGameData["isGameStarted"]["booleanValue"] = true
				gameStarted = true

func _on_Button_pressed():
	print(Background.currentPlayers.size())
	if Background.currentPlayers.size() > 1:
		Background.currentGameData["isGameStarted"]["booleanValue"] = true
		Background.currentGameData["playerQuantity"]["integerValue"] = Background.currentPlayers.size()
		request = "updateGameData"
		FireBase.update_document("Games/%s/Map/Info" % Background.currentGameCode, Background.currentGameData, http)
		
func checkIfGameHasStarted():
	request = "checkStateGame"
	FireBase.get_document("Games/%s/Map/Info" % Background.currentGameCode, http2)

extends Node2D

onready var grid = $Map
onready var player = preload("res://Game/player/Player.tscn").instance()
onready var http = $HTTPRequest
var camera

var greenPlayer = load("res://Game/player/Sprites/GreenPlayer.png")
var bluePlayer = load("res://Game/player/Sprites/BluePlayer.png")
var redPlayer = load("res://Game/player/Sprites/RedPlayer.png")
var yellowPlayer = load("res://Game/player/Sprites/YellowPlayer.png")
var orangePlayer = load("res://Game/player/Sprites/OrangePlayer.png")


var request = ""
var response_body = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	loadMap()
	loadPlayers()
	loadMyself()

func loadMap():
	for i in Background.currentMap.keys():
		for j in Background.currentMap[i]["mapValue"]["fields"]:
			var color = Background.currentMap[i]["mapValue"]["fields"][j]["mapValue"]["fields"]["color"].values()[0]
			grid.set_cell(int(i),int(j),grid.tile_set.find_tile_by_name(String(color)))

func loadPlayers():
	var sprite
	for npc in Background.currentPlayers.keys():
		if npc == Background.currentColor:
			continue
		print(npc)
		var NPC = preload("res://Game/player/NPC.tscn").instance()
		self.add_child(NPC)
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


func _input(event):
	var player_position = grid.world_to_map(player.global_position)
	if event is InputEventMouseButton and event.pressed:
	#if event is InputEventScreenTouch and event.pressed:
		var touched_position = grid.world_to_map(camera.to_global(event.position-Vector2(512,288)))
		# If the player is pressing a tile near the player
		if player_position.distance_to(touched_position) < 2 and player_position.distance_to(touched_position) != 0 and grid.tile_set.tile_get_name(grid.get_cellv(touched_position)) and checkPosition(touched_position):
			player.position = grid.map_to_world(touched_position)
			grid.set_cellv(touched_position, grid.tile_set.find_tile_by_name(String(Background.currentColor)))
			changeMap(touched_position)


func checkPosition(position:Vector2):
	return !Background.currentPlayers.values().has([String(position.x),String(position.y)])

func changeMap(position:Vector2):
	Background.currentMap[String(position.x)]["mapValue"]["fields"][String(position.y)]["mapValue"]["fields"]["color"]["integerValue"] = Background.currentColor
	FireBase.update_document("Games/%s/Map/Cells" % Background.currentGameCode, Background.currentMap, http)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	pass # Replace with function body.

extends Node2D

onready var grid = $Map
onready var player = $Player
onready var camera = $Player/Camera2D


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
	pass
	
func loadMyself():
	print("pos1:",Background.currentPosition)
	print("pos2:",grid.map_to_world(Background.currentPosition))
	player.position = grid.map_to_world(Background.currentPosition)
	grid.set_cellv(grid.world_to_map(player.position), grid.tile_set.find_tile_by_name(String(Background.currentColor)))


func _input(event):
	var player_position = grid.world_to_map(player.global_position)
	if event is InputEventMouseButton and event.pressed:
	#if event is InputEventScreenTouch and event.pressed:
		var touched_position = grid.world_to_map(camera.to_global(event.position-Vector2(512,288)))
		# If the player is pressing a tile near the player
		if player_position.distance_to(touched_position) < 2 and player_position.distance_to(touched_position) != 0 and grid.tile_set.tile_get_name(grid.get_cellv(touched_position)):
			player.position = grid.map_to_world(touched_position)
			# So it paints only the white squares
			#if grid.tile_set.tile_get_name(grid.get_cellv(touched_position)) == "white":
			grid.set_cellv(touched_position, grid.tile_set.find_tile_by_name(String(Background.currentColor)))

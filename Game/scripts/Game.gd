extends Node2D


onready var grid = $Map
onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	grid.set_cellv(grid.world_to_map(player.position), grid.tile_set.find_tile_by_name("yellow"))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	var player_position = grid.world_to_map(player.global_position)
	if event is InputEventMouseButton:
	#if event is InputEventScreenTouch:
		var touched_position = grid.world_to_map(event.position)
		# If the player is pressing a tile near the player
		if player_position.distance_to(touched_position) < 2 and player_position.distance_to(touched_position) != 0 and grid.tile_set.tile_get_name(grid.get_cellv(touched_position)):
			player.position = grid.map_to_world(touched_position)
			print(grid.get_used_cells())
			# So it paints only the white squares
			#if grid.tile_set.tile_get_name(grid.get_cellv(touched_position)) == "white":
			grid.set_cellv(touched_position, grid.tile_set.find_tile_by_name("yellow"))
			
		

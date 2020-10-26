extends Panel

onready var PlayerPressed := $NameFriendLabel

func _on_Button_pressed():
	
	Background.playerPressed = PlayerPressed.text
	get_tree().change_scene("res://Menus/PlayerStats.tscn")

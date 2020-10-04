extends Control



func _on_RegisterButton_pressed() -> void:
	get_tree().change_scene("res://Menus/RegisterMenu.tscn")


func _on_LoginButton_pressed():
	get_tree().change_scene("res://Menus/LogInMenu.tscn")

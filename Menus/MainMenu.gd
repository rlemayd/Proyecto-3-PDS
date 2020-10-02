extends Control

func _on_LogInButton_pressed() -> void:
	get_tree().change_scene("res://Menus/LogInMenu.tscn")


func _on_RegisterButton_pressed() -> void:
	get_tree().change_scene("res://Menus/RegisterMenu.tscn")

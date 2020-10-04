extends Control



func _on_Button_pressed():
	get_tree().change_scene("res://Menus/AddFriendMenu.tscn")


func _on_Notifications_pressed():
	get_tree().change_scene("res://Menus/NotificationsMenu.tscn")

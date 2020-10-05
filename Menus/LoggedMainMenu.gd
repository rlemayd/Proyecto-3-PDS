extends Control

onready var http = $HTTPRequest

func _on_NotificationsButton_pressed():
	get_tree().change_scene("res://Menus/NotificationsMenu.tscn")


func _on_AddFriendsButton_pressed():
	get_tree().change_scene("res://Menus/AddFriendMenu.tscn")


func _on_FriendsButton_pressed():
	get_tree().change_scene("res://Menus/FriendsMenu.tscn")



func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print(response_code)
	print(result)
	var response_body := JSON.parse(body.get_string_from_ascii())
	print(response_body)
	print(response_body.result)


func _on_test_pressed():
	FireBase.test(http)

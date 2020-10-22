extends Control

onready var http = $HTTPRequest
var request = ""
var rng = RandomNumberGenerator.new()
var my_random_number = 0

func _on_NotificationsButton_pressed():
	get_tree().change_scene("res://Menus/NotificationsMenu.tscn")


func _on_AddFriendsButton_pressed():
	get_tree().change_scene("res://Menus/AddFriendMenu.tscn")


func _on_FriendsButton_pressed():
	get_tree().change_scene("res://Menus/FriendsMenu.tscn")


func _on_ExitButton_pressed():
	get_tree().change_scene("res://Menus/MainMenu.tscn")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	

func _on_GamesButton_pressed():
	#Participants?documentId=%s" % FireBase.profile.email
	get_tree().change_scene("res://Menus/GamesMenu.tscn")
	#get_tree().change_scene("res://Game/scenes/Game.tscn")

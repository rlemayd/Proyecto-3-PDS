extends Control

onready var http = $HTTPRequest
var request = ""

func _ready():
	request = "get_stats"
	FireBase.get_document("users/%s" % FireBase.profile.email, http)

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
	if request == "get_stats":
		FireBase.profile.stats = response_body.result.fields
		print(FireBase.profile.stats)
	

func _on_GamesButton_pressed():
	#Participants?documentId=%s" % FireBase.profile.email
	get_tree().change_scene("res://Menus/GamesMenu.tscn")
	#get_tree().change_scene("res://Game/scenes/Game.tscn")


func _on_StatsButton_pressed():
	Background.playerPressed = FireBase.profile.email
	get_tree().change_scene("res://Menus/PlayerStats.tscn")

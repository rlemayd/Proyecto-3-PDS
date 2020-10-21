extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var ReciclerView := $UI/VBoxContainer/GamesScrollBox
var request = ""

func _ready():
	pass

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://Menus/LoggedMainMenu.tscn")


func _on_NewGameButton_pressed():
	pass # Replace with function body.

extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var username : LineEdit = $VBoxContainer/VBoxContainer2/UsernameContainer/LineEdit
onready var password : LineEdit = $VBoxContainer/VBoxContainer2/PasswordContainer/LineEdit
onready var notification : Label = $VBoxContainer/notification



func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		notification.text = response_body.result.error.message.capitalize()
	else:
		get_tree().change_scene("res://Menus/LoggedMainMenu.tscn")
		


func _on_LogInButton_pressed():
	if username.text.empty() or password.text.empty():
		notification.text = "Please, enter your username and password"
		return
	FireBase.login(username.text, password.text, http)

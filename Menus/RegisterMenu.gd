extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var username : LineEdit = $VBoxContainer/VBoxContainer2/UsernameContainer/LineEdit
onready var password : LineEdit = $VBoxContainer/VBoxContainer2/PasswordContainer/LineEdit
onready var confirm : LineEdit = $VBoxContainer/VBoxContainer2/ConfirmPasswordContainer/LineEdit
onready var notification : Label = $VBoxContainer/notification

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		notification.text = response_body.result.error.message.capitalize()
		print(response_body.result.error.message.capitalize())
	else:
		notification.text = "Registration sucessful!"
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://Menus/LogInMenu.tscn")


func _on_RegisterButton_pressed():
	if password.text != confirm.text or username.text.empty() or password.text.empty():
		notification.text = "Invalid password or username"
		return
	FireBase.register(username.text, password.text, http)


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Menus/MainMenu.tscn")

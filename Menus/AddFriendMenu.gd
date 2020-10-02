extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var email : LineEdit = $UI/VBoxContainer/HBoxContainer/LineEdit
onready var notification : Label = $UI/notification

func _on_Button_pressed():
	if email.text.empty():
		notification.text = "Invalid password or username"
		return
	print(email.text)
	FireBase.get_document("users/%s" % email.text, http)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	print(response_body)
	print(response_code)
	print(result)
	if response_code != 200:
		notification.text = "User not found"
	else:
		notification.text = "Friend request sent!"

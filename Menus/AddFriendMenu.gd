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
	print(result)
	print(headers)
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		print(response_code)
		notification.text = "User not found"
	else:
		var prof := {
			"email": {}
		}
		prof.email = {"stringValue": FireBase.profile.email}
		FireBase.save_document("friendRequests?documentId=%s" % email.text, prof, http)
		notification.text = "Friend request sent!"

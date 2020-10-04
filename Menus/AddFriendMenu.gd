extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var email : LineEdit = $UI/VBoxContainer/HBoxContainer/LineEdit
onready var notification : Label = $UI/notification

var request = ""

func _on_Button_pressed():
	if email.text.empty():
		notification.text = "Invalid password or username"
		return
	request = "get_user"
	FireBase.get_document("users/%s" % email.text, http)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print(response_code)
	var response_body := JSON.parse(body.get_string_from_ascii())
	if request == "send_request":
		if response_code != 200:
			var prof := {
				"email": {}
			}
			prof.email = {"stringValue": FireBase.profile.email}
			request = "send_request"
			FireBase.save_document("friendRequests?documentId=%s" % email.text,{}, http)
		else:
			var prof := {
				"email": {}
			}
			prof.email = {"stringValue": FireBase.profile.email}
			request = "save_document"
			FireBase.save_document("friendRequests/%s/%s" % [email.text,FireBase.profile.email],{}, http)
			notification.text = "Friend request sent!"
	elif request == "get_user":
		if response_code != 200:
			notification.text = "User not found"
		else:
			request = "send_request"
			FireBase.get_document("friendRequests/%s" % email.text, http)

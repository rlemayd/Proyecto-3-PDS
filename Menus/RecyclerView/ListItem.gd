extends Panel

onready var http = $HTTPRequest
onready var requestEmail = $NameFriendReqLabel
onready var email = requestEmail.text

var request = ""

func _on_AceptarButton_pressed():
	request = "accept"
	FireBase.delete_document("friendRequests/%s/%s/%s"%[FireBase.profile.email,email,email],http)
	

func _on_RechazarButton_pressed():
	var email = requestEmail.text
	request = "delete"
	FireBase.delete_document("friendRequests/%s/%s/%s"%[FireBase.profile.email,email,email],http)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if request == "delete":
		print(response_code)
		print(response_body.result)
		queue_free()
	elif request == "accept":
		if response_code == 200:
			request = "save_acceptant"
			FireBase.save_document("friends?documentId=%s" % email,{}, http)
	
	elif request == "save_acceptant":
		request = "recieve"
		FireBase.save_document("friends/%s/%s?documentId=%s" % [email,FireBase.profile.email,FireBase.profile.email],{}, http)
	
	elif request == "recieve":
		if response_code == 200:
			request = "save_recipient"
			FireBase.save_document("friends?documentId=%s" % FireBase.profile.email,{}, http)
			
	elif request == "save_recipient":
		request = "END"
		FireBase.save_document("friends/%s/%s?documentId=%s" % [FireBase.profile.email,email,email],{}, http)
	elif request == "END":
		queue_free()
		
		
		
		
		

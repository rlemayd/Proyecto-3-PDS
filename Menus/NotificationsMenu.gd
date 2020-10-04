extends Control

onready var http : HTTPRequest = $HTTPRequest
var request = ""

func _ready():
	print(FireBase.profile.email)
	request = "get_document"
	FireBase.get_collections("friendRequests/%s" % FireBase.profile.email, http)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print("chao")
	var response_body := JSON.parse(body.get_string_from_ascii())
	if request == "get_document":
		print(response_body.result)

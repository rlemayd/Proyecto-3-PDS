extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var ReciclerView := $UI/VBoxContainer/HBoxContainer/Panel
var request = ""

func _ready():
	print(FireBase.profile.email)
	request = "get_document"
	FireBase.query("friendRequests/%s" % FireBase.profile.email, http)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	
	var response_body := JSON.parse(body.get_string_from_ascii())
	if request == "get_document":
		for item in response_body.result:
			ReciclerView.addItem(item["document"]["name"].split("/")[-2])

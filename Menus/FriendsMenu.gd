extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var ReciclerView := $UI/VBoxContainer/FriendsScrollBox
var request = ""

func _ready():
	request = "get_document"
	FireBase.query("friends/%s" % FireBase.profile.email, http)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if request == "get_document":
		var friends = response_body.result
		for item in friends:
			if(item.has("document")):
				ReciclerView.addItem(item["document"]["name"].split("/")[-2])

extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var ReciclerView := $UI/VBoxContainer/ScrollBox
var request = ""

func _ready():
	print(FireBase.profile.email)
	request = "get_document"
	FireBase.query("friendRequests/%s" % FireBase.profile.email, http)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if request == "get_document":
		var friendRequests = response_body.result
		for item in friendRequests:
			if(item.has("document")):
				ReciclerView.addItem(item["document"]["name"].split("/")[-2])


func _on_BackButton_pressed():
	get_tree().change_scene("res://Menus/LoggedMainMenu.tscn")

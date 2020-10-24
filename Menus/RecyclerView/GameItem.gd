extends Panel

onready var http : HTTPRequest = $HTTPRequest
var request = ""
var response_body = {}


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if request == "get map":
		if response_code == 200:
			response_body = JSON.parse(body.get_string_from_ascii())
			if(response_body.result.has("fields")):
				Background.currentMap = response_body.result.fields
				#TODO: CAMBIAR COLOR EN BACKGROUND
				get_tree().change_scene("res://Game/scenes/Game.tscn")
		else:
			response_body = JSON.parse(body.get_string_from_ascii())
			print("No:",response_body)


func _on_Button_pressed():
	var gameCode = $GameNameLabel.text
	print(gameCode)
	request = "get map"
	FireBase.get_document("Games/%s/Map/Cells"% gameCode, http)

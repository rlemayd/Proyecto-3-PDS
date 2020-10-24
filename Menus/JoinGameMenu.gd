extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var codeField : LineEdit = $UI/VBoxContainer/HBoxContainer/LineEdit
onready var notification : Label = $UI/notification

var request = ""




func _on_Button_pressed():
	if codeField.text.empty():
		notification.text = "Invalid Game Code"
		return
	request = "check_game"
	FireBase.get_document("Games/%s" % codeField.text, http)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print(response_code)
	print(request)
	var response_body := JSON.parse(body.get_string_from_ascii())
	if request == "check_game":
		if response_code != 200:
			notification.text = "Invalid Game Code"
		else:
			request = "check_my_games"
			FireBase.get_document("MyGames/%s/%s" % [FireBase.profile.email,codeField.text], http)
	elif request == "check_my_games":
		if response_code == 200:
			if response_body.result.has("fields"):
				if response_body.result.fields.has(codeField.text):
					notification.text = "you are already in the game"
				else:
					request = "check_participants"
					FireBase.get_document("Games/%s/Participants" % codeField.text, http)
			else:
				request = "check_participants"
				FireBase.get_document("Games/%s/Participants" % codeField.text, http)
	elif request == "check_participants":
		if response_code != 200:
			notification.text = "Error finding players"
		else:
			if response_body.result.documents.size() >= 5:
				notification.text = "Game is full"
			else:
				request = "save_me_as_participant"
				var myColor = response_body.result.documents.size()+1
				Background.currentColor = myColor
				var dict = {
					"color": {
						"integerValue": myColor
						},
					"inTurn": {
						"booleanValue": false
					},
					"position": {"arrayValue": {
							"values": [
								{
								  "integerValue": Background.positions[myColor-1][0]
								},
								{
								  "integerValue": Background.positions[myColor-1][1]
								}
							  ]
							}
						}
				}
				Background.currentPosition = Vector2(Background.positions[myColor-1][0],Background.positions[myColor-1][1])
				FireBase.save_document("Games/%s/Participants?documentId=%s" % [codeField.text, FireBase.profile.email],dict, http)
				
	elif request == "save_me_as_participant":
		if response_code == 200:
			request = "See_If_Has_More_Games"
			FireBase.get_document("MyGames/%s" % FireBase.profile.email, http)
			
	elif request == "See_If_Has_More_Games":
		#We update or save the code of the game to the user
		if response_code == 200:
			request = "save_my_game"
			response_body = JSON.parse(body.get_string_from_ascii())
			if response_body.result.has("fields"):
				response_body.result.fields[int(codeField.text)] = {"integerValue": int(codeField.text)}
				FireBase.update_document("MyGames/%s" % FireBase.profile.email, response_body.result.fields, http)
			else:
				FireBase.update_document("MyGames/%s" % FireBase.profile.email, {int(codeField.text):{"integerValue": int(codeField.text)}}, http)
		else:
			request = "save_my_game"
			FireBase.save_document("MyGames/%s" % FireBase.profile.email, {int(codeField.text):{"integerValue": int(codeField.text)}}, http)
	
	
	elif request == "save_my_game":
		if response_code != 200:
			notification.text = "Error saving game"
		else:
			request = "get_map"
			FireBase.get_document("Games/%s/Map/Cells"% codeField.text, http)
	elif request == "get_map":
		if response_code == 200:
			response_body = JSON.parse(body.get_string_from_ascii())
			print(response_body.result)
			if(response_body.result.has("fields")):
				print("chao")
				Background.currentMap = response_body.result.fields
				#TODO: CAMBIAR COLOR EN BACKGROUND
				get_tree().change_scene("res://Game/scenes/Game.tscn")
		else:
			notification.text = "Error getting map"


func _on_BackButton_pressed():
	get_tree().change_scene("res://Menus/GamesMenu.tscn")

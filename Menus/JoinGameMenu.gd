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
					request = "get_map_info"
					FireBase.get_document("Games/%s/Map/Info" % codeField.text, http)
			else:
				request = "get_map_info"
				FireBase.get_document("Games/%s/Map/Info" % codeField.text, http)
				
	elif request == "get_map_info":
		if response_code == 200:
			response_body = JSON.parse(body.get_string_from_ascii())
			Background.currentGameData = response_body.result.fields
			request = "check_participants"
			FireBase.get_document("Games/%s/Participants" % codeField.text, http)
	elif request == "check_participants":
		if response_code != 200:
			notification.text = "Error finding players"
		else:
			if response_body.result.documents.size() >= int(Background.currentGameData["playerQuantity"]["integerValue"]):
				notification.text = "Game is full"
			else:
				request = "save_me_as_participant"
				var myColor = response_body.result.documents.size()+1
				Background.currentColor = myColor
				var dict = {
					"color": {
						"integerValue": myColor
						},
					"position": {"arrayValue": {
							"values": [
								{
								  "integerValue": Background.positions[myColor-2][0]
								},
								{
								  "integerValue": Background.positions[myColor-2][1]
								}
							  ]
							}
						}
				}
				Background.currentPlayerData = dict
				Background.currentPosition = Vector2(Background.positions[myColor-2][0],Background.positions[myColor-2][1])
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
			if(response_body.result.has("fields")):
				Background.currentMap = response_body.result.fields
				request = "get_players"
				FireBase.get_document("Games/%s/Participants" % codeField.text, http)
		else:
			notification.text = "Error getting map"
	elif request == "get_players":
		if response_code == 200:
			response_body = JSON.parse(body.get_string_from_ascii())
			var players = {}
			for player in response_body.result.documents:
				var player_pos = [player.fields.position.arrayValue.values[0].integerValue,player.fields.position.arrayValue.values[1].integerValue]
				players[player.fields.color.integerValue] = player_pos
				
			Background.currentPlayers = players
			Background.currentGameCode = codeField.text
			get_tree().change_scene("res://Game/scenes/Game.tscn")

func _on_BackButton_pressed():
	get_tree().change_scene("res://Menus/GamesMenu.tscn")

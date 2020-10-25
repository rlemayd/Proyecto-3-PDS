extends Panel

onready var http : HTTPRequest = $HTTPRequest
var request = ""
var response_body = {}
var gameCode


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if request == "get map":
		if response_code == 200:
			response_body = JSON.parse(body.get_string_from_ascii())
			if(response_body.result.has("fields")):
				Background.currentMap = response_body.result.fields
				request = "get_player_color"
				FireBase.get_document("Games/%s/Participants/%s"% [gameCode,FireBase.profile.email], http)
				
		else:
			response_body = JSON.parse(body.get_string_from_ascii())
			print("No:",response_body)
	elif request == "get_player_color":
		if response_code == 200:
			response_body = JSON.parse(body.get_string_from_ascii())
			if response_body.result.fields:
				Background.currentPlayerData = response_body.result.fields
			if response_body.result.fields.color.integerValue:
				Background.currentColor = response_body.result.fields.color.integerValue
			if response_body.result.fields.position.arrayValue:
				var values = response_body.result.fields.position.arrayValue.values
				Background.currentPosition = Vector2(values[0].integerValue,values[1].integerValue)
				request = "get_players"
				FireBase.get_document("Games/%s/Participants" % gameCode, http)
		else:
			print("Error")
	elif request == "get_players":
		if response_code == 200:
			response_body = JSON.parse(body.get_string_from_ascii())
			var players = {}
			for player in response_body.result.documents:
				var player_pos = [player.fields.position.arrayValue.values[0].integerValue,player.fields.position.arrayValue.values[1].integerValue]
				players[player.fields.color.integerValue] = player_pos
				
			Background.currentPlayers = players
			Background.currentGameCode = gameCode
			request = "get_map_info"
			FireBase.get_document("Games/%s/Map/Info" % gameCode, http)
	elif request == "get_map_info":
		if response_code == 200:
			response_body = JSON.parse(body.get_string_from_ascii())
			Background.currentGameData = response_body.result.fields
			get_tree().change_scene("res://Game/scenes/Game.tscn")


func _on_Button_pressed():
	gameCode = $GameNameLabel.text
	print(gameCode)
	request = "get map"
	FireBase.get_document("Games/%s/Map/Cells"% gameCode, http)

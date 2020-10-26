extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var ReciclerView := $UI/VBoxContainer/GamesScrollBox
var request = ""
var rng = RandomNumberGenerator.new()
var my_random_number = 0
var response_body = {}

func _ready():
	request = "get_all_current_games"
	FireBase.get_document("MyGames/%s" % FireBase.profile.email, http)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	# To set the games you're already playing
	response_body = JSON.parse(body.get_string_from_ascii())
	#print(response_code, response_body.result, request)
	if request == "get_all_current_games":
		# If there are games
		if response_code == 200:
			if(response_body.result.has("fields")):
				#print(response_body.result.fields)
				for item in response_body.result.fields:
					ReciclerView.addItem(String(item))
		# If you don't have games yet
		else:
			FireBase.save_document("MyGames?documentId=%s" % FireBase.profile.email,{}, http)
	elif request == "game_create":
		if response_code != 200:
			request = "game_id_checker"
			FireBase.save_document("Games?documentId=%s" % my_random_number,{}, http)
		else:
			rng.randomize()
			my_random_number = rng.randi_range(0, 99999999)
			FireBase.get_document("Games/%s/" % my_random_number, http)
	elif request == "game_id_checker":
		#Create the game with the participants first
		var hour = OS.get_time()
		var ghour = String(hour.hour) +":"+ String(hour.minute) +":"+ String(hour.second)
		
		var fields = {
			"color": {"integerValue": 1},
			"position": {"arrayValue": {
				"values": [
					{
					  "integerValue": 1
					},
					{
					  "integerValue": 1
					}
				  ]
				}
			}
		}
		Background.currentPosition = Vector2(1,1)
		Background.currentPlayerData = fields
		request = "Create_New_Game"
		FireBase.save_document("Games/%s/Participants?documentId=%s" % [my_random_number, FireBase.profile.email], fields, http)
	elif request == "Create_New_Game":
		# Create the map in the db
		if response_code == 200:
			request = "Set_Variables_Of_Game"
			
			FireBase.save_document("Games/%s/Map?documentId=%s" % [my_random_number, "Cells"], Background.getMap(), http)
	elif request == "Set_Variables_Of_Game":
		#Set the variables of the game
		if response_code == 200:
			var fields = {
					"totalCells": {"integerValue": 25},
					"whiteCells": {"integerValue": 25},
					"greenCells": {"integerValue": 0},
					"blueCells": {"integerValue": 0},
					"redCells": {"integerValue": 0},
					"yellowCells": {"integerValue": 0},
					"orangeCells": {"integerValue": 0},
					"currentTurn": {"integerValue": 1},
					"playerQuantity": {"integerValue": 5},
					"isGameStarted": {"booleanValue": false}
				}
			Background.currentGameData = fields
			request = "Set_User_In_Game_DB"
			FireBase.save_document("Games/%s/Map?documentId=%s" % [my_random_number, "Info"], fields, http)
	elif request == "Set_User_In_Game_DB":
		#We set the game to the user
		if response_code == 200:
			request = "See_If_Has_More_Games"
			FireBase.get_document("MyGames/%s" % FireBase.profile.email, http)
		#
	elif request == "See_If_Has_More_Games":
		#We update or save the code of the game to the user
		if response_code == 200:
			request = "Added_User_To_Game"
			response_body = JSON.parse(body.get_string_from_ascii())
			if response_body.result.has("fields"):
				response_body.result.fields[my_random_number] = {"integerValue": my_random_number}
				FireBase.update_document("MyGames/%s" % FireBase.profile.email, response_body.result.fields, http)
			else:
				FireBase.update_document("MyGames/%s" % FireBase.profile.email, {my_random_number:{"integerValue": my_random_number}}, http)
		else:
			request = "Added_User_To_Game"
			FireBase.save_document("MyGames/%s" % FireBase.profile.email, {my_random_number:{"integerValue": my_random_number}}, http)
	elif request == "Added_User_To_Game":
		# Go to the game scene
		if response_code == 200:
			request = "Game_Started"
			Background.currentColor = 1
			Background.currentGameCode = my_random_number
			get_tree().change_scene("res://Game/scenes/Game.tscn")
	#print("HOLAAA ", " ", response_code, " ", request)


func _on_BackButton_pressed():
	get_tree().change_scene("res://Menus/LoggedMainMenu.tscn")


func _on_NewGameButton_pressed():
	request = "game_create"
	rng.randomize()
	my_random_number = rng.randi_range(0, 99999999)
	FireBase.get_document("Games/%s/" % my_random_number, http)


func _on_JoinGameButton_pressed():
	get_tree().change_scene("res://Menus/JoinGameMenu.tscn")

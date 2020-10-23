extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var ReciclerView := $UI/VBoxContainer/GamesScrollBox
var request = ""
var rng = RandomNumberGenerator.new()
var my_random_number = 0
var response_body = {}

func _ready():
	request = "get_users"
	FireBase.get_document("MyGames/%s" % FireBase.profile.email, http)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	# To set the games you're already playing
	if request == "get_users":
		# If there are games
		if response_code == 200:
			response_body = JSON.parse(body.get_string_from_ascii())
			if(response_body.result.has("fields")):
				print(response_body.result.fields)
		# If you don't have games yet
		else:
			FireBase.save_document("MyGames?documentId=%s" % FireBase.profile.email,{}, http)
	elif request == "game_id_checker":
		#Create the game with the participants first
		if response_code != 200:
			var hour = OS.get_time()
			var ghour = String(hour.hour) +":"+ String(hour.minute) +":"+ String(hour.second)
			print(ghour)
			var fields = {
				"inTurn": {"booleanValue": true},
				"color": {"integerValue": 1},
				#"position": {"geoPoint": [0,0]}
				#"time":  {"timeValue": ghour}
			}
			request = "creation"
			FireBase.save_document("Games/%s/Participants?documentId=%s" % [my_random_number, FireBase.profile.email], fields, http)
		else:
			rng.randomize()
			my_random_number = rng.randi_range(0, 99999999)
			FireBase.get_document("Games/%s/" % my_random_number, http)
	elif request == "creation":
		# Create the map in the db
		if response_code == 200:
			var fields = {
				"1": {
						"mapValue":
						{
							"fields":
							{
								"1": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 4},
												"power": {"integerValue": 3}
											}
										}
									},
								"2": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 4},
												"power": {"integerValue": 3}
											}
										}
									}
							}
						}
					},
				"2": {
						"mapValue":
						{
							"fields":
							{
								"1": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 4},
												"power": {"integerValue": 3}
											}
										}
									},
								"2": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 4},
												"power": {"integerValue": 3}
											}
										}
									}
							}
						}
					}
				}
			request = "finalReq"
			FireBase.save_document("Games/%s/Map?documentId=%s" % [my_random_number, "Cells"], fields, http)
	elif request == "finalReq":
		#Set the variables of the game
		if response_code == 200:
			var fields = {
					"totalCells": {"integerValue": 100},
					"blueCells": {"integerValue": 30},
					"redCells": {"integerValue": 39},
					"greenCells": {"integerValue": 20},
					"whiteCells": {"integerValue": 10},
					"yellowCells": {"integerValue": 1}
				}
			request = "setUserInDb"
			FireBase.save_document("Games/%s/Map?documentId=%s" % [my_random_number, "Info"], fields, http)
	elif request == "setUserInDb":
		#We set the game to the user
		if response_code == 200:
			request = "UserExists"
			FireBase.get_document("MyGames/%s" % FireBase.profile.email, http)
		#
	elif request == "UserExists":
		#We update or save the code of the game to the user
		if response_code == 200:
			request = "done"
			if response_body.result.has("fields"):
				response_body.result.fields[my_random_number] = {"integerValue": my_random_number}
				FireBase.update_document("MyGames/%s" % FireBase.profile.email, response_body.result.fields, http)
			else:
				FireBase.update_document("MyGames/%s" % FireBase.profile.email, {my_random_number:{"integerValue": my_random_number}}, http)
		else:
			request = "done"
			FireBase.save_document("MyGames/%s" % FireBase.profile.email, {my_random_number:{"integerValue": my_random_number}}, http)
	elif request == "done":
		# Go to the game scene
		if response_code == 200:
			get_tree().change_scene("res://Game/scenes/Game.tscn")
	print("HOLAAA ", " ", response_code, " ", request)


func _on_BackButton_pressed():
	get_tree().change_scene("res://Menus/LoggedMainMenu.tscn")


func _on_NewGameButton_pressed():
	request = "game_id_checker"
	rng.randomize()
	my_random_number = rng.randi_range(0, 99999999)
	FireBase.get_document("Games/%s/" % my_random_number , http)

extends Control

onready var http = $HTTPRequest
var request = ""
var rng = RandomNumberGenerator.new()
var my_random_number = 0

func _on_NotificationsButton_pressed():
	get_tree().change_scene("res://Menus/NotificationsMenu.tscn")


func _on_AddFriendsButton_pressed():
	get_tree().change_scene("res://Menus/AddFriendMenu.tscn")


func _on_FriendsButton_pressed():
	get_tree().change_scene("res://Menus/FriendsMenu.tscn")


func _on_ExitButton_pressed():
	get_tree().change_scene("res://Menus/MainMenu.tscn")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if (request == "game_id_checker"):
		if(response_code != 200):
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
	elif(request == "creation"):
		if(response_code == 200):
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
	elif(request == "finalReq"):
		if(response_code == 200):
			var fields = {
					"totalCells": {"integerValue": 100},
					"blueCells": {"integerValue": 30},
					"redCells": {"integerValue": 39},
					"greenCells": {"integerValue": 20},
					"whiteCells": {"integerValue": 10},
					"yellowCells": {"integerValue": 1}
				}
			request = "done"
			FireBase.save_document("Games/%s/Map?documentId=%s" % [my_random_number, "Info"], fields, http)
	elif(request == "done"):
		if(response_code == 200):
			get_tree().change_scene("res://Game/scenes/Game.tscn")
	print("HOLAAA ",result, " ", response_code, " ", body, my_random_number)

func _on_GamesButton_pressed():
	#Participants?documentId=%s" % FireBase.profile.email
	request = "game_id_checker"
	rng.randomize()
	my_random_number = rng.randi_range(0, 99999999)
	FireBase.get_document("Games/%s/" % my_random_number , http)
	#get_tree().change_scene("res://Menus/GamesMenu.tscn")
	#get_tree().change_scene("res://Game/scenes/Game.tscn")

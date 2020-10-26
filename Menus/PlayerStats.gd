extends Control

onready var PlayerLabel := $UI/Title
onready var http = $HTTPRequest
onready var avg_label = $UI/VBoxContainer/HBoxContainer/AvgPaint_Match_Label
onready var tot_cells = $UI/VBoxContainer/HBoxContainer2/Total_Cells_painted_Label
onready var tot_lost = $UI/VBoxContainer/HBoxContainer3/Matches_Lost_Label
onready var tot_wins = $UI/VBoxContainer/HBoxContainer4/Matches_Won_Label
onready var tot_ties = $UI/VBoxContainer/HBoxContainer5/Matches_Tied_Label
onready var max_cells_painted = $UI/VBoxContainer/HBoxContainer6/Max_Painting_In_A_Match_Label
onready var color_with_more_wins = $UI/VBoxContainer/HBoxContainer7/Best_Color_Label


var request = ""


func _ready():
	PlayerLabel.text = Background.playerPressed
	request = "get_stats"
	FireBase.get_document("users/%s" %Background.playerPressed , http)


func _on_BackButton_pressed():
	get_tree().change_scene("res://Menus/FriendsMenu.tscn")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if request == "get_stats":
		var stats = response_body.result.fields
		var tot_games = int(stats.Matches_Lost.integerValue) + int(stats.Matches_Tied.integerValue) + int(stats.Matches_Won.integerValue)
		if(tot_games != 0):
			avg_label.text = String(int(stats.Cells_Painted.integerValue)/tot_games) + "%"
		else:
			avg_label.text = "N/A"
		tot_cells.text = String(stats.Cells_Painted.integerValue)
		tot_lost.text = String(stats.Matches_Lost.integerValue)
		tot_wins.text = String(stats.Matches_Won.integerValue)
		tot_ties.text = String(stats.Matches_Tied.integerValue)
		max_cells_painted.text = String(stats.Maximum_Painted_Cells_In_Match.integerValue)
		color_with_more_wins.text = String(max(int(stats.Wins_With_Red.integerValue),max(int(stats.Wins_With_Yellow.integerValue),max(int(stats.Wins_With_Orange.integerValue),max(int(stats.Wins_With_Green.integerValue),int(stats.Wins_With_Blue.integerValue))))))

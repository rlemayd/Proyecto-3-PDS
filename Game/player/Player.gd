extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func showWinner():
	$WinnerLabel.visible = true

func showLoser():
	$LoserLabel.visible = true

func showTie():
	$TieLabel.visible = true

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Menus/LoggedMainMenu.tscn")

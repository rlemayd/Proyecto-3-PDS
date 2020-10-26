extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameIdLabel.text = String(Background.currentGameCode)

func hideLabel():
	$GameIdLabel.visible = false
	
func showWinner():
	$WinnerLabel.visible = true

func showLoser():
	$LoserLabel.visible = true

func showTie():
	$TieLabel.visible = true

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Menus/LoggedMainMenu.tscn")

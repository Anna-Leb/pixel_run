extends Control

@onready var score_label = $ScoreLabel

func update_score(new_score):
	score_label.text = "Coins: " + str(new_score)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels_menu.tscn")

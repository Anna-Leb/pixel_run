extends Control

signal start_game()
@onready var button_container = %"Button container"

func _ready() -> void:
	focus_button()
	
func _on_visiblity_changed() -> void:
	if visible:
		focus_button()

func focus_button() -> void:
	if button_container:
		var button: Button = button_container.get_child(0)
		if button is Button:
			button.grab_focus()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels_menu.tscn")

func _on_end_button_pressed() -> void:
	get_tree().quit()

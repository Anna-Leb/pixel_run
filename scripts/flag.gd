extends Area2D

@onready var animation_player = $AnimationFlag

func _ready():
	animation_player.play("stay")  # Явно запускаем стартовую анимацию
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):	
	if body.is_in_group("Player"):
		body.can_move = false
		animation_player.play("win")
		Global.save_coins()
		print("level completed!")
		get_tree().change_scene_to_file("res://scenes/levels_menu.tscn")

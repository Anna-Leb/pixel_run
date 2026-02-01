extends Area2D

@onready var animation_player = $AnimationFlag

func _ready():
	print("Флаг загружен!")  # Проверим, что скрипт работает
	animation_player.play("stay")  # Явно запускаем стартовую анимацию
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	print("Тело вошло в область: ", body.name)  # Проверим, что сигнал срабатывает
	
	if body.is_in_group("Player"):
		print("Обнаружен игрок! Меняем анимацию...")
		animation_player.play("win")
		print("level completed!")

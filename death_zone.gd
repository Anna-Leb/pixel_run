@tool
extends Area2D

func _ready():
	# Подключаем сигнал автоматически
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Проверяем, что вошёл именно игрок (по группе)
	if body.is_in_group("Player"):
		print("Игрок вошел в смертельную зону")
		body.respawn()
@tool
extends Area2D

# Сигнал для уведомления о смерти игрока
signal player_died

func _on_body_entered(body: Node2D) -> void:
	# Проверяем, что вошёл именно игрок (по группе)
	if body.is_in_group("player"):
		emit_signal("player_died")

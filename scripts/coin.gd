extends Area2D

func _ready():
	# подклюение сигнала входа тела в область монеты
	body_entered.connect(_on_coin_body_entered)
	$AnimationPlayer.play("coin")

func _on_coin_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$Coin_sound.play()
		Global.add_coins(1)
		self.queue_free()
		print(Global.coins)
		
extends Node

var coins: int = 0
var total_coins: int = 0

signal coins_changed(new_amount)

func add_coins(amount: int):
	coins += amount
	total_coins += amount
	coins_changed.emit(coins)
	print("Монеток собрано: ", coins)
	
func spend_coins(amount: int) -> bool:
	if coins >= amount:
		coins -= amount
		coins_changed.emit(coins)
		return true
	return false
	
func reset_level_coins():
	coins = 0
	coins_changed.emit(coins)

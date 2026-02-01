extends CharacterBody2D

@onready var animation = $AnimationPlayer
@onready var sprite = $BaseCat 

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

func updateAnimation():
	var direction = "stay"
	
	if abs(velocity.x) > 5 and is_on_floor():
		direction = "run"
	elif abs(velocity.y) > 5 and not is_on_floor():
		direction = "jump"
		
	animation.play(direction)
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		# УСКОРЕНИЕ: постепенно увеличиваем скорость к max_speed
		velocity.x = move_toward(velocity.x, direction * SPEED, 1000 * delta)
	else:
		# ЗАМЕДЛЕНИЕ: постепенно уменьшаем скорость до 0
		velocity.x = move_toward(velocity.x, 0, 1000 * delta)

	sprite.flip_h = velocity.x < 0 if abs(velocity.x) > 10 else sprite.flip_h
	
	move_and_slide()
	updateAnimation()

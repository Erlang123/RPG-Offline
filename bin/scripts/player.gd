extends CharacterBody2D

var input_direction: Vector2 = Vector2.ZERO
@export var speed_scale: float = 0.
@export var max_speed: float = 0.
var current_velocity: Vector2 = Vector2.ZERO

#func _ready():
	#pass

func _physics_process(delta):
	#pass
	input_direction = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), Input.get_action_strength("move_down") - Input.get_action_strength("move_top"))
	
	if input_direction != Vector2.ZERO:
		current_velocity = ((max_speed * speed_scale) * delta) * input_direction
		current_velocity.x = clampf(current_velocity.x, -999., 999.)
		current_velocity.y = clampf(current_velocity.y, -999., 999.)
		
		velocity = current_velocity
		
		move_and_slide()
		return

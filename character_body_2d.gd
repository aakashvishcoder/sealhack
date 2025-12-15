extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d = $Sprite2D
var jump_count = 0


func _physics_process(delta: float) -> void:
	# Animations
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "Running"
	else: 
		sprite_2d.animation = "default"
	#add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "Jump"
	else: 
		jump_count = 0 

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < 2:
		jump_count += 1
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft

extends CharacterBody2D

#speed for A and D keys
@export var baseHorizontalSpeed = 300.0
#how fast character goes up
@export var jumpForce = -350.0
#how long character stays in the air
@export var airTime = 165.0
#total amount of jumps
@export var totalJumps = 2
#multiplies with horizontal speed for dash
@export var dashMultiplier = 2.0
#how long dash last for
@export var dashLength = 150.0
#cooldown for dash
@export var dashCooldown = 500.0


#keeps track of time in air
var jumpTimer = 0
#keeps track of jumps left
var jumpsLeft = totalJumps
#current horizontal movement
var currentHorizontalSpeed = baseHorizontalSpeed
#keeps track of length of dash
var dashTimer = 0
#keeps track of time since last dash (for cooldown)
var dashCurrentCooldown = 0

func _physics_process(delta: float) -> void:
	
	#code for dash
	if Input.is_action_just_pressed("dash") and dashCurrentCooldown < Time.get_ticks_msec() - dashCooldown:
		currentHorizontalSpeed = baseHorizontalSpeed * dashMultiplier
		#start dash length timer
		dashTimer = Time.get_ticks_msec()
		#starts dash cooldown timer
		dashCurrentCooldown = Time.get_ticks_msec()
	elif dashTimer < Time.get_ticks_msec() - dashLength:
		currentHorizontalSpeed = baseHorizontalSpeed
	
	
	#code for horizontal movement
	
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x = currentHorizontalSpeed * (delta * 100)
	elif Input.is_action_pressed("left"):
		velocity.x = -currentHorizontalSpeed * (delta * 100)
	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		velocity.x = 0
		
		
		#code for vertical movement
	if is_on_floor():
		jumpsLeft = totalJumps
	
	if not is_on_floor() and jumpsLeft == totalJumps:
		jumpsLeft -= 1
	
	if Input.is_action_pressed("up"):
		if is_on_floor():
			#regular jump
			print("regular jump")
			jumpTimer = Time.get_ticks_msec()
			velocity.y = jumpForce
			jumpsLeft -= 1
			
		elif Input.is_action_just_pressed("up") and jumpsLeft > 0:
			print("special jump")
			jumpTimer = Time.get_ticks_msec()
			velocity.y = jumpForce
			jumpsLeft -= 1
			


	# start falling immediately after hitting a ceiling
	if is_on_ceiling():
		jumpTimer = 0
	
	#if jump is done
	if jumpTimer < Time.get_ticks_msec() - airTime:
		velocity.y += get_gravity().y * delta
		

	move_and_slide()

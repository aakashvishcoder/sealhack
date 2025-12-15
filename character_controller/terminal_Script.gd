extends Area2D

@export var terminal_path: String = ""

#keeps track of when player is colliding with it
var collidingWithPlayer = false

func on_Player_Collide():
	if Input.is_action_just_pressed("open Terminal"):
		get_tree().change_scene_to_file(terminal_path)
		print("opened the terminal")
		$AudioStreamPlayer2D.play()

func _on_area_2d_area_entered(area: Area2D) -> void:
	collidingWithPlayer = true

func _on_player_trigger_area_area_exited(area: Area2D) -> void:
	collidingWithPlayer = false

func _process(delta: float) -> void:
	if collidingWithPlayer:
		on_Player_Collide()

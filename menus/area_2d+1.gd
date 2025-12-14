extends Area2D

# Path to the new scene you want to load
@export var target_scene_path : String = "res://deathscene.tscn"

func _ready():
	# Connect the signal (if not already 

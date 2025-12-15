extends Node2D

@export var number_of_terminals = 0
@export var astronauts = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.number_of_terminals = number_of_terminals
	Global.astronauts = astronauts
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

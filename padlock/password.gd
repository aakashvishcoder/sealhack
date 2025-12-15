extends TextEdit

@export var password: String = "abc"
@export var level_finished_scene: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grab_focus()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_button_down() -> void:
	var user_input = text
	print("User entered: ", user_input)
	if user_input == password:
		get_tree().change_scene_to_file(level_finished_scene)
	pass # Replace with function body.

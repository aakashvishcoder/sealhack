extends TextEdit

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
	pass # Replace with function body.

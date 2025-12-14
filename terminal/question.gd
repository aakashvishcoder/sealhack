extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = Global.question
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = Global.question
	pass

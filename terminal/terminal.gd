extends Node2D

@export var json_file_path: String = "res://data.json"
@export var main_scene_file_path: String = ""
@export var clue_scene_file_path: String = ""

var question_list = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	question_list = load_json_file()
	var random_index: int = randi_range(0, question_list["questions"].size()-1)
	var correct_answer: int = question_list["correct_answer"][random_index]
	print(clue_scene_file_path)
	match correct_answer:
		1:
			_on_button_2_button_down(clue_scene_file_path)
			print("button 2")
		2:
			_on_button_3_button_down(clue_scene_file_path)
			print("button 3")
		3:
			_on_button_4_button_down(clue_scene_file_path)
			print("button 4")
		4:
			_on_button_5_button_down(clue_scene_file_path)
			print("button 5")
		_:
			print("No answer detected")
	print(random_index)
	pass # Replace with function body.

func load_json_file():
	var file = FileAccess.open(json_file_path, FileAccess.READ) # opening the file to read the data
	assert(file.file_exists(json_file_path), "file path doesn't exist, please enter a new file path!")
	
	# reading the file
	var json = file.get_as_text()
	var json_object = JSON.new()
	
	# parse the JSON file
	json_object.parse(json)
	question_list = json_object.data # store the json data
	
	return question_list

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_2_button_down(file_path: String = main_scene_file_path) -> void:
	print("button 2 pressed")
	get_tree().change_scene_to_file(file_path)

func _on_button_3_button_down(file_path: String = main_scene_file_path) -> void:
	print("button 3 pressed")
	get_tree().change_scene_to_file(file_path)

func _on_button_4_button_down(file_path: String = main_scene_file_path) -> void:
	print("button 4 pressed")
	get_tree().change_scene_to_file(file_path)

func _on_button_5_button_down(file_path: String = main_scene_file_path) -> void:
	print("button 5 pressed")
	get_tree().change_scene_to_file(file_path)

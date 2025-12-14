extends Node2D

@export var json_file_path: String = "res://data.json"
@export var main_scene_file_path: String = ""
@export var clue_scene_file_path: String = ""

var question_list = {}
var file_path = main_scene_file_path
var random_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	question_list = load_json_file()
	random_index = randi_range(0, question_list["questions"].size()-1)
	export_question()
	var correct_answer: int = question_list["correct_answer"][random_index]
	export_clue()
	print(clue_scene_file_path)
	match correct_answer:
		1:
			file_path = clue_scene_file_path
			print("button 2")
		2:
			file_path = clue_scene_file_path
			print("button 3")
		3:
			file_path = clue_scene_file_path
			print("button 4")
		4:
			file_path = 'clue_scene_file_path'
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
	if collidingWithPlayer:
		on_Player_Collide()
	pass

func _on_button_2_button_down() -> void:
	print("button 2 pressed")
	if file_path == clue_scene_file_path:
		Global.number_of_terminals -= 1
	get_tree().change_scene_to_file(file_path)

func _on_button_3_button_down() -> void:
	print("button 3 pressed")
	if file_path == clue_scene_file_path:
		Global.number_of_terminals -= 1
	get_tree().change_scene_to_file(file_path)

func _on_button_4_button_down() -> void:
	print("button 4 pressed")
	if file_path == clue_scene_file_path:
		Global.number_of_terminals -= 1
	get_tree().change_scene_to_file(file_path)

func _on_button_5_button_down() -> void:
	print("button 5 pressed")
	if file_path == clue_scene_file_path:
		Global.number_of_terminals -= 1
	get_tree().change_scene_to_file(file_path)

# exporting the clue to the clue scene
func export_clue() -> void:
	Global.clue = question_list["clues"][random_index]
	print(Global.clue)
	
# exporting the question to the text label	
func export_question() -> void:
	Global.question = question_list["questions"][random_index]
	print(Global.question)

var collidingWithPlayer = false

func on_Player_Collide():
	if Input.is_action_just_pressed("open Terminal"):
		print("opened the terminal")

func _on_area_2d_area_entered(area: Area2D) -> void:
	collidingWithPlayer = true

func _on_player_trigger_area_area_exited(area: Area2D) -> void:
	collidingWithPlayer = false

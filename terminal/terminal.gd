extends Node2D

@export var json_file_path: String = "res://data.json"
@export var main_scene_file_path: String = ""
@export var clue_scene_file_path: String = ""
@onready var my_button_1 = $Button2
@onready var my_button_2 = $Button3
@onready var my_button_3 = $Button4
@onready var my_button_4 = $Button5

var question_list = {}
var file_path_1 = main_scene_file_path
var file_path_2 = main_scene_file_path
var file_path_3 = main_scene_file_path
var file_path_4 = main_scene_file_path
var random_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	question_list = load_json_file()
	random_index = randi_range(0, question_list["questions"].size()-1)
	export_question()
	export_answers()
	var correct_answer: int = question_list["correct_answer"][random_index]
	export_clue()
	match correct_answer:
		1:
			file_path_1 = clue_scene_file_path
		2:
			file_path_2 = clue_scene_file_path
		3:
			file_path_3 = clue_scene_file_path
		4:
			file_path_4 = clue_scene_file_path
		_:
			print("No answer detected")
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
	if file_path_1 == clue_scene_file_path:
		Global.number_of_terminals -= 1
	get_tree().change_scene_to_file(file_path_1)

func _on_button_3_button_down() -> void:
	if file_path_2 == clue_scene_file_path:
		Global.number_of_terminals -= 1
	get_tree().change_scene_to_file(file_path_2)

func _on_button_4_button_down() -> void:
	if file_path_3 == clue_scene_file_path:
		Global.number_of_terminals -= 1
	get_tree().change_scene_to_file(file_path_3)

func _on_button_5_button_down() -> void:
	if file_path_4 == clue_scene_file_path:
		Global.number_of_terminals -= 1
	get_tree().change_scene_to_file(file_path_4)

# exporting the clue to the clue scene
func export_clue() -> void:
	Global.clue = question_list["clues"][random_index]
	print(Global.clue)

func export_answers() -> void:
	var answers = question_list["answer_choices"][random_index]

	my_button_1.text = answers[0]
	my_button_2.text = answers[1]
	my_button_3.text = answers[2]
	my_button_4.text = answers[3]

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

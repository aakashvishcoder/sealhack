extends RichTextLabel

@export var json_file_path: String = "res://data.json"

var question_list = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(load_json_file())
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
	
# function writing to a json file
func write_json_file(data: Dictionary):
	if FileAccess.file_exists(json_file_path):
		print("File exists in the folder. Currently writing to it!")
	else:
		print("File does not exist in the folder. Cannot write to it!")
	
	# open the file 
	var file = FileAccess.open(json_file_path, FileAccess.ModeFlags.WRITE) # tries to find the json file, if not creates a new one!
	
	if file:
		var json_text = JSON.stringify(data, "\t")
		file.store_string(json_text)
		print("Data stored in the new file!")
	else:
		print("Failed to open or create a file.")
	

extends Node2D

@export var scene_path : String = "res://menus/level1.tscn"
@export var rules_path : String = "res://menus/Rules.tscn"

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(scene_path)

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file(rules_path)

func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("quitscene.tscn")

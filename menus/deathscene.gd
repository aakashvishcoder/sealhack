extends Node2D

@export var level_scene: String = "res://menus/level1.tscn"
@export var main_menu_scene: String = "res://character_controller/node_2d.tscn"

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(level_scene)

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file(main_menu_scene)

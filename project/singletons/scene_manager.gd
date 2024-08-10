extends Node


enum Scenes {SPLASH_SCREEN, MAIN_MENU, OPTIONS_SCREEN}

var game_scenes: Dictionary = {
	Scenes.SPLASH_SCREEN: preload("res://scenes/ui/splash_screen/splash_screen.tscn"),
	Scenes.MAIN_MENU: preload("res://scenes/ui/main_menu/main_menu.tscn"),
	Scenes.OPTIONS_SCREEN: preload("res://scenes/ui/options_screen/options_screen.tscn")
}

var _next_scene: Scenes

func _ready() -> void:
	SignalManager.on_transition_fade_in_finished.connect(change_scene)


func change_scene():
	var new_scene: PackedScene = game_scenes[_next_scene]
	get_tree().change_scene_to_packed(new_scene)
	TransitionScreen.fade_out()


func transition_to_scene(scene: Scenes):
	_next_scene = scene
	await TransitionScreen.fade_in()

extends Node

@onready var music: AudioStreamPlayer = $Music


enum AUDIO_BUS {MUSIC, SFX}

enum BGM {
	MAIN_MENU,
	TUTORIAL,
	MATCH,
	TRIUNVIRATE,
}

enum SFX {
	SPLASH_SCREEN,
	LOAD,
}

const audio_bus_list: Dictionary = {
	AUDIO_BUS.MUSIC: "Music",
	AUDIO_BUS.SFX: "SFX"
}

const bgm_list: Dictionary = {
	BGM.MAIN_MENU : preload("res://assets/bgm/No More Magic.mp3"),
	BGM.TUTORIAL: preload("res://assets/bgm/at_work.mp3"),
	BGM.MATCH: preload("res://assets/bgm/magical_theme.mp3"),
	BGM.TRIUNVIRATE: preload("res://assets/bgm/Arabesque.mp3"),
}

const sfx_list: Dictionary = {
	SFX.SPLASH_SCREEN: preload("res://assets/sfx/GUI_Sound_Effects_by_Lokif/misc_sound.wav"),
	SFX.LOAD: preload("res://assets/sfx/GUI_Sound_Effects_by_Lokif/load.wav")
}


func play_music(bgm: BGM):
	music.stream = bgm_list[bgm]
	music.play()


func play_sfx(sfx: SFX):
	var sound = AudioStreamPlayer.new()
	sound.stream = sfx_list[sfx]
	sound.bus = audio_bus_list[AUDIO_BUS.SFX]
	sound.finished.connect(remove_node.bind(sound))
	add_child(sound)
	sound.play()


func remove_node(instance: AudioStreamPlayer):
	instance.queue_free()

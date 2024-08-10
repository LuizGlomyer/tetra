extends Control

@onready var MUSIC_BUS_ID = AudioServer.get_bus_index(
	AudioManager.audio_bus_list[AudioManager.AUDIO_BUS.MUSIC]
)
@onready var SFX_BUS_ID = AudioServer.get_bus_index(
	AudioManager.audio_bus_list[AudioManager.AUDIO_BUS.SFX]
)

const _MUTE_THRESHOULD: float = 0.05


func _ready() -> void:
	AudioManager.play_music(AudioManager.BGM.TUTORIAL)


func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS_ID, value < _MUTE_THRESHOULD)


func _on_sound_effects_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_ID, value < _MUTE_THRESHOULD)


func _on_sound_effects_slider_drag_ended(_value_changed: bool) -> void:
	AudioManager.play_sfx(AudioManager.SFX.LOAD)


func _on_fullscreen_checkbox_pressed() -> void:
	AudioManager.play_sfx(AudioManager.SFX.LOAD)

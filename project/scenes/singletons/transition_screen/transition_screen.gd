extends CanvasLayer


@onready var animation_player: AnimationPlayer = $AnimationPlayer
var _is_in_transition: bool = false


func fade_in():
	if _is_in_transition:
		push_warning("Multiple transitions invocations at the same time detected")
		return
	_is_in_transition = true
	animation_player.play("fade_in")


func fade_out():
	animation_player.play("fade_out")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"fade_in": 
			SignalManager.on_transition_fade_in_finished.emit()
		"fade_out":
			_is_in_transition = false
			SignalManager.on_transition_fade_out_finished.emit()

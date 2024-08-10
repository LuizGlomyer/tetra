extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var texture_rect: TextureRect = $LabelBG/TextureRect

var speed: Vector2 = Vector2(100, 0)
var direction: int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play_sfx(AudioManager.SFX.SPLASH_SCREEN)
	animation_player.play("fade_in")
	await get_tree().create_timer(3).timeout
	SceneManager.transition_to_scene(SceneManager.Scenes.MAIN_MENU)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	texture_rect.offset_right += delta * speed.x
	texture_rect.offset_bottom += delta * speed.y
	
	texture_rect.position += speed * direction * delta
	

	

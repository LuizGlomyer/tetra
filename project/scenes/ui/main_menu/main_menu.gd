extends Control

@onready var bg: TextureRect = $BG

@onready var hearts_selector: TextureRect = $"BG/MarginContainer/VBoxContainer/VBoxContainer/Row 1/MatchButton/PanelContainer/HeartsLabel/HeartsSelector"
@onready var clubs_selector: TextureRect = $"BG/MarginContainer/VBoxContainer/VBoxContainer/Row 2/OptionsButton/PanelContainer/ClubsLabel/ClubsSelector"
@onready var spades_selector: TextureRect = $"BG/MarginContainer/VBoxContainer/VBoxContainer/Row 1/TutorialButton/PanelContainer/SpadesLabel/SpadesSelector"
@onready var diamonds_selector: TextureRect = $"BG/MarginContainer/VBoxContainer/VBoxContainer/Row 2/ExitButton/PanelContainer/DiamondsLabel/DiamondsSelector"

@onready var match_button: Button = $"BG/MarginContainer/VBoxContainer/VBoxContainer/Row 1/MatchButton"
@onready var tutorial_button: Button = $"BG/MarginContainer/VBoxContainer/VBoxContainer/Row 1/TutorialButton"
@onready var options_button: Button = $"BG/MarginContainer/VBoxContainer/VBoxContainer/Row 2/OptionsButton"
@onready var exit_button: Button = $"BG/MarginContainer/VBoxContainer/VBoxContainer/Row 2/ExitButton"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	hide_selectors()
	print("ready")
	#print(bg)
	#print("texture height ", bg.texture.get_height())
	var deck: Deck = Deck.new(true)
	#print(deck)
	var card: Card = deck.draw()
	#print(card)
	#print(deck.get_remaining_cards())
	#print(deck)
	
	#focus the match button
	match_button.grab_focus()
	
	#get_viewport().size = Vector2(1920, 1080)
	#get_viewport().size = DisplayServer.screen_get_size()
	
	#TranslationServer.set_locale("pt")
	await get_tree().create_timer(2).timeout
	AudioManager.play_music(AudioManager.BGM.MAIN_MENU)


func process_input(delta):
	pass
	#match_button.grab_focus()


func hide_selectors():
	hearts_selector.hide()
	clubs_selector.hide()
	spades_selector.hide()
	diamonds_selector.hide()


func set_selector_start(selector: TextureRect, label: Label):
	selector.position.x = label.position.x
	print(label.position.x)

func set_selector_end(selector: TextureRect, label: Label):
	selector.position.x = label.size.x + 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	process_input(delta)


var count = 0

func _on_match_button_pressed() -> void:
	count +=1
	print("Match pressed! ", count)



func _on_tutorial_button_pressed() -> void:
	TransitionScreen.fade_out()
	pass # Replace with function body.


func _on_options_button_pressed() -> void:
	SceneManager.transition_to_scene(SceneManager.Scenes.OPTIONS_SCREEN)



func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_match_button_focus_entered() -> void:
	AudioManager.play_sfx(AudioManager.SFX.LOAD)
	hide_selectors()
	hearts_selector.show()


func _on_tutorial_button_focus_entered() -> void:
	AudioManager.play_sfx(AudioManager.SFX.LOAD)
	hide_selectors()
	spades_selector.show()


func _on_options_button_focus_entered() -> void:
	AudioManager.play_sfx(AudioManager.SFX.LOAD)
	hide_selectors()
	clubs_selector.show()


func _on_exit_button_focus_entered() -> void:
	AudioManager.play_sfx(AudioManager.SFX.LOAD)
	hide_selectors()
	diamonds_selector.show()


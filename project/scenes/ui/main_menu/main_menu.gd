extends Control

@onready var bg: TextureRect = $BG
@onready var match_button: Button = $"BG/MarginContainer/VBoxContainer/VBoxContainer/Row 1/MatchButton"

# Called when the node enters the scene tree for the first time.
func _ready():

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
	

func set_selector_start(selector: TextureRect, label: Label):
	selector.position.x = label.position.x
	print(label.position.x)

func set_selector_end(selector: TextureRect, label: Label):
	selector.position.x = label.size.x + 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


var count = 0

func _on_match_button_pressed() -> void:
	count +=1
	print("Match pressed! ", count)


func _on_exit_button_pressed() -> void:
	get_tree().quit()

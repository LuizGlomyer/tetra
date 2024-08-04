class_name Deck
extends Node


var cards: Array[Card] = []
var discarded_numbers: Array[Card] = []
var discarded_royalties: Array[Card] = []
var has_jokers: bool = false


func _init(has_jokers: bool = false):
	for suit in PlayingCard.Suit:
		for rank in PlayingCard.Rank:
			var card: PlayingCard = PlayingCard.new(PlayingCard.Suit[suit], PlayingCard.Rank[rank])
			self.cards.append(card)
	if has_jokers:
		for color in JokerCard.JokerColor:
			var joker: JokerCard = JokerCard.new(JokerCard.JokerColor[color])
			self.cards.append(joker)
	
	shuffle()


func shuffle() -> void:
	self.cards.shuffle()


func draw() -> Card:
	if self.cards.size() > 0:
		return cards.pop_back()
	else:
		# TODO reshuffle
		return


func get_remaining_cards() -> int:
	return self.cards.size()


func _to_string() -> String:
	var divider: String = "=========="
	var string_representation: String = divider
	for card: Card in cards:
		string_representation += "\n" + card.to_string()
	string_representation += "\n" + divider
	
	return string_representation

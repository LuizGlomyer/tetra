class_name Card
extends Node


var _is_joker: bool


func _init(is_joker: bool):
	self._is_joker = is_joker


func _to_string() -> String:
	return "A Joker card" if self._is_joker else "A non Joker card"


func is_joker(card: Card) -> bool:
	return self._is_joker

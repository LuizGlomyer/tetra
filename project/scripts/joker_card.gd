class_name JokerCard
extends Card

enum JokerColor {RED, BLACK}

var color: JokerColor

func _init(color: JokerColor):
	super(true)
	self.color = color


func _to_string() -> String:
	return "%s Joker" % [JokerColor.keys()[self.color]]

class_name PlayingCard
extends Card

enum Suit {HEARTS, CLUBS, DIAMONDS, SPADES}
enum Rank {ACE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING}

var rank: Rank
var suit: Suit

func _init(suit: Suit, rank: Rank):
	super(false)
	self.suit = suit
	self.rank = rank


func _to_string() -> String:
	return "%s of %s" % [Rank.keys()[self.rank], Suit.keys()[self.suit]]

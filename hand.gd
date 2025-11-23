extends Node2D

@export var is_player: bool = true
@export var card_spacing: int = 320

# Logical hand
@export var cards_data: Array[CardData] = []

# Visual hand
var cards: Array[Card] = []
var card_scene: PackedScene = preload("res://card.tscn")

func _ready() -> void:
	for card_data in cards_data:
		add_card_from_data(card_data)

func add_card_from_data(card_data: CardData) -> void:
	var card_instance: Card = card_scene.instantiate() as Card
	card_instance.data = card_data
	card_instance.face_up = is_player

	add_child(card_instance)
	cards.append(card_instance)

	update_card_positions()

	
func add_card_instance(card_instance: Card) -> void:
	card_instance.face_up = is_player
	add_child(card_instance)

	cards.append(card_instance)
	cards_data.append(card_instance.data)

	update_card_positions()

func update_card_positions():
	var total = cards.size()
	if total == 0:
		return

	# Spread cards horizontally, centered
	var start_x = 0
	for i in range(total):
		var card = cards[i]
		card.position = Vector2(start_x + i * card_spacing, 0)

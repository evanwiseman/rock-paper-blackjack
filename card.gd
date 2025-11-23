extends Area2D

@export var face_up: bool = true
@export var data: CardData

func _ready() -> void:
	load_front()
	load_back()
	update_card()

func load_front() -> void:
	var front = $Visuals/Front
	front.get_node("Background").texture = data.front_background
	front.get_node("Layout/NameLabel").text = data.name
	front.get_node("Layout/Art").texture = data.art
	front.get_node("Layout/DescriptionLabel").text = data.description

func load_back() -> void:
	var back = $Visuals/Back
	back.get_node("Background").texture = data.back_background

func update_card() -> void:
	$Visuals/Front.visible = face_up
	$Visuals/Back.visible = !face_up


func flip():
	face_up = !face_up

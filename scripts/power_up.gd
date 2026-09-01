extends Control

@onready var button_growth = $Card_Growth
@onready var button_speed = $Card_Speed
var player = 0

func _ready() -> void:
	
	button_growth.pressed.connect(func(): _choice("Growth"))
	button_speed.pressed.connect(func(): _choice("Speed"))
	visible = false


	
func _choice(tipo):
	if tipo == "Growth":
		if player == 1:
			$"../Player".scale += Vector2(0.25,0.25)
		elif player == 2:
			$"../Player2".scale += Vector2(0.25,0.25)
		pass
	if tipo == "Speed":
		if player == 1:
			$"../Player".speed += 50
		elif player == 2:
			$"../Player2".speed += 50
	get_tree().paused = false
	hide_card()
	
func hide_card():
	visible = false
	
func show_card(num):
	player = num
	get_tree().paused = true
	visible = true

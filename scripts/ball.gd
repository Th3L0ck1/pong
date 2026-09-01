extends RigidBody2D

var speed = 450
var dir = [-1,1]
var scoreP1 = 0
var scoreP2 = 0
var count_pw = 3

func _ready() -> void:
	
	reset()
	
	pass



func _physics_process(delta: float) -> void:
	
	score()
	pass
	
func reset():
	global_position = get_viewport_rect().size / 2
	
	freeze = true
	await get_tree().create_timer(2).timeout
	freeze = false
	
	apply_central_impulse(Vector2( dir.pick_random() * speed ,dir.pick_random() * speed ))
	
	
	pass
	
func score():
	
	if global_position.x >= get_viewport_rect().size.x:
		scoreP1 += 1
		if scoreP1 == count_pw:
			global_position = get_viewport_rect().size / 2
			$"../Control".show_card(2)
			count_pw += 3
		else:
			reset()
		
	if global_position.x <= 0:
		scoreP2 += 1
		if scoreP2 == count_pw:
			global_position = get_viewport_rect().size / 2
			$"../Control".show_card(1)
			count_pw += 3
		else:
			reset()
		
	
	$"../Score".text = str(scoreP1) + " : " + str(scoreP2)
	pass

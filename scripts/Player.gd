extends StaticBody2D

var speed = 500
var dir = Vector2(0,0)


func _ready() -> void:
	
	pass

func _physics_process(delta: float) -> void:
	move(delta)
	
	pass
	
func move(delta):
	
	dir = Vector2()
	
	if Input.is_key_pressed(KEY_D):
		dir += Vector2(1,0)
	if Input.is_key_pressed(KEY_A):
		dir += Vector2(-1,0)
	if Input.is_key_pressed(KEY_W):
		dir += Vector2(0,-1)
	if Input.is_key_pressed(KEY_S):
		dir += Vector2(0,1)
	
	global_position += dir.normalized() * speed * delta
	
	pass

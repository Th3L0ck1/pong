extends StaticBody2D

var speed = 350
var dir = Vector2(0,0)

@export var up = KEY_W
@export var down = KEY_S
@export var right = KEY_D
@export var left = KEY_A

func _ready() -> void:
	
	pass

func _physics_process(delta: float) -> void:
	move(delta)
	
	pass
	
func move(delta):
	
	dir = Vector2()
	
	if Input.is_key_pressed(right):
		dir += Vector2(1,0)
	if Input.is_key_pressed(left):
		dir += Vector2(-1,0)
	if Input.is_key_pressed(up) and global_position.y > 0:
		dir += Vector2(0,-1)
	if Input.is_key_pressed(down)and global_position.y < get_viewport_rect().size.y:
		dir += Vector2(0,1)
	
	global_position += dir.normalized() * speed * delta
	
	pass

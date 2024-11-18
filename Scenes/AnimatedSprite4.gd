extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation1 = $AnimatedSprite
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(_delta):
	if Input.is_action_pressed(""):
		play("run_right")
		move_local_x(.5)
	elif Input.is_action_pressed(""):
		play("run_left")
		move_local_x(-.5)
	elif Input.is_action_pressed(""):
		play("run_up")
		move_local_y(-.5)
	elif Input.is_action_pressed(""):
		play("run_down")
		move_local_y(.5)
	else:
		stop()

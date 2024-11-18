extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
onready var animation = $AnimatedSprite3
const WALK_SPEED = 50
var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()


func check_input():
	velocity = Vector2()
	var dirx = 0
	var diry = 0
	var change = 0
	if Input.is_action_pressed("3left"):
		velocity.x -= 1
		dirx -= 1
		change += 1
		
	if Input.is_action_pressed("3right"):
		velocity.x += 1
		dirx += 1
		change += 1

	if Input.is_action_pressed("3up"):
		velocity.y -= 1
		diry -= 1
		change += 1

	if Input.is_action_pressed("3down"):
		velocity.y += 1
		diry += 1
		change += 1
		
	if change > 0: direction = Vector2(dirx,diry)
	
	velocity = velocity.normalized()
	
	print(direction)
	
	if velocity.y < 0:
		if velocity.y < 0:
			animation.play("run_up")
	else:
		if velocity.x > 0:
			animation.play("run_right")
		elif velocity.x < 0:
			animation.play("run_left")
		elif velocity.y > 0:
			animation.play("run_down")
	
	if velocity.x == 0 and velocity.y == 0:
		if direction.y != 0:
			if direction.y > 0:
				animation.play("idle_down")
			elif direction.y < 0:
				animation.play("idle_up")
		else:
			if direction.x > 0:
				animation.play("idle_right")
			elif direction.x < 0:
				animation.play("idle_left")
	velocity = move_and_slide(velocity * WALK_SPEED)
	

	# "move_and_slide" already takes delta time into account.
func _physics_process(delta):
	check_input()


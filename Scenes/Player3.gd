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


onready var animation = $AnimatedSprite
onready var aniPlayer = $AnimationPlayer
onready var aniTree = $AnimationTree
onready var aniState = aniTree.get("parameters/playback")

enum {
	MOVE,
	ATK
}

const WALK_SPEED = 50
const ACC = 10
const FRICTION = 10
var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()

var state = MOVE

func check_move():
	
	if abs(velocity.x) + abs(velocity.y) > .2:
		aniTree.set("parameters/run/blend_position", velocity)
		aniState.travel("run")
	else:
		aniTree.set("parameters/idle/blend_position", direction)	
		aniState.travel("idle")
	aniTree.set("parameters/special/blend_position", velocity)
	if Input.is_action_pressed("3spec"):
		state = ATK
		
		
func check_input(dtime):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("3right") - Input.get_action_strength("3left")
	input_vector.y = Input.get_action_strength("3down") - Input.get_action_strength("3up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		
		direction = input_vector
		velocity += input_vector * ACC * dtime
		velocity = velocity.clamped(WALK_SPEED * dtime)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * dtime)
	
	move_and_collide(velocity)
	
			
func check_attack():
	aniState.travel("special")
func atk_ani_finish():
	state = MOVE
	# "move_and_slide" already takes delta time into account.
func _physics_process(delta):
	check_input(delta)
	match state:
		MOVE:
			check_move()
		ATK:
			check_attack()
	

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var aniPlayer = $AnimationPlayer
onready var mytimer = $BreakTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

#animations for each stage of tree damage:
var actions = ["break1", "break2", "break3", "break3", "break3"]
var count = 0

func spawn_wood():
	var Wood = load("res://Scenes/wood.tscn")
	var wood = Wood.instance()
	var world = get_tree().current_scene
	world.add_child(wood)
	wood.global_position = Vector2(global_position.x, global_position.y - 2)
	
func _on_Hurtbox_area_entered(area):
#	if(timer.get_time_left() == 0):
	aniPlayer.play(actions[count]) # Replace with function body.
	print("Tree Hit!!!")
	if count < actions.size() -1:
			count += 1
			if(count == 3):
				$Sprite.frame = 0
				spawn_wood()
	else:
			spawn_wood()
			queue_free()
#	else:
#		timer.start()
	

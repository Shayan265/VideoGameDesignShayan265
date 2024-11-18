extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player1 = self.get_parent().get_node("Player1")
onready var player2 = self.get_parent().get_node("Player2")
onready var player3 = self.get_parent().get_node("Player3")
#onready var player4 = self.get_parent().get_node("Player4")

onready var barrier = self.get_node("RigidBody2D/CollisionPolygon2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var newposition = Vector2()
	newposition.x = (player1.position.x + player2.position.x + player3.position.x) / 3
	newposition.y = (player1.position.y + player2.position.y + player3.position.y) / 3
	
	self.position = newposition
	var dist = sqrt( pow( abs(player1.position.x - player2.position.x) , 2) + pow( abs(player1.position.x - player3.position.x) , 2) )
	
	var zmcount = 1.1 + (dist/300)
	if zmcount > 2:
		zmcount = 2
	self.zoom = Vector2(zmcount, zmcount)
	var sc = zmcount
	barrier.scale = Vector2(sc,sc)

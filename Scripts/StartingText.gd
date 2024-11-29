extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var message = ["Hi Players", "This is a Co-op experience", "For now just explore!!!"]
var contmessage = "\nPress [Space] to continue"
var count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if Input.is_action_just_released("space"):
		if count < message.size() -1:
			count += 1
		else:
			get_parent().visible = false
		
	self.text = message[count] + contmessage

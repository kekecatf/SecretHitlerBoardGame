extends TouchScreenButton

@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Up"):
		timer.start()
		position.y -= 50
	pass

func _on_timer_timeout():
	position.y += 50
	print("timer durdu")

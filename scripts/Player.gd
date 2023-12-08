extends CharacterBody2D

@export_group("Movement")
@export var Speed: float = 500.0
@export_exp_easing var Acceleration: float = 4.0

func _ready():
	pass

func _process(delta):
	# always look at the mouse cursor
	self.look_at(get_global_mouse_position())
	
	# process input nicely and smoothly
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	self.velocity = lerp(self.velocity, input * Speed, delta * Acceleration)
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)

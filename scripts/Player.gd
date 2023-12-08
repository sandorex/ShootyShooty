extends CharacterBody2D

@export_group("Movement")
@export var speed: float = 500.0
@export_exp_easing var acceleration: float = 4.0

var bullet_spawn_location = Vector2(0, 5)

var bullet_scene = preload("res://objects/bullet.tscn")

func _ready():
	pass

func _physics_process(delta):
	# always look at the mouse cursor
	self.look_at(get_global_mouse_position())
	
	# process input nicely and smoothly
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	self.velocity = lerp(self.velocity, input * speed, delta * acceleration)
	
	move_and_slide()

func _input(event):
	if event.is_action_pressed("fire"):
		var bullet = bullet_scene.instantiate()
		bullet.rotation_degrees = 90 + self.rotation_degrees
		bullet.position = $BulletSpawnMarker.global_position
		
		# the bullet shouldnt be children of the player
		get_tree().root.add_child(bullet)

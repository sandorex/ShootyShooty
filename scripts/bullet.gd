extends RigidBody2D

@export var starting_speed: float = 400
@export var lifespan: float = 2

func _ready():
	# set correct lifespan
	$Timer.wait_time = self.lifespan
	$Timer.start()
	
	# apply the initial force in direction of its rotation
	apply_central_impulse(Vector2(0, -starting_speed).rotated(self.rotation))

func _on_body_entered(body):
	print("bullet collided with ", body)
	self.queue_free()

func _on_timer_timeout():
	self.queue_free()

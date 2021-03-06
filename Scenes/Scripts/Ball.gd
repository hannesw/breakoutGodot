extends RigidBody2D

const SPEED = 4
const MAXSPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)


func _physics_process(delta):
	var bodies = get_colliding_bodies()	
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()
		if body.get_name() == "Paddle":
			var speed = linear_velocity.length()
			var direction = position - body.get_node("Anchor").global_position
			var velocity = direction.normalized()

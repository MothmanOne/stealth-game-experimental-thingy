extends RigidBody2D

var velocity = Vector2(200, 200)
# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)

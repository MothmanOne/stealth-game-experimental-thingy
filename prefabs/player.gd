class_name Player
extends CharacterBody2D

# Properties
@export var speed = 300.0
# Children
var shape: CollisionShape2D
var sprite: AnimatedSprite2D
var placeholdersprite : Sprite2D


func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = input_direction * speed

func _physics_process(delta):

	get_input()

	move_and_slide()

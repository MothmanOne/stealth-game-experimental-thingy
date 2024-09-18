class_name Player
extends CharacterBody2D

# Properties

@export var speed = 300.0
var screen_size

# Children

var shape: CollisionShape2D
var sprite: AnimatedSprite2D
var placeholder_sprite : Sprite2D


#Main Methods
#Godot-provided methods such as _ready(), _physics_process(), etc

func _ready():
	screen_size = get_viewport_rect().size
	$Weapon.hide()

func _physics_process(delta):

	get_movement_input()
	move_and_slide()

func _process(delta):
	
	if Input.is_action_just_pressed("attack"):
		attack()


#Private Methods
#Methods that is meant for this script only

func get_movement_input():
	#keyboard movement
	
	#var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#velocity = input_direction * speed 
	velocity = transform.x * Input.get_axis("ctrl", "left_click") * speed
	
	#mouse movement
	look_at(get_global_mouse_position())

func attack():
	$AnimationPlayer.play("player_anims/baton_swing")
	

class_name Player
extends CharacterBody2D


# Properties

@export var speed = 300.0
var screen_size
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const jump_velocity = -400.0


# Children

var shape: CollisionShape2D
var sprite: Sprite2D
var weapon: Node2D


#Main Methods
#Godot-provided methods such as _ready(), _physics_process(), etc

func _ready():
	screen_size = get_viewport_rect().size
	$Weapon.hide()
	#$Weapon/WeaponArea.body_entered.connect(_on_weapon_area_body_entered)

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta

	get_movement_input()	
	move_and_slide()

func _process(delta):
	
	if Input.is_action_just_pressed("right_click"):
		attack()
		
	#print($Weapon.transform)

#Private Methods
#Methods that is meant for this script only

func get_movement_input():
	#keyboard movement

	var direction = get_global_mouse_position()
	#print(direction)
	
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = jump_velocity
	
	velocity += transform.x * Input.get_axis("ctrl", "left_click") * speed
	
	if Input.is_action_just_released("left_click") || Input.is_action_just_released("ctrl"):
		velocity.x = 0#move_toward(velocity.x, 0, speed)
	
	#mouse movement
	look_at(get_global_mouse_position())


func attack():
	$AnimationPlayer.play("player_anims/baton_swing")
	
func _on_weapon_area_body_entered(body):
	#if body.is_in_group("enemies"):
	print(body.name)
	


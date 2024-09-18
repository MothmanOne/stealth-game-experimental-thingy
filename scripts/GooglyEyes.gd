extends Node2D

#propertiees
var pupil_check: int = 0 
# 1 == pupil is out of keeper
# 0 == pupil is in keeper

# Children

var pupil: RigidBody2D
var pupil_keeper: Area2D
var outer_border : StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$PupilKeeper.body_exited.connect(_on_pupils_body_exited)
	$PupilKeeper.body_entered.connect(_on_pupils_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pupil_check == 1:
		$Pupils.position = $PupilKeeper.position

#public methods
func _on_pupils_body_exited(body):
	print("pupil exited")
	pupil_check = 1
	
func _on_pupils_body_entered(body):
	print("pupil entered")
	pupil_check = 0

#private methods
	

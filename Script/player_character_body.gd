class_name Player extends CharacterBody2D


const SPEED = 80.0

var pump : bool = false
var attacking : bool = false

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up","ui_down")
	if direction and pump == false:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()

class_name Player extends CharacterBody2D

@onready var bike_muzzle: Marker2D = $BikeMuzzle

const SPEED = 80.0

var pumping : bool = false
var attacking : bool = false
var bike_pump = preload("res://Scene/bikePump.tscn")
var muzzle_position

func _ready() -> void:
	muzzle_position = bike_muzzle.position

func _physics_process(_delta: float) -> void: 

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up","ui_down")
	if direction and pumping == false:
		velocity = direction * SPEED
		print(Input.get_vector("ui_left", "ui_right", "ui_up","ui_down"))
	else:
		velocity = Vector2.ZERO
		pass
	move_and_slide()

func pump_attack():
	var bike_pump_instance = bike_pump.instantiate() as Node2D
	bike_pump_instance.global_position = bike_muzzle.global_position
	get_parent().add_child(bike_pump_instance)

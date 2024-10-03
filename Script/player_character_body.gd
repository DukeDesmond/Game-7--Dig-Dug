class_name Player extends CharacterBody2D

@onready var bike_muzzle: Marker2D = $BikeMuzzle

const SPEED = 80.0

var pumping : bool = false
var attacking : bool = false
var bike_pump = preload("res://Scene/bikePump.tscn")
var muzzle_position : Vector2

func _ready() -> void:
	muzzle_position = bike_muzzle.position

func _physics_process(_delta: float) -> void: 

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up","ui_down")
	if direction and pumping == false:
		velocity = direction * SPEED
		#bike_muzzle.position default is (16,0)
		if direction == Vector2(-1,0): #Left
			bike_muzzle.position = Vector2(-16,0)
		elif direction == Vector2(1,0): #Right
			bike_muzzle.position = Vector2(16,0)
		elif direction == Vector2(0,1): #Down
			bike_muzzle.position = Vector2(0,16)
		elif direction == Vector2(0,-1): #Up
			bike_muzzle.position = Vector2(0,-16)
			
	else:
		velocity = Vector2.ZERO
		pass
	move_and_slide()

func pump_attack():
	var bike_pump_instance = bike_pump.instantiate() as Node2D
	bike_pump_instance.position = bike_muzzle.position
	bike_pump_instance.enemy_hit.connect(on_enemy_hit)
	bike_pump_instance.miss.connect(on_miss)
	attacking = true
	add_child(bike_pump_instance)
	
func on_enemy_hit():
	pass

func on_miss(miss : bool):
	if miss == true:
		pumping = false

class_name Player extends CharacterBody2D

@export var tile_size : int = 16

@onready var bike_muzzle: Marker2D = $BikeMuzzle
@onready var collision_polygon_2d: CollisionPolygon2D = $DigArea/CollisionPolygon2D

const SPEED = 80.0

var pumping : bool = false
var attacking : bool = false
var bike_pump = preload("res://Scene/bikePump.tscn")
var muzzle_position : Vector2
var currPos = [0,0]
var direction = Vector2.ZERO
var moving : bool = false
signal dig
func _ready() -> void:
	muzzle_position = bike_muzzle.position

func _physics_process(_delta: float) -> void: 
		
	if !pumping and moving == false:
		
		if Input.is_action_pressed("ui_left"):
			direction = Vector2.LEFT
			move()
		elif Input.is_action_pressed("ui_right"):
			direction = Vector2.RIGHT
			move()
		elif Input.is_action_pressed("ui_up"):
			direction = Vector2.UP
			move()
		elif Input.is_action_pressed("ui_down"):
			direction = Vector2.DOWN
			move()
		else:
			direction = Vector2.ZERO
		
		##bike_muzzle.position default is (16,0)
		if direction == Vector2(-1,0): #Left
			bike_muzzle.position = Vector2(-16,0)
		elif direction == Vector2(1,0): #Right  
			bike_muzzle.position = Vector2(16,0)
		elif direction == Vector2(0,1): #Down
			bike_muzzle.position = Vector2(0,16)
		elif direction == Vector2(0,-1): #Up
			bike_muzzle.position = Vector2(0,-16)
		velocity = direction * SPEED

	move_and_slide()
	
	for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision:
				dig.emit(collision)

func move():
	if direction:
		if moving == false:
			moving = true
			var tween = create_tween()
			tween.tween_property(self,"position", position + direction * tile_size, 0.25)
			tween.tween_callback(move_false)
			
func move_false():
	moving = false
			
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


func _on_dig_area_body_entered(body: Node2D) -> void:
		pass
			

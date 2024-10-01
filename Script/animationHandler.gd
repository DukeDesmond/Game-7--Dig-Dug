class_name AnimationHandler extends Node

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var player_character_body: CharacterBody2D = get_parent()

var last_facing_direction := Vector2(0,-1)
var idle : bool

func _ready() -> void:
	animation_tree.active = true

# Called every frame. 'delta' is the elapsed time move_toward(velocity, 0, SPEED)since the previous frame.
func _physics_process(_delta: float) -> void:
	
	idle = !player_character_body.velocity
	
	if !idle:
		last_facing_direction = player_character_body.velocity.normalized()
	
	animation_tree.set("parameters/Idle/blend_position",last_facing_direction)
	animation_tree.set("parameters/Walk/blend_position",last_facing_direction)
	animation_tree.set("parameters/Attack/blend_position",last_facing_direction)
	animation_tree.set("parameters/Pump/blend_position",last_facing_direction)

extends Node2D

@export var animation_tree : AnimationTree
@onready var player_character_body: CharacterBody2D = $PlayerCharacterBody

var last_facing_direction := Vector2(0,-1)
var idle : bool

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time move_toward(velocity, 0, SPEED)since the previous frame.
func _physics_process(delta: float) -> void:
	
	idle = !player_character_body.velocity
	
	if !idle:
		last_facing_direction = player_character_body.velocity.normalized()
	
	animation_tree.set("parameters/Idle/blend_position",last_facing_direction)
	animation_tree.set("parameters/Walk/blend_position",last_facing_direction)
	animation_tree.set("parameters/Attack/blend_position",last_facing_direction)

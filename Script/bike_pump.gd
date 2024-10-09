extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
signal enemy_hit
signal miss

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
		if position == Vector2(-16,0): #Left
			animation_player.play("left")
		elif position == Vector2(+16,0): #Right
			animation_player.play("right")
		elif position == Vector2(0,16): #Down
			animation_player.play("down")
		elif position == Vector2(0,-16): #Up
			animation_player.play("up")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("Enemy"):
		pass
	else:
		animation_player.stop()
		miss.emit(true)
		queue_free()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	miss.emit(true)
	queue_free()

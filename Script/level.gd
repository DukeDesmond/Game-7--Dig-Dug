extends Node2D
@export var player : CharacterBody2D
@onready var tile_map_layer: TileMapLayer = $TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.dig.connect(deleteTile)


func deleteTile(collision):
	if collision.get_collider() is TileMapLayer:
		var tile_pos = collision.get_collider().local_to_map(player.global_position)
		tile_pos -= Vector2i(collision.get_normal())
		var tile = collision.get_collider().get_cell_atlas_coords(tile_pos)
		tile_map_layer.set_cell(tile_pos, -1)

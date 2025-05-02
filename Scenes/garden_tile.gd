extends Node

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	print(tile_map_layer.get_cell_tile_data(Vector2i(0,0)))
	print_debug(tile_map_layer.get_cell_tile_data(Vector2i(0,0)))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

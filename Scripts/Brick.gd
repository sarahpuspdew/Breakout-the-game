extends StaticBody2D

signal brick_destroyed

@export var level: int
@export var point: int = 100
@export var sprites : Array[Texture] = [
	preload("res://Assets/Brick-Blue.png"),
	preload("res://Assets/Brick-Green.png"),
	preload("res://Assets/Brick-Yellow.png"),
	preload("res://Assets/Brick-Orange.png"),
	preload("res://Assets/Brick-Red.png")
]


func _ready():
	set_level(level)


func set_level(new_level : int):
	level = new_level
	$Sprite2D.texture = sprites[new_level - 1]


func decrease_level():
	if level > 1:
		set_level(level - 1)
	else:
		GameManager.point_scored.emit(point)
		queue_free()


func _on_area_2d_body_entered(body):
	if body is Ball:
		decrease_level()

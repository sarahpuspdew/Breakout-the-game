extends Node

signal game_started
signal game_ended
signal point_scored(point)
signal life_lost

var is_game_started : bool = false
var is_game_ended : bool = false
var lifes : int = 3
var score : int = 0


func _ready():
	point_scored.connect(_on_point_scored)
	life_lost.connect(_on_life_lost)


func _on_point_scored(point):
	score += point


func _on_life_lost():
	lifes -= 1
	
	if lifes <= 0:
		game_ended.emit()

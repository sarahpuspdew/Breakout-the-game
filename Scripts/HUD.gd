extends Control


func _ready():
	GameManager.point_scored.connect(_on_point_scored)
	GameManager.life_lost.connect(_on_life_lost)
	
	$Lives.text = "Lives: " + str(GameManager.lifes)


func _on_point_scored(point):
	$Score.text = str(GameManager.score)


func _on_life_lost():
	$Lives.text = "Lives: " + str(GameManager.lifes)

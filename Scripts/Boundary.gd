extends Area2D


func _on_body_entered(body):
	if body is Ball:
		var ball : Ball = body
		
		GameManager.life_lost.emit()
		await get_tree().create_timer(1).timeout
		ball.reset()

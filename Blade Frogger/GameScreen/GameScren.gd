extends Control

func _process(delta):
	$"Label".text = 'Score: ' + str(Global.score)
	
	if Input.is_action_pressed("ui_select"):
		get_tree().change_scene("res://Level/Level.tscn")
		Global.score = 0

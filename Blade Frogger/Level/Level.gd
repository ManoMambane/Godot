extends Node

const CAR = preload("res://Car/Car.tscn")

func _ready():
	$YSort/Player.position = $PlayerStartPos.position
	$"CanvasLayer/Label".text = 'Score: ' + str(Global.score)
	
func car_spawn(start_pos):
	#create car in random position
	var car = CAR.instance()
	var car_start_node_name = "StartPositions/CarStart" + str(start_pos)
	car.position = get_node(car_start_node_name).position
	$"YSort".add_child(car)
	
	#running times, randomly
	var timer_node_name = "CarTimers/Timer" + str(start_pos)
	get_node(timer_node_name).wait_time = rand_range(1.5,2.5)

func _process(delta):
	if $"YSort/Player".position.y <= 10:
		$"YSort/Player".position = $"PlayerStartPos".position
		Global.score += 1
		$"WinSound".play()
	$"CanvasLayer/Label".text = 'Score: ' + str(Global.score)

func _on_Timer1_timeout():car_spawn(1)
func _on_Timer2_timeout():car_spawn(2)
func _on_Timer3_timeout():car_spawn(3)
func _on_Timer4_timeout():car_spawn(4)
func _on_Timer5_timeout():car_spawn(5)

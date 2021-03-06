extends KinematicBody

const SPEED = 5
const GRAVITY = 1

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		$Head.rotate_y(deg2rad(event.relative.x * -0.3)) #player roataion
		$Head/Eyes.rotate_x(deg2rad(event.relative.y * -0.3)) #camera rotation

func _process(delta):
	var velocity = Vector3.ZERO
	var direction = $Head.get_global_transform().basis
	
	if Input.is_action_pressed("forward"): velocity -= direction.z
	if Input.is_action_pressed("backward"): velocity += direction.z
	if Input.is_action_pressed("rightward"): velocity += direction.x
	if Input.is_action_pressed("leftward"): velocity -= direction.x
	
	move_and_slide(velocity.normalized() * SPEED)

extends KinematicBody2D

export (int) var speed = 200
export (int) var progress_speed = 1

var velocity = Vector2()
var bullet_wait = false
var Bullet = preload("res://Scenes/Bullet.tscn")

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	if Input.is_action_just_pressed("shoot") and bullet_wait == false:
		shoot()

func _process(delta):
	var prog = get_node("ProgressBar")
	if bullet_wait:
		prog.visible = true
		prog.value += progress_speed
		if(prog.value >= 100):
			prog.visible = false
			bullet_wait = false
			prog.value = 0

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func shoot():
	var bul = Bullet.instance()
	bul.start(get_node("Gun/GunFront").global_position,$Gun.rotation)
	get_parent().add_child(bul)
	bullet_wait = true

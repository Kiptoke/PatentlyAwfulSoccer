extends KinematicBody2D

export (int) var speed = 10000
export (int) var margin = 100
export (int) var progress_speed = 1

onready var ball = get_node("../Ball")
var velocity = Vector2()
var bullet_wait = false
var Bullet = preload("res://Scenes/Bullet.tscn")

func _process(_delta):
	if ball.position.y > position.y + 10:
		velocity.y += speed
	if ball.position.y < position.y - 10:
		velocity.y -= speed
	if bullet_wait == false:
		shoot()
		
	var prog = get_node("ProgressBar")
	if bullet_wait:
		prog.visible = true
		prog.value += progress_speed
		if(prog.value >= prog.max_value):
			prog.visible = false
			bullet_wait = false
			prog.value = 0
	
func _physics_process(delta):
	velocity = move_and_slide(velocity * delta)

func shoot():
	var bul = Bullet.instance()
	bul.start(get_node("Gun/GunFront").global_position,$Gun.rotation)
	get_parent().add_child(bul)
	$Gun/AudioStreamPlayer2D.play()
	bullet_wait = true

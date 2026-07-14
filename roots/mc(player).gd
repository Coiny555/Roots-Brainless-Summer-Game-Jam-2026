extends CharacterBody2D

@export var speed = 400

@onready var _animated_sprite = $AnimatedSprite2D

var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size



func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	if (Input.is_action_pressed("move_left")):
		velocity.x -= speed
		_animated_sprite.play("walk")
	elif (Input.is_action_pressed("move_right")):
		velocity.x += speed
		_animated_sprite.play("walk")
	elif (Input.is_action_pressed("move_up")):
		velocity.y -= 1
		_animated_sprite.play("walk")
	elif (Input.is_action_pressed("move_down")):
		velocity.y += 1
		_animated_sprite.play("walk")
	else:
		_animated_sprite.play("idle")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed 
		
	position += velocity * delta

	
	

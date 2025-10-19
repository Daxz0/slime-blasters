extends CharacterBody2D

var SPEED = 600

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = direction * SPEED
	var anim_player = $HappyBoo/AnimationPlayer

	move_and_slide()

	if velocity.length() > 0.0:
		anim_player.play("walk")
	else:
		anim_player.play("idle")

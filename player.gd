extends CharacterBody2D

const SPEED = 600

signal health_depleted
var health = 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = direction * SPEED
	var anim_player = $HappyBoo/AnimationPlayer

	move_and_slide()

	if velocity.length() > 0.0:
		anim_player.play("walk")
	else:
		anim_player.play("idle")

	var touching_mobs = %Hurtbox.get_overlapping_bodies()

	for mob in touching_mobs:
		health -= mob.hurt_value * delta
	
	if health <= 0:
		health_depleted.emit()

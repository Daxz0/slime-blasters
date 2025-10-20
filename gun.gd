extends Area2D


func _physics_process(delta: float) -> void:
	var enemies = get_overlapping_bodies()

	if enemies.size() > 0:
		var target = enemies[0]
		look_at(target.global_position)


func shoot():
	const BULLET = preload("res://bullet.tscn")

	var new_bullet = BULLET.instantiate()

	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	new_bullet.z_index = -1


	%ShootingPoint.add_child(new_bullet)

func _on_fire_rate_timeout() -> void:
	shoot()

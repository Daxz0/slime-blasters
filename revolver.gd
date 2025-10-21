extends Area2D

@export var BULLET = preload("res://revolver_shot.tscn")

func _physics_process(delta: float) -> void:
	var enemies = get_overlapping_bodies()
	print(enemies)

	if enemies.size() > 0:
		var target = enemies[0]
		look_at(target.global_position)


func shoot():

	var new_bullet = BULLET.instantiate()

	new_bullet.z_index = -1


	%ShootingPoint.add_child(new_bullet)

func _on_fire_rate_timeout() -> void:
	shoot()

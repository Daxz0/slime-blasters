extends Area2D


@export var SPEED = 500
@onready var player = get_node("/root/Game/Player")

var lifetime = 0
func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)

	var moveConstant = SPEED * delta

	position += direction * moveConstant
	lifetime += moveConstant

	if lifetime > 1000:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	queue_free()

	if body.has_method("take_damage"):
		body.take_damage(50 * player.damageMul)

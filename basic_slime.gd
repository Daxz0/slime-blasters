extends CharacterBody2D


@export var hurt_value: float = 5.0
@onready var player = get_node("/root/Game/Player")

func _ready() -> void:
	$Slime/AnimationPlayer.play("walk")

const SPEED = 300.0
var health = 50

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED

	move_and_slide()


func take_damage(damage):
	health -= damage

	$Slime/AnimationPlayer.play("hurt")
	$Slime/AnimationPlayer.queue("walk")

	if health <= 0:
		queue_free()

		const SMOKE = preload("res://smoke_explosion/smoke_explosion.tscn")
		const XP = preload("res://experience.tscn")

		var smoke = SMOKE.instantiate()
		var expa = XP.instantiate()

		get_parent().add_child(smoke)
		get_parent().add_child(expa)
		smoke.global_position = global_position
		expa.gain_xp.connect(player._on_gain_xp)
		expa.global_position = global_position


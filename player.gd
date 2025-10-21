extends CharacterBody2D

const SPEED = 600

signal health_depleted
var health = 100.0
var xp = 0.0
var level = 0

@onready var GAME = get_node("/root/Game")

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = direction * SPEED
	var anim_player = $HappyBoo/AnimationPlayer

	move_and_slide()

	if velocity.length() > 0.0:

		if Input.is_action_pressed("move_left"):
			# flips the charcater to the other side when left
			$HappyBoo.scale = Vector2(-1,1)
		elif Input.is_action_pressed("move_right"):
			#  defdault rotation
			$HappyBoo.scale = Vector2(1,1)

		anim_player.play("walk")
	else:
		anim_player.play("idle")

	var touching_mobs = %Hurtbox.get_overlapping_bodies()

	for mob in touching_mobs:
		health -= mob.hurt_value * delta

	%Healthbar.value = health
	
	if health <= 0:
		%Healthbar.value = 0
		health_depleted.emit()




func _on_gain_xp(value) -> void:
	xp+=value

	if xp >= 100:
		xp-=100
		level +=1
		%XPBar.get_node("Label").text = "Lvl.%d" % level
	%XPBar.value = xp
 
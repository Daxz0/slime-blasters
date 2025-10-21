extends Node2D

var weapon = "Pistol"

func _on_ready():
    get_tree().paused = true

func spawn_mob():

    var new_mob = preload("res://basic_slime.tscn").instantiate()
    %PathFollow2D.progress_ratio = randf()

    new_mob.global_position = %PathFollow2D.global_position
    add_child(new_mob)


func _on_spawn_timer_timeout() -> void:
    spawn_mob()


func _on_player_health_depleted() -> void:
    %GameOver.visible = true
    get_tree().paused = true


func _on_start_button_pressed() -> void:
    get_tree().paused = false
    %GameStart.visible = false


func _on_select_button_pressed() -> void:
    %WeaponSelector.visible = true



func _on_return_pressed() -> void:
    %WeaponSelector.visible = false


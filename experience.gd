extends Area2D

signal gain_xp

@export var value = 5

func _on_body_entered(body: Node2D) -> void:
    queue_free()
    gain_xp.emit()
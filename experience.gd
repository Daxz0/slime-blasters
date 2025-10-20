extends Area2D

signal gain_xp

func _on_body_entered(body: Node2D) -> void:
    queue_free()
    gain_xp.emit()
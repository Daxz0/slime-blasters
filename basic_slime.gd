extends CharacterBody2D


func _ready() -> void:
	var r = randf()
	var g = randf()
	var b = randf()
	modulate = Color(r, g, b)

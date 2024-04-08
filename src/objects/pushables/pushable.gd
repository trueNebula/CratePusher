class_name Pushable

extends CharacterBody2D

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
    velocity.y += gravity * delta
    move_and_slide()
    velocity.x = 0

func slide(vector) -> void:
    velocity.x = vector.x

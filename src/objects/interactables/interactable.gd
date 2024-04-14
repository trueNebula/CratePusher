class_name Interactable

extends CharacterBody2D

signal interacted

var blocked = false

@onready
var collision: CollisionShape2D = $CollisionShape2D

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
    if blocked:
        return

    if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
        if get_viewport_rect().has_point(to_local(event.position)):
            emit_signal("interacted")
    return

func _on_area_2d_body_entered(body: Node2D) -> void:
    if body is Pushable:
        blocked = true

func _on_area_2d_body_exited(body: Node2D) -> void:
    if body is Pushable:
        blocked = false

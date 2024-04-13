class_name Interactable

extends CharacterBody2D

signal interacted

@onready
var collision: CollisionShape2D = $CollisionShape2D

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_viewport_rect().has_point(to_local(event.position)):
			emit_signal("interacted")
	return

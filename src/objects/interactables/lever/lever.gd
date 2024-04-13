extends Interactable

@onready
var animation = $AnimatedSprite2D
@onready
var child = $Affected

func _on_interacted() -> void:
	animation.frame = 1
	if child:
		child.affect()

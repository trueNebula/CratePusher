extends Moveable

@export var loop: bool = true

var was_started = false

func affect():
	if not was_started:
		if loop:
			animation.play('move')
		else:
			animation.play('move_once')
		was_started = true

extends Moveable

@export var _test = 0
var was_started = false

func affect():
    if not was_started:
        if loop:
            animation.play('move')
        else:
            animation.play('move_once')
        was_started = true

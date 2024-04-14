extends Moveable

@export var _test = 0
var was_started = false

func affect():
    if not was_started:
        animation.play('move_once')
    else:
        animation.play_backwards('move_once')
    was_started = !was_started

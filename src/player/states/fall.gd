extends State

@export var coyote_time: float = 0.2
@export var jump_buffer_time: float = 0.1

@export var walk_state: State
@export var idle_state: State
@export var jump_state: State

var jump_buffer_timer: float = 0.0
var coyote_timer: float = 0.0

func enter() -> void:
    super.enter()
    coyote_timer = coyote_time
    jump_buffer_timer = 0

func process_input(_input: InputEvent) -> State:
    if Input.is_action_just_pressed('jump'):
        jump_buffer_timer = jump_buffer_time
        if coyote_timer > 0:
            return jump_state

    return null

func process_physics(delta: float) -> State:
    jump_buffer_timer = max(jump_buffer_timer - delta, 0)
    coyote_timer = max(coyote_timer - delta, 0)
    parent.velocity.y += gravity * delta

    var movement = Input.get_axis('move_left', 'move_right') * move_speed

    if movement != 0:
        parent.animations.flip_h = movement < 0
    
    parent.velocity.x = movement
    parent.move_and_slide()

    if parent.is_on_floor():
        if jump_buffer_timer > 0:
            return jump_state
        if movement != 0:
            return walk_state
        return idle_state

    return null

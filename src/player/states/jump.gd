extends State

@export var jump_force: float = 700
@export var fall_multiplier: float = 2.0

@export var fall_animation_name: String
@export var walk_state: State
@export var idle_state: State
@export var fall_state: State

func enter() -> void:
    super()
    parent.velocity.y = -jump_force

func process_physics(delta: float) -> State:
    parent.velocity.y += gravity * delta

    if parent.velocity.y > 0:
        animations.play(fall_animation_name)
        parent.velocity.y += gravity * fall_multiplier * delta

    var movement = Input.get_axis('move_left', 'move_right') * move_speed

    if Input.is_action_just_released('jump'):
        parent.velocity.y *= 1 / fall_multiplier

    if movement != 0:
        parent.animations.flip_h = movement < 0
    
    parent.velocity.x = movement
    parent.move_and_slide()

    if parent.is_on_floor():
        if movement != 0:
            return walk_state
        return idle_state

    return null

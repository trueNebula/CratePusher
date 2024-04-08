extends State

@export var jump_state: State
@export var idle_state: State
@export var fall_state: State

var newest_direction: float

func process_input(_input: InputEvent) -> State:
    if Input.is_action_just_pressed('move_left'):
        newest_direction = -1
    elif Input.is_action_just_pressed('move_right'):
        newest_direction = 1
    if Input.is_action_just_pressed('jump') and parent.is_on_floor():
        return jump_state
    return null

func process_physics(delta: float) -> State:
    parent.velocity.y += gravity * delta
    var movement = Input.get_axis('move_left', 'move_right') * move_speed

    if movement == 0:
        if Input.is_action_pressed('move_left') or Input.is_action_just_pressed('move_right'):
            movement = newest_direction * move_speed
        else:
            return idle_state

    parent.animations.flip_h = movement < 0
    parent.velocity.x = movement
    
    for index in parent.get_slide_collision_count():
        var c = parent.get_slide_collision(index)
        if c.get_collider() is Pushable:
            c.get_collider().slide(-c.get_normal() * parent.push_force)

    parent.move_and_slide()

    if !parent.is_on_floor():
        return fall_state

    return null

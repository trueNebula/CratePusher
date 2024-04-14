class_name Player

extends CharacterBody2D

@export var push_force: float = 100.0
@export var score: int = 0

var dead: bool = false

signal update_hud

@onready
var animations: AnimatedSprite2D = $Animations
@onready
var state_machine: Node = $StateMachine
@onready
var player_vars = get_node_or_null("/root/PlayerVariables")

signal player_dead

func _ready() -> void:
    state_machine.init(self, animations)

func _unhandled_input(event: InputEvent) -> void:
    if dead:
        if not Input.is_action_just_pressed('jump'):
            return
        dead = false
        emit_signal("player_dead")
        get_tree().reload_current_scene()
    
    state_machine.process_input(event)

func _physics_process(delta: float) -> void:
    if not dead:
        state_machine.process_physics(delta)

func _process(delta: float) -> void:
    if not dead:
        state_machine.process_frame(delta)

func _on_collected(type, props) -> void:
    if type == "Cherry":
        var new_score = player_vars.update_score(props.score)
        emit_signal("update_hud", new_score)

func die() -> void:
    self.visible = false
    dead = true
    emit_signal("player_dead")
    

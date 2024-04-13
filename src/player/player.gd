class_name Player

extends CharacterBody2D

@export var push_force: float = 100.0
@export var score: int = 0

@onready
var animations: AnimatedSprite2D = $Animations
@onready
var state_machine: Node = $StateMachine

signal update_hud

func _ready() -> void:
	state_machine.init(self, animations)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_collected(type, props) -> void:
	if type == "Cherry":
		score += props.score
		emit_signal("update_hud", score)

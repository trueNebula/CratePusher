extends Area2D

@export var next_scene: String = ""

@onready
var indicator: Sprite2D = $Indicator
@onready
var player_vars: Node = get_node_or_null("/root/PlayerVariables")

var entered: bool = false

func _init() -> void:
    if !indicator:
        return
    indicator.visible = false

func _process(_delta: float) -> void:
    if entered and Input.is_action_just_pressed('jump'):
        player_vars.save_score()
        get_tree().change_scene_to_file(next_scene)

func _on_body_entered(body) -> void:
    if body is Player:
        entered = true
        indicator.visible = true
        
func _on_body_exited(body: Node2D) -> void:
    if body is Player:
        entered = false
        indicator.visible = false
        

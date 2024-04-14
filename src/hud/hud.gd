extends CanvasLayer

@onready
var score_label: Label = $ScoreLabel
@onready
var message_label: Label = $MessageLabel
@onready
var button: TextureButton = $TextureButton
@onready
var player_vars: Node = get_node_or_null("/root/PlayerVariables")

const score_text: String = " Score: "

func _ready() -> void:
    if !player_vars:
        return
    
    update_score(player_vars.score_at_start_of_scene)    

func update_score(new_score):
    score_label.text = score_text + str(new_score)

func _on_update_hud(info):
    update_score(info)

func _on_reload_pressed() -> void:
    var scene = get_tree().reload_current_scene()

func _on_player_dead() -> void:
    message_label.visible = !message_label.visible

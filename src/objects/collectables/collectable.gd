class_name Collectable
extends Area2D

@export var type: String = ""
@export var props: Dictionary = {}

signal collected

func _ready():
    var player_node = get_tree().get_root().get_node_or_null("player")
    
    if  !player_node:
        return
    
    collected.connect(player_node._on_collected)

func _on_body_entered(body):
    if body is Player:
        queue_free()
        body._on_collected(type, props)

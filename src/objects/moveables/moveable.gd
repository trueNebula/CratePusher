class_name Moveable
extends Path2D

@export var closed_path: bool = true
@export var speed: float = 50.0
@export var speed_scale: float = 1.0
@export var affectable: bool = false

var start: bool = false

@onready
var path: PathFollow2D = $PathFollow2D
@onready
var animation: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    if not closed_path:
        animation.speed_scale = speed_scale
        set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if affectable and not start:
        return
        
    path.progress += speed * delta

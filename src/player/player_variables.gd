extends Node

@export var score_at_start_of_scene: int = 0
@export var score: int = 0

func save_score() -> void:
    score_at_start_of_scene = score

func update_score(bonus_score) -> int:
    score += bonus_score
    return score

extends CanvasLayer

@onready
var score_label: Label = $ScoreLabel

const score_text: String = "Score: "

func update_score(new_score):
	score_label.text = score_text + str(new_score)

func _on_update_hud(info):
	update_score(info)

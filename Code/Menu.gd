extends Button



func _ready():
	connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	var target_scene = "res://Scenes/MainMenu.tscn"
	get_tree().change_scene(target_scene)
	queue_free()


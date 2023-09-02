extends ColorRect

const menu = preload("res://Scenes/MainMenu.tscn")


func _input(event):
	if event is InputEventKey and event.pressed:
		get_parent().add_child(menu.instance())
		queue_free()

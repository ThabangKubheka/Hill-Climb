extends Area2D

export(int) var value = 15

var picked_up = false

func _on_BB_body_entered(body):
	if body.is_in_group('player'):
		var level_scene = get_tree().get_root().get_node("Level1")
		if level_scene != null:
			level_scene.add_bb(value)
		$AnimationPlayer.play("pickup")
		$CollisionShape2D.set_deferred("disabled", true)
		picked_up = true

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

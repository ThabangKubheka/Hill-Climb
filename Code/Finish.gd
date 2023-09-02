extends Area2D

var picked_up =false
var win = "YOU WIN"

func _on_Finish_body_entered(body):
	if body.is_in_group('player'):
		get_tree().reload_current_scene()
		$AnimationPlayer.play("pickup")
		$CollisionShape2D.set_deferred("disabled",true)
		picked_up = true


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

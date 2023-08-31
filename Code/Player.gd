extends RigidBody2D

var wheels =[]
var speed = 60000
var max_speed = 50
var fuel = 100
var dead =false 
var driving = 0

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")
	get_parent().update_fuel_UI(fuel)
	
func _physics_process(delta):
	
	driving =0
	
	if fuel > 0 && !dead:
		$GameOver.stop()
		if Input.is_action_pressed("ui_up"):
			driving += 1
			apply_torque_impulse(-6000 * delta * 60)
			for wheel in wheels:
					if wheel.angular_velocity < max_speed:
						wheel.apply_torque_impulse(speed * delta* 60)
					
		if Input.is_action_pressed("ui_down"):
			driving += 1
			apply_torque_impulse(2000 * delta * 60)
			for wheel in wheels:
				if wheel.angular_velocity < max_speed:
					wheel.apply_torque_impulse(-speed * delta* 60)
				
		
	else:
		if $GameOver.is_stopped():
			$GameOver.start()
			
	if $Head.rotation_degrees > 90 || $Head.rotation_degrees < -90 && !dead:
			$CollisionPolygon2D.set_deferred("disabled",true)
			$Head/CollisionShape2D.set_deferred("disabled",true)
			
			death()
			dead =true
			$Head/HeadSpring.node_b=""
				
	if driving == 1:
		$Engine.pitch_scale = lerp($Engine.pitch_scale,2, 2 * delta)
		use_fuel(delta)
	else:
		$Engine.pitch_scale = lerp($Engine.pitch_scale,1, 2 * delta)

		
func death():
	get_parent().call_death()	
				
func refuel():
	fuel=100
	get_parent().update_fuel_UI(fuel)
	
func use_fuel(delta):
	fuel -=30*delta
	fuel = clamp(fuel,0,100)
	get_parent().update_fuel_UI(fuel)
	


func _on_GameOver_timeout():
	get_tree().reload_current_scene()

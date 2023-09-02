extends Node2D

var coins_collected = 0
var bb_collected = 0
var cause_of_death ="BROKEN NECK  "
var win = "YOU WIN"
		

func add_coins(amount):
	coins_collected += amount
	$UI/Coin/Label.text = str(coins_collected)
	
func add_bb(amount):
	bb_collected += amount
	$UI/Bucks/Label.text = str(bb_collected)
	
func finish():
	$GameOver.stop()
	$UI/Death/Label.text = str(win)
	

func update_fuel_UI(value):
	$UI/Fuel/ProgressBar.value = value
	var stylebox = $UI/Fuel/ProgressBar.get('custom_styles/fg')
	stylebox.bg_color.h = lerp(0, 0.3, value /100)
	if value == 0:
		$UI/Fuel/AnimationPlayer.play("alarm")
	else:
		$UI/Fuel/AnimationPlayer.play('idle')
		
func call_death():
	$UI/Death/DeathPlayer.play('alarm')
	$UI/Death/Label.text = str(cause_of_death)

	
	
	
		

extends Node2D
#script for battle scenes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# checks for enemy and player health and displays/updates ui information
func _process(delta: float) -> void:
	if GameManager.tamtamlist[GameManager.index-1]!= null:
		$Enemies/DamageDelt.text = ("EnemyDelt:"+str(GameManager.damagedelttoTamTam)+"\n"+str(GameManager.tamtamlist[GameManager.index-1]["Name"])+"Delt:"+str(GameManager.damagedelttoEnemy))
		$Enemies/HP.text= ("EnemyHp:"+str(GameManager.enemyhealth)+"\n"+str(GameManager.tamtamlist[GameManager.index-1]["Name"]) +"Hp:"+str(GameManager.tamtamlist[GameManager.index-1]["TTCurHP"]))
		
		if GameManager.enemyhealth <=0:
			$BattleMapLayers/AttackButton.position = Vector2(-154, 0)
			$BattleMapLayers/AttackButton.scale = Vector2(1,1)
			$BattleMapLayers/AttackButton.text = ("Enemy Deafeated! \nCollect your Reward!")
		else:
			$BattleMapLayers/AttackButton.position = Vector2(-104, 0)
			$BattleMapLayers/AttackButton.size = Vector2(73,31)
			$BattleMapLayers/AttackButton.text = "ATTACK!"
		if GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] <=0:
			$"../Garden".show()
			$"../Garden/GardenCam".enabled = true
			$".".hide()
			$BattleMapLayers/BattleCam.enabled = false
			GameManager.newEnemy.hide()
	else:
		pass
#signal from run button whcih hides battle scene and shows garden scene
func _on_run_button_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	$".".hide()
	$BattleMapLayers/BattleCam.enabled = false
	GameManager.newEnemy.hide()

#signal from attack button to do damage to enemy at cost of cleanliness, hunger and rolls damage for both enemy and tamtam
#if enemy hp is less than or equal to 0 then change attack button text to reward collection button text which swaps scenes to garden
func _on_attack_button_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	GameManager.incircuit=false
	GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"] -=1
	GameManager.tamtamlist[GameManager.index-1]["TTHUnger"] -=1
	GameManager.tamtamlist[GameManager.index-1]['Sprite'].global_position.y -= 50
	GameManager.newEnemy.modulate = Color(1,0,0,.5)
	if $BattleMapLayers/AttackButton.text == ("Enemy Deafeated! \nCollect your Reward!"):
		GameManager.gold+=randi_range(5,15)
		GameManager.tamtamlist[GameManager.index-1]["TTExp"]+=9
		$"../Garden".show()
		$"../Garden/GardenCam".enabled = true
		$".".hide()
		$BattleMapLayers/BattleCam.enabled = false
		GameManager.newEnemy.hide()
		GameManager.tamtamlist[GameManager.index-1]['Sprite'].global_position.y =0
		GameManager.newEnemy.modulate = Color(1.0, 1.0, 1.0)
	else:
		if GameManager.enemyhealth >= 0 :
			var tempdps = GameManager.enemyhealth
			GameManager.enemyhealth -= randi_range(GameManager.tamtamlist[GameManager.index-1]["TTStrength1"],GameManager.tamtamlist[GameManager.index-1]["TTStrength2"])
			GameManager.damagedelttoEnemy = tempdps-GameManager.enemyhealth # Replace with function body.			
		if GameManager.tamtamlist[GameManager.index-1]["TTCurHP"]>=0:
			var priorHP = GameManager.tamtamlist[GameManager.index-1]["TTCurHP"]
			GameManager.damagedelttoTamTam = randi_range(GameManager.enmstrength1,GameManager.enmstrength2)
			GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] = priorHP-GameManager.damagedelttoTamTam
		$BattleMapLayers/AttackButton.hide()
		var timer = null
		timer = get_tree().create_timer(1)
		await timer.timeout
		$BattleMapLayers/AttackButton.show()
		GameManager.tamtamlist[GameManager.index-1]['Sprite'].global_position.y =0
		GameManager.newEnemy.modulate = Color(1.0, 1.0, 1.0)

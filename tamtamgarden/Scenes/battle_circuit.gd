extends Node2D

#mini rouge like only way to actually make a tamtam flee actively other than waiting for timer to reduce cleanliness of a tamtam
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


#checks rounds for if allow dark egg purchase, checks for enemy and tamtam hp, update/display ui
func _process(delta: float) -> void:
	if GameManager.tamtamlist[GameManager.index-1]!= null and GameManager.newEnemy !=null and GameManager.incircuit ==true:
		$Enemies/DamageDelt.text = (str(GameManager.newEnemy.name)+" Delt:"+str(GameManager.damagedelttoTamTam)+"\n"+str(GameManager.tamtamlist[GameManager.index-1]["Name"])+ "Delt:"+str(GameManager.damagedelttoEnemy))
		$Enemies/HP.text= ((str(GameManager.newEnemy.name)+"Hp:"+str(GameManager.enemyhealth)+"\n"+str(GameManager.tamtamlist[GameManager.index-1]["Name"])+"Hp:"+str(GameManager.tamtamlist[GameManager.index-1]["TTCurHP"])))
		$Rounds.text = ("Round "+ str(GameManager.round))
		if GameManager.round == 10 or GameManager.round == 20 or GameManager.round == 30:
			
			$DarkEggBuy.show()
			$Yes.show()
			$No.show()
		else:
			
			$DarkEggBuy.hide()
			$Yes.hide()
			$No.hide()
		if GameManager.enemyhealth <=0:
			GameManager.newEnemy.show()
			GameManager.round +=1
			GameManager.gold+=randi_range(5,15)
			GameManager.tamtamlist[GameManager.index-1]["TTExp"]+=9
			GameManager.tamtamlist[GameManager.index-1]['Sprite'].global_position.y =0
			GameManager.newEnemy.modulate = Color(1.0, 1.0, 1.0)
			GameManager.newEnemy.hide()
			
			$BattleMapLayers/AttackButton.position = Vector2(-154, 0)
			$BattleMapLayers/AttackButton.scale = Vector2(1,1)
			$BattleMapLayers/AttackButton.text = ("Enemy Deafeated! \nCollect your Reward and Head to Next Round?")
			#load in new enemy, count round up, check if round = 10 then show buy darktamtam egg if yes then buys egg returns to garden if no advance to round 11 
			var derm: CharacterBody2D = $"../BattleCircuit/TamTams/Derm"
			var orah: CharacterBody2D = $"../BattleCircuit/TamTams/Orah"
			var moko: CharacterBody2D = $"../BattleCircuit/TamTams/Moko"
			var holyderm: CharacterBody2D = $"../BattleCircuit/TamTams/HolyDerm"
			var holyorah: CharacterBody2D = $"../BattleCircuit/TamTams/HolyOrah"
			var holymoko: CharacterBody2D = $"../BattleCircuit/TamTams/HolyMoko"
			var darkderm: CharacterBody2D = $"../BattleCircuit/TamTams/DarkDerm"
			var darkorah: CharacterBody2D = $"../BattleCircuit/TamTams/DarkOrah"
			var darkmoko: CharacterBody2D = $"../BattleCircuit/TamTams/DarkMoko"
			var EnemyList = [derm,orah,moko,holyderm,holymoko, holyorah,darkderm,darkorah,darkmoko]
			var liveEnemy= EnemyList[randi_range(0,8)]
			GameManager.newEnemy= liveEnemy
			GameManager.newEnemy.show()
			GameManager.newEnemy.global_position.y =-50
			if liveEnemy == EnemyList[0] or liveEnemy == EnemyList[1] or liveEnemy == EnemyList[2]:
				GameManager.enemyhealth = 100
				GameManager.enmstrength1=5
				GameManager.enmstrength2=10
			elif liveEnemy == EnemyList[3] or liveEnemy == EnemyList[4] or liveEnemy == EnemyList[5]:
				GameManager.enemyhealth = 200
				GameManager.enmstrength1=5
				GameManager.enmstrength2=10
			elif liveEnemy == EnemyList[6] or liveEnemy == EnemyList[7] or liveEnemy == EnemyList[8]:
				GameManager.enemyhealth = 300
				GameManager.enmstrength1=10
				GameManager.enmstrength2=20
			#if GameManager.enemyhealth == 0:
				#liveEnemy.hide()
				#GameManager.newEnemy.hide()
			$"../BattleCircuit/Enemies/Appeared".text= ("A "+str(GameManager.newEnemy.name)+" Has Appeared")
			$"../BattleCircuit/Enemies/HP".text= (str(GameManager.newEnemy.name)+"s Hp:"+str(GameManager.enemyhealth))
		else:
			$BattleMapLayers/AttackButton.position = Vector2(-104, 0)
			$BattleMapLayers/AttackButton.size = Vector2(73,31)
			$BattleMapLayers/AttackButton.text = "ATTACK!"
		if GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] <=0:
			GameManager.dark = false
			GameManager.round = 1
			GameManager.incircuit =false
			$"../Garden".show()
			$"../Garden/GardenCam".enabled = true
			$".".hide()
			$BattleMapLayers/BattleCam.enabled = false
			GameManager.newEnemy.hide()
	else:
		pass
	#resets round to 1, dark tag to false(redundancy check for if run when prompeted to buy dark egg), and swap scene to garden
func _on_run_button_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	$".".hide()
	$BattleMapLayers/BattleCam.enabled = false
	GameManager.newEnemy.hide()
	GameManager.incircuit =false
	GameManager.round = 1
	GameManager.dark = false
#execute attack rolles and hp hps, play animations, and play sounds
func _on_attack_button_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	GameManager.incircuit = true	
	GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"] -=1
	GameManager.tamtamlist[GameManager.index-1]["TTHUnger"] -=1
	GameManager.tamtamlist[GameManager.index-1]['Sprite'].global_position.y -= 50
	GameManager.newEnemy.modulate = Color(1,0,0,.5)
	if $BattleMapLayers/AttackButton.text == ("Enemy Deafeated! \nCollect your Reward and Head to Next Round?"):
		pass
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

#sends signal to hatch function and hides active tamtam then swaps scene to garden and reset round to 1
func _on_yes_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.newEnemy.hide()
	GameManager.round = 1
	GameManager.tamtamlist[GameManager.index-2]["Sprite"].hide()
	
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	$".".hide()
	$BattleMapLayers/BattleCam.enabled = false
#continue the battle circuit
func _on_no_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.round +=1 # Replace with function body.

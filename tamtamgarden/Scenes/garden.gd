extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
 # Replace with function body.
	pass

#home base
#from this scene all buttons out to other areas are managed by hiding the garden node then showing the desired node area to go to
func _process(delta: float) -> void:
	if GameManager.tutorial == true:
		$Tutorial.hide()
	if GameManager.dex[0]==true and GameManager.dex[1]==true and GameManager.dex[2]==true and GameManager.dex[3]==true and GameManager.dex[4]==true and GameManager.dex[5]==true and GameManager.dex[6]==true and GameManager.dex[7]==true and GameManager.dex[8]==true:
		$Mastery.show()
	else:
		$Mastery.hide()
	if GameManager.tamtamlist[GameManager.index-1] != null:
		GameManager.checklevelup=true
		if GameManager.ingarden == true:
			GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position.x += randf_range(-.4,.4)
			GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position.y += randf_range(-.4,.4)
		#GameManager.tamtamlist[GameManager.index-1]["TTHUnger"] -= 1
		$Stats.text = (str(GameManager.tamtamlist[GameManager.index-1]["Name"])+"s: Level:" + str(GameManager.tamtamlist[GameManager.index-1]["TTLevel"])+",Strength:"+str((GameManager.tamtamlist[GameManager.index-1]["TTStrength1"]+GameManager.tamtamlist[GameManager.index-1]["TTStrength2"])/2))+",Exp:"+str(GameManager.tamtamlist[GameManager.index-1]["TTExp"])
		$Wellness.text =(str(GameManager.tamtamlist[GameManager.index-1]["Name"])+"s Wellness: Hp:"+str(GameManager.tamtamlist[GameManager.index-1]["TTCurHP"]) +",Cleanliness:"+str(GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"])+"\nHunger:"+str(GameManager.tamtamlist[GameManager.index-1]["TTHUnger"]))
		$Gold.text =("Gold:"+str(GameManager.gold))
		var wellness = (GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"]+GameManager.tamtamlist[GameManager.index-1]["TTCurHP"]+GameManager.tamtamlist[GameManager.index-1]["TTHUnger"])
		
		if wellness <= 0:
			$Notification.text = ("Last Fled: " + str(GameManager.tamtamlist[GameManager.index-1]["Name"]))
			
			var checklevelup = false
			GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
			GameManager.tamtamlist[GameManager.index-1]= null
			
			if GameManager.firstmade == true and GameManager.tamtamlist[0] == null and GameManager.tamtamlist[1] == null and GameManager.tamtamlist[2] == null and GameManager.tamtamlist[3] == null and GameManager.tamtamlist[4] == null and GameManager.tamtamlist[5] == null and GameManager.tamtamlist[6] == null and GameManager.tamtamlist[7] == null and GameManager.tamtamlist[8] == null and GameManager.tamtamlist[9] == null:
				$"../HatchMap".hide()
				$"../HatchMap/HatchLayers/HatchCam".enabled = false
				$"../Battle".hide()
				$"../Battle/BattleMapLayers/BattleCam".enabled = false
				$"../Relax".hide()
				$"../Relax/RelaxCam".enabled = false
				$"../Info".hide()
				$"../Info/InfoCam".enabled = false
				$"../Explore".hide()
				$"../Explore/ExploreCam".enabled = false
				$"../Shop".hide()
				$"../Shop/ShopCam".enabled = false
				$"../TamTamBox".hide()
				$"../TamTamBox/TTLCam".enabled = false
				#disable tamtamlist cam
				$"../Tournament".hide()
				$"../Garden".show()
				$"../Garden/RButton".show()
				$Battle.hide()
				$Info.hide()
				$Save.hide()
				$Relax.hide()
				$Explore.hide()
				$"Battle Circuit".hide()
				$TamTamStats.hide()
				$Shop.hide()
				$"../Garden/GardenCam".enabled = true
			else:
				while GameManager.tamtamlist[GameManager.index-1] == null:
					GameManager.findnotnulldex()
	

		if GameManager.checklevelup==true and GameManager.firstmade == true and GameManager.tamtamlist[GameManager.index-1] !=null: 
			if GameManager.tamtamlist[GameManager.index-1]["TTExp"]%10 ==0 && GameManager.tamtamlist[GameManager.index-1]["TTExp"] !=0:
				GameManager.tamtamlist[GameManager.index-1]["TTLevel"]+=1
				GameManager.tamtamlist[GameManager.index-1]["TTExp"]+=1
				GameManager.tamtamlist[GameManager.index-1]["TTMaxHP"]+=10
				GameManager.tamtamlist[GameManager.index-1]["TTStrength1"]+=1
				GameManager.tamtamlist[GameManager.index-1]["TTStrength2"]+=1
			else:
				pass
		
func _on_battle_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] > 0:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].show()
		GameManager.ingarden = false
		$".".hide()
		$GardenCam.enabled = false 
		GameManager.x=0
		GameManager.y=0
		
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x,GameManager.y)
		$"../Battle".show()
		$"../Battle/BattleMapLayers/BattleCam".enabled = true
		var bat: AnimatedSprite2D = $"../Battle/Enemies/Bat"
		var frog: AnimatedSprite2D = $"../Battle/Enemies/Frog"
		var ghost: AnimatedSprite2D = $"../Battle/Enemies/Ghost"
		var skeleton: AnimatedSprite2D = $"../Battle/Enemies/Skeleton"
		var snek: AnimatedSprite2D = $"../Battle/Enemies/SnekBoss"
		
		var EnemyList = [bat,frog,ghost,skeleton,snek]
		var liveEnemy= EnemyList[randi_range(0,4)]
		GameManager.newEnemy= liveEnemy
		liveEnemy.show()
		if liveEnemy == EnemyList[4]:
			GameManager.enemyhealth = 40
			GameManager.enmstrength1=5
			GameManager.enmstrength2=10
		else:
			GameManager.enemyhealth = 20
			GameManager.enmstrength1=2
			GameManager.enmstrength2=3
		#if GameManager.enemyhealth == 0:
			#liveEnemy.hide()
			#GameManager.newEnemy.hide()
		$"../Battle/Enemies/Appeared".text= ("A "+str(GameManager.newEnemy.name)+" Has Appeared")
		$"../Battle/Enemies/HP".text= ("EnemyHp:"+str(GameManager.enemyhealth))
	else:
		$Notification.text = "Your TamTam's HP is Low! \n Head to the Relax Area!"
		var timer
		timer = get_tree().create_timer(2)
		await timer.timeout
		$Notification.text = ""
func _on_shop_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.ingarden = false
	GameManager.holy = false
	GameManager.dark = false
	$".".hide()
	$GardenCam.enabled = false 
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
	$"../Shop".show()
	$"../Shop/ShopCam".enabled = true
	

func _on_info_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.ingarden = false
	$".".hide()
	$GardenCam.enabled = false
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
	$"../Info".show()
	$"../Info/InfoCam".enabled=true
func _on_explore_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.inrelax = false
	GameManager.movementCont = true
	GameManager.holy = true
	GameManager.ingarden = false
	$".".hide()
	$GardenCam.enabled = false
	GameManager.x=0
	GameManager.y=0
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x,GameManager.y)
	$"../Explore".show()
	$"../Explore/ExploreCam".enabled= true
	$"../Explore/Floor1".show()
	$"../Explore/Floor2".hide()
	$"../Explore/Floor3".hide()
	$"../Explore/Floor4".hide()
	$"../Explore/Floor5".hide()
	$"../Explore/Floor1/OntoLevel2".monitoring = true
	$"../Explore/Floor1/OntoLevel3".monitoring = false
	$"../Explore/Floor1/OntoLevel4".monitoring = false
	$"../Explore/Floor1/OntoLevel5".monitoring = false
	$"../Explore/Floor1/RightR".monitoring =false
	$"../Explore/Floor1/LeftR".monitoring = true
	$"../Explore/Floor1/TopR".monitoring = true
	$"../Explore/Floor1/BotR".monitoring = true

func _on_relax_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.movementCont = true
	GameManager.inrelax = true
	GameManager.ingarden = false
	$".".hide()
	$GardenCam.enabled = false
	GameManager.x=0
	GameManager.y=0
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x,GameManager.y)
	$"../Relax".show()
	$"../Relax/RelaxCam".enabled= true
	$"../Explore/Floor1/LeftR".set_deferred("monitoring", true)
	$"../Explore/Floor1/RightR".set_deferred("monitoring", true)
	$"../Explore/Floor1/OntoLevel2".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel3".set_deferred("monitoring", false)
	#$"../Explore/Floor1/OntoLevel2/CollisionShape2D".set_deferred("disabled", true)
	#$"../Explore/Floor1/OntoLevel3/CollisionShape2D".set_deferred("disabled",  true)
	#$"../Explore/Floor1/LeftR/CollisionShape2D".position.x = -400
	#$"../Explore/Floor1/RightR/CollisionShape2D".position.x = 550
	$"../Explore/Floor1/LeftR/CollisionShape2D".set_deferred("position.x", -400)
	$"../Explore/Floor1/RightR/CollisionShape2D".set_deferred("position.x", 550)
#create check if not null in future buttons, create dictionary data type instead



func _on_tam_tam_stats_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.ingarden = false
	GameManager.inbox = true
	$".".hide()
	$GardenCam.enabled= false
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	$"../TamTamBox".show()
	$"../TamTamBox/TTLCam".enabled= true # Replace with function body.


func _on_button_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	Music.autoplay = false
	Music.autoplay = true
	#$"../Music".playing = false
	get_tree().reload_current_scene()
	GameManager.gold = 200
	GameManager.index = 0


func _on_battle_circuit_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	
	if GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] > 0:
		GameManager.dark = true
		GameManager.round = 1
		GameManager.incircuit =true
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].show()
		GameManager.ingarden = false
		$".".hide()
		$GardenCam.enabled = false 
		GameManager.x=0
		GameManager.y=0
		
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x,GameManager.y)
		$"../BattleCircuit".show()
		$"../BattleCircuit/BattleMapLayers/BattleCam".enabled = true
		$"../BattleCircuit/DarkEggBuy".hide()
		$"../BattleCircuit/Yes".hide()
		$"../BattleCircuit/No".hide()
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
		liveEnemy.show()
		liveEnemy.global_position.y =-50
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
		$"../BattleCircuit/Enemies/HP".text= ("EnemyHp:"+str(GameManager.enemyhealth))
	else:
		$Notification.text = "Your TamTam's HP is Low! \n Head to the Relax Area!"
		var timer
		timer = get_tree().create_timer(2)
		await timer.timeout
		$Notification.text = ""# Replace with function body.

#slow cook the live tamtam the only way to really cause tamtams to flee which is currently set to about 90 mins or so of just leaving it in the garden
# this assumes is lv 1 and hunger would need to be >= -201 for tam tam to flee. should be adjusted for feel of needing to progress with tamtam
func _on_timer_timeout() -> void:
	GameManager.tamtamlist[GameManager.index-1]["TTHUnger"] -= 1 # Replace with function body.

#controls the visibiltiy of the first tutorial information label does not reappear after first close
func _on_tutorial_timer_timeout() -> void:
	GameManager.tutorial = true

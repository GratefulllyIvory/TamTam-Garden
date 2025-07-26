extends Node2D
#this sequence is fairly complicated so im just going to explain it here
#basically turns on and off a series of bumpers and advance level areas
#at the final level Mandle is waiting which allows player to purchase holy egg which then loads that new purchase in
# if able to and send the player back to the garden

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.tamtamlist[GameManager.index-1]!= null:
		$Stats.text =(str(GameManager.tamtamlist[GameManager.index-1]["Name"])+ "s Wellness:"+"\nHp: "+str(GameManager.tamtamlist[GameManager.index-1]["TTCurHP"]) +"\nCleanliness: "+str(GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"])+"\nHunger: "+str(GameManager.tamtamlist[GameManager.index-1]["TTHUnger"]))
		$Gold.text = "Gold:" + str(GameManager.gold)
	

func _on_return_button_pressed() -> void:
	GameManager.movementCont = false
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	$".".hide()
	$ExploreCam.enabled = false
	$"../Explore/Floor1/OntoLevel2".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel3".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel4".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel5".set_deferred("monitoring", false)
	$"../Explore/Floor1/RightR".set_deferred("monitoring", false)
	$"../Explore/Floor1/LeftR".set_deferred("monitoring", false)
	$"../Explore/Floor1/TopR".set_deferred("monitoring", false)
	$"../Explore/Floor1/BotR".set_deferred("monitoring", false)
	GameManager.holy = false

#lower left position back step
func _on_area_2d_body_entered(body: Node2D) -> void:
	if GameManager.xlastchanged ==true:
		GameManager.x *= .5
	elif GameManager.ylastchanged == true:
		if GameManager.tamtamlist[GameManager.index-1]["Name"]== "Derm" or GameManager.tamtamlist[GameManager.index-1]["Name"]== "HolyDerm" or GameManager.tamtamlist[GameManager.index-1]["Name"]== "DarkDerm":
			GameManager.y *= .7
		else:
			GameManager.y *= .45
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x, GameManager.y)
	

#level 1 to 2
func _on_onto_level_2_body_entered(body: Node2D) -> void:
	$Floor1.hide()
	$Floor2.show()
	$Floor1/OntoLevel2.set_deferred("monitoring", false)
	$Floor1/OntoLevel3.set_deferred("monitoring", true)
	$Floor1/RightR.set_deferred("monitoring", true)
	$Floor1/LeftR.set_deferred("monitoring", false)
	GameManager.x = 0
	GameManager.y = 0
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x,GameManager.y)
#wrong way reset
func _on_reset_to_level_1_body_entered(body: Node2D) -> void:
	$Floor1.show()
	$Floor1/OntoLevel2.set_deferred("monitoring", true)
	$Floor1/RightR.set_deferred("monitoring", false)
	$Floor1/OntoLevel3.set_deferred("monitoring", false)
	$Floor1/OntoLevel4.set_deferred("monitoring", false)
	$Floor1/OntoLevel5.set_deferred("monitoring", false)
	$Floor1/LeftR.set_deferred("monitoring", true)
	$Floor1/BotR.set_deferred("monitoring", true)
	$Floor1/TopR.set_deferred("monitoring", true)
	$Floor2.hide()
	$Floor3.hide()
	$Floor4.hide()
	$Floor5.hide()
	GameManager.x = 0
	GameManager.y = 0
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x,GameManager.y)


func _on_onto_level_3_body_entered(body: Node2D) -> void:
	$Floor2.hide()
	$Floor3.show()
	$Floor1/OntoLevel3.set_deferred("monitoring", false)
	$Floor1/OntoLevel4.set_deferred("monitoring", true)
	$Floor1/LeftR.set_deferred("monitoring", true)
	$Floor1/BotR.set_deferred("monitoring", false)
	GameManager.x = 0
	GameManager.y = 0
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x,GameManager.y)

func _on_onto_level_4_body_entered(body: Node2D) -> void:
	$Floor3.hide()
	$Floor4.show()
	$Floor1/OntoLevel4.set_deferred("monitoring", false)
	$Floor1/OntoLevel5.set_deferred("monitoring", true)
	$Floor1/BotR.set_deferred("monitoring", true)
	$Floor1/TopR.set_deferred("monitoring", false)
	GameManager.x = 0
	GameManager.y = 0
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x,GameManager.y)


func _on_onto_level_5_body_entered(body: Node2D) -> void:
	GameManager.movementCont = false
	$Floor4.hide()
	$Floor5.show()

	$Floor1/OntoLevel4.set_deferred("monitoring", false)
	$Floor1/TopR.set_deferred("monitoring", true)
	$Floor1/BotR.set_deferred("monitoring", true)
	$Floor1/RightR.set_deferred("monitoring", true)
	$Floor1/LeftR.set_deferred("monitoring", true)
	GameManager.x = 0
	GameManager.y = 0
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(GameManager.x,GameManager.y)


func _on_no_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	$".".hide()
	$ExploreCam.enabled = false
	$"../Explore/Floor1/OntoLevel2".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel3".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel4".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel5".set_deferred("monitoring", false)
	$"../Explore/Floor1/RightR".set_deferred("monitoring", true)
	$"../Explore/Floor1/LeftR".set_deferred("monitoring", true)
	$"../Explore/Floor1/TopR".set_deferred("monitoring", true)
	$"../Explore/Floor1/BotR".set_deferred("monitoring", true)
	GameManager.holy = false


func _on_yes_buy_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	$".".hide()
	$ExploreCam.enabled = false
	$"../Explore/Floor1/OntoLevel2".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel3".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel4".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel5".set_deferred("monitoring", false)
	$"../Explore/Floor1/RightR".set_deferred("monitoring", true)
	$"../Explore/Floor1/LeftR".set_deferred("monitoring", true)
	$"../Explore/Floor1/TopR".set_deferred("monitoring", true)
	$"../Explore/Floor1/BotR".set_deferred("monitoring", true)

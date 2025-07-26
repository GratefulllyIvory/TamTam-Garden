extends Node2D
#simple shop of buttons 
#place to purchase tamtam eggs n such

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Gold.text =("Gold:"+str(GameManager.gold))
	if GameManager.tamtamlist[GameManager.index-1] != null:
		$TamTamInGarden.text = ("TamTam in Garden: " + str(GameManager.tamtamlist[GameManager.index-1]["Name"]))
		
func _on_button_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].show()
	$".".hide()
	$ShopCam.enabled = false


func _on_protein_powder_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.gold > 10:
		GameManager.tamtamlist[GameManager.index-1]["TTStrength1"]+=1
		GameManager.tamtamlist[GameManager.index-1]["TTStrength2"]+=1
		GameManager.gold -=10


func _on_mind_tomb_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.gold > 10:
		GameManager.tamtamlist[GameManager.index-1]["TTExp"]+=9
		GameManager.gold -=10

func _on_food_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.gold > 10 and GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] < GameManager.tamtamlist[GameManager.index-1]["TTMaxHP"] and GameManager.tamtamlist[GameManager.index-1]["TTHUnger"] <100:
		GameManager.tamtamlist[GameManager.index-1]["TTCurHP"]+=10
		GameManager.tamtamlist[GameManager.index-1]["TTHUnger"]+=10
		GameManager.gold -=1
func _on_soap_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.gold > 1:
		GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"]+=10
		GameManager.gold -=1
		
		

#just plays the sound here but sends another signal back to hatch map hatch
func _on_new_egg_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	
		
		
	#9(0-8) if else checks for if null then create egg at that index in the tamtam list
	#save the curtam tam where its original index was
	#then load that tamtam at that index as the current 
	#if all 9 index spots full then display pop up that your out of box space

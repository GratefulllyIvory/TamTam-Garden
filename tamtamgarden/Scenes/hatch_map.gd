extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass# Replace with function body.


#jitter the egg around a bit and show the egg etc.
func _process(delta: float) -> void:
	if $HatchLayers/AnimatedSprite2D.position.x<600 and $HatchLayers/AnimatedSprite2D.position.x>550:
		$HatchLayers/AnimatedSprite2D.position.x += randi_range(-1,1)
		$HatchLayers/AnimatedSprite2D.position.y += randi_range(-.1,.1)
	else:
		$HatchLayers/AnimatedSprite2D.position.x = 571
#this is how all tamtams are added the the array of dictionaries which stores the information from a refrence pass to the sprite as well as initialization(lv1) stats
func _on_hatch_button_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.movementCont = false
	GameManager.checklevelup = true
	GameManager.ingarden = true
	$HatchLayers.hide()
	$HatchLayers/HatchCam.enabled = false
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	$TamTams/Derm.hide()
	$TamTams/Orah.hide()
	$TamTams/Moko.hide()
	var derm: CharacterBody2D = $TamTams/Derm
	var orah: CharacterBody2D = $TamTams/Orah
	var moko: CharacterBody2D = $TamTams/Moko
	var holyderm: CharacterBody2D = $TamTams/HolyDerm
	var holyorah: CharacterBody2D = $TamTams/HolyOrah
	var holymoko: CharacterBody2D = $TamTams/HolyMoko
	var darkderm: CharacterBody2D = $TamTams/DarkDerm
	var darkorah: CharacterBody2D = $TamTams/DarkOrah
	var darkmoko: CharacterBody2D = $TamTams/DarkMoko
	#array stores of refrence data to the sprites and thereby names of each type of moko a
	var TamTams = [moko, derm, orah]
	var HTamTams = [holyderm, holymoko, holyorah]
	var DTamTams = [darkderm, darkmoko, darkorah]
	GameManager.CurTamTam = TamTams[randi_range(0,2)]
	#if trigger from explore then set CutTamTamarray for holy variants
	GameManager.HTamTam = HTamTams[randi_range(0,2)]
	#if trigger from explore then set CutTamTamarray for dark variants
	
	GameManager.DTamTam = DTamTams[randi_range(0,2)]
	#money avail check then decrement
	if GameManager.gold >= 200:
			GameManager.gold -= 200
			GameManager.canbuy = true
			
	else:
		GameManager.canbuy = false
	#append list of tam tams
	
	GameManager.findnextlastnotnull()
	
	if GameManager.tamtamlist[GameManager.index] == null:
		if GameManager.index > 1:
			
			GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
			if GameManager.tamtamlist[GameManager.index-2] != null:
				$"../Shop/Notification".text= str(GameManager.tamtamlist[GameManager.index-2]["Name"])+" Has been placed in your Box"
#if total tamtams in box is less than 9 then add a new tam tam at the index current value which should be pointing to empty index
#dark and holy booleans control adding holy and dark mokos but if both are false then it ignore and uses the common tamtam array to add in the tamtam
		if GameManager.index > 9:
				$"../Shop/Notification".text = "Box is full"
				GameManager.canbuy = false
				GameManager.gold +=200
		if GameManager.canbuy == true:
				var newtamtaminfo = {
						"Sprite" : GameManager.CurTamTam,
						"Name": GameManager.CurTamTam.name,
						"TTLevel": GameManager.initttlv,
						"TTExp": GameManager.initttexp,
						"TTStrength1": GameManager.initttstrength1,
						"TTStrength2": GameManager.initttstrength2,
						"TTMaxHP":GameManager.initttmaxhealth,
						"TTCurHP":GameManager.inittthealth,
						"TTCleanliness": GameManager.initttcleanliness,
						"TTHUnger": GameManager.inittthunger,
					}
				var htamtaminfo = {
						"Sprite" : GameManager.HTamTam,
						"Name": GameManager.HTamTam.name,
						"TTLevel": GameManager.initttlv,
						"TTExp": GameManager.initttexp,
						"TTStrength1": GameManager.initttstrength1,
						"TTStrength2": GameManager.initttstrength2,
						"TTMaxHP":GameManager.initttmaxhealth,
						"TTCurHP":GameManager.inittthealth,
						"TTCleanliness": GameManager.initttcleanliness,
						"TTHUnger": GameManager.inittthunger
					}
				var dtamtaminfo = {
						"Sprite" : GameManager.DTamTam,
						"Name": GameManager.DTamTam.name,
						"TTLevel": GameManager.initttlv,
						"TTExp": GameManager.initttexp,
						"TTStrength1": GameManager.initttstrength1,
						"TTStrength2": GameManager.initttstrength2,
						"TTMaxHP":GameManager.initttmaxhealth,
						"TTCurHP":GameManager.inittthealth,
						"TTCleanliness": GameManager.initttcleanliness,
						"TTHUnger": GameManager.inittthunger
					}
				if GameManager.holy == true:
					GameManager.tamtamlist[GameManager.index]=htamtaminfo
					pass
				elif GameManager.dark == true:
					GameManager.tamtamlist[GameManager.index]=dtamtaminfo
					pass
				else:
					GameManager.tamtamlist[GameManager.index]=newtamtaminfo
	
				print(GameManager.tamtamlist)
				print(str(len(GameManager.tamtamlist)))
				GameManager.tamtamlist[GameManager.index]["Sprite"].global_position= Vector2(0,0)
				GameManager.tamtamlist[GameManager.index]["Sprite"].show()
				#save info for dex values
				if GameManager.tamtamlist[GameManager.index]["Name"] == "Moko":
					GameManager.dex[0]= true
				elif GameManager.tamtamlist[GameManager.index]["Name"] == "Orah":
					GameManager.dex[1]= true
				elif GameManager.tamtamlist[GameManager.index]["Name"] == "Derm":
					GameManager.dex[2]= true
				elif GameManager.tamtamlist[GameManager.index]["Name"] == "HolyMoko":
					GameManager.dex[3]= true
				elif GameManager.tamtamlist[GameManager.index]["Name"] == "HolyDerm":
					GameManager.dex[4]= true
				elif GameManager.tamtamlist[GameManager.index]["Name"] == "HolyOrah":
					GameManager.dex[5]= true
				elif GameManager.tamtamlist[GameManager.index]["Name"] == "DarkDerm":
					GameManager.dex[6]= true
				elif GameManager.tamtamlist[GameManager.index]["Name"] == "DarkOrah":
					GameManager.dex[7]= true
				elif GameManager.tamtamlist[GameManager.index]["Name"] == "DarkMoko":
					GameManager.dex[8]= true
				#show sprite of last added tam tam then advance index to position of next null
				#then reset the triger check for holy and dark eggs
				GameManager.tamtamlist[GameManager.index]["Sprite"].show()
				GameManager.index+=1
				GameManager.firstmade = true
				GameManager.holy = false
				GameManager.dark = false
				
			
	
#intro context lore scene
func _on_button_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	$TextureRect.hide()
	$MandleText.hide()
	$Button.hide()

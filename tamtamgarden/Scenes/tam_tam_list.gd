extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if GameManager.tamtamlist[GameManager.index-1] != null and GameManager.inbox == true:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].show()
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
		$TamTamInGarden.text=("Current TamTam in Garden:" + str(GameManager.tamtamlist[GameManager.index-1]["Name"]))
		
	if GameManager.tamtamlist[0] != null:
		$Index1.text = (str(GameManager.tamtamlist[0]["Name"]))
	else:
		$Index1.text = (str(1))
	if GameManager.tamtamlist[1] != null:
		$Index2.text = (str(GameManager.tamtamlist[1]["Name"]))
	else:
		$Index2.text = (str(2))
	if GameManager.tamtamlist[2] != null:
		$Index3.text = (str(GameManager.tamtamlist[2]["Name"]))
	else:
		$Index3.text = (str(3))
	if GameManager.tamtamlist[3] != null:
		$Index4.text = (str(GameManager.tamtamlist[3]["Name"]))
	else:
		$Index4.text = (str(4))
	if GameManager.tamtamlist[4] != null:
		$Index5.text = (str(GameManager.tamtamlist[4]["Name"]))
	else:
		$Index5.text = (str(5))
	if GameManager.tamtamlist[5] != null:
		$Index6.text = (str(GameManager.tamtamlist[5]["Name"]))
	else:
		$Index6.text = (str(6))
	if GameManager.tamtamlist[6] != null:
		$Index7.text = (str(GameManager.tamtamlist[6]["Name"]))
	else:
		$Index7.text = (str(7))
	if GameManager.tamtamlist[7] != null:
		$Index8.text = (str(GameManager.tamtamlist[7]["Name"]))
	else:
		$Index8.text = (str(8))
	if GameManager.tamtamlist[8] != null:
		$Index9.text = (str(GameManager.tamtamlist[8]["Name"]))
	else:
		$Index9.text = (str(9))

#series of buttons for indexs of tamtams in the tamtamlist, using 8 buttons
#


func _on_index_1_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.tamtamlist[0] != null and GameManager.tamtamlist[GameManager.index-1] != null:
		
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
		GameManager.tamtamlist[0]["Sprite"].show() # Replace with function body.
		GameManager.index = 0+1
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	elif GameManager.tamtamlist[GameManager.index-1] != null:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
		GameManager.tamtamlist[0]["Sprite"].show() # Replace with function body.
		GameManager.index = 0+1
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	else:
		pass

func _on_index_2_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.tamtamlist[1] != null and GameManager.tamtamlist[GameManager.index-1] != null:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
		GameManager.tamtamlist[1]["Sprite"].show()  # Replace with function body.
		GameManager.index = 1+1
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	
	else:
		pass
func _on_index_3_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.tamtamlist[2] != null and GameManager.tamtamlist[GameManager.index-1] != null:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
		GameManager.tamtamlist[2]["Sprite"].show()  # Replace with function body.
		GameManager.index = 2+1
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	
	else:
		pass

func _on_index_4_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.tamtamlist[3] != null and GameManager.tamtamlist[GameManager.index-1] != null:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
		GameManager.tamtamlist[3]["Sprite"].show()  # Replace with function body.
		GameManager.index = 3+1
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	
	else:
		pass

func _on_index_5_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.tamtamlist[4] != null and GameManager.tamtamlist[GameManager.index-1] != null:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
		GameManager.tamtamlist[4]["Sprite"].show()  # Replace with function body.
		GameManager.index = 4+1
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	
	else:
		pass

func _on_index_6_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.tamtamlist[5] != null and GameManager.tamtamlist[GameManager.index-1] != null:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
		GameManager.tamtamlist[5]["Sprite"].show()  # Replace with function body.
		GameManager.index = 5+1
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	
	else:
		pass

func _on_index_7_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.tamtamlist[6] != null and GameManager.tamtamlist[GameManager.index-1] != null:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
		GameManager.tamtamlist[6]["Sprite"].show()  # Replace with function body.
		GameManager.index = 6+1
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	
	else:
		pass

func _on_index_8_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	if GameManager.tamtamlist[7] != null and GameManager.tamtamlist[GameManager.index-1] != null:
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].hide()
		GameManager.tamtamlist[7]["Sprite"].show()  # Replace with function body.
		GameManager.index = 7+1
		GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position=Vector2(-480,-250)
	
	else:
		pass

func _on_return_to_garden_pressed() -> void:
	$".".hide()
	$TTLCam.enabled= false
	GameManager.inbox = false
	GameManager.ingarden = true
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(0,0)# Replace with function body.


func _on_release_1_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	if GameManager.tamtamlist[0] != GameManager.tamtamlist[GameManager.index-1]:
		GameManager.tamtamlist[0] = null
	else:
		pass

func _on_release_2_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	if GameManager.tamtamlist[1] != GameManager.tamtamlist[GameManager.index-1]:
		GameManager.tamtamlist[1] = null
	else:
		pass

func _on_release_3_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	if GameManager.tamtamlist[2] != GameManager.tamtamlist[GameManager.index-1]:
		GameManager.tamtamlist[2] = null
	else:
		pass

func _on_release_4_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	if GameManager.tamtamlist[3] != GameManager.tamtamlist[GameManager.index-1]:
		GameManager.tamtamlist[3] = null
	else:
		pass

func _on_release_5_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	if GameManager.tamtamlist[4] != GameManager.tamtamlist[GameManager.index-1]:
		GameManager.tamtamlist[4] = null
	else:
		pass
func _on_release_6_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	if GameManager.tamtamlist[5] != GameManager.tamtamlist[GameManager.index-1]:
		GameManager.tamtamlist[5] = null
	else:
		pass

func _on_release_7_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	if GameManager.tamtamlist[6] != GameManager.tamtamlist[GameManager.index-1]:
		GameManager.tamtamlist[6] = null
	else:
		pass

func _on_release_8_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	if GameManager.tamtamlist[7] != GameManager.tamtamlist[GameManager.index-1]:
		GameManager.tamtamlist[7] = null
	else:
		pass

func _on_release_9_pressed() -> void:
	Damage.pitch_scale = randf_range(.85,1)
	Damage.play()
	if GameManager.tamtamlist[8] != GameManager.tamtamlist[GameManager.index-1]:
		GameManager.tamtamlist[8] = null
	else:
		pass

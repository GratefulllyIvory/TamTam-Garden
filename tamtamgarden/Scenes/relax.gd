extends Node2D
const BUBBLE_SCENE = preload("res://bubble.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
#ui update
func _process(delta: float) -> void:
	if GameManager.tamtamlist[GameManager.index-1]!= null:
		$Stats.text =(str(GameManager.tamtamlist[GameManager.index-1]["Name"])+ "s Wellness:"+"\nHp: "+str(GameManager.tamtamlist[GameManager.index-1]["TTCurHP"]) +"\nCleanliness: "+str(GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"])+"\nHunger: "+str(GameManager.tamtamlist[GameManager.index-1]["TTHUnger"]))
	
#return to garden button
func _on_button_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.movementCont = false
	GameManager.inrelax = false
	GameManager.ingarden = true
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	$".".hide()
	$RelaxCam.enabled = false
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].global_position = Vector2(0,0)
	$"../Explore/Floor1/LeftR".set_deferred("monitoring", false)
	$"../Explore/Floor1/RightR".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel2".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel3".set_deferred("monitoring", false)
	$"../Explore/Floor1/RightR".set_deferred("monitoring", false)
	$"../Explore/Floor1/RightR".set_deferred("monitoring", false)
	$"../Explore/Floor1/LeftR/CollisionShape2D".set_deferred("position.x", -145)
	$"../Explore/Floor1/RightR/CollisionShape2D".set_deferred("position.x", 271)
	#$"../Explore/Floor1/OntoLevel2/CollisionShape2D".set_deferred("disabled", false)
	#$"../Explore/Floor1/OntoLevel3/CollisionShape2D".set_deferred("disabled",  false)
#fast restore the tam tam due to bubble game jankiness then send the player back to the garden area
func _on_relax_button_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	GameManager.movementCont = false
	GameManager.inrelax = false
	GameManager.ingarden = true
	GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"]= GameManager.restorewellness
	GameManager.tamtamlist[GameManager.index-1]["TTCurHP"]= GameManager.tamtamlist[GameManager.index-1]["TTMaxHP"]
	GameManager.tamtamlist[GameManager.index-1]["TTHUnger"]= GameManager.restorewellness
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].position = Vector2(0,0)
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	$".".hide()
	$RelaxCam.enabled = false
	$"../Explore/Floor1/LeftR".set_deferred("monitoring", false)
	$"../Explore/Floor1/RightR".set_deferred("monitoring", false)
	$"../Explore/Floor1/LeftR/CollisionShape2D".set_deferred("position.x", -145)
	$"../Explore/Floor1/RightR/CollisionShape2D".set_deferred("position.x", 271)
	$"../Explore/Floor1/OntoLevel2".set_deferred("monitoring", false)
	$"../Explore/Floor1/OntoLevel3".set_deferred("monitoring", false)
#load in bubbles on a timer
func _on_bubble_spawn_timer_timeout() -> void:
	if GameManager.inrelax == true:
		var new_bubble_instance = BUBBLE_SCENE.instantiate()
		print("Spawned bubble init ", new_bubble_instance.global_position)
		$BubbleSpawnTimer.get_parent().add_child(new_bubble_instance)
		var position = Vector2(randi_range(-400,400),-200)
		new_bubble_instance.global_position = position
		new_bubble_instance.z_index = 10
		new_bubble_instance.show()
		
		print("Spawned bubble at ", new_bubble_instance.global_position)
# deletes the bubbles if they fall to far
func _on_boundary_body_entered(body) -> void:
	body.queue_free() # Replace with function body.

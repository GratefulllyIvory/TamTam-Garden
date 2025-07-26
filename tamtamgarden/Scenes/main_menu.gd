extends Node2D


# main menu. redundantly assures all nodes are set to hide until they are desired to be shown and resets some global vars
func _ready() -> void:
	GameManager.index = 0
	$".".show()
	$"../Garden".hide()
	$"../Garden/GardenCam".enabled = false
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
	$"../BattleCircuit".hide()
	$"../BattleCircuit/BattleMapLayers/BattleCam".enabled = false
	#disable tamtamlist cam
	$"../Tournament".hide()
	GameManager.emptylist = false
#	$"../Music".playing = true
	$"../Garden/RButton".hide()
	GameManager.ingarden = false
	GameManager.canbuy = true
	GameManager.firstmade = false
	GameManager.inbox = false
	GameManager.inrelax = false
	GameManager.movementCont = false
	GameManager.incircuit =false
	GameManager.tutorial = false
	$"../Explore/Floor1/OntoLevel2".monitoring = false
	$"../Explore/Floor1/OntoLevel3".monitoring = false
	$"../Explore/Floor1/OntoLevel4".monitoring = false
	$"../Explore/Floor1/OntoLevel5".monitoring = false
	$"../Explore/Floor1/RightR".monitoring =false
	$"../Explore/Floor1/LeftR".monitoring = true
	$"../Explore/Floor1/TopR".monitoring = true
	$"../Explore/Floor1/BotR".monitoring = true

	#GameManager.holy = false
	#GameManager.dark = false
	#disable tournament cam
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_info_pressed() -> void:
	pass # Replace with function body.


func _on_options_pressed() -> void:
	pass # Replace with function body.



func _on_new_game_pressed() -> void:
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	$".".hide()
	$MMCam.enabled = false
	$"../HatchMap".show()
	$"../HatchMap/HatchLayers/HatchCam".enabled= true
	$"../HatchMap/TextureRect".show()
	$"../HatchMap/MandleText".show()
	$"../HatchMap/Button".show()


func _on_collision_shape_2d_tree_entered() -> void:
	pass # Replace with function body.

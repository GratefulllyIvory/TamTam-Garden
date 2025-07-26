extends CharacterBody2D

#create the location of the bubbles to spawn in at
func _ready() -> void:
	var position = Vector2(randi_range(-400,400),-200)
	$Sprite2D.global_position = position # Replace with function body.
	$".".global_position = position
	$CollisionShape2D.global_position = position
#add gravity to the bubbles
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += (get_gravity() * delta)/4
		$Sprite2D.global_position = $".".global_position
		$CollisionShape2D.global_position = $".".global_position
	
	move_and_slide()



#restors the hp of tamtam after coliding with a bubble after a short delay kinda janky needs to be refacotred 
func _on_tree_entered() -> void:
	var timer
	timer = get_tree().create_timer(2)
	await timer.timeout
	if GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] < 100 or GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"]<100 or GameManager.tamtamlist[GameManager.index-1]["TTHUnger"]<100:
		GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] += 10
		GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"] += 10
		GameManager.tamtamlist[GameManager.index-1]["TTHUnger"] += 10
		if GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] > GameManager.tamtamlist[GameManager.index-1]["TTMaxHP"]:
			GameManager.tamtamlist[GameManager.index-1]["TTCurHP"] = GameManager.tamtamlist[GameManager.index-1]["TTMaxHP"]
		elif GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"] > 100 or GameManager.tamtamlist[GameManager.index-1]["TTHUnger"] > 100:
			GameManager.tamtamlist[GameManager.index-1]["TTCleanliness"] = 100
			GameManager.tamtamlist[GameManager.index-1]["TTHUnger"] = 100

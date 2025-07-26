extends CharacterBody2D
#general movements, is set not to move unless in the bubble scene or in the explore scene

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if GameManager.movementCont == true:
		# Add the gravity.
		#if not is_on_floor():
			#velocity += get_gravity() * delta
		if GameManager.inrelax == true:
			GameManager.y = 0
		# coordinate movement
		
		if Input.is_action_just_pressed("up"):
			Move.pitch_scale= randf_range(.85,1)
			Move.play()
			GameManager.y -= 10
			global_position = Vector2(GameManager.x,GameManager.y)
			GameManager.xlastchanged=false
			GameManager.ylastchanged=true
		if Input.is_action_just_pressed("down"):
			Move.pitch_scale= randf_range(.85,1)
			Move.play()
			GameManager.y += 10 
			global_position = Vector2(GameManager.x,GameManager.y)
			GameManager.xlastchanged=false
			GameManager.ylastchanged=true
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		if Input.is_action_just_pressed("left"):
			Move.pitch_scale= randf_range(.85,1)
			Move.play()
			GameManager.x -= 10
			global_position = Vector2(GameManager.x,GameManager.y)
			GameManager.xlastchanged=true
			GameManager.ylastchanged=false
		if Input.is_action_just_pressed("right"):
			Move.pitch_scale= randf_range(.85,1)
			Move.play()
			GameManager.x += 10
			global_position = Vector2(GameManager.x,GameManager.y)
			GameManager.xlastchanged=true
			GameManager.ylastchanged=false
		#var direction := Input.get_axis("left", "right")
		#if direction:
			#velocity.x = direction * SPEED
		#else:
			#velocity.x = move_toward(velocity.x, 0, SPEED)

		#move_and_slide()
	#else set position of tamtam to global 0,0 then movement along track 

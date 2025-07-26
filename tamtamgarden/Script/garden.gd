extends Node2D
#does nothing
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#PersistentData.newtamtam.connect()
	#var tamtam: CharacterBody2D= get_tree().current_scene.CharacterBod2D
	#GameManager.loadState(tamtam)
	#GameManager.loadState()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
	#playhatchanim
	#emit_signal("newtamtam")
		
#	else:
		#display The garden is full. Cherish the tamtam you have :D!
#		print("Garden Is Full")
#	for tamtam in TamTamList:
		#add spawn of tamtam in garden at position along pathfollow
#


func _on_tam_tams_newtamtam() -> void:
	
	print("NewTamTam Signal") # Replace with function body.
	

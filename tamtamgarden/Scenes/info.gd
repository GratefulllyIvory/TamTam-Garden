extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#show info as a button then hide if the button is clicked
func _on_info_button_pressed() -> void:
	Music.play() 
	Menu.pitch_scale = randf_range(.85,1)
	Menu.play()
	$"../Garden".show()
	$"../Garden/GardenCam".enabled = true
	GameManager.tamtamlist[GameManager.index-1]["Sprite"].show()
	$".".hide()
	$InfoCam.enabled = false

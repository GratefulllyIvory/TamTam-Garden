extends Node2D
#series of global variables to call between script. probably causing memory leaks but should be fine if kept small in scope
# should be refactored into function calls if scope will advance considerably further
# the primary mechanism for managing the display and stats of the tam tam are stored in an aray of dictionaries.
# not the tamtam array of dictionaries must be defined as null otherwise it will return a invalid access. godot limitation of null pointers probably mutable data type issue
# there is also an array of booleans to contain a dex values, should probably be used to covey to the player dex progress somehow 
#signal newtamtam
var config = ConfigFile.new()
var CurTamTam
var DTamTam
var HTamTam
var restorewellness=100
var ttmaxhealth = 100
var tthealth = 100
#var ttwellness = (GameManager.tthealth+GameManager.ttcleanliness+GameManager.tthunger)#is equal to health, cleanliness, hunger
var ttcleanliness =100
var tthunger = 100
var ttexp = 1 
var ttlv = 1
var ttstrength1 = 5#minroll
var ttstrength2 =10#maxx roll
#initation tamtam values
var initttmaxhealth = 100
var inittthealth = 100
var initttcleanliness =100
var inittthunger = 100
var initttexp = 1 
var initttlv = 1
var initttstrength1 = 5#minroll
var initttstrength2 =10

#var ttstrength = (GameManager.ttstrength1+GameManager.ttstrength2)/2 #for display
var enemyhealth = 0
var enmstrength1 #minroll
var enmstrength2 #maxx roll
#var enmstrength = (GameManager.enmstrength1+GameManager.enmstrength2)/2 #for display
var gold = 400
var newEnemy
var damagedelttoEnemy =0
var damagedelttoTamTam =0
var movementCont = true #simply change pass global to a movement script for if a tam tam will be able to move or if itll have procedural movement around area

var x = 0 
var y = 0 
var backX = 0
var backY = 0
var xlastchanged = true
var ylastchanged = true
#save the state of a tamtam in a index with the following information
#save for index then if null reload static when loaded
var tamtamlist = [null,null,null,null,null,null,null,null,null,null,null]
var dex = [false,false,false,false,false,false,false,false,false]
var canbuy
var ingarden
var emptylist
var checklevelup
var inbox
var inrelax
var round = 1
var incircuit
var tutorial 
#var tamtamlist = {
	#"Name": GameManager.CurTamTam.name,
	#"TTLevel": GameManager.ttlevel,
	#"TTExp": GameManager.ttexp,
	#"TTStength1": GameManager.ttstrength1,
	#"TTStrenght2": GameManager.ttstrength2,
	#"TTMaxHP": GameManager.ttmaxhealth,
	#"TTCurHP": GameManager.tthealth,
	#"TTCleanliness": GameManager.ttcleanliness,
	#"TTHUnger": GameManager.tthunger,
#}
var index
var firstmade
var reset
var holy
var dark
func findnotnulldex():
	for n in GameManager.tamtamlist.size():
		if GameManager.tamtamlist[n] != null:
				GameManager.index = n + 1
				GameManager.tamtamlist[GameManager.index-1]["Sprite"].show()
				print("First space past Not null Found at: "+ str(GameManager.index))
				break
		else:
			print("NullFound at :"+ str(n))
#Starts a loop from start of tamtamlist then finds first null location in tam tam list then sets index to be that null location
func findnextlastnotnull():
	for n in GameManager.tamtamlist.size():
		if GameManager.tamtamlist[n] == null:
			if GameManager.tamtamlist[GameManager.index-1] != null and GameManager.firstmade==false:
				GameManager.tamtamlist[GameManager.index-1]['Sprite'].hide()
			GameManager.index = n
			break
# a series of functions i started to build but gave up on
#func _process(delta: float) -> void:
	#if GameManager.firstmade == true and GameManager.tamtamlist[0] == null and GameManager.tamtamlist[1] == null and GameManager.tamtamlist[2] == null and GameManager.tamtamlist[3] == null and GameManager.tamtamlist[4] == null and GameManager.tamtamlist[5] == null and GameManager.tamtamlist[6] == null and GameManager.tamtamlist[7] == null and GameManager.tamtamlist[8] == null and GameManager.tamtamlist[9] == null:
			#GameManager.reset = false
	##if GameManager.reset == false:
		##$Garden/RButton.show()
	##
#implement functions for full version
#func damagettHP():
	#GameManager.tthealth -= randi_range(GameManager.enmstrength1, GameManager.enmstrength2)
#func damageenemyHealth():
	#if GameManager.enemyhealth ==0:
		#GameManager.enemyhealth -= randi_range(GameManager.ttstrength1, GameManager.ttstrength2)
	#else:
		#pass
##
#func updateexp():
	#if GameManager.ttexp%10 ==0 :
		#GameManager.lv +=1
		#GameManager.exp+1
		#
#if exp u mod % 10 = 0 increase total hp by 100, increase ttstrength1,ttstregnth2 by 1 each
#func enemyDPS():
	#pass
#func tamtamDPS():
	#pass
#func goldcheck():
	#pass
#func explore():
	#pass
#func welnessHeal():
	#pass
#func deathcheck():
	#pass
	#if wellness reaches 0 play tam tam death anim and reset game(get_tree main menu)

#standard save funciton due to the tam tam list being passed by refrence dynamically it had issues saving the sprite values which caused ghost tamtams that were live but were not showing their info
# to fix the ghost tam tam issue new refrence variables should be created here in global then accessed in hatch map
func _on_save_pressed() -> void:
	
	 # Set a section for general game data
	var section = "game_data"
	#config.set_value(section, "TamTamList", GameManager.tamtamlist)
	config.set_value(section, "Dex", GameManager.dex)
	config.set_value(section, "Gold", GameManager.gold)
	#config.set_value(section, "Index", GameManager.index)
	var error = config.save("user://save_game.cfg")
	if error != OK:
		print("Error saving game: ", error)
	else:
		print("Game saved successfully to user://save_game.cfg")

	# 1. Save the array of booleans
	# The key "TamTamList" is already used, so we'll continue with that.
	

	# 2. Save the array of dictionaries
   

	# 3. Save the global gold value
	

	# --- IMPORTANT: Save the ConfigFile to disk ---
	# "user://" is a special path that points to a persistent user data directory.
	# It's platform-independent (e.g., C:\Users\User\AppData\Roaming\Godot\app_name on Windows)
	

   
#standard load function
func _on_load_game_pressed() -> void:
	var save_path = "user://save_game.cfg"
	if not FileAccess.file_exists(save_path):
		print("No save game found at: ", save_path)
		return
	var error = config.load(save_path)
	if error != OK:
		print("Error loading game: ", error)
		return
	var section = "game_data"
	#GameManager.tamtamlist = config.get_value(section, "TamTamList", [])
	#print("Loaded TamTamList: ", GameManager.tamtamlist)
	GameManager.dex = config.get_value(section, "Dex", [])
	print("Loaded InventoryData: ", GameManager.dex)
	GameManager.gold = config.get_value(section, "Gold", 200)
	GameManager.gold +=200
	print("Loaded Gold: ", GameManager.gold)
	#GameManager.index = config.get_value(section, "Index", 0)
	print("Game loaded successfully.")

class_name Pump extends State


func enter():
	character.pumping = true
	character.pump_attack()

func exit():
	pass
	
func state_process(_delta : float):
	if character.pumping == false:
		transitioned.emit(self,"Dig")

func state_physics_process(_delta : float):
	pass

func state_input(event : InputEvent):
	pass

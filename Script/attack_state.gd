class_name Dead extends State

func enter():
	pass

func exit():
	pass
	
func state_process(_delta : float):
	if character.attacking == false:
		transitioned.emit(self,"Pump")

func state_physics_process(_delta : float):
	pass

func state_input(event : InputEvent):
	pass

class_name Pump extends State


func enter():
	character.pump = true
	#spawn attack pump
	#if attack pump hits something
	#go to attack state
	pass

func exit():
	pass
	
func state_process(_delta : float):
	if character.pump == false:
		transitioned.emit(self, "Dig")

func state_physics_process(_delta : float):
	pass

func state_input(event : InputEvent):
	if event.is_action_pressed("ui_accept"):
		pass

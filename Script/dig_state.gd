class_name Dig extends State

func enter():
	pass

func exit():
	pass
	
func state_process(_delta : float):
	pass

func state_physics_process(_delta : float):
	pass

func state_input(event : InputEvent):
		if event.is_action_pressed("ui_accept"):
			transitioned.emit(self, "Pump")

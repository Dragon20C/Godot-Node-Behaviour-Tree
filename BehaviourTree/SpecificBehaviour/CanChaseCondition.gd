class_name CanChase extends NodeBT


@export var NPC : CharacterBody2D
@export var MinChaseDistance : int

func Evaluate(delta: float) -> NodeState:
	var MousePos = get_global_mouse_position()
	
	var Distance = NPC.position.distance_to(MousePos)
	
	if Distance < MinChaseDistance:
		State = NodeState.SUCCESS
		return State
	
	State = NodeState.FAILURE
	return State

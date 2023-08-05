class_name CanChase extends ConditionBT


@export var MinChaseDistance : int

func Evaluate(Data : DataTreeClass) -> NodeState:
	var Actor = Data.Get("Actor")
	var MousePos = get_global_mouse_position()
	
	var Distance = Actor.position.distance_to(MousePos)
	
	if Distance < MinChaseDistance:
		State = NodeState.SUCCESS
		return State
	
	State = NodeState.FAILURE
	return State

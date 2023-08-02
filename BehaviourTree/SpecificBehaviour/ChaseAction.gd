class_name ChaseAction extends NodeBT

@export var Speed : int
@export var MaxChaseDistance : int

func Evaluate(Data : DataTreeClass) -> NodeState:
	var Actor = Data.Get("Actor")
	var MousePos = get_global_mouse_position()
	
	Actor.velocity = (MousePos - Actor.position).normalized() * Speed
	Actor.move_and_slide()

	var Distance = Actor.position.distance_to(MousePos)
	if Distance < 5.0:
		print("Chase Finished")
		return NodeState.SUCCESS
	elif Distance > MaxChaseDistance:
		return NodeState.FAILURE
			
	return NodeState.RUNNING

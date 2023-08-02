class_name InverterBT extends NodeBT


func Evaluate(Data : DataTreeClass) -> NodeState:
	
	var childState = get_child(0).Evaluate(Data)
	
	match childState:
		NodeState.SUCCESS:
			return NodeState.FAILURE
		NodeState.FAILURE:
			return NodeState.SUCCESS
		NodeState.RUNNING:
			return NodeState.RUNNING
		_:
			return NodeState.FAILURE
			

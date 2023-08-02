class_name ChangeColourAction extends NodeBT


func Evaluate(Data : DataTreeClass) -> NodeState:
	print("Colour updated!")
	return NodeState.RUNNING

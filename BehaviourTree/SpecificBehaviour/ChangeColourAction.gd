class_name ChangeColourAction extends ActionBT


func Evaluate(Data : DataTreeClass) -> NodeState:
	print("Colour updated!")
	return NodeState.RUNNING

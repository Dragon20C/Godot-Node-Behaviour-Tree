class_name RepeaterBT extends NodeBT


var ChildNode : NodeBT
@export var Repetitions: int = 0
var CurrentRepetition: int = 0


func _ready() -> void:
	if get_child_count() != 1:
		push_error("Repeater must have exactly one child.")
	ChildNode = get_child(0)


func Evaluate(Data : DataTreeClass) -> NodeState:
	
	if Repetitions <= 0:
		return NodeState.SUCCESS  # Repeat indefinitely
		
	if CurrentRepetition >= Repetitions:
		return NodeState.FAILURE
	else:
		var childState = ChildNode.Evaluate(Data)
				
		match childState:
			NodeState.SUCCESS:
				CurrentRepetition += 1
			NodeState.RUNNING:
				return NodeState.RUNNING
			NodeState.FAILURE:
				return NodeState.FAILURE
				
	return NodeState.FAILURE

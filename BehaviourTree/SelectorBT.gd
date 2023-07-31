class_name SelectorBT extends NodeBT


var SelectorChildren : Array

func _ready() -> void:
	SelectorChildren = get_children()
	
func OldEvaluate(delta: float) -> NodeState:

	for child in SelectorChildren:
		if child is NodeBT:
			var btNode = child as NodeBT
			var childState = btNode.Evaluate(delta)

			if childState == NodeState.SUCCESS:
				return NodeState.SUCCESS

	# If none of the children succeed, return FAILURE
	return NodeState.FAILURE


func Evaluate(delta: float) -> NodeState:
	for child in SelectorChildren:
		var childState = child.Evaluate(delta)
		
		match childState:
			NodeState.FAILURE:
				State = NodeState.FAILURE
				continue
			NodeState.SUCCESS:
				State = NodeState.SUCCESS
				return State
			NodeState.RUNNING:
				State = NodeState.RUNNING
				return State
			_:
				continue
				
	State = NodeState.FAILURE
	return State

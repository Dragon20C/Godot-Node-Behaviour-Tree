class_name SelectorBT extends NodeBT


var SelectorChildren : Array

func _ready() -> void:
	SelectorChildren = get_children()
	
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

class_name SelectorBT extends NodeBT


var SelectorChildren : Array

func _ready() -> void:
	SelectorChildren = get_children()
	
func Evaluate(delta: float) -> NodeState:
	for child in SelectorChildren:
		var childState = child.Evaluate(delta)
		
		match childState:
			NodeState.FAILURE:
				continue
			NodeState.SUCCESS:
				return NodeState.SUCCESS
			NodeState.RUNNING:
				return NodeState.RUNNING
			_:
				continue
				
	return NodeState.FAILURE

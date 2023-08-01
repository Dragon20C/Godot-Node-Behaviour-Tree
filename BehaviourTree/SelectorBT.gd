class_name SelectorBT extends NodeBT


var SelectorChildren : Array

func _ready() -> void:
	SelectorChildren = get_children()
	SelectorChildren.sort_custom(ComparePriority)
	print(SelectorChildren)
	
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

func ComparePriority(a: Node, b: Node) -> bool:
	
	return a.Priority > b.Priority

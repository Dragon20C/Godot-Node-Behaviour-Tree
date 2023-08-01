class_name RootBT extends NodeBT

var TreeChildren : Array

func _ready() -> void:
	TreeChildren = get_children()

func _process(delta: float) -> void:
	State = EvaluateTree(delta)

func EvaluateTree(delta: float) -> NodeState:
	for child in TreeChildren:
		var childState = child.Evaluate(delta)
		
		match childState:
			NodeState.FAILURE:
				return NodeState.FAILURE
			NodeState.SUCCESS:
				return NodeState.SUCCESS
			NodeState.RUNNING:
				continue
			_:
				continue
				
	return NodeState.RUNNING

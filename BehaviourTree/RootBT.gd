class_name RootBT extends NodeBT

var TreeChildren : Array

func _ready() -> void:
	State = NodeState.RUNNING
	TreeChildren = get_children()

func _process(delta: float) -> void:
	#if State == NodeState.RUNNING:
	UpdateTree(delta)
		
func UpdateTree(delta) -> void:
	State = Evaluate(delta)

func Evaluate(delta: float) -> NodeState:
	for child in TreeChildren:
		if child is NodeBT:
			var btNode = child as NodeBT
			var childState = btNode.Evaluate(delta)
			
			# Check the state of the child and return if it's not running (i.e., it's either SUCCESS or FAILURE).
			if childState != NodeState.RUNNING:
				return childState

	# If all children are still running, return RUNNING.
	return NodeState.RUNNING

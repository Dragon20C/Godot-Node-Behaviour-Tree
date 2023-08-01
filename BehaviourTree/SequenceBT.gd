class_name SequenceBT extends NodeBT

var SequenceChildren : Array

func _ready() -> void:
	SequenceChildren = get_children()

func Evaluate(delta: float) -> NodeState:
	for child in SequenceChildren:
		var childState = child.Evaluate(delta)

		match childState:
			NodeState.FAILURE:
				return NodeState.FAILURE
			NodeState.SUCCESS:
				continue
			NodeState.RUNNING:
				continue
			_:
				return NodeState.FAILURE

	return NodeState.SUCCESS

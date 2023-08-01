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
				return NodeState.RUNNING
			_:
				# Handle any unexpected NodeState values here.
				# For example, raise an error or log a message.
				return NodeState.FAILURE

	return NodeState.SUCCESS

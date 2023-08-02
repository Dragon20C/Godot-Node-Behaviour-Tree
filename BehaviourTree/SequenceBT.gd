class_name SequenceBT extends NodeBT

var SequenceChildren : Array

func _ready() -> void:
	SequenceChildren = get_children()

func Evaluate(Data : DataTreeClass) -> NodeState:
	for child in SequenceChildren:
		var childState = child.Evaluate(Data)
		
		match childState:
			NodeState.FAILURE:
				return NodeState.FAILURE
			NodeState.SUCCESS:
				continue
			NodeState.RUNNING:
				return NodeState.RUNNING
			_:
				return NodeState.SUCCESS

	return NodeState.RUNNING

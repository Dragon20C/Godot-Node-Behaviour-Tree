class_name SequenceBT extends NodeBT

var SequenceChildren : Array

func _ready() -> void:
	SequenceChildren = get_children()

func Evaluate(delta):
	var AnyChildrenRunning : bool = false
	
	for child in SequenceChildren:
		
		var childState = child.Evaluate(delta)
		
		match childState:
			NodeState.FAILURE:
				State = NodeState.FAILURE
				return State
			NodeState.SUCCESS:
				State = NodeState.SUCCESS
				continue
			NodeState.RUNNING:
				State = NodeState.RUNNING
				AnyChildrenRunning = true
				continue
			_:
				State = NodeState.RUNNING
				return State
				
	State = NodeState.RUNNING if AnyChildrenRunning else NodeState.SUCCESS
	return State

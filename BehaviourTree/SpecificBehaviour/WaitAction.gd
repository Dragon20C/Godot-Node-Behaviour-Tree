class_name WaitAction extends ActionBT

@export var WaitTime : float = 2.0
var Clock : float = 0.0

func _ready() -> void:
	Clock = WaitTime

func Evaluate(Data : DataTreeClass) -> NodeState:
	
	var delta = Data.Get("delta")
	if Clock > 0:
		Clock -= delta
	else:
		if get_child(0) != null:
			var ChildState = get_child(0).Evaluate(Data)
			
			match ChildState:
				NodeState.RUNNING:
					return NodeState.RUNNING
				NodeState.SUCCESS:
					Clock = WaitTime
					return NodeState.SUCCESS
		
	return NodeState.RUNNING


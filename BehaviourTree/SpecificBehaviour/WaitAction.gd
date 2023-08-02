class_name WaitAction extends NodeBT

@export var WaitTime : float = 2.0
var Clock : float = 0.0

func _ready() -> void:
	Clock = WaitTime

func Evaluate(Data : DataTreeClass) -> NodeState:
	var delta = Data.Get("delta")
	if Clock > 0:
		Clock -= delta
	else:
		Clock = WaitTime
		print("Done")
		return NodeState.SUCCESS
		
	return NodeState.RUNNING

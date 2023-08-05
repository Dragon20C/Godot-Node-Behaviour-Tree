class_name PatrolAction extends ActionBT

@export var Speed : int
var TargetPosition : Vector2
  
func _ready() -> void:
	NewTarget()

func Evaluate(Data : DataTreeClass) -> NodeState:
	var Actor = Data.Get("Actor")
			# Move towards the target position
	Actor.velocity = (TargetPosition - Actor.position).normalized() * Speed
	Actor.move_and_slide()

	# Check if the Actor has reached the target position
	if Actor.position.distance_to(TargetPosition) < 5.0:
		Actor.position = TargetPosition
		NewTarget()

			# Return success when the patrol is completed
		return NodeState.SUCCESS
			

	# Return RUNNING while the patrol is in progress
	return NodeState.RUNNING

func NewTarget():
	TargetPosition = Vector2(randi_range(100,900), randi_range(100,450))

func ResetBehaviour() -> void:
	print("Restarted")
	NewTarget()

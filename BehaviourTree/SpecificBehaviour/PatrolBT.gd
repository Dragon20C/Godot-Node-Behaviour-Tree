class_name PatrolAction extends NodeBT

@export var NPC : CharacterBody2D
@export var Speed : int
var TargetPosition : Vector2
var WaitTime : float = 2.0
var Clock : float = 0.0
  
func _ready() -> void:
	NewTarget()

func Evaluate(delta: float) -> NodeState:
	if Clock > 0:
		# Wait for the specified time
		Clock -= delta
	else:
		# Move towards the target position
		NPC.velocity = (TargetPosition - NPC.position).normalized() * Speed
		NPC.move_and_slide()

		# Check if the NPC has reached the target position
		if NPC.position.distance_to(TargetPosition) < 5.0:
			NPC.position = TargetPosition
			# Wait for a few seconds before selecting a new target position
			Clock = WaitTime
			NewTarget()

			# Return success when the patrol is completed
			print("Patrol Finished")
			return NodeState.SUCCESS
			

	# Return RUNNING while the patrol is in progress
	return NodeState.RUNNING

func NewTarget():
	TargetPosition = Vector2(randi_range(100,900), randi_range(100,450))


	

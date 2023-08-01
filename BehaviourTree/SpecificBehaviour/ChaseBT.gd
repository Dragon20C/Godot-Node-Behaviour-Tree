class_name ChaseBT extends NodeBT

@export var NPC : CharacterBody2D
@export var Speed : int
@export var MaxChaseDistance : int
@export var MinChaseDistance : int

func Evaluate(delta: float) -> NodeState:
	var MousePos = get_global_mouse_position()
	# Move towards the target position
	NPC.velocity = (MousePos - NPC.position).normalized() * Speed
	NPC.move_and_slide()

	# Check if the NPC has reached the target position
	var Distance = NPC.position.distance_to(MousePos)
	if Distance < 5.0:
		print("Chase Finished")
		return NodeState.SUCCESS
	elif Distance > MaxChaseDistance:
		return NodeState.FAILURE
			
	# Return RUNNING while the patrol is in progress
	return NodeState.RUNNING

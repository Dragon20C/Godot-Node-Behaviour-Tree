class_name NodeBT extends Node2D

enum NodeState {RUNNING,SUCCESS,FAILURE}
var State : NodeState
var Priority : int = 0

func Evaluate(delta : float) -> NodeState:
	return NodeState.FAILURE

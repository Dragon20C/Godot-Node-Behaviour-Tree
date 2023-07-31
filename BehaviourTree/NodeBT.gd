class_name NodeBT extends Node2D

enum NodeState {RUNNING,SUCCESS,FAILURE}
var State : NodeState

func Evaluate(delta : float) -> NodeState:
	return NodeState.FAILURE

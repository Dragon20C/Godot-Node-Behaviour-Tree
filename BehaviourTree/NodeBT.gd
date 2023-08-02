class_name NodeBT extends Node2D

enum NodeState {RUNNING,SUCCESS,FAILURE}
var State : NodeState

func Evaluate(Data : DataTreeClass) -> NodeState:
	return NodeState.FAILURE

@icon("res://IconSVG/Root.svg")
class_name RootBT extends NodeBT

@onready var DataTree = DataTreeClass.new()

func _ready() -> void:
	DataTree.Set("Actor",get_parent())

func _process(delta: float) -> void:
	DataTree.Set("delta",delta)
	self.get_child(0).Evaluate(DataTree)


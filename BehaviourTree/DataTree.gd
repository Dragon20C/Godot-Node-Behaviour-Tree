class_name DataTreeClass extends Node


var Data : Dictionary = {}

func Get(Key):
	return Data[Key]
	
func Set(Key,Value):
	Data[Key] = Value
	
func Has(Key):
	if Data[Key] != null:
		return true
	return false

extends LineEdit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var pageInstance = $"../../../../../../"
onready var sceneRoot = $"../.."
# Called when the node enters the scene tree for the first time.
func _ready():
	text = ""
	self.connect("text_changed", self, "_update_label")
	max_length = $"../..".rect_size.x / 7
	_update_label(text)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _update_label(newText):
	if Global.state != 1: return
	
	$"../Text".text = newText
	
	if pageInstance.get_index() != 0 && sceneRoot.editable:#segment is not on page 1 and it was changed
		Global._save()
		return
	
	
	if pageInstance.get_index() != 0:#segment is not on page 1 and page 1 was changed
		for seg in get_tree().get_nodes_in_group("Header Segment"):
			if seg.get_parent().get_parent().get_parent().get_parent().get_index() == 0:
				if seg.name == $"../..".name && seg != $"../.." && seg.editable == false:
					_set_text(seg._get_text())
				
	else:#segment is on page 1
		for seg in get_tree().get_nodes_in_group("Header Segment"):
			if seg.name == $"../..".name && seg != $"../.." && seg.editable == false:
				seg._set_text(newText) #set text to what this text is.
				
	
					
	Global._save()
	
func _set_text(s):
	text = s
	$"../Text".text = s
	
	
	

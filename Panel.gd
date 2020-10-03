extends Panel

const LIST_ITEM := preload("res://Menus/RecyclerView/ListItem.tscn")

var listIndex := 0

func addItem(value):
	var item = LIST_ITEM.instance()
	listIndex += 1
	item.get_node("NameFriendReqLabel").text = value
	
	$ScrollContainer/VBoxContainer.add_child(item)

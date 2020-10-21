extends Panel


const LIST_ITEM := preload("res://Menus/RecyclerView/GameItem.tscn")

var listIndex := 0

func addItem(value):
	var item = LIST_ITEM.instance()
	listIndex += 1
	item.get_node("NameFriendLabel").text = value
	item.rect_min_size = Vector2(816,64)
	
	$ScrollContainer/VBoxContainer.add_child(item)

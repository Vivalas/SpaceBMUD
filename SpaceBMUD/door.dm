obj/game/item/door
	var/open_desc = "The door creaks open."
	var/close_desc = "The door slams shut."
	var/open = 0
	var/locked = 0
	hidden = 1 //It shows up in a special bar on the bottom, yo.
	var/direction
	var/obj/game/item/door/linked
	var/broken = 0
	anchored = 1 //just no, none of that

	proc/open_door(var/pass = 1)
		if(!linked)
			get_link()
		if(locked)
			return 0
		loc:announce_visual(open_desc)
		open = 1
		if(pass) linked.open_door(0) //don't want dem infifnite loops
		return 1

	proc/close_door(var/pass = 1)
		if(!linked)
			get_link()
		if(broken)
			return 0
		loc:announce_visual(close_desc)
		open = 0
		if(pass) linked.close_door(0)
		return 1

	proc/get_link()
		var/list/other_doors = list()
		var/obj/room/room = src.loc:dir2exit(direction)
		for(var/obj/game/item/door/D in room)
			other_doors += D
		for(var/obj/game/item/door/D in other_doors)
			if(D.direction == OppositeDirection(direction)) linked = D

/*
mob/verb/build_room_door()
	for(var/obj/game/item/door/D in loc)
		D.get_link()
*/
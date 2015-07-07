mob/proc/look_surround(var/room/R)

	var/msg
	msg += "			[R.name] / \[[R.area]\] (<font color=blue>[R.region]</font>)"
	msg += "<BR><BR>"
	msg += "<font color=#99F>[R.area.desc]</font>"
	msg += "<BR>[R.desc]<BR>"
	var/list/object_list = list()
	for(var/obj/game/item/G in R)
		if(G.invisibility <= see_invisible)
			object_list += G
	msg += "<font color=white>[Generate_Object_List(object_list)]</font>"

	for(var/e in R.exit_descs)
		var/desc = R.exit_descs[e]
		msg += "<BR>To the [e], [desc]"

	if(R.hint)
		msg += "<BR><BR><font color=yellow>\[HINT: [R.hint]\]</font>"

	return msg


proc/Generate_Object_List(var/list/objects)
	var/msg
	if(!objects.len)
		return
	if(objects.len == 1)
		msg = "You see on the floor here a "
	else
		msg = "You see on the floor "
	var/list/pre_objects = list()
	for(var/obj/game/G in objects)
		var/found = 0
		for(var/obj/game/GO in pre_objects)
			if(GO.name == G.name)
				pre_objects[GO]++
				found = 1
		if(!found)
			pre_objects[G] = 1

	for(var/obj/game/item/G in pre_objects)
		if(pre_objects[G] == 1&&pre_objects.len == 1) msg += "[G.name]."
		else
			var/num = pre_objects[G]
			var/index = pre_objects.Find(G)
			var/prefix
			if(index == 1) prefix = ""
			else if(index == pre_objects.len) prefix = ", and "
			else prefix = ", "
			if(pre_objects[G] == 1) msg += "[prefix] [Generate_Plural_Tag(num)] [G.name]"
			else msg += "[prefix] [Generate_Plural_Tag(num)] [G.plural_name]"
	msg += "."
	return msg

proc/Generate_Plural_Tag(var/number)
	if(number <= 0) return "MIND FUCK"
	switch(number)
		if(1) return "one"
		if(2) return "two"
		if(3) return "three"
		if(4) return "four"
		if(5) return "five"
		if(6) return "six"
		if(7) return "seven"
		if(8) return "eight"
		if(9) return "nine"
		if(10 to 19) return "a lot of"
		if(20 to 29) return "about a score of"
		if(30 to 99) return "a few score of"
		if(100 to 999) return "hundreds of"
		if(1000 to 9999) return "thousands of"
		if(10000 to 99999) return "tens of thousands of"
		if(100000 to 999999) return "hundreds of thousands of"
		if(1000000 to 999999999) return "millions of" //the game has crashed by now
		if(1000000000 to 99999999999999999999999999999999999999999999999999999999999999) return "an ungodly amount of" //if this ever happens it will be a miracle the game is even still running


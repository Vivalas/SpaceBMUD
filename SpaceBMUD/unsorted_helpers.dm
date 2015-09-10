proc/OppositeDirection(dir)
	switch(dir)
		if(NORTH) return SOUTH
		if(SOUTH) return NORTH
		if(WEST) return EAST
		if(EAST) return WEST

proc/OppositeDirectionStr(dir)
	switch(dir)
		if("north") return "south"
		if("south") return "north"
		if("west") return "east"
		if("east") return "west"

proc/dir2str(dir)
	switch(dir)
		if(NORTH) return "north"
		if(SOUTH) return "south"
		if(WEST) return "west"
		if(EAST) return "east"

obj/room/proc/dir2exit(dir)
	switch(dir)
		if(NORTH) return locate(north_exit)
		if(SOUTH) return locate(south_exit)
		if(WEST) return locate(west_exit)
		if(EAST) return locate(east_exit)

obj/room/proc/dir2door(dir)
	for(var/obj/game/item/door/D in src)
		if(D.direction == dir) return D
	return 0

proc/door2dir(var/obj/game/item/door/D)
	return D.direction

obj/room/proc/is_door_blocked(dir)
	for(var/obj/game/item/door/D in src)
		if(D.direction == dir&&!D.open) return 1
	return 0

proc/make_sentence_uppercase(string)
	var/list/broken = kText.text2list(string," ")
	var/list/capitals = list()
	for(var/word in broken)
		capitals += kText.capitalize(word)
	var/finished_sentence = kText.list2text(capitals," ")
	return finished_sentence

/proc/sanitize_name(var/input, var/max_length = 25, var/allow_numbers = 0)
	if(!input || length(input) > max_length)
		return //Rejects the input if it is null or if it is longer then the max length allowed
	var/number_of_alphanumeric	= 0
	var/last_char_group			= 0
	var/output = ""

	for(var/i=1, i<=length(input), i++)
		var/ascii_char = text2ascii(input,i)
		switch(ascii_char)
			// A  .. Z
			if(65 to 90)			//Uppercase Letters
				output += ascii2text(ascii_char)
				number_of_alphanumeric++
				last_char_group = 4

			// a  .. z
			if(97 to 122)			//Lowercase Letters
				if(last_char_group<2)		output += ascii2text(ascii_char-32)	//Force uppercase first character
				else						output += ascii2text(ascii_char)
				number_of_alphanumeric++
				last_char_group = 4

			// 0  .. 9
			if(48 to 57)			//Numbers
				if(!last_char_group)		continue	//suppress at start of string
				if(!allow_numbers)			return
				output += ascii2text(ascii_char)
				number_of_alphanumeric++
				last_char_group = 3

			// '  -  .
			if(39,45,46)			//Common name punctuation
				if(!last_char_group) continue
				output += ascii2text(ascii_char)
				last_char_group = 2

			// ~   |   @  :  #  $  %  &  *  +
			if(126,124,64,58,35,36,37,38,42,43)			//Other symbols that we'll allow (mainly for AI)
				if(!last_char_group)		continue	//suppress at start of string
				if(!allow_numbers)			return
				output += ascii2text(ascii_char)
				last_char_group = 2

			//Space
			if(32)
				if(last_char_group <= 1)	continue	//suppress double-spaces and spaces at start of string
				output += ascii2text(ascii_char)
				last_char_group = 1
			else
				return

	if(number_of_alphanumeric < 2)	return		//protects against tiny names like "A" and also names like "' ' ' ' ' ' ' '"

	if(last_char_group == 1)
		output = copytext(output,1,length(output))	//removes the last character (in this case a space)

	for(var/bad_name in list("space","floor","wall","r-wall","monkey","unknown","inactive ai"))	//prevents these common metagamey names
		if(cmptext(output,bad_name))	return	//(not case sensitive)
	return output


proc/hint_text(string)
	var/newstring = "<font color=#0FF>\[ [string] \]</font>"
	return newstring
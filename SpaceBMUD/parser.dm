client/Command(T)
	if(mob.buffering)
		if(T == ".abort")
			mob.reset_buffer()
			src << "Aborting buffer mode..."
			return
		else
			if(mob.buffer_overwrite) mob.overwrite_to_buffer(T)
			else mob.add_to_buffer(T)
			return
	src << T
	var/list/extras
	var/obj/room/R = mob.loc
	extras = R.getRoomCommands()
	var/ParserOutput/out = alaparser.parse(src.mob,T,extras)
	if(!out.getMatchSuccess())
		src << "Huh?";



proc/Start_Parser()
	alaparser = new()


obj/room/var/list/commands = new()
obj/room/proc/getRoomCommands()
	return commands


/*
Command
	bloop

		format = "~bloop"

		command(mob/user)
			world << "[user] bloops!"
*/
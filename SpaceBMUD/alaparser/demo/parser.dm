/*

Push all client input over to the parser for processing,
and let the user know if what they typed didn't make any sense.

*/

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
	if(istype(mob.loc, /obj/room))
		var/obj/room/R = mob.loc
		extras = R.getRoomCommands()

	var/ParserOutput/out = alaparser.parse(src.mob, T, extras);
	if(!out.getMatchSuccess())
		src << "Huh?"


proc/Start_Parser()
	alaparser = new()


obj/room/var/list/commands = new()
obj/room/proc/getRoomCommands()
	return commands


/*Command
	var
		level_req = 1;

	preprocess(mob/user) {
		if(level_req > user.client.level) {
			user << "You aren't high enough level!";
			return FALSE;
		}
		return TRUE;
	}
*/
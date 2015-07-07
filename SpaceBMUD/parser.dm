client/Command(T) {
	var/ParserOutput/out = alaparser.parse(src.mob, T);
	if(!out.getMatchSuccess()) {
		src << "Huh?";
	}
}


proc/Start_Parser()
	sleep(5)
	alaparser = new()



Command
	bloop

		format = "~bloop"

		command(mob/user)
			world << "[user] bloops!"
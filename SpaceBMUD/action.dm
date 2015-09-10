Command/rooms/movement
	var/desc
	var/udesc
	var/odesc
	var/obj/room/dest

	var/list/allowed_rooms = list()



	command(mob/user)
		var/allowed = 0
		for(var/i in allowed_rooms)
			if(user in locate(i))
				allowed = 1
		if(!allowed)
			user << "Huh?" //#mostlazyhack2015
			return
		var/obj/room/R = user.loc
		R.oannounce_visual(user,"[user] [desc]")
		user << "\red [udesc]"
		if(user.Move(locate(dest)))
			user.loc:oannounce_visual(user,"[user] [odesc]")



	test_for_item
		var/atom/needed
		var/deny_str

		command(mob/user)
			var/allowed = 0
			for(var/i in allowed_rooms)
				if(user in locate(i))
					allowed = 1

			if(!allowed)
				user << "Huh?"
				return

			if(locate(needed) in user)
				..()
			else
				user << "[deny_str]"
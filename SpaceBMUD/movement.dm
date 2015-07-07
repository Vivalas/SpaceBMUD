Command
	north
		format = "~north"

		command(mob/user)
			user.TryMove(NORTH)

	south
		format = "~south"

		command(mob/user)
			user.TryMove(SOUTH)

	west
		format = "~west"

		command(mob/user)
			user.TryMove(WEST)

	east
		format = "~east"
		command(mob/user)
			user.TryMove(EAST)





mob/proc/TryMove(dir)
	var/room/target
	var/room/source = loc
	switch(dir)
		if(NORTH) target = locate(source.north_exit)
		if(SOUTH) target = locate(source.south_exit)
		if(WEST) target = locate(source.west_exit)
		if(EAST) target = locate(source.east_exit)
	if(!target)
		src << "You can't go that way!"
		return
	if((dir in source.blocked_exits)||(dir in target.blocked_exits) )
		src << "That way seems to be blocked."
		return

	else
		var/interaction/move/M = new
		M.doer = src
		M.affecting += dir
		add_to_queue(M)


interaction
	move
		_start_()

		_end_()
			var/mob/M = doer
			var/dir = affecting[1]
			switch(dir)
				if(NORTH) M.CanMove(locate(M.loc:north_exit),"north")
				if(SOUTH) M.CanMove(locate(M.loc:south_exit),"south")
				if(WEST) M.CanMove(locate(M.loc:west_exit),"west")
				if(EAST) M.CanMove(locate(M.loc:east_exit),"east")

mob/Move()
	if(..())
		src << look_surround(loc)
		return 1


mob/proc/CanMove(room/target,dir)
	loc:announce_visual("[src] leaves to the [dir].")
	if(src.Move(target))
		loc:oannounce_visual("[src] arrives from the [dir].")


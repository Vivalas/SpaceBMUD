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
	var/obj/room/target
	var/obj/room/source = loc
	switch(dir)
		if(NORTH) target = locate(source.north_exit)
		if(SOUTH) target = locate(source.south_exit)
		if(WEST) target = locate(source.west_exit)
		if(EAST) target = locate(source.east_exit)
	if(!target)
		src << "You can't go that way!"
		return
	if((dir in source.blocked_exits)||(OppositeDirection(dir) in target.blocked_exits) )
		src << "That way seems to be blocked."
		return
	if(loc:is_door_blocked(dir))
		src << "There seems to be a door blocking that way!"
		return
	else
		var/interaction/move/M = new
		M.doer = src
		M.affecting += dir
		add_to_queue(M)


interaction
	move
		delay = 1
		_start_()
			var/dir = affecting[1]
			doer << "You start to move towards the [dir2str(dir)]."
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


mob/proc/CanMove(obj/room/target,dir)
	if(loc:depart_desc.len)
		var/announced = 0
		for(var/i in loc:depart_desc)
			if(loc:depart_desc[i] == dir)
				var/desc = i
				loc:announce_visual("[src] [desc]")
				announced = 1
		if(!announced) loc:announce_visual("[src] leaves to the [dir].")
	else loc:announce_visual("[src] leaves to the [dir].")
	if(src.Move(target))
		if(target.arrive_desc.len)
			var/announced = 1
			for(var/i in target.arrive_desc)
				if(target.arrive_desc[i] == dir)
					var/desc = i
					loc:oannounce_visual("[src] [desc]")
					announced = 1
			if(!announced) target.oannounce_visual("[src] arrives from the [OppositeDirectionStr(dir)]")

		else target.oannounce_visual("[src] arrives from the [OppositeDirectionStr(dir)]")
	else
		src.loc:announce_visual("[src] is unable to leave the room!")

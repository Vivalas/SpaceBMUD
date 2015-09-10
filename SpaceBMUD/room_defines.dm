obj/room

	var/list/exit_descs = list()
	var/hint //a hint that displays in look if the user has hints on
	var/datum/area/area
	var/region/region
	var/list/blocked_exits = list()
	var/list/arrive_desc = list()
	var/list/depart_desc = list()
	var/list/init_doors = list()
	var/roomid
	var/obj/room
		north_exit
		south_exit
		west_exit
		east_exit
	var/list/population = list()

	New()
		..()
		spawn Connect_Regions()
//		spawn InitDoors()
		spawn InitRoom()





	proc/Connect_Regions()
		sleep(1)
		var/region/oregion
		if(region)
			var/region/nregion = new region
			for(var/region/R in regions)
				if(R.name == nregion.name)
					oregion = R
			if(oregion)
				region = nregion
				oregion:rooms += src
			else
				region = "\red UNKNOWN REGION CONTACT A DEVELOPER IMMEDIATELY \red"
		var/datum/area/oarea
		if(area)
			var/datum/area/narea = new area
			for(var/datum/area/A in areas)
				if(A.type == narea.type)
					oarea = A
			if(oarea)
				area = narea
				oarea:rooms += src
			else

				area = "\red UNKNOWN AREA CONTACT A DEVELOPER IMMEDIATELY \red"

		InitDoors()

	proc/announce_visual(msg)
		for(var/atom/A in contents)
			A << msg

	proc/announce_audio(msg)
		for(var/atom/A in contents)
			A << msg

	proc/oannounce_visual(mob/M,msg)
		for(var/atom/A in contents)
			if(A == M)
				continue
			A << msg

	proc/oannounce_audio(mob/M,msg)
		for(var/atom/A in contents)
			if(A == M)
				continue
			A << msg

	proc/InitDoors()
		for(var/i in init_doors)
			if(dir2door(init_doors[i])) continue //no multiple doors, yo
			var/door = new i(src)
			door:direction = init_doors[i]


	proc/InitRoom()
		for(var/i in population) new i(src)

		if(!roomid) roomid = NewRoomId()


	proc/NewRoomId()
		var/obj/room/a
		var/roomid = 1
		start_over:
		for(a)
			if(a.roomid == roomid)
				roomid++
				goto start_over
		return roomid

	proc/handle_commands()

		while(alaparser == null || alaparser.generator == null) {
			sleep(5);
		}

		if(commands && length(commands)) {
			var/list/paths = commands.Copy();
			commands.Cut();
			for(var/path in paths) {
				commands[path] = new path();
			}

		}
proc/LocateRoom(roomid)
	var/obj/room/a
	if(isnum(roomid))
		for(a)
			world << a
			if(a.roomid == roomid) return a
	else
		a = locate(roomid)
		return a


mob/verb/find_rooms()
	var/obj/room/A
	for(A) world << A

mob/verb/world_contents()
	for(var/i in world) world << i




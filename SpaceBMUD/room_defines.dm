room
	var/list/exit_descs = list()
	var/hint //a hint that displays in look if the user has hints on
	var/datum/area/area
	var/region/region
	var/list/blocked_exits = list()
	var/list/arrive_desc = list()
	var/list/depart_desc = list()


	New()
		..()
		spawn Connect_Regions()


	proc/Connect_Regions()
		sleep(5)
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

	proc/announce_visual(msg)
		contents << msg

	proc/announce_audio(msg)
		contents << msg

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
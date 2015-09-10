world
	mob = /mob/char_gen

var/list/areas = list()
var/list/regions = list()
var/list/rooms = list()
var/list/skills = list()

world/New()
	..()
//	mud.Read()
	spawn Create_Lists()
	spawn Start_Parser()
	spawn
		if (!GameController)
			GameController = new()
	spawn CreateRooms()
	spawn CreateSkills()

//	spawn CreateDoorLinks()





proc/Create_Lists()
	var/list/nareas = typesof(/datum/area) - /datum/area
	var/list/nregions = typesof(/region) - /region
	for(var/i in nareas)
		var/ni = new i
		areas += ni
	for(var/i in nregions)
		var/ni = new i
		regions += ni

proc/CreateRooms()
	var/list/create_rooms = typesof(/obj/room)
	for(var/type in create_rooms)
		new type

proc/CreateSkills()
	var/list/nskills = typesof(/skill) - /skill
	for(var/i in nskills)
		var/NI = new i
		skills += NI


mob/Login()
	loc = LocateRoom(8)


mob/verb/goto_start()
	loc = LocateRoom(1)

mob/verb/relay_roomids()
	for(var/obj/room/i in world)
		world << i
		world << i.roomid

mob/verb/relay_skills()
	for(var/skill/skill in skills)
		world << skill.type
		world << skill.name

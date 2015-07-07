world
	mob = /mob/standard

var/list/areas = list()
var/list/regions = list()


world/New()
	..()
	mud.Read()
	Create_Lists()
	Start_Parser()
	var/result = ..()
	if (!GameController)
		GameController = new()
		return result




proc/Create_Lists()
	var/list/nareas = typesof(/datum/area) - /datum/area
	var/list/nregions = typesof(/region) - /region
	for(var/i in nareas)
		var/ni = new i
		areas += ni
	for(var/i in nregions)
		var/ni = new i
		regions += ni




mob/char_gen
	desc = "A faceless featureless stark-white ghoul-looking humanoid creature. Weird!"
	var/list/up_stats() = list()
	var/list/down_stats() = list()
	proc/compile_stats()
		for(var/obj/game/item/stat_item/stat in contents)
			if(stat.mode)
				up_stats += stat.stat
			else
				down_stats += stat.stat
			del stat

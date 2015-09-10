obj/room/ether
	area = /datum/area/ether
	region = /region/ether


	start
		name = "Sphere of Creation"
		desc = "You look all around you and see a majestic sphere of light floating above you. \
		 Everything else is just an inky blackness, and you feel restrained when you try to move."
		roomid = 1

		exit_descs = list(north="you see a large square platform.")
		arrive_desc = list("floats over from the north."="south")
		hint = "You are held in place by a mysterious force! Type <font color=white>wriggle</font> to break free!"


	platform
		name = "Obsidian Platform"
		desc = "A shiny, featureless obisidan platform hovers here in the void. There's not much else to say about it really. \
		it's pretty damn unremarkable."
		south_exit = .start
		north_exit = .cube_room
		exit_descs = list(south="you see a large irridescent sphere glowing and warping.",north="you see a black obsidian cube with a door built in facing you.")
		depart_desc = list("floats over to the south."="south")
		population = list(/obj/game/item/char_gen/name_orb)
		init_doors = list(/obj/game/item/door=NORTH)


	cube_room
		name = "Obsidian Cube"
		desc = "You find yourself inside a cube of pure obsidian. The walls floors and ceiling are nothing but a glossy shade of black. \
		It almost makes you think that there is no room at all. As soon as you step in the room you immediately feel as if your very body \
		is being ripped from reality!"
		south_exit = .platform
		init_doors = list(/obj/game/item/door=SOUTH)
		hint = "You feel an ethereal force in the room trying to drag you across space and time. You feel as if you could loose connection \
		with reality at any moment. Type <font color=white>ascend</font> to release yourself into the void!"


	platform2
		name = "Obsidian Platform"
		area = /datum/area/ether2
		desc = "You find yourself on another obsidiam platform... though it seems as if you were back on the same one as earlier. \
		You look around and don't see a cube however, and instead of black nothing surrounding you, the void ripples with color and \
		light. There is a portal here on the north end of the platform, shimmering with color and pulsing."
		population = list(/obj/game/item/char_gen/gender_orb)
		exit_descs = list(north = "you see a shimmiring portal at the end of the platform.")
		hint = "At the north end of the platform there is a shimmering portal! Type <font color = white>depart</font> to leave!"

	cylinder
		name = "Obsidian Cylinder"
		desc = "You appear to be in a massive obsidian cylinder about 10 meters wide. Looking up, the cylinder stretches upward for what \
		seems like eternity. The cylinder is adequately lit despite there not being any visible light source. You feel slightly weightless \
		in this room, as if you could float up and away any moment."
		population = list(/obj/game/item/char_gen/desc_orb)
		hint = "When you are ready to leave this room, type <font color=white>float</color> to go on to the next stage!"

	dome1
		name = "Hall of Virtues"
		desc = "You find yourself inside an otherwise MASSIVE obsidian dome that sretches in all directions, about the size of a sports \
		stadium. All around you lie glowing objects, which seem to attract you to them, almost uncontrollably."
		hint = "Welcome to the Hall of Virtues! Here you will pick 2 items from the ones lying around your feet. You have 6 stats in \
		SpaceBMUD. Strength (STR), Endurance (END), Intelligence (INT), Reflexes (REF), Agility (AGI), and Perception (PCP). Each of the 6 objects in this \
		room is linked to a specific stat. You will pick 2 objects in this room and 2 in the next room, the Hall of Flaws. The 2 stats \
		you pick here will be boosted, and the two you pick in the next room will be hindered. The 2 stats you don't pick in either room will \
		be considered average. Choose wisely! (And obviously you can't pick the same stat in both rooms, dumbass.)"
		north_exit = .dome2
		exit_descs = list(north = "you see a wide archway leading into another identical obsidian dome.")
		population = list(/obj/game/item/stat_item/sword,/obj/game/item/stat_item/shield,/obj/game/item/stat_item/lantern, /obj/game/item/stat_item/headband,/obj/game/item/stat_item/gloves,/obj/game/item/stat_item/book)
		area = /datum/area/ether3

		Exit(mob/char_gen/M)
			var/list/stat_items = list()
			for(var/obj/game/item/stat_item/stat in M)
				stat_items += stat
			if(stat_items.len < 2)
				M << "You try to head through the arch to the north, but you are blocked off by an invisible wall. A force urges you to \
				pick up more items."
				return 0
			else if(stat_items.len > 2)
				M << "You try to head through the arch to the north, but you are blocked off by an invisible wall. A force urges you to \
				drop some of the items you have."
				return 0
			else
				return 1
		Exited(mob/char_gen/M)
			M.compile_stats()


	dome2
		name = "Hall of Flaws"
		desc = "You're in another large obsidian dome, filled with more objects, but instead of the colorful auras in the last room, this \
		room is filled with menacing objects that seem to fill you with fear and despair. The exit to the south that you seemed to have come \
		from appears to be missing, and in its place is just a curved obsidian wall, Weird!"
		hint = "Welcome to the Hall of Flaws! This room is the same as the previous room, but the 2 stats you pick here will be downgraded \
		rather than upgraded."
		area = /datum/area/ether3
		population = list(/obj/game/item/stat_item/debuff/cutlass,/obj/game/item/stat_item/debuff/buckler,/obj/game/item/stat_item/debuff/spyglass,/obj/game/item/stat_item/debuff/gauntlet,/obj/game/item/stat_item/debuff/weight,/obj/game/item/stat_item/debuff/sphere)
		north_exit = .tube
		exit_descs = list(north = "you see another archway connecting the dome to a long hallway.")

		Exit(mob/char_gen/M)
			var/list/stat_items = list()
			for(var/obj/game/item/stat_item/debuff/stat in M)
				stat_items += stat
			if(stat_items.len < 2)
				M << "You try to head through the arch to the north, but you are blocked off by an invisible wall. A force urges you to \
				pick up more items."
				return 0
			else if(stat_items.len > 2)
				M << "You try to head through the arch to the north, but you are blocked off by an invisible wall. A force urges you to \
				drop some of the items you have."
				return 0
			for(var/obj/game/item/stat_item/debuff/stat in stat_items)
				if(M.up_stats.Find(stat.stat))
					M << "You try to head through the arch to the north, but are blocked off by an invisible wall. An unknown force tells \
					you about how much of a dumbsass you are."
					return 1
			return 1

		Exited(mob/char_gen/M)
			M.compile_stats()

	tube
		name = "Obsidian Hallway"
		desc = "The walls of this hallway are curved, giving it the appearance of being inside of a tube. Towards the end of the hallway is \
		an archway leading into another room. Once again the arch behind you seems to not exist when you pass through it."
		area = /datum/area/ether4
		exit_descs = list(north="the hallway continues onward.")
		population = list(/obj/game/item/char_gen/skill_orb)

		Exit(mob/M)
			if(locate(/obj/game/item/char_gen/skill_orb) in M.contents)
				return 1
			else


	tube2
		name = "Obsidian Hallway"
		desc = "The hallway ends here, quite abrubtly. The wall at to the north seems to ripple and fluctuate."
		area = /datum/area/ether4
		exit_descs = list(south="the hallway continues to the south, but an invisible wall seems to block the way.")
		population = list(/obj/game/item/char_gen/background_orb)
		hint = "You're almost at the end of the first phase of character creation! The next phase consists of us giving you some money \
		and letting you shop peacefully for your equipment without having to deal with the hassles of the real world! The next area consists \
		of a room where you can either step through the portal into the real world, or back to square one of character generation. Although \
		since you can still use your orbs that you should all have by now, the only reason you'd want to do that is to change your stats! \
		Type <font color=white>approach</font> to step through!"





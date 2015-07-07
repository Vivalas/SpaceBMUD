room/soft_coded/ether
	area = /datum/area/ether
	region = /region/ether


	start
		name = "Sphere of Creation"
		desc = "You look all around you and see a majestic sphere of light floating above you. \
		 Everything else is just an inky blackness, and you feel restrained when you try to move."
		roomid = 1

		exit_descs = list(north="you see a large square platform.")
		hint = "You are held in place by a mysterious force! Type <font color=white>wriggle</font> to break free!"
		New()
			..()
			var/action/exit/e = new(src)
			e.SetName("wriggle")
			e.desc = "wriggles free of the mysterious force suspending him and then floats towards the north."
			e.udesc = "You break free of the force holding you, and then levitate north to the platform."
			e.odesc = "floats over from the platform to the south."
			e.dest = /room/soft_coded/ether/platform

	platform
		name = "Obsidian Platform"
		desc = "A shiny, featureless obisidan platform hovers here in the void. There's not much else to say about it really. \
		it's pretty damn unremarkable."
		south_exit = .start
		exit_descs = list(south="you see a large irridescent sphere glowing and warping.")
		population = list(/obj/game/item/red_ball,/obj/game/item/red_ball,/obj/game/item/blue_ball,/obj/game/item/badass_ball)

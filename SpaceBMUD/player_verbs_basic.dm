Command
	look
		format = "~look; ?~search(atom@view)"

		command(mob/user,mob/M)
			if(M)
				user << M.examined()
			else
				user << user.look_surround(user.loc)

Command
	get
		format = "~get; ?~search(obj/game/item@loc)"

		command(mob/user,obj/game/item/O)
			if(!O)
				user << "Get what?"
				return
			else if(!istype(O))
				user << "What is \"[O]\"?"
				return
			if((O in user.contents))
				user << "There is no [O] on the ground here."
				return
			if((locate(O.type) in user.contents)&&O.only_one)
				user << "The [O] seems to repulse you."
				return
			if(O.anchored)
				user << "You can't seem to be able to pick up [O]."
				return
			if(O.weight >= 1.5*user.max_weight)
				user << "You can't possibly carry any more weight!"
				return
			var/interaction/get/G = new
			G.doer = user
			G.affecting += O
			user.add_to_queue(G)


interaction
	get
		_start_()



		_end_()
			var/mob/M = doer
			var/O = affecting[1]
			if(O in M.loc)
				var/NO = new O:type(M.loc)
				M.loc:announce_visual("\A [NO] materializes!")
				O:loc = M
			else return
			M.loc:announce_visual("[M] picks up [O].")
			if(O:hint)
				M << "<font color=#0FF>\[ [O:hint] \]</font>"

interaction
	drop
		_start_()

		_end_()
			var/mob/M = doer
			var/O = affecting[1]
			if(O in M) O:loc = M.loc
			else return
			M.loc:announce_visual("[M] drops [O].")
			O:dropped(M)



Command
	drop

		format = "~drop; ~?search(obj/game/item@contents)"

		command(mob/user,obj/game/item/O)
			if(!O)
				user << "Drop what?"
				return
			if(!istype(O)) return //what?

			if((!O in user.contents))
				user << "You don't have [O]."
				return

			if(O.soulbound)
				user << "You can't seem to drop [O]. Weird!"
				return

			var/interaction/drop/D = new
			D.doer = user
			D.affecting += O
			user.add_to_queue(D)

Command
	inventory

		format = "~inventory"

		command(mob/user)
			user << user.BuildInventory(user.contents)

mob/proc/BuildInventory(var/list/contents)
	var/msg
	msg += "		Inventory"
	msg += "<BR><BR>"
	for(var/obj/game/item/O in contents) //I mean, they can't POSSIBLY have anything that's not obj/game in their inventory, RIGHT?
		msg += "<BR>| [O.name] - <font color=#0FF>\[[O.weight] g\]</font>"
	return msg



Command
	noot //why not :^)

		format = "noot"

		command(mob/user)
			user << "Noot! Noot!"

interaction
	open_door

		_start_()
			var/dir = affecting[2]
			doer:loc:announce_visual("[doer] moves to open the door to the [dir].")

		_end_()
			var/dir = affecting[2]
			var/obj/game/item/door/door_to_open = affecting[1]
			var/mob/M = doer
			if(door_to_open.open_door())
				doer.loc:announce_visual("[doer] opens the door to the [dir].")
				door_to_open.linked.loc:announce_visual("[doer] opens the door to the [OppositeDirectionStr(dir)] from the other side.")
			else
				doer << "You can't seem to open the door. Maybe it's locked?"

interaction
	close_door

		_start_()
			var/dir = affecting[2]
			doer:loc:announce_visual("[doer] moves to close the door to the [dir].")

		_end_()
			var/dir = affecting[2]
			var/obj/game/item/door/door_to_close = affecting[1]
			var/mob/M = doer
			if(door_to_close.close_door())
				doer.loc:announce_visual("[doer] closes the door to the [dir].")
				door_to_close.linked.loc:announce_visual("[doer] closes the door to the [OppositeDirectionStr(dir)] from the other side.")
			else
				doer << "You can't seem to close the door. Maybe it's broken?"

Command
	open

		format = "~open; ~?search(obj/game/item/door@loc)"

		command(mob/user, obj/game/item/door/door)
			if(!door)
				user << "Open what?"
				return
			else
				var/interaction/open_door/D = new
				D.doer = user
				D.affecting += door
				D.affecting += dir2str(door2dir(door))
				user.add_to_queue(D)

Command
	close

		format = "?close; ~?search(obj/game/item/door@loc)"

		command(mob/user, obj/game/item/door/door)
			if(!door)
				user << "Close what?"
				return
			else
				var/interaction/close_door/D = new
				D.doer = user
				D.affecting += door
				D.affecting += dir2str(door2dir(door))
				user.add_to_queue(D)





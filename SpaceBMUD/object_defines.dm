obj/game/item
	var/weight = 0 //in grams
	var/anchored = 0 //can the thingy be moved?
	var/category = "Miscellaneous" //for inventory purposes
	var/plural_name = "items"
	var/soulbound = 0 //can you drop it?
	var/hint // message that shows when you pick it up
	var/respawn = 0 //does it respawn when you pick it up?
	var/only_one = 0 //can you only hold one?
	var/hidden = 0 //does it show up in 'look'?
	var/must_hold = 1 //do you need to be holding it to use it?


	proc/use(mob/M)
		return 0

	proc/dropped(mob/M)

Command
	use
		format = "~use; ~?search(obj/game/item@view)"

		command(mob/user,obj/game/item/O)
			if(!O)
				user << "Use what?"
				return
			if((O.must_hold)&&!(locate(O) in user))
				user << "You have to hold [O] to use it!"
				return
			var/interaction/use/U = new()
			U.doer = user
			U.affecting += O
			user.add_to_queue(U)

interaction
	use
		_start_()

		_end_()
			var/obj/game/item/O = affecting[1]
			var/mob/M = doer
			if(!O.use(M))
				doer << "You can't find any useful way to use [O]."

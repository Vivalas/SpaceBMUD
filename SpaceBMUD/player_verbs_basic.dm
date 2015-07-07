Command
	look
		format = "~look; ?~search(atom@loc)"

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
			if(O in M.loc) O:loc = M
			else return
			M.loc:announce_visual("[M] picks up [O].")


mob/verb/write(msg as text)




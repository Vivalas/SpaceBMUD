Command/rooms/movement

	wriggle

		format = "~wriggle"
		allowed_rooms = list(/obj/room/ether/start)
		desc = "breaks free of the force holding him and floats over to the north."
		udesc = "You break free of the force holding you and float over to the north."
		odesc = "floats over from the south."
		dest = /obj/room/ether/platform



Command/rooms/movement/test_for_item

	ascend

		format = "~ascend"
		allowed_rooms = list(/obj/room/ether/cube_room)
		desc = "fades away... was he even there in the first place?"
		udesc = "You find your body rapidly disappearing and fading away, and start to panic. The whole world then starts fading away, and before you \
		can even collect your thoughts you find yourself.. back on the platform you were on earlier?"
		odesc = "materializes in front of you!"
		dest = /obj/room/ether/platform2
		needed = /obj/game/item/char_gen/name_orb
		deny_str = "You try to seperate yourself from reality, but an unknown force continues to hold you back. You suddenly have \
		an inexplicable urge to go and pick up that orb you saw earlier on the platform."

	depart
		format = "~depart"
		allowed_rooms = list(/obj/room/ether/platform2)
		desc = "departs through the portal to the north."
		udesc = "You walk to the north end of the platform and step though the portal. You're blinded by a disorienting blast of white light \
		and find yourself stumbling around inside of a massive vertical cylinder."
		odesc = "materializes in front of you, and stumbles around a bit before regaining his bearing."
		dest = /obj/room/ether/cylinder
		needed = /obj/game/item/char_gen/gender_orb
		deny_str = "You try to pass though the portal but you walk face first into it instead. It appears to be completely solid. You get \
		a strange urge to pick up the glowing red orb on the floor here."

	float
		format = "~float"
		allowed_rooms = list(/obj/room/ether/cylinder)
		desc = "floats up and off the ground, and begins to ascend faster and faster up the cylinder until they disappear from sight."
		udesc = "You urge yourself to float, and your body obeys. You being to fly faster and faster up the seemingly infinite shaft of the \
		cylinder. Suddenly, without any sensation of deceleration or intertia, you find yourself standing inside a massive dome!"
		odesc = "materializes in front of you!"
		dest = /obj/room/ether/dome1
		needed = /obj/game/item/char_gen/desc_orb
		deny_str = "Try as you might you can't seem to lift up and float away. You seem to be held back by an invisible force and feel an \
		urge to pick up the glowing yellow orb beside your feet."

	approach
		format = "~approach"
		allowed_rooms = list(/obj/room/ether/tube2)
		desc = "steps forward slowly and touches the wall. It ripples to his touch and sucks him inward, and he disappears completely, as he \
		is swallowed up."
		udesc = "You step forward slowly to the wall, reaching out a hand tentatively to touch it. It begins to ripple rapidly and then consumes you, \
		sucking you into it. You get pulled for what seems like an eternity through a gelatin like black substance. The substance glows and \
		pulses with pictures and memories of your past, and seems odly translucent as opposed to before. You suddenly lurch and are spat out \
		in another room."
		odesc = "gets spat out from the wall to the south."
		needed = /obj/game/item/char_gen/background_orb
		deny_str = "You walk forward to the wall and reach out your hand, but the wall ripples away from your hand, rejecting you. You \
		feel an urge to pick up the glowing white orb at your feet."
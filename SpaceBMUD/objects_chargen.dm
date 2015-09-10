obj/game/item/char_gen
	soulbound = 1
	respawn = 1
	only_one = 1




	name_orb
		name = "orb of identity"
		desc = "A glowing blue orb that seems to radiate memories of your identity and self when you peer into it."
		plural_name = "orbs of identity"
		hint = "You pick up the orb, entranced by how it seems to radiate your entire life's memories. \
		You start to wonder who you are or where you even are. Trippy. (Type \"use orb\" to begin the character generation process!)"
		var/chosen_name

		use(mob/M)
			M << "\red You hold up the orb and peer into it. The world distorts a little bit as you gleam memories of your identity. \
			You start to wonder who you are and why you're here, memories come and you become alarmed about why you are here, but quickly get supressed \
			by an unknown force. You feel at peace once again, and you finally remember who you are, or were, at least."
			M << hint_text("You are now in text input mode. Type words into the command console to input data. \
			Please enter your desired name. The name must be at least 3 letters long and contain only letters and normal name punctuation \
			such as \" \\, -, `\". It is also requested that you also give yourself a surname, unless your backstory would otherwise leave \
			leave you without one.")

			M.start_buffer(src,1)

			return 1

		listen_to_buffer(data,mob/M)
			..()
			var/name = sanitize_name(data)
			if(!name)
				M << "Invalid name!"
				return
			else
				name = make_sentence_uppercase(name)
				M << "\yellow Name: [name] chosen! To choose another name use the orb again!"
			chosen_name = name
			M.reset_buffer()

	gender_orb
		name = "orb of identity"
		desc = "A glowing red orb that seems to radiate more memories of your identity than the last one.."
		plural_name = "orbs of identity"
		hint = "You pick up another orb, this one seems like the one before, but is a bright shade of red... it seems to make you remember \
		more of your past than the last one...."
		var/chosen_gender

		use(mob/M)
			M << "\red You hold up the orb and peer into it, eager to remember more about your past... you seem to remember what \
			gender you are, or were...."
			M << hint_text("Please choose a gender. Valid entires are \"male\", or \"female\". Seriously, you're either a man or a woman.")

			M.start_buffer(src,1)

			return 1

		listen_to_buffer(data,mob/M)
			..()
			if(data == "male"||data == "Male")
				chosen_gender = MALE
				M << "\yellow Gender: Male chosen! To choose another gender, use the orb again!"
				M.reset_buffer()
			else if(data == "female"||data == "Female")
				chosen_gender = FEMALE
				M << "\yellow Gender: Female chosen! To choose another gender, use the orb again!"
				M.reset_buffer()
			else
				M << "Not a recognized gender! Valid genders are male and female!"

	desc_orb
		name = "orb of self"
		desc = "A glowing yellow orb that seems to make you remember your physical form, and causes you to rapidly morph and change \
		appearance when you look at it."
		hint = "Just being in the presence of this next orb makes your appearance rapidly change, and you start to concentrate on \
		how you remember your appearance to be.."
		var/chosen_desc

		use(mob/M)
			M << "\red You hold up the orb and stare deep into it's yellow core. Your vision blurs and images of yourself rapidly flash \
			by your eyes..."
			M << hint_text("Now you get to choose your description. Your description is purely what someone would be able to see if they \
			looked at your character, or observed them for a short period of time. Things like mannerisms and behavior quirks, as well as \
			just your physical appearance fit here. Abuse of your description to add otherwise metagamey text to your examine blurp \
			will result in swift and harsh punishment. Type .end on an empty line to end the process.")

			M.start_buffer(src,0)

			return 1

		listen_to_buffer(data,mob/M)
			..()

			if(findtext(data,".end"))
				chosen_desc = data
				chosen_desc = kText.replaceText(chosen_desc,".end","")
				M << "\yellow Description: [chosen_desc] chosen! Use the orb again to change it!"
				M.reset_buffer()

	background_orb
		name = "orb of memories"
		desc = "A glowing green orb that seems to make your entire life flash before your eyes when you peer into it."
		hint = "The orb you pick up seems to make you remember random moments in your past whenever you stare into it for too long."
		var/chosen_back

		use(mob/M)
			M << "\red You hold the orb up and stare into it. Your vision wavers and the green comforting aura of the orb seems to \
			take over your vision. Visions and moments in your past rapidly fly by, and your whole life is strung, manipulated, wound, \
			and spun in front of you. Whoah."
			M << hint_text("You now get to write your character's background. A full fledged 5 paragraph description is not necessary, but \
			it should reflect the skills and stats you have chosen to reflect how your character obtained them. Have fun and be creative! \
			Note that only staff can see these notes.")

			M.start_buffer(src,0)

			return 1

		listen_to_buffer(data,mob/M)
			..()

			if(findtext(data,".end"))
				chosen_back = data
				chosen_back = kText.replaceText(chosen_back,".end","")
				M << "\yellow Background: [chosen_back] chosen! Use the orb again to change it!"
				M.reset_buffer()

	skill_orb
		name = "orb of knowledge"
		desc = "A glowing white orb that seems to inundate your mind with all sorts of knowledge by just looking at it."
		hint = "Use this orb to set your skills! Skills in SpaceBMUD are in levels and tied to certain stats!(e.g. REF and INT to Cooking) \
		You can train stats ingame albeit very slowly, and it's better to just train with other players using the \"train\" command and \
		roleplay it out!"
		var/list/chosen_skills = list()

		use(mob/M)
			M << "\red You hold the orb to your face, attempting to unlock the secrets lying within. You feel a great calm run over you as \
			knowledge and facts fly by you at dizzying speeds. You remember who you were and what your profession was in life."
			M << hint_text("This is the part of character creation where you get to define your skills and the knowledge you bring into \
			the game world, Skills are not an intergral part of SpaceBMUD and serve as a guide to what your character has knowledge of \
			and what they are not capable. While it is possible to raise skills in game, the system is more of a natural one, and \
			roleplaying with fellow players and learning from them yields far more than grinding skills. Grinding skills is not something \
			that is really all that fun at all, and while we can't really stop you, this game is meant to be fun and enjoyable, and skills \
			should not be something you really should worry about that much, as they mostly grow on their own along with yout character, much \
			like in the real world. From the following list you will need to input 5 skills onto the same line, seperated by colons \
			e.g.(cooking;pistols;fray;etc..). The skills you input will be rolled in order from highest to lowest. Input the skill names in \
			all lower case.")

			for(var/skill/skill in skills)
				M << "|[skill]"

			M.start_buffer(src,1)

			return 1

		listen_to_buffer(data,mob/M)
			..()

			var/list/sel_skills = kText.text2list(data,";")
			var/list/picked_skills = list()
			for(var/word in sel_skills)
				var/skill/sel_skill = cname2skill(word)
				if(sel_skill)
					picked_skills += sel_skill
				else
					M << "Error: Undefined skill: [word]"
					return
			if(picked_skills.len > 5)
				M << "You may only pick 5 skills!"
			else if(picked_skills.len < 5)
				M << "You must at least 5 skills!"
			else //picked is 5
				chosen_skills = picked_skills
				M << "\yellow Skills chosen! Use the orb again to change them!"
				for(var/skill/skill in chosen_skills)
					M << "\yellow |- [skill]"

				M.reset_buffer()




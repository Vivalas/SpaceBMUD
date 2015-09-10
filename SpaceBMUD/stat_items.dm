obj/game/item/stat_item
	respawn = 1
	only_one = 1

	var/stat //linked stat of the object

	var/mode = 1 //1 is boost, 0, is hinder

	dropped(mob/M)
		loc:announce_visual("The [src] shimmers and fades away into nothing!")
		del src

	sword
		name = "obsidian longsword"
		desc = "This object seems to emit a red aura, and just holding it makes you feel stronger!"
		stat = STRENGTH
		hint = "You pick up a large sword that immediately fills you with boundless energy and the strength of 100 men! \
		This is the Strength (STR) increasing item of the Hall of Virtues. Leaving the room with this will increase your STR."

	shield
		name = "titanium shield"
		desc = "This object seems to emit a green aura, and just holding it makes you feel indestructable!"
		stat = ENDURANCE
		hint = "Picking up the titanium shield makes you feel extremely powerful and almost indestructable. You feel your muscles ripple \
		with energy and feel like you could run 100 miles without stopping! This is the Endurance (END) increasing item of the Hall of \
		Virtues. Leaving the rooom with this will increase your END."

	lantern
		name = "golden lantern"
		desc = "This object seems to emit a yellow aura, and holding it makes you feel as if you can see the entire universe!"
		stat = PERCEPTION
		hint = "As you pick up the golden lantern, your field of vision immediately warps and distorts. After a minute, you feel as if you \
		can sense and feel the world around you! This is the Perception (PCP) increasing item of the Hall of Virtues, Leaving the room with \
		it will increase your PCP."

	headband
		name = "adamantium headband"
		desc = "This headband seems to emit a purple aura. Picking it up makes you feel invigorated and fast!"
		stat = AGILITY
		hint = "Holding the headband in your hand, you can't seem to fit it on your head, but it makes you feel as if you have superhuman \
		speed. You feel as if you could run 100 miles per hour! This is the Agility (AGI) increasing item of the Hall of Virtues, Leaving the room with \
		it will increase your AGI."

	gloves
		name = "gossomer gloves"
		desc = "These gloves are made out of silky pink gossomer that is almost transparent. The gloves glow with a white aura. Holding them \
		in your hands makes it feel as if time is slowed down!"
		stat = REFLEXES
		hint = "Putting the gloves on, you feel as if time is slowing down around you. You feel super-aware of everything around you and feel \
		like the world moves in response to you! This is the Reflexes (REF) increasing item of the Hall of Virtues, Leaving the room with \
		it will increase your REF."

	book
		name = "silver tome"
		desc = "A solid silver item resembling the shape of a book, It emits a blue aura and just holding it makes you feel as if you know \
		everything!"
		stat = INTELLIGENCE
		hint = "Holding the book in your hands, you feel your eyes open to the secrets of the universe. Boundless amounts of knowledge \
		inundate your head and you feel enlightened, at one with the universe. This is the Intelligence (INT) increasing object of the Hall \
		of Virtues. Leaving the room with it will increase your INT."

	//Stat debuffs
	debuff

		mode = 0

		cutlass
			name = "corrupted cutlass"
			desc = "A chipped obsidian cutlass that emits a dark and frightenting aura. Holding it makes you feel weak and helpless."
			stat = STRENGTH
			hint = "Picking up this cutlass immediatly makes a wave of nausea and vertigo sweep over you. You feel helpless and weak, and \
			feel as if an evil force is eminating from the object. This is the Strength (STR) decreasing item of the Hall of Flaws. Leaving \
			the room with this will decrease your STR."

		buckler
			name = "shattered buckler"
			desc = "A broken and scratched wooden buckler is here, emitting a dark and tiring aura."
			stat = ENDURANCE
			hint = "Just holding this relic in your hand makes you feel puny and tired. You feel a wave of lerthargy wash over you \
			and become more and more sleepy... This is the Endurance (END) decreasing item of the Hall of Flaws. Leaving the room with it \
			will cause your END to decrease."

		spyglass
			name = "ominous spyglass"
			desc = "A dark, glowing spyglass rests here staring at it for too long causes your vision to blur and your eyes to tire."
			stat = PERCEPTION
			hint = "As you pick up the eyeglass, you immediately feel an irresitable urge to hold it to your eyes. You obey and hold it \
			to your eyes. The world turns upside down, spins, contorts and blurs slightly out of focus. This is the Perception (PCP) \
			decreasing item of the Hall of Flaws. Leaving the room with this item will decrease your PCP."

		weight
			name = "void anchor"
			desc = "A weight-shaped crystal that broods with a dark presence. Holding it makes you feel slow and clumsy."
			stat = AGILITY
			hint = "Picking up the void anchor immediately makes you feel fatigued and slow. You have to struggle to move and the air \
			feels like soup. This is the Agility (AGI) decreasing item of the Hall of Flaws."

		gauntlet
			name = "bone gauntlets"
			desc = "A bone set of gauntlets that glows with a dark ominous glow."
			stat = REFLEXES
			hint = "Wearing these gauntlets on your hands, you feel immediately as if the world starts to speed up around you. Every \
			urge you give your body seems to happen after a long delay. You feel as if you can't react to anything happening around you. \
			This is the Reflexes (REF) decreasing item of the Hall of Flaws. Leaving the room with this item will decrease your REF."

		sphere
			name = "obsidian sphere"
			desc = "A smooth black obidian sphere that emits a dark aura. Looking at it seems to slow down yout thoughts and mental functions."
			stat = INTELLIGENCE
			hint = "Picking up this sphere, an alarming sense of calm washes over you. You drown out the outer world and your mental thought \
			processes seem to slow down. You feel slightly dumb and careless about the world around you. This is the Intelligence (INT) \
			decreasing item of the Hall of Flaws. Leaving the room with this item will decrease your INT."



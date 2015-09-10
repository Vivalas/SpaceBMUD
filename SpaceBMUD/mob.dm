//The file containing all the shite for mobs and such. The basic health system will be replaced in the future with a
//far more advanced and comprehensive system.

#define STRENGTH 1
#define REFLEXES 2
#define INTELLIGENCE 4
#define ENDURANCE 8
#define AGILITY 16
#define PERCEPTION 32
/mob/standard //I want to allow another child of mob to be for really non-standard things
	var/health = 30

	var/list/stats = list(STRENGTH = 10,REFLEXES = 10,INTELLIGENCE = 10, ENDURANCE = 10, AGILITY = 10, PERCEPTION = 10)



	New()
		..()


	base_EventCycle()


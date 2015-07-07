//The file containing all the shite for mobs and such. The basic health system will be replaced in the future with a
//far more advanced and comprehensive system.

#define STRENGTH 1
#define DEXTERITY 2
#define INTELLIGENCE 4
#define CONSTITUTION 8
/mob/standard //I want to allow another child of mob to be for really non-standard things
	var/health = 30

	var/list/stats = list(STRENGTH = 10,DEXTERITY = 10,INTELLIGENCE = 10, CONSTITUTION = 10)



	New()
		..()

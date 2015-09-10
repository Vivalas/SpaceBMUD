//Skills, oh boy, here we go :C

skill
	var/name = "Skill"
	var/cname = "skill"

proc/cname2skill(string)
	for(var/skill/skill in skills)
		if(skill.cname == string) return skill

/* #############
   Combat Skills
   #############
*/

skill/fray
	name = "Fray"
	cname = "fray"

skill/short_blade
	name = "Short Blade"
	cname = "short blade"

skill/long_blade
	name = "Long Blade"
	cname = "long blade"

skill/heavy_blade
	name = "Heavy Blade"
	cname = "heavy blade"

skill/melee
	name = "Melee"
	cname = "melee"

skill/unarmed
	name = "Unarmed"
	cname = "unarmed"

skill/pistol
	name = "Pistol"
	cname = "pistol"

skill/rifle
	name = "Rifle"
	cname = "rifle"

skill/heavy_ranged
	name = "Heavy Ranged"
	cname = "heavy ranged"

skill/marksman
	name = "Marksman"
	cname = "marksman"

/* #############
   Labor Skills
   #############
*/

skill/carpentry
	name = "Carpentry"
	cname = "carpentry"

skill/masonry
	name = "Masonry"
	cname = "masonry"

skill/mechanics
	name = "Mechanics"
	cname = "mechanics"

skill/electronics
	name = "Electronics"
	cname = "electronics"

skill/metallurgy
	name = "Metallurgy"
	cname = "metallurgy"

skill/construction
	name = "Construction"
	cname = "construction"

skill/cooking
	name = "Cooking"
	cname = "cooking"


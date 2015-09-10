mob/verb/test_contents()
	for(var/i in loc) src << i


mob/verb/make_upper_case(string as text)
	var/list/broken = kText.text2list(string," ")
	var/list/capitals = list()
	for(var/word in broken)
		capitals += kText.capitalize(word)
	var/finished_sentence = kText.list2text(capitals," ")
	src << finished_sentence
/mob/living/carbon/human/New()
	. = ..()
	sexual_potency = (prob(80) ? rand(9, 14) : pick(rand(5, 13), rand(15, 20)))
	lust_tolerance = (prob(80) ? rand(150, 300) : pick(rand(10, 100), rand(350,600)))

/mob/proc/do_fucking_animation(fuckdir) // Today I wrote 'var/fuckdir' with a straight face. Not a milestone I ever expected to pass. dont worry, we dont use heretic proc/name(var/dir)
	if(!fuckdir)
		return

	dir = fuckdir

	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/final_pixel_y = initial(pixel_y)

	if(fuckdir & NORTH)
		pixel_y_diff = 8
	else if(fuckdir & SOUTH)
		pixel_y_diff = -8

	if(fuckdir & EAST)
		pixel_x_diff = 8
	else if(fuckdir & WEST)
		pixel_x_diff = -8

	if(pixel_x_diff == 0 && pixel_y_diff == 0)
		pixel_x_diff = rand(-3,3)
		pixel_y_diff = rand(-3,3)
		animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)
		return

	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = final_pixel_y, time = 2)


/mob/proc/has_penis()
	return (gender == MALE)

/mob/proc/has_vagina()
	return (gender == FEMALE)

/mob/proc/has_anus()
	return TRUE

/mob/proc/has_hand()
	return TRUE

/mob/proc/is_nude()
	return TRUE

/mob/living/carbon/human/is_nude()
	return (!wear_suit || !(wear_suit.body_parts_covered)) && (!w_uniform || !(w_uniform.body_parts_covered))
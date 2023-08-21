/mob/proc/defaultRitualSuccess(var/mob/ritual_leader)
	to_chat(ritual_leader, "We did it boys, we did the ritual!")


/proc/preservationSuccess(var/mob/ritual_leader)
	var/area/cadiaoutpost/oa/service/chapel/C = get_area(ritual_leader)
	C.consecrated = TRUE //marks the chapel area as consecrated, this will make heretics unable to stand being in it for long

/mob/proc/invokeSuccess(var/mob/ritual_leader)
//This is a redundant loop, the extra requirement check that is similar exists to show an example of how to use the attribute

	for(var/mob/living/carbon/M in view(6, ritual_leader))
		if(/datum/reagent/water/holywater in M.chem_doses)
			if(M.faction == "Chaos")
				to_chat(ritual_leader, "spooking this chaos boy")
				M.spookyMoves() // if this procs the bad boy interogee will do some spooky exorcist floating



/mob/proc/spookyMoves()
	var/mob/living/carbon/human/target = src
	var/default_pixel_x = 0
	var/default_pixel_y = 0
	visible_message("[target.name] begins to twitch and levitate!")
	playsound(get_turf(target), 'sound/effects/pig_squeal.ogg', 95, 5)


	var/i
	for(i=1,i<=10,i++)
		if(target.buckled == null)
			target.pixel_x += (i + 4.5)
			target.pixel_y += (i + 4.5)//less moves when not in a chair, it looks a little too wonky
			sleep(2)
			target.pixel_x = default_pixel_x
			target.pixel_y = default_pixel_y
		else
			var/obj/structure/buckle_obj = target.buckled
			target.pixel_x  += (i + 4.5)
			target.pixel_y  += (i + 4.5) //less moves when not in a chair, it looks a little too wonky
			buckle_obj.pixel_x  += (i + 4.5)
			buckle_obj.pixel_y  += (i + 4.5)
			sleep(2)
			target.pixel_x = default_pixel_x
			target.pixel_y = default_pixel_y
			buckle_obj.pixel_x = default_pixel_x
			buckle_obj.pixel_y = default_pixel_y


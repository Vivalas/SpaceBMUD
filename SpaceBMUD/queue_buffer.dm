mob/var/list/queue = list()
mob/var/interaction/queued
mob/var/queue_steps = 0
mob/var/buffer_overwrite = 0

mob/proc/add_to_queue(var/interaction/interaction)
	if(buffering)
		reset_buffer()
	queue += interaction

mob/proc/process_queue() //finish what's currently queued and then move on to anything else waiting to be processed
	if(queued)
		queue_steps--
		if(queue_steps <= 0)
			queued._end_()
			queue_steps = 0 //wanna be on the safe side, this is BYOND, after all.
			queued = null
		else
			return
	if(queue.len&&!buffering)
		queued = queue[1]
		queue -= queued
		queued._start_()
		queue_steps = queued.delay
		if(!queue_steps) process_queue() //do immediate things immediately

mob/base_EventCycle()
	..()
	process_queue()


atom/proc/listen_to_buffer(var/data,var/mob/M)
	if((!src in M))
		M.buffer_listeners -= src
		return //only listen to the buffer when in the mob's inventory
mob/var/buffering = 0 //whether or not to
mob/var/buffer //simple storage buffer for inputting data into the console. Please don't edit this directly
mob/var/list/buffer_listeners = list()
mob/proc/start_buffer(var/atom/A,var/mode)
	buffer_listeners += A
	buffering = 1
	buffer_overwrite = mode
	src << "<font color=#0FF>\[ You are now in buffer input mode. Type to input data into the buffer. Type .abort on a new line to stop. \]</FONT>"
mob/proc/add_to_buffer(var/data) //call this when changing the buffer since it alerts any listeners listening for buffer entry
	buffer += data
	buffering = 1
	for(var/atom/A in buffer_listeners)
		A.listen_to_buffer(buffer,src)
	src << "> [data]"
mob/proc/overwrite_to_buffer(var/data)
	buffer = null
	buffer += data
	buffering = 1
	for(var/atom/A in buffer_listeners)
		A.listen_to_buffer(buffer,src)
	src << "> [data]"
mob/proc/reset_buffer()
	src << "Cancelled text input."
	buffer = null
	buffer_listeners.Cut() //stop listening bitches
	buffering = 0
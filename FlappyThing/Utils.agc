function ClampFloat(value as float, minval as float, maxval as float )
	result as float
	if value < minval
		print("clamped from bottom")
		result = minval
	elseif value > maxval
		print("clamped from top")
		result = maxval
	else
		result = value
	endif
endfunction result

function ClampInt(value as integer, minval as integer, maxval as integer )
	result as integer
	if value < minval
		result = minval
	elseif value > maxval
		result = maxval
	endif
endfunction result

function DestroyEverything()
	for i=0 to allsprites.length
		DeleteSprite(allsprites[i])
	next i 
	for i = 0 to alltexts.length
		DeleteText(alltexts[i])
	next i 
	for i=0 to allvirtbuttons.length
		DeleteVirtualButton(allvirtbuttons[i])
	next i
endfunction

function ResetObjectStorage()
	for i=0 to allsprites.length
		allsprites.remove(i)
	next i 
	for i = 0 to alltexts.length
		alltexts.remove(i)
	next i 
	for i=0 to allvirtbuttons.length
		allvirtbuttons.remove(i)
	next i
endfunction

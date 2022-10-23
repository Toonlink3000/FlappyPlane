Type PipeType
	id as integer
	imgid as integer
	x as float
	y as float
	xvel as float
	yvel as float
endtype

function UpdatePipePosition(pipes as PipeType[])
	pipes[0].x = GetVirtualWidth()
	pipes[1].x = GetVirtualWidth()
	
	pipes[0].y = Random(minpipey, maxpipey) - GetSpriteHeight(pipes[0].id)
	pipes[1].y = pipes[0].y + pipegap + GetSpriteHeight(pipes[0].id)
	
endfunction pipes

function LoadPipeAssets()
	global pipeimage as integer
	pipeimage = LoadImage("pipe.png")
endfunction

function InitPipes()
toppipe as PipeType
toppipe.id = CreateSprite(pipeimage)
toppipe.xvel = screenscrollspeed
bottompipe as PipeType
bottompipe.id = CreateSprite(pipeimage)
bottompipe.xvel = screenscrollspeed
print("hi")

allpipes.insert(toppipe)
allpipes.insert(bottompipe)
allpipes = UpdatePipePosition(allpipes)
endfunction

function UpdatePipes()
for i=0 to allpipes.length
	allpipes[i].x = allpipes[i].x + allpipes[i].xvel
	allpipes[i].y = allpipes[i].y + allpipes[i].yvel
	SetSpritePosition(allpipes[i].id, allpipes[i].x, allpipes[i].y)
	print(allpipes[i].x)
	print(allpipes[i].y)
next i 
if allpipes[0].x < 0 - GetSpriteWidth(allpipes[0].id)
	allpipes = UpdatePipePosition(allpipes)
	IncrementScore()
endif

endfunction
function ClearPipesArray()
	allpipes.remove(0)
	allpipes.remove(0)
endfunction

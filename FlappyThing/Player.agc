
#include "Utils.agc"

type PlayerType
	id as integer
	imgid as integer
	x as float
	y as float
	xvel as float
	yvel as float
	maxxvel as float
	minxvel as float
	maxyvel as float
	minyvel as float
	speed as float
	jumpheight as float
	gravity as float
endtype
function InitPlayer()
	global player as PlayerType
	player.imgid = playerimage
	player.id = CreateSprite(player.imgid)
	player.x = 10.0
	player.y = GetVirtualHeight() / 2
	player.xvel = 0.0
	player.yvel = 0.0
	player.gravity = 0.5
	player.speed = 5
	player.jumpheight = -20
	player.maxxvel = player.speed
	player.minxvel = 0
	player.maxyvel = 5
	player.minyvel = -10
endfunction
function LoadPlayerAssets()
	global playerimage as integer
	playerimage = LoadImage("player.png")
endfunction
function UpdatePlayer()	
	// Pressed space or virtual button
	if GetPointerPressed() = 1
		player.yvel = player.yvel + player.jumpheight
	endif
	player.yvel = player.yvel + player.gravity	
	player.xvel = ClampFloat(player.xvel, player.minxvel, player.maxxvel)
	player.yvel = ClampFloat(player.yvel, player.minyvel, player.maxyvel)
	print(player.xvel)
	print(player.yvel)
	player.x = player.x + player.xvel
	player.y = player.y + player.yvel
	SetSpritePosition(player.id, player.x, player.y)
	
	SetSpriteAngle(player.id, player.yvel / ((player.maxyvel - player.minyvel)/100))
	
	for i=0 to allpipes.length
		if GetSpriteCollision(player.id, allpipes[i].id)
			PlayerDeath(player.id, allpipes)
			exitfunction
		endif
	next i 
	if player.y > GetVirtualHeight() - GetSpriteHeight(player.id) or player.y < 0
		PlayerDeath(player.id, allpipes)
		exitfunction
	endif
endfunction

function PlayerDeath(player as integer, pipes as PipeType[])
	allsprites.insert(player)
	for i=0 to pipes.length
		allsprites.insert(pipes[i].id)
	next i 
	DestroyEverything()
	ResetObjectStorage()
	ClearPipesArray()
	
	gamestate=2
endfunction

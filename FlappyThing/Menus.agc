function InitMainMenu()
	mainmenutext = CreateText("Flappy Plane")
	alltexts.insert(mainmenutext)
	SetTextAlignment(mainmenutext, 1)
	SetTextSize(mainmenutext, 50)
	SetTextPosition(mainmenutext, GetVirtualWidth() / 2, 100)
	AddVirtualButton(1,GetVirtualWidth() /2, GetVirtualHeight() - 100, 100.00)
	SetVirtualButtonText(1, "Play!")
	allvirtbuttons.insert(1)
endfunction

function UpdateMainMenu()
	if GetVirtualButtonPressed(1) = 1
		DestroyEverything()
		gamestate = 1
		ResetObjectStorage()
	endif
endfunction

function InitDeathMenu()
	mainmenutext = CreateText("You Died! :(")
	scoretxt = CreateText("Your score was: " + str(score))
	alltexts.insert(mainmenutext)
	alltexts.insert(scoretxt)
	
	SetTextAlignment(mainmenutext, 1)
	SetTextSize(mainmenutext, 50)
	SetTextPosition(mainmenutext, GetVirtualWidth() / 2, 100)
	
	SetTextAlignment(scoretxt, 1)
	SetTextSize(scoretxt, 30)
	SetTextPosition(scoretxt, GetVirtualWidth() / 2, 150)
	
	AddVirtualButton(2,GetVirtualWidth() /2, GetVirtualHeight() - 100, 100.00)
	SetVirtualButtonText(2, "Restart")
	allvirtbuttons.insert(2)
endfunction

function UpdateDeathMenu()
	if GetVirtualButtonPressed(2) = 1
		DestroyEverything()
		gamestate = 1
		ResetObjectStorage()
	endif
	for i=0 to allpipes.length
		print(allpipes[i].id)
	next i 
endfunction

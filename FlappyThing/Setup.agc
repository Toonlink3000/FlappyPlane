// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "FlappyThing" )
SetWindowSize( 640, 480, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 640, 480 ) // doesn't have to match the window
SetOrientationAllowed( 0, 0, 1, 0 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 60, 0 ) // 30fps instead of 60 to save battery
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

global allsprites as integer[]
global alltexts as integer[]
global allvirtbuttons as integer[]
global gamestate = 0 // 0 - mainmenu , 1 - game, 2 - 
global screenscrollspeed = -5
global maxpipey = 300
global minpipey = 40
global pipespacing = 50
global lastpipeplaced = 0
global pipegap = 170
global allpipes as PipeType[]
global score = 0

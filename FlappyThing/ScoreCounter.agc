
function InitScoreCounter()
	score = 0
	global scoretext as integer
	scoretext = CreateText(Str(score))
	SetTextSize(scoretext, 40)
	SetTextAlignment(scoretext, 1)
	SetTextPosition(scoretext, GetVirtualWidth() / 2, 10)
	alltexts.insert(scoretext)
endfunction

function UpdateScoreCounter()
	if Val(GetTextString(scoretext)) <> scoretext
		SetTextString(scoretext, str(score))
	endif
endfunction
function IncrementScore()
	score = score + 1
endfunction


local hiddenNote = Action()

	function onUse(cid, item, fromPosition, itemEx, toPosition)

		if item.itemid == 1985 then	
			text = "i love jake"
			doSetItemText(item.uid,text)
		end
	end

hiddenNote:position({x = 33165, y = 31249, z = 11})
hiddenNote:register()
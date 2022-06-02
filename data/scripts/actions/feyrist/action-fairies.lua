local config = {
	[25747] = {
		message = "Doooon't touch me! *puff*"
		}
}

local function revertFairy(toPosition, item)
	local fairy = Tile(toPosition):getItemById(item)
	if fairy then
		fairy:transform(25747)
	end
end

local touchFairy = Action()

function touchFairy.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local fairy = config[item.itemid]
	if not fairy then
		return
	end

	item:transform(25797)
	addEvent(revertFairy, 30 * 1000, toPosition, 25797)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, fairy.message)
	toPosition:sendMagicEffect(CONST_ME_PURPLESMOKE)
	toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end

touchFairy:id(25747)
touchFairy:register()

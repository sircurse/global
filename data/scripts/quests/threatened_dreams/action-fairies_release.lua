local config = {
	[40013] = {
		pos = Position(33576, 32185, 8),
		storage = Storage.Quest.ThreatenedDreams.Mission02.fairy01,
		message = "My tainted siblings locked me up in the dark far too long. Now I'm finally free! Thank you, mortal being!"
		},
	[40014] = {
		pos = Position(33621, 32214, 8),
		storage = Storage.Quest.ThreatenedDreams.Mission02.fairy02,
		message = "My tainted siblings locked me up in the dark far too long. Now I'm finally free! Thank you, mortal being!"
		},
	[40015] = {
		pos = Position(33559, 32203, 9),
		storage = Storage.Quest.ThreatenedDreams.Mission02.fairy03,
		message = "My tainted siblings locked me up in the dark far too long. Now I'm finally free! Thank you, mortal being!"
		},
	[40016] = {
		pos = Position(33505, 32286, 8),
		storage = Storage.Quest.ThreatenedDreams.Mission02.fairy04,
		message = "My tainted siblings locked me up in the dark far too long. Now I'm finally free! Thank you, mortal being!"
		},
	[40017] = {
		pos = Position(33440, 32217, 8),
		storage = Storage.Quest.ThreatenedDreams.Mission02.fairy05,
		message = "My tainted siblings locked me up in the dark far too long. Now I'm finally free! Thank you, mortal being!"
		}
}

local function revertFairy(toPosition, item)
	local fairy = Tile(toPosition):getItemById(item)
	if fairy then
		fairy:transform(25796)
	end
end

local fairiesRelease = Action()

function fairiesRelease.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local fairy = config[item.actionid]
	if not fairy then
		return
	end

	local fairiesCounter = player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission02.fairiesCounter)
    if fairiesCounter < 5 then
        if player:getStorageValue(fairy.storage) < 1 then
			item:transform(25797)
			addEvent(revertFairy, 60 * 15 * 1000, toPosition, 25797)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, fairy.message)
			toPosition:sendMagicEffect(CONST_ME_PURPLESMOKE)
            toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
            -- player:setStorageValue(fairy.storage, 1)
			-- player:setStorageValue(fairiesCounter, fairiesCounter + 1)
            return true
        end
    else
        toPosition:sendMagicEffect(CONST_ME_PURPLESMOKE)
    end
end

fairiesRelease:aid(40013,40014,40015,40016,40017)
fairiesRelease:register()

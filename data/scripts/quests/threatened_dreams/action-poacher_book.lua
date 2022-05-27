local chests = {
	[14036] = {itemid = 25235, count = 1}
}

local poacherChest = Action()
function poacherChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission01[1]) == 1 then
		if chests[item.uid] then
			if player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission01.PoacherChest) == 1 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It\'s empty.')
				return true
			end

			local chest = chests[item.uid]
			local itemType = ItemType(chest.itemid)
			if itemType then
				local article = itemType:getArticle()
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found ' .. (#article > 0 and article .. ' ' or '') .. itemType:getName() .. '.')
			end

			player:addItem(chest.itemid, chest.count)
			player:setStorageValue(Storage.Quest.ThreatenedDreams.Mission01.PoacherChest, 1)
		end
	else
		player:sendCancelMessage("You are not on this mission.")
	end
	return true
end

poacherChest:uid(14036)
poacherChest:register()


local poacherBook = Action()
function poacherBook.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if (player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission01[1]) == 2) then
        if (target.itemid == 12648 or target.itemid == 12649)then
            target:decay()
            item:remove(1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are placing the book on the table, hopefully the poachers will discover it soon.')
            toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
            player:setStorageValue(Storage.Quest.ThreatenedDreams.Mission01[1], 3)
            return true
        end
    else
        player:sendCancelMessage("You are not on that mission.")
    end
end

poacherBook:id(25235)
poacherBook:register()

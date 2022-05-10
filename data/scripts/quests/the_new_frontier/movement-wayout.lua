local wayOut = MoveEvent()

function wayOut.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.Quest.TheNewFrontier.Questline) == 1 then
		--Questlog, The New Frontier Quest "Mission 01: New Land"
		player:setStorageValue(Storage.Quest.TheNewFrontier.Mission01, 2)
		player:setStorageValue(Storage.Quest.TheNewFrontier.Questline, 2)
		player:say("You have found the passage through the mountains and can report about your success.", TALKTYPE_MONSTER_SAY)
	end
	return true
end

wayOut:position({x = 33082, y = 31532, z = 7})
wayOut:position({x = 33082, y = 31533, z = 7})
wayOut:register()
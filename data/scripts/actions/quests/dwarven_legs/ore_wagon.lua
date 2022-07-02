local dwarvenOreWagon = Action()
function dwarvenOreWagon.onUse(player, item, fromPosition, itemEx, toPosition)
	if item.actionid == 50109 then
		if player:getStorageValue(Storage.DwarvenLegs) < 1 then
			player:teleportTo({x = 32624, y = 31514, z = 9})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			local rubble = Game.createItem(5709, 1, Position(32619, 31514, 9)):setActionId(50114)
			local tile = Tile(Position(32617, 31513, 9))
			local tile2 = Tile(Position(32617, 31514, 9))
			tile:getItemById(1272):remove()
			tile2:getItemById(1624):remove()
			return true
		else
			player:say("Zzz Dont working.", TALKTYPE_ORANGE_1)
			return true
		end
	elseif item.actionid == 50110 then
		if player:getStorageValue(Storage.HiddenCityOfBeregar.RoyalRescue) == 4 then
			player:teleportTo({x = 32725, y = 31487, z = 15})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		else
			player:say("You need talk with Tehlim first.", TALKTYPE_ORANGE_1)
			return true
		end
	end
	return false
end

dwarvenOreWagon:aid(50109, 50110)
dwarvenOreWagon:register()

local cultsCarlinFix = MoveEvent()

function cultsCarlinFix.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
		creature:teleportTo(Position(32403, 31813, 8))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

cultsCarlinFix:aid(35004)
cultsCarlinFix:register()

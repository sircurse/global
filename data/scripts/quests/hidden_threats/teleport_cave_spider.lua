local corymCaveSpider = MoveEvent()

function corymCaveSpider.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

    if player:getStorageValue(Storage.Quest.HiddenThreats.corymRescueMission) == 9 then
        creature:teleportTo(Position(33023, 32106, 12))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        creature:teleportTo(Position(33056, 32004, 11))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end
    return true
end

corymCaveSpider:aid(35003)
corymCaveSpider:register()


local createSpiders = MoveEvent()

function createSpiders.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.Quest.HiddenThreats.corymRescueMission) == 9 then
		player:setStorageValue(Storage.Quest.HiddenThreats.corymRescueMission, 10)
		Game.createMonster("tarantula", Position(33029, 32103, 12), false, false)
		Game.createMonster("tarantula", Position(33029, 32107, 12))
		Game.createMonster("tarantula", Position(33029, 32111, 12))
		Game.createMonster("cave spider", Position(33034, 32107, 12))

	end
	return true
end

createSpiders:type("stepin")
createSpiders:aid(50365)
createSpiders:register()
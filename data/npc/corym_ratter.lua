local internalNpcName = "Corym Ratter"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 533,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 115,
	lookFeet = 0,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new())

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if(MsgContains(message, "hi")) then
		if player:getStorageValue(Storage.HiddenThreats.QuestLine) == 0 then
			npcHandler:say({
				"Welcome stranger! You might be surprised that I don't attack you immediately. The point is, that I think you could be useful to me. What you see in front of you is a great mine of the corym! ...",
				"We dig up all what mother earth delivers to us, valuable natural resources. But the yield is getting worse and here I need your help."
			}, npc, creature)
			npcHandler:setTopic(playerId, 1)
		end
	elseif(MsgContains(message, "help")) then
		if(npcHandler:getTopic(playerId) == 1) then
			npcHandler:say("Recently the amount of delivered ores is decreasing. Could you find out the reason, why the situation has become worse?", npc, creature)
			npcHandler:setTopic(playerId, 2)
		end
	elseif(MsgContains(message, "yes")) then
		if(npcHandler:getTopic(playerId) == 2) then
			player:setStorageValue(Storage.HiddenThreats.QuestLine, 1)
			npcHandler:say("Nice! I have opened the mine for you. But take care of you! The monsters of depth won't spare you.", npc, creature)
			npcHandler:setTopic(playerId, 2)
		end
	end
	return true
end

-- npcType registering the npcConfig table
npcType:register(npcConfig)

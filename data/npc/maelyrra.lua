local internalNpcName = "Maelyrra"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 989,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "mission") then
		if player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission02[1]) < 1 then
			npcHandler:say({
				"Some annoying nightmarish creatures rove about in the tunnels underneath this island. They are threatening the members of my court and devastate the flora and fauna. They also threaten the natural balance. Would you go and fight them for me?"
			}, npc, creature)
			npcHandler:setTopic(playerId, 1)
		elseif player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission02[1]) >= 1
		and player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission02[1]) <= 2 then
			npcHandler:say({
				"Have you defeated the nightmare monsters?"
			}, npc, creature)
			npcHandler:setTopic(playerId, 2)
		else
			npcHandler:say({
				"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
			}, npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			npcHandler:say("I knew you would be willing to help us. Kill two hundred of them as well as the terrible demon Kroazur who's leading them. That should bring some relief for the fae.", npc, creature)
			player:setStorageValue(Storage.Quest.ThreatenedDreams.Mission02[1], 1)
			player:setStorageValue(Storage.Quest.ThreatenedDreams.Mission02.kroazurAccess, 1)
			player:setStorageValue(Storage.Quest.ThreatenedDreams.QuestLine, 2)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 2 then
			local enfeebledKills = player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission02.enfeebledCount)
			local frazzlemawsKills = player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission02.frazzlemawsCount)
			local kroazurKill = player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission02.kroazurKill)
			if player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission02[1]) == 1
			and kroazurKill >= 1 and (enfeebledKills+frazzlemawsKills) >= 200 then
				npcHandler:say({
					"Thank you! You rendered a great favour to the fae courts and Feyrist alike. Would you help us with another problem?"
				}, npc, creature)
				npcHandler:setTopic(playerId, 3)
				player:setStorageValue(Storage.Quest.ThreatenedDreams.Mission02[1], 2)
			elseif player:getStorageValue(Storage.Quest.ThreatenedDreams.Mission02[1]) == 2 then
				npcHandler:say({
					"You rendered a great favour to the fae courts and Feyrist alike. Would you help us with another problem?"
				}, npc, creature)
				npcHandler:setTopic(playerId, 3)
			else
				npcHandler:say({
					"You have to kill two hundred of nightmare creatures and the terrible demon Kroazur who's leading them. That should bring some relief for the fae."
				}, npc, creature)
				npcHandler:setTopic(playerId, 0)
			end
		elseif npcHandler:getTopic(playerId) == 3 then
			npcHandler:say({
				"Some of our siblings are tainted by the destructive energies that threaten Feyrist. They are darker now, more aggressive, twisted ... I'm sure you already met them. ...",
				"They are living in tunnels and caves but at night they surface, even attacking their own siblings. They kidnapped some fairies, holding them prisoner in their mouldy dens. ...",
				"And as if this wasn't enough they stole an ancient and precious artefact, the moon mirror. Please seek out the tainted fae, retrieve the artefact and free the captured fairies. ...",
				"You may discover the entrance to the tainted caves somewhere in the deep forest. The tainted fae like to hide their treasures in hollow logs or trumps, so have a closer look at them."
			}, npc, creature)
			player:setStorageValue(Storage.Quest.ThreatenedDreams.Mission02[1], 3)
			npcHandler:setTopic(playerId, 0)
		end
	elseif MsgContains(message, "no") then
		npcHandler:say("Then not.", npc, creature)
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Nature's blessings! Welcome to the land of dreams.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May your path always be even.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "May your path always be even.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)

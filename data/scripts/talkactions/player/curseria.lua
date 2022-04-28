local twitchTV = TalkAction("!curseria")

function twitchTV.onSay(player, words, param)
	local configRateSkill =  configManager.getNumber(configKeys.RATE_SKILL)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Redes Sociais do Server:"
	.. "\nDiscord: " .. getRateFromTable(experienceStages, player:getLevel(), configManager.getNumber(configKeys.RATE_EXP))
	.. "\nhttps://discord.gg/y6C3BUrh4u" .. getRateFromTable(skillsStages, player:getSkillLevel(SKILL_SWORD), configRateSkill)
	.. "\n " .. getRateFromTable(skillsStages, player:getSkillLevel(SKILL_CLUB), configRateSkill)
	.. "\nTwitch:" .. getRateFromTable(skillsStages, player:getSkillLevel(SKILL_AXE), configRateSkill)
	.. "\nhttps://www.twitch.tv/curseofcourse"
	return false
end

twitchTV:separator(" ")
twitchTV:register()

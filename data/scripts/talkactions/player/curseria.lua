local twitchTV = TalkAction("!curseria")

function twitchTV.onSay(player, words, param)
	local configRateSkill =  configManager.getNumber(configKeys.RATE_SKILL)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Redes Sociais do Server:"
	.. "\nDiscord: "
	.. "\nhttps://discord.gg/y6C3BUrh4u"
	.. "\n "
	.. "\nTwitch:"
	.. "\nhttps://www.twitch.tv/curseofcourse")
	return false
end

twitchTV:separator(" ")
twitchTV:register()

local playerrecord = GlobalEvent("playerrecord")
function playerrecord.onRecord(current, old)
	addEvent(Game.broadcastMessage, 150, 'New record: ' .. current .. ' players online.', MESSAGE_EVENT_ADVANCE)
	Webhook.send("New record online", "Player count: " .. current, WEBHOOK_COLOR_ONLINE, announcementChannels["serverAnnouncements"])
	return true
end
playerrecord:register()

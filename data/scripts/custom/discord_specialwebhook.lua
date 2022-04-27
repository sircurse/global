-- Sends Discord webhook special notifications.
-- The URL layout is https://discord.com/api/webhooks/:id/:token
-- Leave empty if you wish to disable.

announcementChannels = {
	["serverAnnouncements"] = "https://discord.com/api/webhooks/966771867761385582/SyA0yQKORxz6Z4ON9bWIQg913Bc1w5c62iy4CD3JdM2TiCwu7pEN8x71Z0lLrj8pNbT5", -- Used for an announcement channel on your discord
	["raids"] = "https://discord.com/api/webhooks/966771867761385582/SyA0yQKORxz6Z4ON9bWIQg913Bc1w5c62iy4CD3JdM2TiCwu7pEN8x71Z0lLrj8pNbT5", -- Used to isolate raids on your discord
	["player-kills"] = "https://discord.com/api/webhooks/966776909876834365/sYEFelBHRaZSfTK3ccBwrrY2pOichEOlnn7ANaNP6My-tw7fhggs_sE1cY8yJHM2j2Kh", -- Self-explaining
}

--[[
	Example of notification (After you do the config):
	This is going to send a message into your server announcements channel

	local message = blablabla
	local title = test
	Webhook.send(title, message, WEBHOOK_COLOR_WARNING,
                        announcementChannels["serverAnnouncements"])

	Dev Comment: This lib can be used to add special webhook channels
	where you are going to send your messages. Webhook.specialSend was designed
	to be used with countless possibilities.
]]
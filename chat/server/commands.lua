--[[ COMMANDS ]]--
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterCommand('clear', function(source, args, rawCommand)
    TriggerClientEvent('chat:client:ClearChat', source)
end, false)

RegisterCommand('twt', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
        if ESX then
            local name = getIdentity(src)
		        fal = name.firstname .. " " .. name.lastname
                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message"><b>@{0}: </b>{1}</div>',
                args = { fal, msg }
            })
            exports.JD_logs:discord("@" .. fal..": "..rawCommand:gsub("twt", ""), source, 0, '#FFFFFF', 'twt')
        end
end, false)

RegisterCommand('vpn', function(source, args, rawCommand) 
    local src = source
    local msg = rawCommand:sub(5)
        if ESX then
            local user = ''
                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message vpn"><b>[^2ANONYMOUS^0]{0}: </b>{1}</div>',
                args = { user, msg }
            })
            exports.JD_logs:discord("[VPN] " .. ": "..rawCommand:gsub("vpn", ""), source, 0, '#FFFFFF', 'vpn')
        end   
end, false)

RegisterCommand('ads', function(source, args, rawCommand) 
    local src = source
    local msg = rawCommand:sub(5)
        if ESX then
            local user = ''
                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message ads"><b>Advertisement{0}: </b>{1}</div>',
                args = { user, msg }
            })
        end   
end, false)

function getIdentity(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        return {
            identifier = xPlayer.identifier,
            name = xPlayer.getName(),
            firstname = xPlayer.get("firstName"),
            lastname = xPlayer.get("lastName"),
            dateofbirth = xPlayer.get("dateofbirth"),
            sex = xPlayer.get("sex"),
            height = xPlayer.get("height"),
        }
    else
        return nil
    end
end
local locale = {}

locale['en'] = {
	invalid_command   = '[~r~ERROR~s~] missing argument. Usage: /%s emote_id',
	invalid_command_2 = '[~r~ERROR~s~] %s is not a valid emote.',
	cant_use_command  = '[~r~ERROR~s~] You can\'t perform this animation while dead or inside a vehicle.',
	keymapping_hint	  = 'Stop animation',
}

locale['br'] = {
	invalid_command   = '[~r~ERRO~s~] argumento faltando. Uso correto: /%s id_do_emote',
	invalid_command_2 = '[~r~ERRO~s~] %s não é um emote válido.',
	cant_use_command  = '[~r~ERRO~s~] Você não pode fazer essa animação se estiver morto ou dentro de um veículo.',
	keymapping_hint	  = 'Parar animação',
}

function _s(index, ...)
	local lang = locale[Config.Locale]
	if not lang then
		print('^1Locale [^7' .. Config.Locale .. '^1] does not exist, setting to default language.^7')
		Config.Locale = 'en'
		return _s(index)
	end

	if not lang[index] then return '' end
	if not {...} then return lang[index] else return (lang[index]):format(...) end
end
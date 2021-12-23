if GetLocale() ~= "ruRU" then return end

local L

----------------------------------
--  Archavon the Stone Watcher  --
----------------------------------
L = DBM:GetModLocalization("Archavon")

L:SetGeneralLocalization({
	name = "Аркавон Страж Камня"
})

L:SetWarningLocalization({
	WarningGrab		= "Аркавон хватает |3-1(>%s<)"
})

L:SetTimerLocalization({
	ArchavonEnrage	= "Берсерк Аркавона"
})

L:SetOptionLocalization({
	WarningGrab		= "Объявлять о захвате цели"
})

L:SetMiscLocalization({
	TankSwitch		= "%%s бросается к (%S+)!"
})

--------------------------------
--  Emalon the Storm Watcher  --
--------------------------------
L = DBM:GetModLocalization("Emalon")

L:SetGeneralLocalization({
	name = "Эмалон Страж Бури"
})

L:SetTimerLocalization({
	timerMobOvercharge	= "Взрыв в результате перегрузки",
	EmalonEnrage		= "Берсерк Эмалона"
})

L:SetOptionLocalization({
	timerMobOvercharge	= "Отсчет времени для моба с Перегрузкой (стакающего дебафф)"
})

---------------------------------
--  Koralon the Flame Watcher  --
---------------------------------
L = DBM:GetModLocalization("Koralon")

L:SetGeneralLocalization{
	name = "Коралон Страж Огня"
}

L:SetWarningLocalization{
	BurningFury		= "Пылающая ярость >%d<"
}

L:SetTimerLocalization{
	KoralonEnrage	= "Берсерк Коралона"
}

L:SetOptionLocalization{
	PlaySoundOnCinder	= "Звуковой сигнал, когда под вами $spell:67332",
	BurningFury			= "Предупреждение для $spell:66721",
	KoralonEnrage		= "Отсчет времени до $spell:26662"
}

L:SetMiscLocalization{
	Meteor	= "%s применяет заклинание \"Кулаки-метеоры\"!"
}

-------------------------------
--  Toravon the Ice Watcher  --
-------------------------------
L = DBM:GetModLocalization("Toravon")

L:SetGeneralLocalization{
	name = "Торавон Страж Льда"
}

L:SetWarningLocalization{
	Frostbite	= "Обморожение на |3-5(>%s<) (%d)"
}

L:SetTimerLocalization{
	ToravonEnrage	= "Берсерк Торавона"
}

L:SetOptionLocalization{
	Frostbite	= "Предупреждение для $spell:72098",
}

L:SetMiscLocalization{
	ToravonEnrage	= "Отсчет времени до $spell:26662"
}
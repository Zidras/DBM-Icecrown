if GetLocale() ~= "zhCN" then return end
local L

---------------
--  Kalecgos --
---------------
L = DBM:GetModLocalization("Kal")

L:SetGeneralLocalization({
	name = "卡雷苟斯"
})

L:SetWarningLocalization({
	WarnPortal			= "传送 #%d : >%s< (%d组)",
	SpecWarnWildMagic	= "狂野魔法 - %s!"
})

L:SetOptionLocalization({
	WarnPortal			= "Show warning for $spell:46021 target",--Translate
	SpecWarnWildMagic	= "Show special warning for Wild Magic",--Translate
	ShowFrame			= "Show Spectral Realm frame" ,--Translate
	FrameClassColor		= "Use class colors in Spectral Realm frame",--Translate
	FrameUpwards		= "Expand Spectral Realm frame upwards",--Translate
	FrameLocked			= "Set Spectral Realm frame not movable"--Translate
})

L:SetMiscLocalization({
	Demon				= "腐蚀者萨索瓦尔",
	Heal				= "+100%治疗效果",
	Haste				= "+100%施法时间",
	Hit					= "-50%命中几率",
	Crit				= "+100%爆击伤害",
	Aggro				= "+100%威胁值",
	Mana				= "-50%技能消耗",
	FrameTitle			= "首领生命值",
	FrameLock			= "锁定框体",
	FrameClassColor		= "使用职业颜色",
	FrameOrientation	= "灵魂世界框体向上延伸",
	FrameHide			= "隐藏框体",
	FrameClose			= "Close"--Translate
})

----------------
--  Brutallus --
----------------
L = DBM:GetModLocalization("Brutallus")

L:SetGeneralLocalization({
	name = "布鲁塔卢斯"
})

L:SetMiscLocalization({
	Pull			= "啊，又来了一群小绵羊！"
})

--------------
--  Felmyst --
--------------
L = DBM:GetModLocalization("Felmyst")

L:SetGeneralLocalization({
	name = "菲米丝"
})

L:SetWarningLocalization({
	WarnPhase		= "%s阶段"
})

L:SetTimerLocalization({
	TimerPhase		= "%s阶段"
})

L:SetOptionLocalization({
	WarnPhase		= "显示下一阶段的警告",
	TimerPhase		= "显示下一阶段的计时器"
})

L:SetMiscLocalization({
	Air				= "空中",
	Ground			= "地面",
	AirPhase		= "我比以前更强大了！",
	Breath			= "%s深深地吸了一口气。"
})

-----------------------
--  The Eredar Twins --
-----------------------
L = DBM:GetModLocalization("Twins")

L:SetGeneralLocalization({
	name = "艾瑞达双子"
})

L:SetMiscLocalization({
	NovaWhisper		= "暗影新星！",
	ConflagWhisper	= "燃烧！",
	Nova			= "萨洛拉丝向([^%s]+)施放暗影新星。",--Verify
	Conflag			= "奥蕾塞丝向([^%s]+)施放燃烧。"--Verify
})

------------
--  M'uru --
------------
L = DBM:GetModLocalization("Muru")

L:SetGeneralLocalization({
	name = "穆鲁"
})

L:SetWarningLocalization({
	WarnHuman		= "暗誓精灵 (%d)",
	WarnHumanSoon	= "暗誓精灵 - 5秒后出现 (%d)",
	WarnVoid		= "虚空戒卫 (%d)",
	WarnVoidSoon	= "虚空戒卫 - 5秒后出现 (%d)",
	WarnFiend		= "黑暗魔出现"
})

L:SetTimerLocalization({
	TimerHuman		= "暗誓精灵 (%s)",
	TimerVoid		= "虚空戒卫 (%s)",
	TimerPhase		= "熵魔"
})

L:SetOptionLocalization({
	WarnHuman		= "Show warning for Humanoids",--Translate
	WarnHumanSoon	= "Show pre-warning for Humanoids",--Translate
	WarnVoid		= "Show warning for Void Sentinels",--Translate
	WarnVoidSoon	= "Show pre-warning for Void Sentinels",--Translate
	WarnFiend		= "Show warning for Fiends in phase 2",--Translate
	TimerHuman		= "Show timer for Humanoids",--Translate
	TimerVoid		= "Show timer for Void Sentinels",--Translate
	TimerPhase		= "Show time for Phase 2 transition"--Translate
})

L:SetMiscLocalization({
	Entropius		= "熵魔"
})

----------------
--  Kil'jeden --
----------------
L = DBM:GetModLocalization("Kil")

L:SetGeneralLocalization({
	name = "基尔加丹"
})

L:SetWarningLocalization({
	WarnDarkOrb		= "Dark Orbs Spawned",--Translate
	WarnBlueOrb		= "Dragon Orb activated",--Translate
	SpecWarnDarkOrb	= "Dark Orbs Spawned!",--Translate
	SpecWarnBlueOrb	= "Dragon Orbs Activated!"--Translate
})

L:SetTimerLocalization({
	TimerBlueOrb	= "Dragon Orbs activate"--Translate
})

L:SetOptionLocalization({
	WarnDarkOrb		= "Show warning for Dark Orbs",--Translate
	WarnBlueOrb		= "Show warning for Dragon Orbs",--Translate
	SpecWarnDarkOrb	= "Show special warning for Dark Orbs",--Translate
	SpecWarnBlueOrb	= "Show special warning for Dragon Orbs",--Translate
	TimerBlueOrb	= "Show timer form Dragon Orbs activate",--Translate
	RangeFrame		= "Show range frame (10 yards)",--Translate
	BloomIcon		= DBM_CORE_L.AUTO_ICONS_OPTION_TEXT:format(45641),
	YellOnBloom		= "Yell on $spell:45641",--Translate
	BloomWhisper	= "Send whisper to $spell:45641 target (requires Raid Leader)"--Translate
})

L:SetMiscLocalization({
	YellPull		= "这个消耗品已经没用了，不管她了！现在我已经做到了连萨格拉斯都没有做到的事情！我要彻底毁灭这个世界，真正成",
	YellBloom		= "我中了火焰之花！",
	BloomWhisper	= "火焰之花！",
	OrbYell1		= "I will channel my powers into the orbs! Be ready!",--Translate
	OrbYell2		= "I have empowered another orb! Use it quickly!",--Translate
	OrbYell3		= "Another orb is ready! Make haste!",--Translate
	OrbYell4		= "I have channeled all I can! The power is in your hands!"--Translate

})

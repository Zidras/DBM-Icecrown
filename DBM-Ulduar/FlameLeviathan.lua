local mod	= DBM:NewMod("FlameLeviathan", "DBM-Ulduar")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20220518110528")

mod:SetCreatureID(33113)

mod:RegisterCombat("yell", L.YellPull)

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 62396 62475 62374 62297",
	"SPELL_AURA_REMOVED 62396",
	"SPELL_SUMMON 62907"
)

local warnHodirsFury		= mod:NewTargetAnnounce(62297, 3)
local warnPursueTarget		= mod:NewAnnounce("PursueWarn", 2, 62374, nil, nil, nil, 62374)
local warnNextPursueSoon	= mod:NewAnnounce("warnNextPursueSoon", 3, 62374, nil, nil, nil, 62374)

local specWarnSystemOverload= mod:NewSpecialWarningSpell(62475)
local specWarnPursue		= mod:NewSpecialWarning("SpecialPursueWarnYou", nil, nil, 2, 4, 2, nil, 62374, 62374)
local specWarnWardOfLife	= mod:NewSpecialWarning("warnWardofLife", nil, nil, nil, nil, nil, nil, 62907, 62907)

local timerSystemOverload	= mod:NewBuffActiveTimer(20, 62475, nil, nil, nil, 6)
local timerFlameVents		= mod:NewCastTimer(10, 62396, nil, nil, nil, 2, nil, DBM_COMMON_L.INTERRUPT_ICON)
local timerNextFlameVents	= mod:NewNextTimer(20, 62396)
local timerPursued			= mod:NewBuffFadesTimer(30, 62374, nil, nil, nil, 3)

local guids = {}
local function buildGuidTable(self)
	table.wipe(guids)
	for uId in DBM:GetGroupMembers() do
		local name, server = GetUnitName(uId, true)
		local fullName = name .. (server and server ~= "" and ("-" .. server) or "")
		guids[UnitGUID(uId.."pet") or "none"] = fullName
	end
end

function mod:OnCombatStart(delay)
	buildGuidTable(self)
	if self:IsDifficulty("normal10") then
		timerNextFlameVents:Start(20-delay)
	else
		timerNextFlameVents:Start(30-delay)
	end
end

function mod:OnTimerRecovery()
	buildGuidTable(self)
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 62396 then		-- Flame Vents
		timerFlameVents:Start()
		timerNextFlameVents:Start()
	elseif spellId == 62475 then	-- Systems Shutdown / Overload
		timerSystemOverload:Start()
		timerNextFlameVents:Stop()
		if mod:IsDifficulty("normal10") then
			timerNextFlameVents:Start(40)
		else
			timerNextFlameVents:Start(50)
		end
		specWarnSystemOverload:Show()
	elseif spellId == 62374 then	-- Pursued
		local target = guids[args.destGUID]
		warnNextPursueSoon:Schedule(25)
		timerPursued:Start()
		if target then
			warnPursueTarget:Show(target)
			if target == UnitName("player") then
				specWarnPursue:Show()
				specWarnPursue:Play("runaway")
			end
		end
	elseif spellId == 62297 then	-- Hodir's Fury (Person is frozen)
		local target = guids[args.destGUID]
		if target then
			warnHodirsFury:Show(target)
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 62396 then
		timerFlameVents:Stop()
	end
end

function mod:SPELL_SUMMON(args)
	if args.spellId == 62907 and self:AntiSpam(3, 1) then		-- Ward of Life spawned (Creature id: 34275)
		specWarnWardOfLife:Show()
	end
end
local mod	= DBM:NewMod("FlameLeviathan", "DBM-Ulduar")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20220710172609")

mod:SetCreatureID(33113)

mod:RegisterCombat("yell", L.YellPull)

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 62396 62475 62374 62297",
	"SPELL_AURA_REMOVED 62396 62374",
	"SPELL_SUMMON 62907"
)

local warnHodirsFury			= mod:NewTargetAnnounce(62297, 3)
local warnPursueTarget			= mod:NewAnnounce("PursueWarn", 2, 62374, nil, nil, nil, 62374)
local warnNextPursueSoon		= mod:NewAnnounce("warnNextPursueSoon", 3, 62374, nil, nil, nil, 62374)

local specWarnSystemOverload	= mod:NewSpecialWarningSpell(62475, nil, nil, nil, 1, 12)
local specWarnPursue			= mod:NewSpecialWarning("SpecialPursueWarnYou", nil, nil, 2, 4, 2, nil, 62374, 62374)
local specWarnWardOfLife		= mod:NewSpecialWarning("warnWardofLife", nil, nil, nil, 1, 2, nil, 62907, 62907)

local timerSystemOverload		= mod:NewBuffActiveTimer(20, 62475, nil, nil, nil, 6)
local timerFlameVents			= mod:NewCastTimer(10, 62396, nil, nil, nil, 2, nil, DBM_COMMON_L.INTERRUPT_ICON)
local timerNextFlameVents		= mod:NewNextTimer(20, 62396, nil, nil, nil, 2)
local timerPursued				= mod:NewTargetTimer(30, 62374, nil, nil, nil, 3)

local timerNextWardOfLife		= mod:NewNextTimer(30, 62907, nil, nil, nil, 1)

local guids = {}
local function buildGuidTable(self)
	table.wipe(guids)
	for uId in DBM:GetGroupMembers() do
		local name, server = GetUnitName(uId, true)
		local fullName = name .. (server and server ~= "" and ("-" .. server) or "")
		guids[UnitGUID(uId.."pet") or "none"] = fullName
	end
end

local function CheckTowers(self, delay)
	if DBM:UnitBuff("boss1", 64482) then -- Tower of Life
		timerNextWardOfLife:Start(41 - delay) -- S2 VOD review
	end
end

function mod:OnCombatStart(delay)
	buildGuidTable(self)
	timerNextFlameVents:Start(-delay) -- 25 man log review (2022/07/10)
	self:Schedule(5, CheckTowers, self, delay)
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
		if self:IsDifficulty("normal10") then
			timerNextFlameVents:Start(40)
		else
			timerNextFlameVents:Start(50)
		end
		specWarnSystemOverload:Show()
		specWarnSystemOverload:Play("attacktank")
	elseif spellId == 62374 then	-- Pursued
		local target = guids[args.destGUID]
		warnNextPursueSoon:Schedule(25)
		timerPursued:Start(target)
		if target then
			warnPursueTarget:Show(target)
			if target == UnitName("player") then
				specWarnPursue:Show()
				specWarnPursue:Play("justrun")
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
	local spellId = args.spellId
	if spellId == 62396 then
		timerFlameVents:Stop()
	elseif spellId == 62374 then	-- Pursued
		local target = guids[args.destGUID]
		timerPursued:Stop(target)
	end
end

function mod:SPELL_SUMMON(args)
	if args.spellId == 62907 and self:AntiSpam(3, 1) then		-- Ward of Life spawned (Creature id: 34275)
		specWarnWardOfLife:Show()
		specWarnWardOfLife:Show("bigmob")
		timerNextWardOfLife:Start() -- S2 VOD review
	end
end
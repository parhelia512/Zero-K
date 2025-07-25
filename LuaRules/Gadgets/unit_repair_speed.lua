--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
   return {
      name      = "Repair Speed Changer",
      desc      = "Changes the repair speed for units that are in combat",
      author    = "Google Frog",
      date      = "11 December 2010",
      license   = "GNU GPL, v2 or later",
      layer     = 0,
      enabled   = true
   }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--SYNCED
if (not gadgetHandler:IsSyncedCode()) then
   return false
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local spAreTeamsAllied    = Spring.AreTeamsAllied
local spSetUnitCosts      = Spring.SetUnitCosts
local spValidUnitID       = Spring.ValidUnitID
local spGetUnitIsStunned  = Spring.GetUnitIsStunned

local ALLY_ACCESS = {allied = true}

local unitCostOverride = {}
local terraunitDefID = UnitDefNames["terraunit"].id

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- CONFIG

local REPAIR_PENALTY = 4 -- effective 4x time to repair
local REPAIR_PENALTY_TIME = 300
local UPDATE_FREQUENCY = 30

local noFFWeaponDefs = {}
for i = 1, #WeaponDefs do
	local wd = WeaponDefs[i]
	if wd.customParams and wd.customParams.nofriendlyfire then
		noFFWeaponDefs[i] = true
	end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local damagedUnitFrame = {}
GG.unitRepairRate = {}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, attackerID, attackerDefID, attackerTeam)
	if (unitDefID == terraunitDefID) or (damage < 0.01) then
		return
	end
	
	if (weaponDefID and noFFWeaponDefs[weaponDefID] and unitTeam and attackerTeam and spAreTeamsAllied(unitTeam, attackerTeam)) then
		return
	end

	if damagedUnitFrame[unitID] then
		damagedUnitFrame[unitID] = REPAIR_PENALTY_TIME
	else
		damagedUnitFrame[unitID] = REPAIR_PENALTY_TIME
		local _, _, inbuild = spGetUnitIsStunned(unitID)
		if not inbuild then
			spSetUnitCosts(unitID, {buildTime =  Spring.Utilities.GetUnitCost(unitID)*REPAIR_PENALTY})
			GG.unitRepairRate[unitID] = 1/REPAIR_PENALTY
		end
	end
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
	if damagedUnitFrame[unitID] then
		spSetUnitCosts(unitID, {buildTime = Spring.Utilities.GetUnitCost(unitID, unitDefID) * REPAIR_PENALTY})
		GG.unitRepairRate[unitID] = 1/REPAIR_PENALTY
	else
		GG.unitRepairRate[unitID] = 1
	end
end

function gadget:GameFrame(n)
	if n%UPDATE_FREQUENCY == 20 then
		for unitID, _ in pairs(damagedUnitFrame) do
			damagedUnitFrame[unitID] = damagedUnitFrame[unitID] - UPDATE_FREQUENCY
			if damagedUnitFrame[unitID] <= 0 then
				if spValidUnitID(unitID) then
					spSetUnitCosts(unitID, {buildTime = Spring.Utilities.GetUnitCost(unitID)})
					GG.unitRepairRate[unitID] = 1
					local _, _, inbuild = spGetUnitIsStunned(unitID)
					if inbuild then
						GG.unitRepairRate[unitID] = nil
					end
				end
				damagedUnitFrame[unitID] = nil
			end
		end
	end
end

function GG.HasCombatRepairPenalty(unitID)
	return (damagedUnitFrame[unitID] and true) or false
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	if damagedUnitFrame[unitID] then
		damagedUnitFrame[unitID] = nil
	end
end

function gadget:Initialize()
	-- load active units
	for _, unitID in ipairs(Spring.GetAllUnits()) do
		local unitDefID = Spring.GetUnitDefID(unitID)
		gadget:UnitFinished(unitID, unitDefID)
	end
end

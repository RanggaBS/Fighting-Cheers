--[[
	Fighting Cheers v2
	Author: RBS ID
]]

local t_fightCheers;
function main()
	while not SystemIsReady() or AreaIsLoading() do
		Wait(0)
	end
	t_fightCheers = CreateThread("T_FightingCheers")
	TextPrintString("Fighting Cheers\nMod by: RBS ID", 3, 1)
	TutorialShowMessage("Fighting Cheers v2", 1500, true)
	Wait(1500)
	TutorialShowMessage("Mod by: RBS ID", 1500, true)
	--[[for i, v in ({1,2,3,4,5,6,11}) do
		PedSetTypeToTypeAttitude(v, 13, 4)
	end]]
	while true do
		Wait(0)
		--[[if IsButtonBeingPressed(3, 0) then
			on = not on
			if on then
				PedSwapModel(gPlayer, math.random(2) == 1 and "PRGirl_Pinky" or (math.random(2) == 1 and "GN_Littleblkboy" or "NDLead_Earnest"))
				--PedSetActionTree(gPlayer, "/Global/GS_Male_A", "Act/Anim/GS_Male_A.act")
				PedSetAITree(gPlayer, "/Global/PlayerAI", "Act/PlayerAI.act")
			else
				PedSwapModel(gPlayer, "player")
				PedSetActionTree(gPlayer, "/Global/Player", "Act/Player.act")
				PedSetAITree(gPlayer, "/Global/PlayerAI", "Act/PlayerAI.act")
			end
		end]]
		if F_PlayerIsDead() then
			TerminateThread(t_fightCheers)
			--TextPrintString("thread was terminated", 3, 1)
			--Wait(3000)
			t_fightCheers = CreateThread("T_FightingCheers")
			--TextPrintString("thread has been created", 3, 1)
		end
	end
end

function T_FightingCheers()
	local playerCheeringSpeechs = {"PLAYER_DEFEAT_TEAM", "PLAYER_TAUNT_COMBAT", "PLAYER_VICTORY_INDIVIDUAL", "PLAYER_VICTORY_TEAM"}
	while true do
		Wait(0)
		if PedIsInCombat(PedGetTargetPed(gPlayer)) then
			if --[[not isCheering and]] PedMePlaying(gPlayer, "Default_KEY") and IsButtonBeingPressed(7, 0) then
				PedSetTaskNode(gPlayer, "/Global/AI/ScriptedAI/CheeringAINode", "Act/AI/AI.act")
				PedLockTarget(gPlayer, -1)
				if PedIsModel(gPlayer, 0) then
					if SoundSpeechPlaying(gPlayer) then
						SoundStopCurrentSpeechEvent(gPlayer)
					end
					SoundPlayAmbientSpeechEvent(gPlayer, playerCheeringSpeechs[math.random(table.getn(playerCheeringSpeechs))])
				else
					SoundPlayAmbientSpeechEvent(gPlayer, "FIGHT_WATCH")
				end
				--isCheering = true
			end
		end
		if --[[isCheering]]PedIsDoingTask(gPlayer, "/Global/AI/ScriptedAI/CheeringAINode", true) then
			if PedGetTargetPed(gPlayer) then
				PedLockTarget(gPlayer, -1)
			end
			if not SoundSpeechPlaying(gPlayer) and math.random(180) < 4 then
				if PedIsModel(gPlayer, 0) then
					SoundPlayAmbientSpeechEvent(gPlayer, playerCheeringSpeechs[math.random(table.getn(playerCheeringSpeechs))])
				else
					SoundPlayAmbientSpeechEvent(gPlayer, "FIGHT_WATCH")
				end
			elseif IsButtonBeingPressed(8, 0) then
				--PedSetCheering(gPlayer, false)
				PedLockTarget(gPlayer, -1)
				PedSetTaskNode(gPlayer, "/Global/PlayerAI", "Act/PlayerAI.act")
				--isCheering = false
				PedSetActionNode(gPlayer, "/Global", "Act/Globals.act")
				PedSetAITree(gPlayer, "/Global/PlayerAI", "Act/PlayerAI.act")
			end
		end
	end
end

-- STimeCycle:
F_AttendedClass = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  SetSkippedClass(false)
  PlayerSetPunishmentPoints(0)
end
 
F_MissedClass = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  SetSkippedClass(true)
  StatAddToInt(166)
end
 
F_AttendedCurfew = function()
  if not PedInConversation(gPlayer) and not MissionActive() then
    TextPrintString("You got home in time for curfew", 4)
  end
end
 
F_MissedCurfew = function()
  if not PedInConversation(gPlayer) and not MissionActive() then
    TextPrint("TM_TIRED5", 4, 2)
  end
end
 
F_StartClass = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  F_RingSchoolBell()
  local l_6_0 = PlayerGetPunishmentPoints() + GetSkippingPunishment()
end
 
F_EndClass = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  F_RingSchoolBell()
end
 
F_StartMorning = function()
  F_UpdateTimeCycle()
end
 
F_EndMorning = function()
  F_UpdateTimeCycle()
end
 
F_StartLunch = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    F_UpdateTimeCycle()
    return 
  end
  F_UpdateTimeCycle()
end
 
F_EndLunch = function()
  F_UpdateTimeCycle()
end
 
F_StartAfternoon = function()
  F_UpdateTimeCycle()
end
 
F_EndAfternoon = function()
  F_UpdateTimeCycle()
end
 
F_StartEvening = function()
  F_UpdateTimeCycle()
end
 
F_EndEvening = function()
  F_UpdateTimeCycle()
end
 
F_StartCurfew_SlightlyTired = function()
  F_UpdateTimeCycle()
end
 
F_StartCurfew_Tired = function()
  F_UpdateTimeCycle()
end
 
F_StartCurfew_MoreTired = function()
  F_UpdateTimeCycle()
end
 
F_StartCurfew_TooTired = function()
  F_UpdateTimeCycle()
end
 
F_EndCurfew_TooTired = function()
  F_UpdateTimeCycle()
end
 
F_EndTired = function()
  F_UpdateTimeCycle()
end
 
F_Nothing = function()
end
 
F_ClassWarning = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  local l_23_0 = math.random(1, 2)
end
 
F_UpdateTimeCycle = function()
  if not IsMissionCompleated("1_B") then
    local l_24_0 = GetCurrentDay(false)
    if l_24_0 < 0 or l_24_0 > 2 then
      SetCurrentDay(0)
    end
  end
  F_UpdateCurfew()
end
 
F_UpdateCurfew = function()
  local l_25_0 = shared.gCurfewRules
  if not l_25_0 then
    l_25_0 = F_CurfewDefaultRules
  end
  l_25_0()
end
 
F_CurfewDefaultRules = function()
  local l_26_0 = ClockGet()
  if l_26_0 >= 23 or l_26_0 < 7 then
    shared.gCurfew = true
  else
    shared.gCurfew = false
  end
end

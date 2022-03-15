--[[
	Fighting Cheers v1
	Author: RBS ID
]]

local t_fightCheers;
local fightCheerNodes = {
	--{"/Global/Ambient/CheerBank/NPC_Cheer_A/Default/Idle/ExecuteRandomCheers", "Act/Anim/Ambient.act"},
	{"/Global/3_G3_Conv/Cheerage", "Act/Conv/3_G3.act"},
	{"/Global/2_04_Conv/Cheerage", "Act/Conv/2_04.act"},
	--{"/Global/2_S04/Anim/NerdCheer", "Act/Conv/2_S04.act"},
	{"/Global/3_04/3_04_Anim/Cheer_Cool3/Cheer_Cool_11", "Act/Conv/3_04.act"},
    {"/Global/3_04/3_04_Anim/Cheer_Cool3/Cheer_Cool_12", "Act/Conv/3_04.act"},
    {"/Global/3_04/3_04_Anim/Cheer_Cool3/Cheer_Cool_13", "Act/Conv/3_04.act"},
    {"/Global/3_04/3_04_Anim/Cheer_Cool3/Cheer_Cool_14", "Act/Conv/3_04.act"},
    {"/Global/6_02/FactionLeaderNIS/Greasers/JohnnyCheer", "Act/Conv/6_02.act"},
	{"/Global/6_02/FactionLeaderNIS/Jocks/Cheering", "Act/Conv/6_02.act"},
	{"/Global/Chap5Trans/Cheering/CheerCool2/CheerCool06", "Act/Conv/Chap5Trans.act"},
	{"/Global/Chap5Trans/Cheering/CheerCool2/CheerCool08", "Act/Conv/Chap5Trans.act"},
	{"/Global/Chap5Trans/Cheering/CheerGen3/CheerGen08", "Act/Conv/Chap5Trans.act"},
	{"/Global/Chap5Trans/Cheering/CheerGen3/CheerGen09", "Act/Conv/Chap5Trans.act"},
	{"/Global/Chap5Trans/Cheering/CheerPosh1/CheerPosh_01", "Act/Conv/Chap5Trans.act"},
	{"/Global/Chap5Trans/Cheering/CheerPosh1/CheerPosh_04", "Act/Conv/Chap5Trans.act"},
	--{"/Global/Chap5Trans/Cheering/Cheer_MsPhillips/Cheer_MsPhillips01", "Act/Conv/Chap5Trans.act"},
	{"/Global/6_02/FactionLeaderNIS/Jocks/Cheering", "Act/Conv/6_02.act"},
	{"/Global/6_02/FactionLeaderNIS/Jocks/Cheering/Cheering01", "Act/Conv/6_02.act"},
	{"/Global/6_02/FactionLeaderNIS/Jocks/Cheering/Cheering01/Cheering02", "Act/Conv/6_02.act"},
	{"/Global/MGSocPen/TargetReactions/Cheer", "Act/Conv/MGSocPen.act"},
	{"/Global/MGSocPen/TargetReactions/Cheer/Cheer1", "Act/Conv/MGSocPen.act"},
	{"/Global/2_S04/Anim/MelvinCheers", "Act/Conv/2_S04.act"},
	--{"/Global/6_02/FactionLeaderNIS/Nerds/Cheering/Cheering01", "Act/Conv/6_02.act"},
	{"/Global/Chap5Trans/Cheering/CheerNerd1/CheerNerd_03", "Act/Conv/Chap5Trans.act"},
	{"/Global/Chap5Trans/Cheering/CheerNerd3/CheerNerd_10", "Act/Conv/Chap5Trans.act"},
	--{"/Global/6_02/FactionLeaderNIS/Nerds/Cheering/Cheering01", "Act/Conv/6_02.act"},
	--{"/Global/6_02/FactionLeaderNIS/Nerds/Cheering/Cheering02", "Act/Conv/6_02.act"},
	--{"/Global/6_02/FactionLeaderNIS/Nerds/Cheering/Cheering03", "Act/Conv/6_02.act"},
	{"/Global/Chap5Trans/Cheering/CheerGirl2/CheerGirl06", "Act/Conv/Chap5Trans.act"},
	{"/Global/Chap5Trans/Cheering/CheerGirl2/CheerGirl07", "Act/Conv/Chap5Trans.act"},
	{"/Global/Chap5Trans/Cheering/CheerGirl3/CheerGirl11", "Act/Conv/Chap5Trans.act"}
}
local plyrCheerSpeechs = {"PLAYER_DEFEAT_TEAM", "PLAYER_TAUNT_COMBAT", "PLAYER_VICTORY_INDIVIDUAL", "PLAYER_VICTORY_TEAM"}

--local on = false

function PlayerIsNerds()
	--[[for i, v in ipairs({4, 5, 6, 7, 8, 9, 10, 11, 155, 162, 174, 186, 208, 209, 210, 215, 224}) do
		if PedIsModel(gPlayer, v) then
			return true
		end
		return false
	end]]
	return PedIsModel(gPlayer, 4) or PedIsModel(gPlayer, 5) or PedIsModel(gPlayer, 6) or PedIsModel(gPlayer, 7) or PedIsModel(gPlayer, 8) or PedIsModel(gPlayer, 9) or
		PedIsModel(gPlayer, 10) or PedIsModel(gPlayer, 11) or PedIsModel(gPlayer, 155) or PedIsModel(gPlayer, 162) or PedIsModel(gPlayer, 174) or PedIsModel(gPlayer, 186) or
		PedIsModel(gPlayer, 208) or PedIsModel(gPlayer, 209) or PedIsModel(gPlayer, 210) or PedIsModel(gPlayer, 215) or PedIsModel(gPlayer, 224)
end

function PlayerIsCheering()
	--[[for i, v in ipairs({"Cheerage", "Cheer_Cool3", "Cheering", "Cheer", "MelvinCheers", "NerdCheer", "JohnnyCheer"}) do
		if PedMePlaying(gPlayer, v) then
			return true
		end
		return false
	end]]
	return PedMePlaying(gPlayer, "Cheerage") or PedMePlaying(gPlayer, "Cheer_Cool3") or PedMePlaying(gPlayer, "Cheering") or PedMePlaying(gPlayer, "Cheer") or
		PedMePlaying(gPlayer, "MelvinCheers") or PedMePlaying(gPlayer, "NerdCheer") or PedMePlaying(gPlayer, "JohnnyCheer")
end

function FightingCheers_mod()
	LoadAnimationGroup("4_04_FUNHOUSEFUN")
	LoadAnimationGroup("Ambient")
	LoadAnimationGroup("Ambient2")
	LoadAnimationGroup("Ambient3")
    LoadAnimationGroup("Cheer_Cool1")
  	LoadAnimationGroup("Cheer_Cool2")
  	LoadAnimationGroup("Cheer_Cool3")
  	LoadAnimationGroup("Cheer_Gen1")
  	LoadAnimationGroup("Cheer_Gen2")
  	LoadAnimationGroup("Cheer_Gen3")
  	LoadAnimationGroup("Cheer_Girl1")
  	LoadAnimationGroup("Cheer_Girl2")
  	LoadAnimationGroup("Cheer_Girl3")
  	LoadAnimationGroup("Cheer_Girl4")
  	LoadAnimationGroup("Cheer_Nerd1")
  	LoadAnimationGroup("Cheer_Nerd2")
  	LoadAnimationGroup("Cheer_Nerd3")
  	LoadAnimationGroup("Cheer_Posh1")
  	LoadAnimationGroup("Cheer_Posh2")
  	LoadAnimationGroup("Cheer_Posh3")
  	LoadAnimationGroup("Hobo_Cheer")
	LoadAnimationGroup("NPC_Cheering")
	LoadActionTree("Act/Conv/2_04.act")
	LoadAnimationGroup("3_G3")
	LoadActionTree("Act/Conv/3_G3.act")
    LoadAnimationGroup("NPC_Spectator")
    LoadActionTree("Act/Conv/3_04.act")
    LoadAnimationGroup("NIS_6_02")
    LoadAnimationGroup("NIS_6_03")
    LoadActionTree("Act/Conv/6_02.act")
    LoadActionTree("Act/Conv/Chap5Trans.act")
  	LoadAnimationGroup("MINI_React")
  	LoadAnimationGroup("BBALL_21")
  	LoadAnimationGroup("NPC_Cheering")
  	LoadActionTree("Act/Conv/2_S04.act")
	t_fightCheers = CreateThread("T_FightingCheers")
	TextPrintString("Fighting Cheers\nMod by: RBS ID", 3, 1)
	TutorialShowMessage("Fighting Cheers", 1500, true)
	Wait(1500)
	TutorialShowMessage("Mod by: RBS ID", 1500, true)
	--TextPrintString("thread has been created", 3, 1)
end

function main()
	while not SystemIsReady() or AreaIsLoading() do
		Wait(0)
	end
	FightingCheers_mod()
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
	while true do
		Wait(0)
		if PedIsInCombat(PedGetTargetPed(gPlayer)) then
			if PedMePlaying(gPlayer, "Default_KEY") and IsButtonBeingPressed(7, 0) then
			Wait(math.random(100, 300))
			if PedIsFemale(gPlayer) then
				local femaleCheerNodes = math.random(23, 25)
				PedSetActionNode(gPlayer, fightCheerNodes[femaleCheerNodes][1], fightCheerNodes[femaleCheerNodes][2])
			elseif PlayerIsNerds() then
				local nerdCheersNodes = math.random(20, 22)
				PedSetActionNode(gPlayer, fightCheerNodes[nerdCheersNodes][1], fightCheerNodes[nerdCheersNodes][2])
			elseif not PedIsFemale(gPlayer) and not PlayerIsNerds() then
				local cheerNodes_rand = math.random(19)
				PedSetActionNode(gPlayer, fightCheerNodes[cheerNodes_rand][1], fightCheerNodes[cheerNodes_rand][2])
			end
			if PedIsModel(gPlayer, 0) then
				SoundPlayAmbientSpeechEvent(gPlayer, plyrCheerSpeechs[math.random(table.getn(plyrCheerSpeechs))])
			else
				SoundPlayAmbientSpeechEvent(gPlayer, "FIGHT_WATCH")
			end
			end
		end
		if PlayerIsCheering() then
			if not SoundSpeechPlaying(gPlayer) and math.random(150) < 6 then
				if PedIsModel(gPlayer) == 0 then
					SoundPlayAmbientSpeechEvent(gPlayer, plyrCheerSpeechs[math.random(table.getn(plyrCheerSpeechs))])
				else
					SoundPlayAmbientSpeechEvent(gPlayer, "FIGHT_WATCH")
				end
			end
			if IsButtonBeingPressed(8, 0) then
				PedSetActionNode(gPlayer, "/Global", "Act/Globals.act")
			end
		end
		--[[if PedIsFemale(gPlayer) then
			TextPrintString("player is female", 1, 1)
		else
			TextPrintString("player is not female", 1, 1)
		end
		TextPrintString("thread is running", 1, 2)]]
	end
end

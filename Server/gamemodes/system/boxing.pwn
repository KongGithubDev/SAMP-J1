#include	<YSI_Coding\y_hooks>

new inBoxingZone[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    inBoxingZone[playerid] = 0;
}

hook OnGameModeInit()
{
	// โซนฝึกอาวุธ
	CreateDynamicPickup(1314, 23, 266.3651,-1816.9652,4.9168);
	CreateDynamic3DTextLabel("{FF00FF} โซนฝึกอาวุธ \n{FFFFFF}กดปุ่ม N", COLOR_YELLOW, 229.1385,-1934.5159,7.4234, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 25.0);

	CreateDynamicPickup(1314, 23, 478.2189,-2094.6321,626.6250);
	CreateDynamic3DTextLabel("{FF00FF} ออกจากโซนฝึกอาวุธ \n{FFFFFF}กดปุ่ม N\n{FDC8B7}(( อาวุธทุกอย่างจะหายหลังจากออกโซนฝึกอาวุธ ))", COLOR_YELLOW, 478.2189,-2094.6321,626.6250, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 25.0);

	CreateDynamicPickup(2061, 23, 485.4781,-2110.9434,626.6250);
	CreateDynamic3DTextLabel("{FF00FF} เบิกอาวุธสำหรับการซ้อม \n{FFFFFF}กดปุ่ม N\n{F1F502}(( อาวุธทุกอย่างจะหายหลังจากออกโซนฝึกอาวุธ ))", COLOR_YELLOW, 485.4781,-2110.9434,626.6250, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 25.0);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
	    // เข้า โซนฝึกอาวุธ
	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 266.3651,-1816.9652,4.9168))
	    {
	        if (GetPlayerMoneyEx(playerid) < 500)
	            return SendClientMessage(playerid, COLOR_RED, "คุณมีเงินสดไม่เพียงพอ! ($500)");

			ResetPlayerWeaponsEx(playerid);
			SetPlayerPosExten(playerid, 478.2189,-2094.6321,626.6250);
			SetPlayerFacingAngle(playerid, 353.4302);
			SetPlayerInterior(playerid, 15);
			SetPlayerVirtualWorld(playerid, 0);
			inBoxingZone[playerid] = 1;
			GivePlayerMoneyEx(playerid, -500);

			SendClientMessage(playerid, COLOR_YELLOW, "[ระบบ]: กรุณารอ LoadObject และ Map เวลา 5 วินาที");
			FreeTimer(playerid, 5000);

			SendClientMessage(playerid, -1, "{F53F04}แจ้งเตือน :: {FBC3B1}คุณได้เข้ามาภายในโซนฝึกอาวุธแล้ว!");
			SendClientMessage(playerid, COLOR_LIGHTRED, "ค่าเข้าสนามวอร์โซน : {ffffff}$500");
	    }
	    // ออก โซนฝึกอาวุธ
	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 478.2189,-2094.6321,626.6250))
	    {
	        ResetPlayerWeaponsEx(playerid);
			SetPlayerPosExten(playerid, 266.3651,-1816.9652,4.9168);
			SetPlayerFacingAngle(playerid, 86.554344);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			inBoxingZone[playerid] = 0;
			
			SendClientMessage(playerid, COLOR_YELLOW, "[ระบบ]: กรุณารอ LoadObject และ Map เวลา 5 วินาที");
			FreeTimer(playerid, 5000);

			SendClientMessage(playerid, -1, "{F53F04}แจ้งเตือน :: {FBC3B1}คุณได้ออกจากโซนฝึกอาวุธแล้ว!");
	    }

		// เบิกอาวุธสำหรับการซ้อม
	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 485.4781,-2110.9434,626.6250))
		{
			Dialog_Show(playerid, DIALOG_FREE_WEAPONS, DIALOG_STYLE_TABLIST, "{F5A002}[ {F5F102}เบิกอาวุธสำหรับการซ้อม {F5A002}]", "\
			{ffffff}สนับมือ\t{FC9B79}ฟรี!\n\
			{ffffff}ไม้กอล์ฟ\t{FC9B79}ฟรี!\n\
			{ffffff}มีดสั้น\t{FC9B79}ฟรี!\n\
			{ffffff}ไม้เบสบอล\t{FC9B79}ฟรี!\n\
			{ffffff}ไม้สนุ๊ก\t{FC9B79}ฟรี!\n\
			{ffffff}คาตานะ\t{FC9B79}ฟรี!\n\
			", "หยิบอาวุธ", "ออก");
		    TogglePlayerControllable(playerid, 0);
		}
	}
	return 1;
}

Dialog:DIALOG_FREE_WEAPONS(playerid, response, listitem, inputtext[])
{

	TogglePlayerControllable(playerid, 1); // ปลดล็อกเดินหลังเลือกหรือออก
	if(response)
	{
		switch(listitem)
  		{
			case 0:
			{
				GivePlayerWeaponEx(playerid, 1, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "คุณได้ทำการหยิบอาวุธ 'สนับมือ' ออกมาสำหรับการซ้อมในโซนฝึกอาวุธแล้ว");
			}
			case 1:
			{
				GivePlayerWeaponEx(playerid, 2, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "คุณได้ทำการหยิบอาวุธ 'ไม้กอล์ฟ' ออกมาสำหรับการซ้อมในโซนฝึกอาวุธแล้ว");
			}
			case 2:
			{
				GivePlayerWeaponEx(playerid, 4, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "คุณได้ทำการหยิบอาวุธ 'มีดสั้น' ออกมาสำหรับการซ้อมในโซนฝึกอาวุธแล้ว");
			}
			case 3:
			{
				GivePlayerWeaponEx(playerid, 5, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "คุณได้ทำการหยิบอาวุธ 'ไม้เบสบอล' ออกมาสำหรับการซ้อมในโซนฝึกอาวุธแล้ว");
			}
			case 4:
			{
				GivePlayerWeaponEx(playerid, 7, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "คุณได้ทำการหยิบอาวุธ 'ไม้สนุ๊ก' ออกมาสำหรับการซ้อมในโซนฝึกอาวุธแล้ว");
			}
			case 5:
			{
				GivePlayerWeaponEx(playerid, 8, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "คุณได้ทำการหยิบอาวุธ 'คาตานะ' ออกมาสำหรับการซ้อมในโซนฝึกอาวุธแล้ว");
			}
		}
	}
	return 1;
}

CMD:warpboxing(playerid)
{
	if (playerData[playerid][pAdmin] == 0)
	    return SendClientMessage(playerid, COLOR_RED, "สำหรับผู้ดูแลระบบเท่านั้น!");

	SetPlayerPosExten(playerid, 410.62589,-2125.44873,630.00000);
	SetPlayerFacingAngle(playerid, 169.9462);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	inBoxingZone[playerid] = 0;
	
	return SendClientMessage(playerid, COLOR_YELLOW, "คุณได้วาร์ปมาสนาม 'ซ้อม' แล้ว");
}

CMD:av(playerid, params[])
{
	new Float:hp;
	GetPlayerHealth(playerid, hp);

	if (GetPlayerInterior(playerid) != 15)
	    return SendClientMessage(playerid, COLOR_RED, "คุณต้องอยู่ในสนาม Boxing เท่านั้น!");

	if (hp > 10)
	    return SendClientMessage(playerid, COLOR_RED, "คุณต้องเหลือเลือดน้อยกว่า 10.0 HP ถึงจะสามารถเพิ่มเลือดได้!");
	    
	SetPlayerHealth(playerid, 100.0);
	SendClientMessage(playerid, COLOR_YELLOW, "คุณได้ทำการเพิ่มเลือดกลับมา 100.0 HP เรียบร้อยแล้ว!");
	return 1;
}

CMD:vv(playerid, params[])
{
	new userid;

	if (inBoxingZone[playerid] == 0)
	    return SendClientMessage(playerid, COLOR_RED, "คุณต้องอยู่ในสนาม Boxing เท่านั้น!");

    if (sscanf(params, "u", userid))
	    return SendClientMessage(playerid, COLOR_WHITE, "/vv [ไอดี/ชื่อ]");

	if (userid == INVALID_PLAYER_ID)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ในเกม");

	if (!playerData[userid][pInjured])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ในสถานะบาดเจ็บ");

	if (inBoxingZone[userid] == 0)
	    return SendClientMessage(playerid, COLOR_RED, "ผู้เล่นนั้นต้องอยู่ในสนาม Boxing เท่านั้น!");

	SetPlayerHealth(userid, 100);
	SetPlayerWeather(userid, globalWeather);
    playerData[userid][pInjured] = 0;
    playerData[userid][pInjuredTime] = 0;
    ClearAnimations(userid);
    PlayerTextDrawHide(userid, PlayerDeathTD[userid]);
    ShowPlayerStats(userid, true);

    Injured_Remove(userid);

    SendClientMessageEx(playerid, COLOR_WHITE, "คุณได้รักษาอาการบาดเจ็บให้ {33CCFF}%s{FFFFFF}", GetPlayerNameEx(userid));
    SendClientMessageEx(userid, COLOR_LIGHTBLUE, "%s {FFFFFF}ได้รักษาอาการบาดเจ็บให้คุณ", GetPlayerNameEx(playerid));
    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้รักษาอาการบาดเจ็บให้ %s", GetPlayerNameEx(playerid), GetPlayerNameEx(userid));
	return 1;
}

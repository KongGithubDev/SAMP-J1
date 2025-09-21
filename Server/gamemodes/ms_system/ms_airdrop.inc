#include <YSI_Coding\y_hooks>

new Text:AIRDROP_TD[6] , Airdrop_Citizen_Time, Airdrop_Gang_Time, Airdrop_Agency_Time, Airdrop_Citizen_On, Airdrop_Gang_On, Airdrop_Agency_On, Airdrop_Citizen_Ready, Airdrop_Gang_Ready, Airdrop_Agency_Ready;
new airdrop_citizen[2], Text3D:airdrop_citizen3D, airdrop_gang[2], Text3D:airdrop_gang3D, airdrop_agency[2], Text3D:airdrop_agency3D, GangPicking[MAX_PLAYERS], AgencyPicking[MAX_PLAYERS];
new PickingAirdropCitizen, PickingAirdropGang, PickingAirdropAgency, PickingDeath[MAX_PLAYERS], CitizenPicking[MAX_PLAYERS];

enum E_AIRDROP
{
	Float:airX,
	Float:airY,
	Float:airZ,
	no
};
new airData[MAX_PLAYERS][E_AIRDROP];
new AirOnnnn[3];
hook OnPlayerSpawn(playerid)
{
	if (Airdrop_Gang_On == 1 && Airdrop_Citizen_On == 1 && Airdrop_Agency_On == 1)
	{
		for (new i = 0; i < 6; i++)
		{
			TextDrawShowForAll(AIRDROP_TD[i]);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i <3; i++)
	{
		AirOnnnn[i] = 0;
	}
    airdrop_citizen3D = CreateDynamic3DTextLabel("", -1, 1760.8866,-2542.8342,13.5469+0.3, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
    airdrop_agency3D = CreateDynamic3DTextLabel("", -1, 1431.5370,1463.6014,10.8203+0.3, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
    airdrop_gang3D = CreateDynamic3DTextLabel("", -1, -1329.1659,-33.2564,14.1484+0.3, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    AIRDROP_TD[0] = TextDrawCreate(231.000000, -1.000000, "ms_hudserver:ms_airplayer");
	TextDrawFont(AIRDROP_TD[0], 4);
	TextDrawLetterSize(AIRDROP_TD[0], 0.600000, 2.000000);
	TextDrawTextSize(AIRDROP_TD[0], 145.500000, 58.500000);
	TextDrawSetOutline(AIRDROP_TD[0], 1);
	TextDrawSetShadow(AIRDROP_TD[0], 0);
	TextDrawAlignment(AIRDROP_TD[0], 1);
	TextDrawColor(AIRDROP_TD[0], -1);
	TextDrawBackgroundColor(AIRDROP_TD[0], 255);
	TextDrawBoxColor(AIRDROP_TD[0], 50);
	TextDrawUseBox(AIRDROP_TD[0], 1);
	TextDrawSetProportional(AIRDROP_TD[0], 1);
	TextDrawSetSelectable(AIRDROP_TD[0], 0);

    AIRDROP_TD[1] = TextDrawCreate(231.000000, -1.000000, "ms_hudserver:ms_airagency");
	TextDrawFont(AIRDROP_TD[1], 4);
	TextDrawLetterSize(AIRDROP_TD[1], 0.600000, 2.000000);
	TextDrawTextSize(AIRDROP_TD[1], 145.500000, 58.500000);
	TextDrawSetOutline(AIRDROP_TD[1], 1);
	TextDrawSetShadow(AIRDROP_TD[1], 0);
	TextDrawAlignment(AIRDROP_TD[1], 1);
	TextDrawColor(AIRDROP_TD[1], -1);
	TextDrawBackgroundColor(AIRDROP_TD[1], 255);
	TextDrawBoxColor(AIRDROP_TD[1], 50);
	TextDrawUseBox(AIRDROP_TD[1], 1);
	TextDrawSetProportional(AIRDROP_TD[1], 1);
	TextDrawSetSelectable(AIRDROP_TD[1], 0);

    AIRDROP_TD[2] = TextDrawCreate(231.000000, -1.000000, "ms_hudserver:ms_airgang");
	TextDrawFont(AIRDROP_TD[2], 4);
	TextDrawLetterSize(AIRDROP_TD[2], 0.600000, 2.000000);
	TextDrawTextSize(AIRDROP_TD[2], 145.500000, 58.500000);
	TextDrawSetOutline(AIRDROP_TD[2], 1);
	TextDrawSetShadow(AIRDROP_TD[2], 0);
	TextDrawAlignment(AIRDROP_TD[2], 1);
	TextDrawColor(AIRDROP_TD[2], -1);
	TextDrawBackgroundColor(AIRDROP_TD[2], 255);
	TextDrawBoxColor(AIRDROP_TD[2], 50);
	TextDrawUseBox(AIRDROP_TD[2], 1);
	TextDrawSetProportional(AIRDROP_TD[2], 1);
	TextDrawSetSelectable(AIRDROP_TD[2], 0);

	AIRDROP_TD[3] = TextDrawCreate(323.000000, 54.000000, "");
	TextDrawFont(AIRDROP_TD[3], 1);
	TextDrawLetterSize(AIRDROP_TD[3], 0.179166, 1.100000);
	TextDrawTextSize(AIRDROP_TD[3], 400.000000, 27.000000);
	TextDrawSetOutline(AIRDROP_TD[3], 0);
	TextDrawSetShadow(AIRDROP_TD[3], 0);
	TextDrawAlignment(AIRDROP_TD[3], 2);
	TextDrawColor(AIRDROP_TD[3], 0x00FF00FF);
	TextDrawBackgroundColor(AIRDROP_TD[3], 255);
	TextDrawBoxColor(AIRDROP_TD[3], 255);
	TextDrawUseBox(AIRDROP_TD[3], 1);
	TextDrawSetProportional(AIRDROP_TD[3], 1);
	TextDrawSetSelectable(AIRDROP_TD[3], 0);

    AIRDROP_TD[4] = TextDrawCreate(323.000000, 54.000000, "");
	TextDrawFont(AIRDROP_TD[4], 1);
	TextDrawLetterSize(AIRDROP_TD[4], 0.179166, 1.100000);
	TextDrawTextSize(AIRDROP_TD[4], 400.000000, 27.000000);
	TextDrawSetOutline(AIRDROP_TD[4], 0);
	TextDrawSetShadow(AIRDROP_TD[4], 0);
	TextDrawAlignment(AIRDROP_TD[4], 2);
	TextDrawColor(AIRDROP_TD[4], 0x76C3FFFF);
	TextDrawBackgroundColor(AIRDROP_TD[4], 255);
	TextDrawBoxColor(AIRDROP_TD[4], 255);
	TextDrawUseBox(AIRDROP_TD[4], 1);
	TextDrawSetProportional(AIRDROP_TD[4], 1);
	TextDrawSetSelectable(AIRDROP_TD[4], 0);

    AIRDROP_TD[5] = TextDrawCreate(323.000000, 54.000000, "");
	TextDrawFont(AIRDROP_TD[5], 1);
	TextDrawLetterSize(AIRDROP_TD[5], 0.179166, 1.100000);
	TextDrawTextSize(AIRDROP_TD[5], 400.000000, 27.000000);
	TextDrawSetOutline(AIRDROP_TD[5], 0);
	TextDrawSetShadow(AIRDROP_TD[5], 0);
	TextDrawAlignment(AIRDROP_TD[5], 2);
	TextDrawColor(AIRDROP_TD[5], 0xFF0000FF);
	TextDrawBackgroundColor(AIRDROP_TD[5], 255);
	TextDrawBoxColor(AIRDROP_TD[5], 255);
	TextDrawUseBox(AIRDROP_TD[5], 1);
	TextDrawSetProportional(AIRDROP_TD[5], 1);
	TextDrawSetSelectable(AIRDROP_TD[5], 0);
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        //--> ประชาชน
        if (IsPlayerInRangeOfPoint(playerid, 3.0, 1760.8866,-2542.8342,13.5469))
        {
            if (Airdrop_Citizen_Ready == 0)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "แอร์ดรอปยังไม่พร้อมเก็บตอนนี้ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            if(playerData[playerid][pInjured] == 1)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "คุณอยู่ในสถานะการตาย ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            if (playerData[playerid][pFaction] != -1)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "คุณไม่ใช่ประชาชน ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            if (AgencyPicking[playerid] == 1)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "คุณกำลังเก็บแอร์ดรอปอยู่ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            if (PickingAirdropCitizen == 1)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "มีคนกำลังเก็บแอร์ดรอปอยู่ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            SendClientMessageToAllEx(0x00FF00FF, "[Citizen-Airdrop] %s {FFFFFF}กำลังเก็บแอร์ดรอปในขณะนี้ สามารถฆ่าเขาเพื่อหยุดได้", GetPlayerNameEx(playerid));

            TogglePlayerControllable(playerid, false);
            StartProgress(playerid, 100, 0, 0);
            PickingAirdropCitizen = 1;
            CitizenPicking[playerid] = 1;
            
        }
        //--> แก๊งค์
        if (IsPlayerInRangeOfPoint(playerid, 3.0, -1329.1659,-33.2564,14.1484))
        {
            if(GetFactionType(playerid) != FACTION_GANG)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "คุณไม่มีกลุ่มแก๊งค์ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            if (Airdrop_Gang_Ready == 0)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "แอร์ดรอปยังไม่พร้อมเก็บตอนนี้ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            if(playerData[playerid][pInjured] == 1)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "คุณอยู่ในสถานะการตาย ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            if (AgencyPicking[playerid] == 1)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "คุณกำลังเก็บแอร์ดรอปอยู่ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            if (PickingAirdropGang == 1)
                return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "มีคนกำลังเก็บแอร์ดรอปอยู่ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

            SendClientMessageToAllEx(0xFF0000FF, "[Gang-Airdrop] %s {FFFFFF}กำลังเก็บแอร์ดรอปในขณะนี้ สามารถฆ่าเขาเพื่อหยุดได้", GetPlayerNameEx(playerid));

            TogglePlayerControllable(playerid, false);
            StartProgress(playerid, 100, 0, 0);
            PickingAirdropGang = 1;
            GangPicking[playerid] = 1;
        }
        //--> หน่วยงาน
        if (IsPlayerInRangeOfPoint(playerid, 3.0, 1431.5370,1463.6014,10.8203))
        {
            if(GetFactionType(playerid) == FACTION_POLICE || GetFactionType(playerid) == FACTION_MEDIC || GetFactionType(playerid) == FACTION_MEC || playerData[playerid][pFaction] == 5)
            {
                if (Airdrop_Agency_Ready == 0)
                    return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "แอร์ดรอปยังไม่พร้อมเก็บตอนนี้ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

		        if(playerData[playerid][pInjured] == 1)
                    return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "คุณอยู่ในสถานะการตาย ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

                if (AgencyPicking[playerid] == 1)
                    return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "คุณกำลังเก็บแอร์ดรอปอยู่ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

                if (PickingAirdropAgency == 1)
                    return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "มีคนกำลังเก็บแอร์ดรอปอยู่ ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");

                SendClientMessageToAllEx(0x76C3FFFF, "[Agency-Airdrop] %s {FFFFFF}กำลังเก็บแอร์ดรอปในขณะนี้ สามารถฆ่าเขาเพื่อหยุดได้", GetPlayerNameEx(playerid));

                TogglePlayerControllable(playerid, false);
                StartProgress(playerid, 100, 0, 0);
                PickingAirdropAgency = 1;
                AgencyPicking[playerid] = 1;
            }
            else
            {
                Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "คุณไม่ใช่หน่วยงาน ไม่สามารถเก็บแอร์ดรอปได้", "ปิด", "");
            }
        }
    }
    return 1;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(CitizenPicking[playerid] == 1 || GangPicking[playerid] == 1 || AgencyPicking[playerid] == 1)
    {
        ApplyAnimation(playerid, "DANCING", "DAN_Down_A", 4.0, 1, 0, 0, 0, 0, 1);
    }
	if(PickingDeath[playerid] == 1 && CitizenPicking[playerid] == 0)
    {
        StopProgress(playerid);
        PickingDeath[playerid] = 0;
    }
	if(PickingDeath[playerid] == 1 && GangPicking[playerid] == 0)
    {
        StopProgress(playerid);
        PickingDeath[playerid] = 0;
    }
	if(PickingDeath[playerid] == 1 && AgencyPicking[playerid] == 0)
    {
        StopProgress(playerid);
        PickingDeath[playerid] = 0;
    }
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressFinish(playerid, objectid)
{
	if(CitizenPicking[playerid] == 1)
	{
        Inventory_Add(playerid, "ปูน", 3);
        Inventory_Add(playerid, "สายไฟ", 3);
        Inventory_Add(playerid, "ผ้าพันแผล", 3);

        new B = randomEx(10000, 20000); 
        GivePlayerMoneyEx(playerid, B);

		Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "\
        ยินดีด้วยคุณเก็บแอร์ดรอปสำเร็จ\n\
        {00FF00}[+] {FFFFFF}ปูน +3\n\
        {00FF00}[+] {FFFFFF}สายไฟ +3\n\
        {00FF00}[+] {FFFFFF}ผ้าพันแผล +3\n\
        {00FF00}[+] {FFFFFF}เงินเขียว +%d", "ปิด", "", B);

		DestroyDynamic3DTextLabel(airdrop_citizen3D);

        DestroyDynamicObject(airdrop_citizen[0]);
        DestroyDynamicObject(airdrop_citizen[1]);

        TextDrawHideForAll(AIRDROP_TD[0]);
        TextDrawHideForAll(AIRDROP_TD[3]);

		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
        PickingAirdropCitizen = 0;
        CitizenPicking[playerid] = 0;

        Airdrop_Citizen_Ready = 0;
        Airdrop_Citizen_On = 0;
        SetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
        airData[playerid][no] = 0;
        AirOnnnn[0] = 0;
	}
	if(AgencyPicking[playerid] == 1)
	{
        Inventory_Add(playerid, "ผ้าพันแผล", 5);
        Inventory_Add(playerid, "เครื่องมือซ่อมรถ", 5);

        new B = randomEx(10000, 20000);
        GivePlayerMoneyEx(playerid, B);
		SetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
        airData[playerid][no] = 0;
        AirOnnnn[1] = 0;
		Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "\
        ยินดีด้วยคุณเก็บแอร์ดรอปสำเร็จ\n\
        {00FF00}[+] {FFFFFF}ผ้าพันแผล +5\n\
        {00FF00}[+] {FFFFFF}เครื่องมือซ่อมรถ +5\n\
        {00FF00}[+] {FFFFFF}เงินเขียว +%d", "ปิด", "", B);

		DestroyDynamic3DTextLabel(airdrop_agency3D);

        DestroyDynamicObject(airdrop_agency[0]);
        DestroyDynamicObject(airdrop_agency[1]);

        TextDrawHideForAll(AIRDROP_TD[1]);
        TextDrawHideForAll(AIRDROP_TD[4]);

		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
        PickingAirdropAgency = 0;
        AgencyPicking[playerid] = 0;

        Airdrop_Agency_Ready = 0;
        Airdrop_Agency_On = 0;
        SetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
        airData[playerid][no] = 0;
        AirOnnnn[1] = 0;
	}
	if(GangPicking[playerid] == 1)
	{
        Inventory_Add(playerid, "ผ้าพันแผล", 5);
        Inventory_Add(playerid, "สายไฟ", 5);
        Inventory_Add(playerid, "ปูน", 5);
        Inventory_Add(playerid, "เครื่องมือซ่อมรถ", 1);

        new B = randomEx(10000, 20000);
        GivePlayerMoneyEx(playerid, B);

		Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Alert", "\
        ยินดีด้วยคุณเก็บแอร์ดรอปสำเร็จ\n\
        {00FF00}[+] {FFFFFF}ผ้าพันแผล +5\n\
        {00FF00}[+] {FFFFFF}สายไฟ +5\n\
        {00FF00}[+] {FFFFFF}ปูน +5\n\
        {00FF00}[+] {FFFFFF}เครื่องมือซ่อมรถ +1\n\
        {00FF00}[+] {FFFFFF}เงินเขียว +%d", "ปิด", "", B);

		DestroyDynamic3DTextLabel(airdrop_gang3D);

        DestroyDynamicObject(airdrop_gang[0]);
        DestroyDynamicObject(airdrop_gang[1]);

		TextDrawHideForAll(AIRDROP_TD[2]);
        TextDrawHideForAll(AIRDROP_TD[5]);

		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
        PickingAirdropGang = 0;
        GangPicking[playerid] = 0;

        Airdrop_Gang_Ready = 0;
        Airdrop_Gang_On = 0;
        SetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
        airData[playerid][no] = 0;
        AirOnnnn[2] = 0;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}

///////////////////////////////////////////////////////////////////////////////////

CMD:onair1(playerid, params[]) // เปิดแอร์ ประชาชน
{
    new timer;

    if (playerData[playerid][pAdmin] < 6)
        return 1;

    if (sscanf(params, "d", timer))
        return SendClientMessage(playerid, COLOR_WHITE, "/onair1 [เวลา/นาที]");

    TextDrawShowForAll(AIRDROP_TD[0]);
    TextDrawShowForAll(AIRDROP_TD[3]);

    SendClientMessageToAll(COLOR_GREEN,"กิจกรรมแอร์ดรอป ประชาชน ได้เริ่มขึ้นแล้ว");
    SendClientMessageToAll(COLOR_YELLOW,"/air1  สำหรับประชาชน");

    Airdrop_Citizen_Time = timer*60;
    Airdrop_Citizen_Ready = 0;
    Airdrop_Citizen_On = 1;
    AirOnnnn[0] = 1;
    return 1;
}

CMD:onair2(playerid, params[]) // เปิดแอร์ แก๊งค์
{
    new timer;

    if (playerData[playerid][pAdmin] < 6)
        return 1;

    if (sscanf(params, "d", timer))
        return SendClientMessage(playerid, COLOR_WHITE, "/onair2 [เวลา/นาที]");

    TextDrawShowForAll(AIRDROP_TD[2]);
    TextDrawShowForAll(AIRDROP_TD[5]);

    SendClientMessageToAll(COLOR_RED,"กิจกรรมแอร์ดรอป แก๊งค์ ได้เริ่มขึ้นแล้ว");
    SendClientMessageToAll(COLOR_YELLOW,"/air2  สำหรับแก๊งค์");

    Airdrop_Gang_Time = timer*60;
    Airdrop_Gang_Ready = 0;
    Airdrop_Gang_On = 1;
    AirOnnnn[1] = 1;
    return 1;
}

CMD:onair3(playerid, params[]) // เปิดแอร์ หน่วยงาน
{
    new timer;

    if (playerData[playerid][pAdmin] < 6)
        return 1;

    if (sscanf(params, "d", timer))
        return SendClientMessage(playerid, COLOR_WHITE, "/onair3 [เวลา/นาที]");

    TextDrawShowForAll(AIRDROP_TD[1]);
    TextDrawShowForAll(AIRDROP_TD[4]);

    SendClientMessageToAll(COLOR_TG,"กิจกรรมแอร์ดรอป หน่วยงาน ได้เริ่มขึ้นแล้ว");
    SendClientMessageToAll(COLOR_YELLOW,"/air3  สำหรับหน่วยงาน");

    Airdrop_Agency_Time = timer*60;
    Airdrop_Agency_Ready = 0;
    Airdrop_Agency_On = 1;
    AirOnnnn[2] = 1;
    return 1;
}
///////////////////////////////////////////////////////////////////////////////////

CMD:offair1(playerid, params[]) // ปิดแอร์ ประชาชน
{
    if (playerData[playerid][pAdmin] < 6)
        return 1;

    SendAdminMessage(0xFF0000FF, "[Logs] {FFFFFF}%s ได้ปิดกิจกรรมแอร์ดรอป ประชาชน", GetPlayerNameEx(playerid));

    TextDrawHideForAll(AIRDROP_TD[0]);
    TextDrawHideForAll(AIRDROP_TD[3]);

    DestroyDynamicObject(airdrop_citizen[0]);
    DestroyDynamicObject(airdrop_citizen[1]);
    DestroyDynamic3DTextLabel(airdrop_citizen3D);

    Airdrop_Citizen_Time  = 0;
    Airdrop_Citizen_Ready = 0;
    Airdrop_Citizen_On    = 0;
    AirOnnnn[0]           = 0;
    SetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
    airData[playerid][no] = 0;

    return 1;
}

CMD:offair2(playerid, params[]) // ปิดแอร์ แก๊งค์
{
    if (playerData[playerid][pAdmin] < 6)
        return 1;

    SendAdminMessage(0xFF0000FF, "[Logs] {FFFFFF}%s ได้ปิดกิจกรรมแอร์ดรอป แก๊งค์", GetPlayerNameEx(playerid));

    TextDrawHideForAll(AIRDROP_TD[2]);
    TextDrawHideForAll(AIRDROP_TD[5]);

    DestroyDynamicObject(airdrop_gang[0]);
    DestroyDynamicObject(airdrop_gang[1]);
    DestroyDynamic3DTextLabel(airdrop_gang3D);

    Airdrop_Gang_Time  = 0;
    Airdrop_Gang_Ready = 0;
    Airdrop_Gang_On    = 0;
    AirOnnnn[2]        = 0;
    SetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
    airData[playerid][no] = 0;

    return 1;
}

CMD:offair3(playerid, params[]) // ปิดแอร์ หน่วยงาน
{
    if (playerData[playerid][pAdmin] < 6)
        return 1;

    SendAdminMessage(0xFF0000FF, "[Logs] {FFFFFF}%s ได้ปิดกิจกรรมแอร์ดรอป หน่วยงาน", GetPlayerNameEx(playerid));

    TextDrawHideForAll(AIRDROP_TD[1]);
    TextDrawHideForAll(AIRDROP_TD[4]);

    DestroyDynamicObject(airdrop_agency[0]);
    DestroyDynamicObject(airdrop_agency[1]);
    DestroyDynamic3DTextLabel(airdrop_agency3D);

    Airdrop_Agency_Time  = 0;
    Airdrop_Agency_Ready = 0;
    Airdrop_Agency_On    = 0;
    AirOnnnn[1]          = 0;
    SetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
    airData[playerid][no] = 0;

    return 1;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

hook OnDynamicObjectMoved(objectid)
{
    if (objectid == airdrop_citizen[0] || objectid == airdrop_gang[0] || objectid == airdrop_agency[0])
    {
        UpdateDynamic3DTextLabelText(airdrop_citizen3D, 0x00FF00FF, "[ CITIZEN AIRDROP ]\n{FFFFFF}กดปุ่ม N เพื่อเก็บ");
        UpdateDynamic3DTextLabelText(airdrop_agency3D, 0x76C3FFFF, "[ AGENCY AIRDROP ]\n{FFFFFF}กดปุ่ม N เพื่อเก็บ");
        UpdateDynamic3DTextLabelText(airdrop_gang3D, 0xFF0000FF, "[ GANG AIRDROP ]\n{FFFFFF}กดปุ่ม N เพื่อเก็บ");
   
        Airdrop_Citizen_Ready = 1;
        Airdrop_Gang_Ready = 1;
        Airdrop_Agency_Ready = 1;
    }
    return 1;
}

task TaskAirdropTimer[1000]()
{
	new ServerHour, ServerMinute, ServerSecond;

	gettime(ServerHour, ServerMinute, ServerSecond);

    new str_citizen[128], str_gang[128], str_agency[128];

	if (Airdrop_Citizen_On == 1)
	{
        if (Airdrop_Citizen_Time >= 1)
        {
            foreach (new i : Player)
            {
                new hours, minutes, seconds;

                Airdrop_Citizen_Time--;

                GetElapsedTime(Airdrop_Citizen_Time, hours, minutes, seconds);

                format(str_citizen,sizeof(str_citizen),"%02d:%02d:%02d", hours, minutes, seconds);
                
                TextDrawSetString(AIRDROP_TD[3], str_citizen);
            }
        }
        if (Airdrop_Citizen_Time <= 0)
        {
            TextDrawSetString(AIRDROP_TD[3], "READY");

            //--> ประชาชน
            airdrop_citizen[0] = CreateDynamicObject(1685, 1760.8866,-2542.8342,5.5555, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
            MoveDynamicObject(airdrop_citizen[0], 1760.8866,-2542.8342,13.5469, 4.00);

			Airdrop_Citizen_On = -1;
		}
    }
	if (Airdrop_Agency_On == 1)
	{
        if (Airdrop_Agency_Time >= 1)
        {
            foreach (new i : Player)
            {
                new hours, minutes, seconds;

                Airdrop_Agency_Time--;

                GetElapsedTime(Airdrop_Agency_Time, hours, minutes, seconds);

                format(str_agency,sizeof(str_agency),"%02d:%02d:%02d", hours, minutes, seconds);
                
                TextDrawSetString(AIRDROP_TD[4], str_agency);
            }
        }
        if (Airdrop_Agency_Time <= 0)
        {
            TextDrawSetString(AIRDROP_TD[4], "READY");

            //--> หน่วยงาน
            airdrop_agency[0] = CreateDynamicObject(1685, 1431.5370,1463.6014,5.5555, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
            MoveDynamicObject(airdrop_agency[0], 1431.5370,1463.6014,10.8203, 4.00);

			Airdrop_Agency_On = -1;
		}
	}
	if (Airdrop_Gang_On == 1)
	{
        if (Airdrop_Gang_Time >= 1)
        {
            foreach (new i : Player)
            {
                new hours, minutes, seconds;

                Airdrop_Gang_Time--;

                GetElapsedTime(Airdrop_Gang_Time, hours, minutes, seconds);

                format(str_gang,sizeof(str_gang),"%02d:%02d:%02d", hours, minutes, seconds);
                
                TextDrawSetString(AIRDROP_TD[5], str_gang);
            }
        }
        if (Airdrop_Gang_Time <= 0)
        {
            TextDrawSetString(AIRDROP_TD[5], "READY");

            //--> แก๊งค์
            airdrop_gang[0] = CreateDynamicObject(1685, -1329.1659,-33.2564,5.5555, 0.000000, 0.000000, -35.299995, -1, -1, -1, 300.00, 300.00);    
            MoveDynamicObject(airdrop_gang[0], -1329.1659,-33.2564,14.1484, 4.00);
 
			Airdrop_Gang_On = -1;
		}
    }
    return 1;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
CMD:air1(playerid, params[]) //ประชาชน
{
    if (GetFactionType(playerid) == FACTION_GANG)
	    return SendClientMessage(playerid, COLOR_YELLOW, "[!] แก๊งห้ามเล่นแอร์ ปชช");

	if (GetFactionType(playerid) == FACTION_POLICE)
	    return SendClientMessage(playerid, COLOR_YELLOW, "[!] หน่วยงานห้ามเล่นแอร์ ปชช");

	if (GetFactionType(playerid) == FACTION_MEDIC)
	    return SendClientMessage(playerid, COLOR_YELLOW, "[!] หน่วยงานห้ามเล่นแอร์ ปชช");
    
    if (GetFactionType(playerid) == FACTION_MEC)
	    return SendClientMessage(playerid, COLOR_YELLOW, "[!] หน่วยงานห้ามเล่นแอร์ ปชช");

	if(AirOnnnn[0] != 1)
		return 1;
	if(Airdrop_Citizen_Time > 0)
	{
	 	if(airData[playerid][no] == 1)
			return 1;
		GetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
		SetPlayerPos(playerid, 1760.8866,-2542.8342,13.5469);
        SendClientMessage(playerid, COLOR_YELLOW, "[ระบบ]: {FFFFFF}กำลังโหลดแมพ 5 วินาที");
		FreeTimer(playerid, 5000);
		airData[playerid][no] = 1;
		return 1;
	}
	return 1;
}
CMD:air2(playerid, params[])  //gang
{
    if (GetFactionType(playerid) != FACTION_GANG)
	    return SendClientMessage(playerid, COLOR_YELLOW, "[!] คุณไม่มีแก๊ง");

	if(AirOnnnn[1] != 1)
		return 1;
	if(Airdrop_Gang_Time > 0)
	{
	 	if(airData[playerid][no] == 1)
			return 1;
		GetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
		SetPlayerPos(playerid, -1329.1659,-33.2564,14.1484);
        SendClientMessage(playerid, COLOR_YELLOW, "[ระบบ]:  {FFFFFF}กำลังโหลดแมพ 5 วินาที");
		FreeTimer(playerid, 5000);
		airData[playerid][no] = 1;
		return 1;
	}
	return 1;
}
CMD:air3(playerid, params[])  //หน่วยงาน
{
    if (GetFactionType(playerid) == FACTION_POLICE || GetFactionType(playerid) == FACTION_MEDIC || GetFactionType(playerid) == FACTION_MEC){

    }
	if(AirOnnnn[2] != 1)
		return 1;
	if(Airdrop_Agency_Time > 0)
	{
	 	if(airData[playerid][no] == 1)
			return 1;
		GetPlayerPos(playerid,airData[playerid][airX], airData[playerid][airY], airData[playerid][airZ]);
		SetPlayerPos(playerid, 1431.5370,1463.6014,10.8203);
        SendClientMessage(playerid, COLOR_YELLOW, "[ระบบ]:  {FFFFFF}กำลังโหลดแมพ 5 วินาที");
		FreeTimer(playerid, 5000);
		airData[playerid][no] = 1;
		return 1;
	}
    else SendClientMessage(playerid, COLOR_WHITE, "ปชช ห้ามเล่นแอร์ หน่วยงาน");
 
	return 1;
}
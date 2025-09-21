#include	<YSI_Coding\y_hooks>

#define     WEEDOBJECT       	19473
#define     WEEDTEXT           	"Objective: {FF0000}�ѭ��\n{FFFFFF}������ {FFFF00}N {FFFFFF}���͡����!"
#define     WEEDNAME            "Cannabis"
#define     WEEDTIMER           15 // �ҷ��Դ

new weedTake[MAX_PLAYERS];

enum WEED_DATA
{
    weedID,
    weedObject,
    Float: weedPosX,
	Float: weedPosY,
	Float: weedPosZ,
    Text3D: weed3D,
    weed3DMSG[80],
    weedOn
};
new const weedData[][WEED_DATA] =
{
	{ INVALID_STREAMER_ID, WEEDOBJECT, -1069.9668, -1623.0992, 75.3739, Text3D: INVALID_3DTEXT_ID, WEEDTEXT, 0 },
	{ INVALID_STREAMER_ID, WEEDOBJECT, -1067.6013, -1679.0267, 75.0730, Text3D: INVALID_3DTEXT_ID, WEEDTEXT, 0 },
	{ INVALID_STREAMER_ID, WEEDOBJECT, -1014.7828, -1644.5602, 75.3672, Text3D: INVALID_3DTEXT_ID, WEEDTEXT, 0 },
	{ INVALID_STREAMER_ID, WEEDOBJECT, -991.7202, -1678.5632, 75.3672, Text3D: INVALID_3DTEXT_ID, WEEDTEXT, 0 },
	{ INVALID_STREAMER_ID, WEEDOBJECT, -983.2482, -1700.8352, 75.3029, Text3D: INVALID_3DTEXT_ID, WEEDTEXT, 0 },
	{ INVALID_STREAMER_ID, WEEDOBJECT, -1053.4578, -1628.6263, 75.3672, Text3D: INVALID_3DTEXT_ID, WEEDTEXT, 0 }
};

hook OnPlayerConnect(playerid)
{
	weedTake[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (weedTake[playerid] != 0)
	{
		if (weedData[ProgressObject[playerid]][weedOn] == 1)
		{
			weedData[ProgressObject[playerid]][weedOn] = 0;
			StopProgress(playerid);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(weedData); i++)
	{
		weedData[i][weedID] = CreateDynamicObject(weedData[i][weedObject], weedData[i][weedPosX], weedData[i][weedPosY], weedData[i][weedPosZ], 0.0, 0.0, 0.0);
		weedData[i][weed3D] = CreateDynamic3DTextLabel(weedData[i][weed3DMSG], COLOR_GREEN, weedData[i][weedPosX], weedData[i][weedPosY], weedData[i][weedPosZ] + 1.5, 5.0);
	}
	CreateDynamicPickup(1239, 23, 2350.3289,-652.7498,128.0547);
	CreateDynamic3DTextLabel("��觼Դ������:{FFFFFF} ������ {FFFF00}N{FFFFFF}\n㹡�â�¢ͧ", COLOR_RED, 2350.3289,-652.7498,128.0547, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	CreateDynamicPickup(1212, 23, 2485.0144,-1464.2155,24.0185);
	CreateDynamic3DTextLabel("��觼Դ������:{FFFFFF} ������ {FFFF00}N{FFFFFF}\n㹡������¹�Թᴧ", COLOR_RED, 2485.0144,-1464.2155,24.0185, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof weedData; i++)
        {
            GetDynamicObjectPos(weedData[i][weedID], weedData[i][weedPosX], weedData[i][weedPosY], weedData[i][weedPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, weedData[i][weedPosX], weedData[i][weedPosY], weedData[i][weedPosZ]))
            {
                if(IsValidDynamicObject(weedData[i][weedID]) && weedData[i][weedOn] == 0)
                {
				    if (GetFactionType(playerid) == FACTION_POLICE || GetFactionType(playerid) == FACTION_MEDIC || GetFactionType(playerid) == FACTION_GOV)
				        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�������ö�ӧҹ�Դ��������!");

					if (playerData[playerid][pLevel] < 5)
					    return SendClientMessage(playerid, COLOR_LIGHTRED, "�س��ͧ Level �ҡ���� 5");

				    if (CopOnline() < 3)
				        return SendClientMessage(playerid, COLOR_LIGHTRED, "��ͧ�� '���Ǩ' �͹�Ź�������������ҧ��û�Ժѵ�˹�ҷ���ҡ���� '3 ��'");

                    weedData[i][weedOn] = 1;
	                ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
	                StartProgress(playerid, 100, 0, i);
					weedTake[playerid] = 1;
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 2350.3289,-652.7498,128.0547))
        {
            Dialog_Show(playerid, DIALOG_SELLBAD, DIALOG_STYLE_TABLIST_HEADERS, "[��¡���Ѻ����]", "\
				������¡��\t�Ҥ�\n\
				"#WEEDNAME"\t{FF0000}$1,500", "���", "�͡");
        }
        else if (IsPlayerInRangeOfPoint(playerid, 2.5, 2485.0144,-1464.2155,24.0185))
        {
            Dialog_Show(playerid, DIALOG_TRADEBAD, DIALOG_STYLE_TABLIST_HEADERS, "[��¡���š�Թᴧ]", "\
                �Թ����\t�Թᴧ\n\
				{00FF00}$750\t{FF0000}$1,500\n\
				{00FF00}$4,500\t{FF0000}$9,000", "�š", "�͡");
        }
	}
	return 1;
}

Dialog:DIALOG_SELLBAD(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, WEEDNAME);
			    new price = ammo*500;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�����"#WEEDNAME"����㹵�����");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â��"#WEEDNAME" {00FF00}%d {FFFFFF}��", FormatMoney(price), ammo);
				Inventory_Remove(playerid, WEEDNAME, ammo);
		    }
		}
	}
	return 1;
}

Dialog:DIALOG_TRADEBAD(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    if (GetPlayerRedMoney(playerid) < 1500)
					return SendClientMessageEx(playerid, COLOR_RED, "[�к�] {FFFFFF}�Թᴧ�ͧ�س�����§�� (%s/$1,500)", FormatMoney(GetPlayerRedMoney(playerid)));

				GivePlayerRedMoney(playerid, -1500);
				GivePlayerMoneyEx(playerid, 750);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թ���Ǩӹǹ {00FF00}$750 {FFFFFF}�ҡ����š�Թᴧ�ӹǹ {FF0000}$1,500");
			}
			case 1:
			{
			    if (GetPlayerRedMoney(playerid) < 9000)
					return SendClientMessageEx(playerid, COLOR_RED, "[�к�] {FFFFFF}�Թᴧ�ͧ�س�����§�� (%s/$9,000)", FormatMoney(GetPlayerRedMoney(playerid)));

				GivePlayerRedMoney(playerid, -9000);
				GivePlayerMoneyEx(playerid, 4500);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թ���Ǩӹǹ {00FF00}$4,500 {FFFFFF}�ҡ����š�Թᴧ�ӹǹ {FF0000}$9,000");
			}
		}
	}
	return 1;
}

PlayerWeedUnfreeze(playerid, number)
{
	/*new wanted = randomEx(1, 2);
	switch(wanted)
	{
	    case 2:
		{
			GivePlayerWanted(playerid, 1);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[��դ���] {FFFFFF}�س�Դ������Фس��"#WEEDNAME"");
		}
	}*/
	ClearAnimations(playerid);
	
	weedTake[playerid] = 0;
	weedData[number][weedOn] = 0;

	if (CopOnline() < 3)
    	return SendClientMessage(playerid, COLOR_LIGHTRED, "��ͧ�� '���Ǩ' �͹�Ź��ҡ���� '3 ��'");

    Inventory_Add(playerid, WEEDNAME, 1);
	GivePlayerExp(playerid, 10);
	SendClientMessage(playerid, COLOR_WHITE, "�س���Ѻ {FF0000}"#WEEDNAME" +1");
	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	if(weedTake[playerid] == 1)
		PlayerWeedUnfreeze(playerid, objectid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(weedTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

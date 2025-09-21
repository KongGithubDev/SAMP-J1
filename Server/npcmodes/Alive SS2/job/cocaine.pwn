#include	<YSI_Coding\y_hooks>

#define     COCAINEOBJECT       	1580
#define     COCAINETEXT           	"Objective: {FF0000}�ह\n{FFFFFF}������ {FFFF00}N {FFFFFF}���͡����!"
#define     COCAINENAME            "Cocain"
#define     COCAINETIMER           15 // �ҷ��Դ

new COCAINETake[MAX_PLAYERS];

enum COCAINE_DATA
{
    COCAINEID,
    COCAINEObject,
    Float: COCAINEPosX,
	Float: COCAINEPosY,
	Float: COCAINEPosZ,
    Text3D: COCAINE3D,
    COCAINE3DMSG[80],
    COCAINEOn
};
new const COCAINEData[][COCAINE_DATA] =
{
	{ INVALID_STREAMER_ID, COCAINEOBJECT, 2846.60034, 983.47882, 9.74154, Text3D: INVALID_3DTEXT_ID, COCAINETEXT, 0 },
	{ INVALID_STREAMER_ID, COCAINEOBJECT, 2327.35400, 2784.76563, 9.79700, Text3D: INVALID_3DTEXT_ID, COCAINETEXT, 0 },
	{ INVALID_STREAMER_ID, COCAINEOBJECT, 1640.08728, 2326.47266, 9.81001, Text3D: INVALID_3DTEXT_ID, COCAINETEXT, 0 },
	{ INVALID_STREAMER_ID, COCAINEOBJECT, 1068.99194, 2129.14478, 9.81578, Text3D: INVALID_3DTEXT_ID, COCAINETEXT, 0 }
};

hook OnPlayerConnect(playerid)
{
	COCAINETake[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (COCAINETake[playerid] != 0)
	{
		if (COCAINEData[ProgressObject[playerid]][COCAINEOn] == 1)
		{
			COCAINEData[ProgressObject[playerid]][COCAINEOn] = 0;
			StopProgress(playerid);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(COCAINEData); i++)
	{
		COCAINEData[i][COCAINEID] = CreateDynamicObject(COCAINEData[i][COCAINEObject], COCAINEData[i][COCAINEPosX], COCAINEData[i][COCAINEPosY], COCAINEData[i][COCAINEPosZ], 0.0, 0.0, 0.0);
		COCAINEData[i][COCAINE3D] = CreateDynamic3DTextLabel(COCAINEData[i][COCAINE3DMSG], COLOR_GREEN, COCAINEData[i][COCAINEPosX], COCAINEData[i][COCAINEPosY], COCAINEData[i][COCAINEPosZ] + 1.5, 5.0);
	}
	CreateDynamicPickup(1239, 23, 209.9630,-225.6056,1.7786);
	CreateDynamic3DTextLabel("��觼Դ������:{FFFFFF} ������ {FFFF00}N{FFFFFF}\n㹡�â�¢ͧ", COLOR_RED, 209.9630,-225.6056,1.7786, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof COCAINEData; i++)
        {
            GetDynamicObjectPos(COCAINEData[i][COCAINEID], COCAINEData[i][COCAINEPosX], COCAINEData[i][COCAINEPosY], COCAINEData[i][COCAINEPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, COCAINEData[i][COCAINEPosX], COCAINEData[i][COCAINEPosY], COCAINEData[i][COCAINEPosZ]))
            {
                if(IsValidDynamicObject(COCAINEData[i][COCAINEID]) && COCAINEData[i][COCAINEOn] == 0)
                {
				    if (GetFactionType(playerid) == FACTION_POLICE || GetFactionType(playerid) == FACTION_MEDIC || GetFactionType(playerid) == FACTION_GOV)
				        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�������ö�ӧҹ�Դ��������!");

					if (playerData[playerid][pLevel] < 5)
					    return SendClientMessage(playerid, COLOR_LIGHTRED, "�س��ͧ Level �ҡ���� 5");
                    
				    if (CopOnline() < 5)
				        return SendClientMessage(playerid, COLOR_LIGHTRED, "��ͧ�� '���Ǩ' �͹�Ź�������������ҧ��û�Ժѵ�˹�ҷ���ҡ���� '5 ��'");

                    COCAINEData[i][COCAINEOn] = 1;
	                ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
	                StartProgress(playerid, 100, 0, i);
					COCAINETake[playerid] = 1;
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 209.9630,-225.6056,1.7786))
        {
            Dialog_Show(playerid, DIALOG_COCAINE, DIALOG_STYLE_TABLIST_HEADERS, "[��¡���Ѻ����]", "\
				������¡��\t�Ҥ�\n\
				"#COCAINENAME"\t{FF0000}$1,500", "���", "�͡");
        }
	}
	return 1;
}

Dialog:DIALOG_COCAINE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, COCAINENAME);
			    new price = ammo*750;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�����"#COCAINENAME"����㹵�����");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â��"#COCAINENAME" {00FF00}%d {FFFFFF}��", FormatMoney(price), ammo);
				Inventory_Remove(playerid, COCAINENAME, ammo);
		    }
		}
	}
	return 1;
}

PlayerCOCAINEUnfreeze(playerid, number)
{
	/*new wanted = randomEx(1, 2);
	switch(wanted)
	{
	    case 2:
		{
			GivePlayerWanted(playerid, 1);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[��դ���] {FFFFFF}�س�Դ������Фس��"#COCAINENAME"");
		}
	}*/
	ClearAnimations(playerid);
	
	COCAINETake[playerid] = 0;
	COCAINEData[number][COCAINEOn] = 0;

    if (CopOnline() < 3)
    	return SendClientMessage(playerid, COLOR_LIGHTRED, "��ͧ�� '���Ǩ' �͹�Ź��ҡ���� '3 ��'");

	Inventory_Add(playerid, COCAINENAME, 1);
	GivePlayerExp(playerid, 10);
	SendClientMessage(playerid, COLOR_WHITE, "�س���Ѻ {FF0000}"#COCAINENAME" +1");
	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	if(COCAINETake[playerid] == 1)
		PlayerCOCAINEUnfreeze(playerid, objectid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(COCAINETake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

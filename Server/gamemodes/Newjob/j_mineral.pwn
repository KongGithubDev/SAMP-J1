#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>
#include	<strlib>

#define     MAX_T_OREPS		    	20
#define     OREPS_OBJ_ID       	    15069
#define     OREPS_TEXT           	"{FFA84D}[ ��� ] \n{FFFFFF}�� [ N ] ������"

#define		OREPS_TIMER_CREATE	    1

#define		POS_PROCESS_OREPS		620.4846,894.4778,-37.1285
#define		PICKUP_PROCESS_OREPS	1239

#define		OREPS_AMONT			    1

enum OREPS_DATA
{
    OREPSID,
    OREPSOBJ,
    Float: OREPSPos[6],
    Text3D: OREPS3D,
    OREPS3DMSG[80],
    OREPSStatus,
    OREPSAmount
};
 
static const OREPSData[MAX_T_OREPS][OREPS_DATA] =
{
	{ 0, OREPS_OBJ_ID, { 572.542419, 896.754699, -44.284481, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 1, OREPS_OBJ_ID, { 567.136657, 879.811035, -44.629650, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 2, OREPS_OBJ_ID, { 553.789733, 859.715759, -44.023452, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 3, OREPS_OBJ_ID, { 569.159423, 846.102844, -43.154628, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 4, OREPS_OBJ_ID, { 555.950378, 848.508117, -43.318752, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 5, OREPS_OBJ_ID, { 567.381835, 866.425598, -44.345874, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 6, OREPS_OBJ_ID, { 556.281250, 876.157226, -44.470211, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 7, OREPS_OBJ_ID, { 554.284484, 892.485107, -44.167675, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 8, OREPS_OBJ_ID, { 540.405517, 907.219787, -43.960937, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 9, OREPS_OBJ_ID, { 558.390502, 907.060791, -43.960937, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 10, OREPS_OBJ_ID, { 562.327514, 920.543090, -43.960937, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 11, OREPS_OBJ_ID, { 577.488220, 924.405456, -43.960937, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 12, OREPS_OBJ_ID, { 589.608642, 910.866210, -44.693668, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 13, OREPS_OBJ_ID, { 589.417358, 891.971069, -45.641883, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 14, OREPS_OBJ_ID, { 607.201965, 890.539489, -44.738147, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 15, OREPS_OBJ_ID, { 618.552185, 879.716003, -43.960937, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 16, OREPS_OBJ_ID, { 638.942626, 886.569458, -43.953437, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 17, OREPS_OBJ_ID, { 645.621154, 868.886901, -43.364830, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 18, OREPS_OBJ_ID, { 662.547485, 862.407409, -43.614273, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT },
	{ 19, OREPS_OBJ_ID, { 650.943725, 847.164978, -43.960937, 0.00000, 0.00000, 0.00000 }, Text3D: INVALID_3DTEXT_ID, OREPS_TEXT, 0, OREPS_AMONT }
	
};

hook OnPlayerDisconnect(playerid, reason)
{
	SetPVarInt(playerid, "OREPSProcess", 0);
	if(GetPVarInt(playerid, "OREPSPicking") == 1)
    {
		SetPVarInt(playerid, "OREPSPicking", 0);

		new playerOREPSID = GetPVarInt(playerid, "playerOREPSID");
		OREPSData[playerOREPSID][OREPSStatus] = 0;

		SetPVarInt(playerid, "playerOREPSID", -1);
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(OREPSData); i++)
	{
		OREPSData[i][OREPSID] = CreateDynamicObject(OREPSData[i][OREPSOBJ], OREPSData[i][OREPSPos][0], OREPSData[i][OREPSPos][1], OREPSData[i][OREPSPos][2], OREPSData[i][OREPSPos][3], OREPSData[i][OREPSPos][4], OREPSData[i][OREPSPos][5]);
		OREPSData[i][OREPS3D] = CreateDynamic3DTextLabel(OREPSData[i][OREPS3DMSG], COLOR_GREEN, OREPSData[i][OREPSPos][0], OREPSData[i][OREPSPos][1], OREPSData[i][OREPSPos][2]+1.5, 15.0);
	}
	CreateDynamicPickup(PICKUP_PROCESS_OREPS, 23, POS_PROCESS_OREPS);
	CreateDynamic3DTextLabel("[ Procress ]\n{FFFFFF}�� [ N ] ������ʷ", COLOR_ORANGE, POS_PROCESS_OREPS, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, POS_PROCESS_OREPS))
		{
            if(GetPVarInt(playerid, "OREPSPicking") == 0 && GetPVarInt(playerid, "OREPSProcess") == 0)
            {
                new amount = Inventory_Count(playerid, "���");
                if(amount <= 0) return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {FFFFFF}�س����� ��� �ҡ������Ѻ��ʷ");

                SetPVarInt(playerid, "OREPSProcess", 1);
                TogglePlayerControllable(playerid, false);
                ApplyAnimation(playerid, "BD_FIRE", "WASH_UP", 4.0, 1, 0, 0, 0, 0, 1);
                
                StartProgress(playerid, 150, 0, 0);
                SendClientMessage(playerid, COLOR_RED, "[ ����͹ ] {FFFFFF}�ҡ��ͧ���¡��ԡ �� N �ա����");
                return 1;
            }
            else
            {
                SetPVarInt(playerid, "OREPSProcess", 0);
                TogglePlayerControllable(playerid, true);

                SendClientMessage(playerid, COLOR_RED, "[ ����͹ ] {FFFFFF}�س��¡��ԡ�����ʷ����");
                StopProgress(playerid);        
			}
		}
		for(new i = 0; i < sizeof OREPSData; i++)
		{
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(OREPSData[i][OREPSID], x, y, z);

			if(IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z))
			{
                if(IsValidDynamicObject(OREPSData[i][OREPSID]) && OREPSData[i][OREPSStatus] == 0)
                {
                    if(GetPVarInt(playerid, "OREPSPicking") == 0)
                    {
						new ammo = Inventory_Count(playerid, "���");
                    	if(Inventory_Count(playerid, "���") >= 50) // 200��ͨ�����ѹ�ѹ��������Ѻ������
                       		return SendClientMessageEx(playerid, COLOR_RED, "%d/50 �������", ammo);

                        if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
                            return SendClientMessage(playerid, COLOR_RED, "[ ����͹ ] {FFFFFF} �س��ͧ���������ҹ��˹�");

						if (Inventory_Items(playerid) >= playerData[playerid][pMaxItem])
							return SendClientMessageEx(playerid, COLOR_RED, "[ ����͹ ] {FFFFFF}�����آͧ�����������§�� (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

                        OREPSData[i][OREPSStatus] = 1;
                        SetPVarInt(playerid, "playerOREPSID", i);
                        SetPVarInt(playerid, "OREPSPicking", 1);
						
                        TogglePlayerControllable(playerid, false);
		                ApplyAnimation(playerid, "BASEBALL", "Bat_1", 4.1, 1, 0, 0, 1, 0, 1);
                        StartProgress(playerid, 10, 0, 0);
                        return 1;
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_RED, "[ ����͹ ] {FFFFFF}�س���ѧ�ش����ѹ�������");
                    }
                }
			}
        }
    }
	return 1;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(GetPVarInt(playerid, "OREPSPicking") == 1)
	{
        ApplyAnimation(playerid, "BASEBALL", "Bat_1", 4.1, 1, 0, 0, 1, 0, 1);
    }
    if(GetPVarInt(playerid, "OREPSProcess") == 1)
    {
        ApplyAnimation(playerid, "BD_FIRE", "WASH_UP", 4.0, 1, 0, 0, 0, 0, 1);
    }
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressFinish(playerid, objectid)
{
    if(GetPVarInt(playerid, "OREPSPicking") == 1)
	{
		new number = GetPVarInt(playerid, "playerOREPSID");
		OREPSData[number][OREPSAmount] -= 1;
		
		// �����ӹǹ��� (1-3 ���)
		new randOre = random(3) + 1;

		// ����Ңͧ��������ѧ
		new ammo = Inventory_Count(playerid, "���");
		if(ammo + randOre > 50)
		{
			SendClientMessageEx(playerid, COLOR_RED, "%d/50 �������", ammo);
			TogglePlayerControllable(playerid, true);   
			ClearAnimations(playerid);                  
			OREPSData[number][OREPSStatus] = 0;        
			SetPVarInt(playerid, "OREPSPicking", 0);  
			SetPVarInt(playerid, "playerOREPSID", -1);
			return 1;
		}

		// �����ͧ����
		Inventory_Add(playerid, "���", randOre);

		// ��ͤ�������͹
		SendClientMessageEx(playerid, COLOR_GREEN, "[ ����͹ ] {FFFFFF}�س���Ѻ {00FF00}��� +%d", randOre);

		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);

		UpdateDynamic3DTextLabelText(OREPSData[number][OREPS3D], COLOR_GREEN, sprintf("{FF0000}[ ��� ] \n{FFFFFF}�� [ N ] ������%d", OREPSData[number][OREPSAmount]));
		if(OREPSData[number][OREPSAmount] <= 0)
		{
			SetDynamicObjectPos(OREPSData[number][OREPSID], OREPSData[number][OREPSPos][0], OREPSData[number][OREPSPos][1], OREPSData[number][OREPSPos][2] - 50);
			DestroyDynamic3DTextLabel(OREPSData[number][OREPS3D]);
			defer CreateOREPSOBJ(number);
		}
		OREPSData[number][OREPSStatus] = 0;

		SetPVarInt(playerid, "OREPSPicking", 0);
		SetPVarInt(playerid, "playerOREPSID", -1);
	}
	if(GetPVarInt(playerid, "OREPSProcess") == 1)
	{
		new amount = Inventory_Count(playerid, "���");
		if(amount < 2)
		{
			SendClientMessage(playerid, COLOR_RED, "[ ����͹ ] {FFFFFF}�س�� ��� ��������Ѻ�����ʷ");
			SetPVarInt(playerid, "OREPSProcess", 0);
			TogglePlayerControllable(playerid, true);
			return 1;
		}
		else
		{
			new rand = randomEx(1, 200);
			new ore[24];
			switch(rand)
			{
				case 1..100: format(ore, sizeof(ore), "�������ͧ"); 
				case 101..120: format(ore, sizeof(ore), "�������"); 
				case 121..150: format(ore, sizeof(ore), "�����"); 
				case 151..200: format(ore, sizeof(ore), "���ᴧ");
			}

			if (Inventory_Count(playerid, ore) >= 50)
			{
				SendClientMessageEx(playerid, COLOR_RED, "[ ����͹ ] {FFFFFF}%s �ͧ�س�ú���� 50 ��� �������ö��ʷ������", ore);
				SetPVarInt(playerid, "OREPSProcess", 0);
				TogglePlayerControllable(playerid, true);
				return 1;
			}

			Inventory_Remove(playerid, "���", 2);
			Inventory_Add(playerid, ore, 1);
			SendClientMessage(playerid, -1, "{FF0000}[ ����͹ ] {FFFFFF}�س������ (���) - 2");
			SendClientMessageEx(playerid, -1, "{00FF00}[ ����͹ ] {FFFFFF}�س���Ѻ (%s) + 1", ore);
			StartProgress(playerid, 50, 0, 0);
		}
    }
	return Y_HOOKS_CONTINUE_RETURN_0;
}

timer CreateOREPSOBJ[OREPS_TIMER_CREATE*60000](number)
{
    if(OREPSData[number][OREPSAmount] <= 0)
    {
		SetDynamicObjectPos(OREPSData[number][OREPSID], OREPSData[number][OREPSPos][0], OREPSData[number][OREPSPos][1], OREPSData[number][OREPSPos][2]);
        OREPSData[number][OREPS3D] = CreateDynamic3DTextLabel(OREPSData[number][OREPS3DMSG], COLOR_GREEN, OREPSData[number][OREPSPos][0], OREPSData[number][OREPSPos][1], OREPSData[number][OREPSPos][2]+1.5, 10.0);
        OREPSData[number][OREPSAmount] = OREPS_AMONT;
    }
    return 0;
}

Dialog:DIALOG_SELLMINING1(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "�������ͧ");
				new price = ammo*priceMining1;
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ MARKET ] {FFFFFF}�س����� �������ͧ ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKET ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� �������ͧ {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "�������ͧ" , ammo);
		    }
		}
	}
	return 1;
}

Dialog:DIALOG_SELLMINING2(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "�������");
				new price = ammo*priceMining2;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ MARKET ] {FFFFFF}�س����� ������� ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKET ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� ������� {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "�������" , ammo);
		    }
		}
	}
	return 1;
}

Dialog:DIALOG_SELLMINING3(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "�����");
				new price = ammo*priceMining3;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ MARKET ] {FFFFFF}�س����� ����� ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKET ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� ����� {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "�����" , ammo);
		    }
		}
	}
	return 1;
}

Dialog:DIALOG_SELLMINING4(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "���ᴧ");
				new price = ammo*priceMining4;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ MARKET ] {FFFFFF}�س����� ���ᴧ ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKET ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� ���ᴧ {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "���ᴧ" , ammo);
		    }
		}
	}
	return 1;
} 
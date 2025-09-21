#include	<YSI_Coding\y_hooks>

#define 	TIMEMsJOBFISH 120 

new PlayerText:Ms_FISHING[MAX_PLAYERS][7];
new bool:OpenUIMsFISHING[MAX_PLAYERS];
new FISHINGProgsee[MAX_PLAYERS];

new Float:fishPoint[][] = {
	{289.6868,-2334.9065,-0.1309}
};

new fishSystemData[][] = {
	{ "��ҷ�" },
	{ "�������͹" },
	{ "��ҹ��" },
	{ "��" },
	{ "���" }
};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(fishPoint); i++) {
	    CreateDynamic3DTextLabel("��������� �� {FFFF00}[N]", COLOR_WHITE, fishPoint[i][0], fishPoint[i][1], fishPoint[i][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);
	}
    return 1;
}

hook OnPlayerConnect(playerid){
    OpenUIMsFISHING[playerid] = false;
    FISHINGProgsee[playerid] = 0;
    return 1;
}

CreateUIMsFISHING(playerid){
	Ms_FISHING[playerid][0] = CreatePlayerTextDraw(playerid, 89.000000, 147.000000, "Ms_AUTOFISHING:Ms_FISHING");
	PlayerTextDrawFont(playerid, Ms_FISHING[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Ms_FISHING[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Ms_FISHING[playerid][0], 137.000000, 222.000000);
	PlayerTextDrawSetOutline(playerid, Ms_FISHING[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Ms_FISHING[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Ms_FISHING[playerid][0], 1);
	PlayerTextDrawColor(playerid, Ms_FISHING[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_FISHING[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Ms_FISHING[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Ms_FISHING[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Ms_FISHING[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_FISHING[playerid][0], 0);

	Ms_FISHING[playerid][1] = CreatePlayerTextDraw(playerid, 146.000000, 216.000000, "100");
	PlayerTextDrawFont(playerid, Ms_FISHING[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, Ms_FISHING[playerid][1], 0.237498, 0.899999);
	PlayerTextDrawTextSize(playerid, Ms_FISHING[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Ms_FISHING[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, Ms_FISHING[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Ms_FISHING[playerid][1], 2);
	PlayerTextDrawColor(playerid, Ms_FISHING[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_FISHING[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Ms_FISHING[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Ms_FISHING[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, Ms_FISHING[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_FISHING[playerid][1], 0);

	Ms_FISHING[playerid][2] = CreatePlayerTextDraw(playerid, 182.000000, 239.000000, "0");
	PlayerTextDrawFont(playerid, Ms_FISHING[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, Ms_FISHING[playerid][2], 0.237498, 0.899999);
	PlayerTextDrawTextSize(playerid, Ms_FISHING[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Ms_FISHING[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, Ms_FISHING[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Ms_FISHING[playerid][2], 1);
	PlayerTextDrawColor(playerid, Ms_FISHING[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_FISHING[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Ms_FISHING[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Ms_FISHING[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, Ms_FISHING[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_FISHING[playerid][2], 0);

	Ms_FISHING[playerid][3] = CreatePlayerTextDraw(playerid, 182.000000, 263.000000, "0");
	PlayerTextDrawFont(playerid, Ms_FISHING[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, Ms_FISHING[playerid][3], 0.237498, 0.899999);
	PlayerTextDrawTextSize(playerid, Ms_FISHING[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Ms_FISHING[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, Ms_FISHING[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Ms_FISHING[playerid][3], 1);
	PlayerTextDrawColor(playerid, Ms_FISHING[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_FISHING[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Ms_FISHING[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, Ms_FISHING[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, Ms_FISHING[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_FISHING[playerid][3], 0);

	Ms_FISHING[playerid][4] = CreatePlayerTextDraw(playerid, 182.000000, 287.000000, "0");
	PlayerTextDrawFont(playerid, Ms_FISHING[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, Ms_FISHING[playerid][4], 0.237498, 0.899999);
	PlayerTextDrawTextSize(playerid, Ms_FISHING[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Ms_FISHING[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, Ms_FISHING[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Ms_FISHING[playerid][4], 1);
	PlayerTextDrawColor(playerid, Ms_FISHING[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_FISHING[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Ms_FISHING[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, Ms_FISHING[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, Ms_FISHING[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_FISHING[playerid][4], 0);

	Ms_FISHING[playerid][5] = CreatePlayerTextDraw(playerid, 182.000000, 312.000000, "0");
	PlayerTextDrawFont(playerid, Ms_FISHING[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, Ms_FISHING[playerid][5], 0.237498, 0.899999);
	PlayerTextDrawTextSize(playerid, Ms_FISHING[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Ms_FISHING[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, Ms_FISHING[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Ms_FISHING[playerid][5], 1);
	PlayerTextDrawColor(playerid, Ms_FISHING[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_FISHING[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Ms_FISHING[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, Ms_FISHING[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Ms_FISHING[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_FISHING[playerid][5], 0);

	Ms_FISHING[playerid][6] = CreatePlayerTextDraw(playerid, 182.000000, 337.000000, "0");
	PlayerTextDrawFont(playerid, Ms_FISHING[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, Ms_FISHING[playerid][6], 0.237498, 0.899999);
	PlayerTextDrawTextSize(playerid, Ms_FISHING[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Ms_FISHING[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, Ms_FISHING[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Ms_FISHING[playerid][6], 1);
	PlayerTextDrawColor(playerid, Ms_FISHING[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_FISHING[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Ms_FISHING[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, Ms_FISHING[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, Ms_FISHING[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_FISHING[playerid][6], 0);
}

jobfishUI_User(playerid, Show = false) {
    if(Show) {
        new string[256];        
        new bait = Inventory_Count(playerid, "������");
        CreateUIMsFISHING(playerid);
        format(string, sizeof(string), "%d", bait);           
        PlayerTextDrawSetString(playerid, Ms_FISHING[playerid][1], string);      
        OpenUIMsFISHING[playerid] = true;
		for (new s = 0; s < 7; s ++) PlayerTextDrawShow(playerid, Ms_FISHING[playerid][s]);
    }
    else {
        OpenUIMsFISHING[playerid] = false;
		for (new s = 0; s < 7; s ++) PlayerTextDrawDestroy(playerid, Ms_FISHING[playerid][s]);
    }
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
    if(newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
    {
        if (IsPlayerNearFishPoint(playerid)){
			if (!Inventory_HasItem(playerid, "�紵����"))
			    return SendClientMessage(playerid, COLOR_RED, "[JOB]  {FFFFFF}�س����� '�紵����'");
			if (!Inventory_HasItem(playerid, "������"))
			    return SendClientMessage(playerid, COLOR_RED, "[JOB]  {FFFFFF}�س����� '������'");

            if (OpenUIMsFISHING[playerid] == false){
                jobfishUI_User(playerid, true);
                FISHINGProgsee[playerid] = 1;
                TogglePlayerControllable(playerid, 0);          
                StartProgress(playerid, TIMEMsJOBFISH, 0, playerid);
            } else{
                jobfishUI_User(playerid, false);
                ClearAnimations(playerid);
                TogglePlayerControllable(playerid, 1);
                FISHINGProgsee[playerid] = 0;
                RemovePlayerAttachedObject(playerid, 9);
                StopProgress(playerid);
            }
        }
    }
    return 1;
}

stock IsPlayerNearFishPoint(playerid) {
	for(new x = 0; x < sizeof(fishPoint); x ++) {
	    if(IsPlayerInRangeOfPoint(playerid, 40.0, fishPoint[x][0], fishPoint[x][1], fishPoint[x][2])) {
	        return 1;
		}
	}
	return 0;
}

UnfreezeJobFishAuto(playerid)
{
    new string[256];
	
    Inventory_Remove(playerid, "������", 1);
    new bait = Inventory_Count(playerid, "������");
    format(string, sizeof(string), "%d", bait);           
    PlayerTextDrawSetString(playerid, Ms_FISHING[playerid][1], string);
    StartProgress(playerid, TIMEMsJOBFISH, 0, playerid);

	new effect = random(5);
	switch (effect)
	{
		case 0:
		{
			if (Inventory_Count(playerid, "��ҷ�") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}�س�� '��ҷ�' �ú '50' ������� �������ö��������");

            Inventory_Add(playerid, "��ҷ�", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}�س���Ѻ {00FF00}��ҷ� +1");
			GivePlayerExp(playerid, 5);
		}
		case 1:
	    {
			if (Inventory_Count(playerid, "�������͹") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}�س�� '�������͹' �ú '50' ������� �������ö��������");

            Inventory_Add(playerid, "�������͹", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}�س���Ѻ {00FF00}�������͹ +1");    
			GivePlayerExp(playerid, 5);        
		}
		case 2:
	    {
			if (Inventory_Count(playerid, "��ҹ��") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}�س�� '��ҹ��' �ú '50' ������� �������ö��������");

            Inventory_Add(playerid, "��ҹ��", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}�س���Ѻ {00FF00}��ҹ�� +1");  
			GivePlayerExp(playerid, 5);          
		}   
		case 3:
	    {
			if (Inventory_Count(playerid, "��") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}�س�� '��' �ú '50' ������� �������ö��������");

            Inventory_Add(playerid, "��", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}�س���Ѻ {00FF00}�� +1");  
			GivePlayerExp(playerid, 5);          
		}   
		case 4:
	    {
			if (Inventory_Count(playerid, "���") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}�س�� '���' �ú '50' ������� �������ö��������");

            Inventory_Add(playerid, "���", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}�س���Ѻ {00FF00}��� +1");  
			GivePlayerExp(playerid, 5);          
		}        
	}
	if (!Inventory_HasItem(playerid, "������")){
        jobfishUI_User(playerid, false);
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 1);
        FISHINGProgsee[playerid] = 0;
        RemovePlayerAttachedObject(playerid, 1);
        StopProgress(playerid);
    }
	if (!Inventory_HasItem(playerid, "�紵����")){
        jobfishUI_User(playerid, false);
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 1);
        FISHINGProgsee[playerid] = 0;
        StopProgress(playerid);
        RemovePlayerAttachedObject(playerid, 1);
    }    
	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	if(FISHINGProgsee[playerid] == 1)
		UnfreezeJobFishAuto(playerid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(FISHINGProgsee[playerid] == 1)
	{
		ApplyAnimation(playerid, "SWORD", "sword_block", 50.0, 0, 1, 0, 1, 1);
		SetPlayerAttachedObject(playerid, 9, 18632, 6, 0.100999, 0.035999, 0.000000, 25.999969, 170.699920, -176.099914, 1.000000, 1.000000, 1.000000);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}

RefreshFishingItem(playerid)
{
	new str[32];

	for (new i=0;i<sizeof(fishSystemData);i++)
	{
		new totalFish = Inventory_Count(playerid, fishSystemData[i]);
		format(str, 32, "%d", totalFish);
		PlayerTextDrawSetString(playerid, Ms_FISHING[playerid][i+2], str);
	}
}

Dialog:DIALOG_SELLFISHING1(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "��ҷ�");
				new price = ammo*pricefish1;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {FFFFFF}�س����� ��ҷ� ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� ��ҷ� {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "��ҷ�" , ammo);
		    }
		}
	}
	return 1;
}

Dialog:DIALOG_SELLFISHING2(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "�������͹");
				new price = ammo*pricefish2;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {FFFFFF}�س����� �������͹ ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� �������͹ {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "�������͹" , ammo);
		    }
		}
	}
	return 1;
}

Dialog:DIALOG_SELLFISHING3(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "��ҹ��");
				new price = ammo*pricefish3;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {FFFFFF}�س����� ��ҹ�� ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� ��ҹ�� {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "��ҹ��" , ammo);
		    }
		}
	}
	return 1;
}

Dialog:DIALOG_SELLFISHING4(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "��");
				new price = ammo*pricefish4;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {FFFFFF}�س����� �� ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� �� {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "��" , ammo);
		    }
		}
	}
	return 1;
}

Dialog:DIALOG_SELLFISHING5(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "���");
				new price = ammo*pricefish5;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {FFFFFF}�س����� ��� ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� ��� {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "���" , ammo);
		    }
		}
	}
	return 1;
}
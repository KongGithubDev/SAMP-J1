#include	<YSI_Coding\y_hooks>

#define 	TIMEMsJOBFISH 120 

new PlayerText:Ms_FISHING[MAX_PLAYERS][7];
new bool:OpenUIMsFISHING[MAX_PLAYERS];
new FISHINGProgsee[MAX_PLAYERS];

new Float:fishPoint[][] = {
	{289.6868,-2334.9065,-0.1309}
};

new fishSystemData[][] = {
	{ "ปลาทู" },
	{ "ปลาแซลม่อน" },
	{ "ปลานิล" },
	{ "ปู" },
	{ "กุ้ง" }
};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(fishPoint); i++) {
	    CreateDynamic3DTextLabel("ตกปลาออโต้ กด {FFFF00}[N]", COLOR_WHITE, fishPoint[i][0], fishPoint[i][1], fishPoint[i][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);
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
        new bait = Inventory_Count(playerid, "เหยื่อ");
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
			if (!Inventory_HasItem(playerid, "เบ็ดตกปลา"))
			    return SendClientMessage(playerid, COLOR_RED, "[JOB]  {FFFFFF}คุณไม่มี 'เบ็ดตกปลา'");
			if (!Inventory_HasItem(playerid, "เหยื่อ"))
			    return SendClientMessage(playerid, COLOR_RED, "[JOB]  {FFFFFF}คุณไม่มี 'เหยื่อ'");

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
	
    Inventory_Remove(playerid, "เหยื่อ", 1);
    new bait = Inventory_Count(playerid, "เหยื่อ");
    format(string, sizeof(string), "%d", bait);           
    PlayerTextDrawSetString(playerid, Ms_FISHING[playerid][1], string);
    StartProgress(playerid, TIMEMsJOBFISH, 0, playerid);

	new effect = random(5);
	switch (effect)
	{
		case 0:
		{
			if (Inventory_Count(playerid, "ปลาทู") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}คุณมี 'ปลาทู' ครบ '50' ตัวแล้ว ไม่สามารถเก็บเพิ่มได้");

            Inventory_Add(playerid, "ปลาทู", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}คุณได้รับ {00FF00}ปลาทู +1");
			GivePlayerExp(playerid, 5);
		}
		case 1:
	    {
			if (Inventory_Count(playerid, "ปลาแซลม่อน") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}คุณมี 'ปลาแซลม่อน' ครบ '50' ตัวแล้ว ไม่สามารถเก็บเพิ่มได้");

            Inventory_Add(playerid, "ปลาแซลม่อน", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}คุณได้รับ {00FF00}ปลาแซลม่อน +1");    
			GivePlayerExp(playerid, 5);        
		}
		case 2:
	    {
			if (Inventory_Count(playerid, "ปลานิล") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}คุณมี 'ปลานิล' ครบ '50' ตัวแล้ว ไม่สามารถเก็บเพิ่มได้");

            Inventory_Add(playerid, "ปลานิล", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}คุณได้รับ {00FF00}ปลานิล +1");  
			GivePlayerExp(playerid, 5);          
		}   
		case 3:
	    {
			if (Inventory_Count(playerid, "ปู") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}คุณมี 'ปู' ครบ '50' ตัวแล้ว ไม่สามารถเก็บเพิ่มได้");

            Inventory_Add(playerid, "ปู", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}คุณได้รับ {00FF00}ปู +1");  
			GivePlayerExp(playerid, 5);          
		}   
		case 4:
	    {
			if (Inventory_Count(playerid, "กุ้ง") >= 50)
                return SendClientMessage(playerid, COLOR_RED, "[JOB] {FFFFFF}คุณมี 'กุ้ง' ครบ '50' ตัวแล้ว ไม่สามารถเก็บเพิ่มได้");

            Inventory_Add(playerid, "กุ้ง", 1);
            SendClientMessage(playerid, COLOR_GREEN, "[JOB]  {ffffff}คุณได้รับ {00FF00}กุ้ง +1");  
			GivePlayerExp(playerid, 5);          
		}        
	}
	if (!Inventory_HasItem(playerid, "เหยื่อ")){
        jobfishUI_User(playerid, false);
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 1);
        FISHINGProgsee[playerid] = 0;
        RemovePlayerAttachedObject(playerid, 1);
        StopProgress(playerid);
    }
	if (!Inventory_HasItem(playerid, "เบ็ดตกปลา")){
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
			    new ammo = Inventory_Count(playerid, "ปลาทู");
				new price = ammo*pricefish1;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ปลาทู อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ปลาทู {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ปลาทู" , ammo);
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
			    new ammo = Inventory_Count(playerid, "ปลาแซลม่อน");
				new price = ammo*pricefish2;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ปลาแซลม่อน อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ปลาแซลม่อน {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ปลาแซลม่อน" , ammo);
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
			    new ammo = Inventory_Count(playerid, "ปลานิล");
				new price = ammo*pricefish3;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ปลานิล อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ปลานิล {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ปลานิล" , ammo);
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
			    new ammo = Inventory_Count(playerid, "ปู");
				new price = ammo*pricefish4;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ปู อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ปู {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ปู" , ammo);
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
			    new ammo = Inventory_Count(playerid, "กุ้ง");
				new price = ammo*pricefish5;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี กุ้ง อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย กุ้ง {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "กุ้ง" , ammo);
		    }
		}
	}
	return 1;
}
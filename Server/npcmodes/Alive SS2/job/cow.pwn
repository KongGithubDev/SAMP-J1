#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     COWOBJECT       	19833
#define     COWTEXT           	"Objective: {FFFFFF}วัว\nกดปุ่ม {FFFF00}N {FFFFFF}เพื่อฆ่า!"
#define     COWNAME             "Beef"
#define		COWTIMER			10

static cowTake[MAX_PLAYERS];
static cowMeat[MAX_PLAYERS];
static cowCutMeat[MAX_PLAYERS];

enum COW_DATA
{
    cowID,
    cowObject,
    Float: cowPosX,
	Float: cowPosY,
	Float: cowPosZ,
    Float: cowPosRotX,
	Float: cowPosRotY,
	Float: cowPosRotZ,
    Text3D: cow3D,
    cow3DMSG[80],
    cowOn
};
new const cowData[][COW_DATA] =
{
	{ INVALID_STREAMER_ID, COWOBJECT, -930.01276, -531.18152, 24.95411, 0.00000, 0.00000, 60.23994, Text3D: INVALID_3DTEXT_ID, COWTEXT, 0 },
	{ INVALID_STREAMER_ID, COWOBJECT, -922.19482, -529.74524, 24.95411, 0.00000, 0.00000, 19.79998, Text3D: INVALID_3DTEXT_ID, COWTEXT, 0 },
	{ INVALID_STREAMER_ID, COWOBJECT, -922.58936, -536.64032, 24.95411, 0.00000, 0.00000, -45.48000, Text3D: INVALID_3DTEXT_ID, COWTEXT, 0 },
	{ INVALID_STREAMER_ID, COWOBJECT, -926.11890, -536.45496, 24.95411, 0.00000, 0.00000, 96.41994, Text3D: INVALID_3DTEXT_ID, COWTEXT, 0 },
	{ INVALID_STREAMER_ID, COWOBJECT, -926.92047, -531.61273, 24.95411, 0.00000, 0.00000, -35.34002, Text3D: INVALID_3DTEXT_ID, COWTEXT, 0 }
};

hook OnPlayerConnect(playerid)
{
	cowMeat[playerid] = 0;
	cowCutMeat[playerid] = 0;
	cowTake[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (cowTake[playerid] != 0)
	{
		if (cowData[ProgressObject[playerid]][cowOn] == 1)
		{
			cowData[ProgressObject[playerid]][cowOn] = 0;
			StopProgress(playerid);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(cowData); i++)
	{
		cowData[i][cowID] = CreateDynamicObject(cowData[i][cowObject], cowData[i][cowPosX], cowData[i][cowPosY], cowData[i][cowPosZ], cowData[i][cowPosRotX], cowData[i][cowPosRotY], cowData[i][cowPosRotZ]);
		cowData[i][cow3D] = CreateDynamic3DTextLabel(cowData[i][cow3DMSG], COLOR_GREEN, cowData[i][cowPosX], cowData[i][cowPosY], cowData[i][cowPosZ] + 1.5, 5.0);
	}
	CreateDynamicPickup(1239, 23, -956.6041, -503.3005, 27.4829);
	CreateDynamic3DTextLabel("แร่เนื้อ:{FFFFFF} วัว\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการแร่"#COWNAME"", COLOR_GREEN, -956.6041, -503.3005, 27.4829, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	CreateDynamicPickup(1239, 23, 1114.8167,-1444.6161,15.7969);
	CreateDynamic3DTextLabel("ร้านค้า:{FFFFFF} วัว\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการขาย"#COWNAME"", COLOR_GREEN, 1114.8167,-1444.6161,15.7969, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof cowData; i++)
        {
            GetDynamicObjectPos(cowData[i][cowID], cowData[i][cowPosX], cowData[i][cowPosY], cowData[i][cowPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, cowData[i][cowPosX], cowData[i][cowPosY], cowData[i][cowPosZ]))
            {
                if(IsValidDynamicObject(cowData[i][cowID]) && cowData[i][cowOn] == 0)
                {
					if(cowMeat[playerid] == 1)
						return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีวัวอยู่แล้ว นำไปแร่ก่อน!");

					cowData[i][cowOn] = 1;
					ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
					StartProgress(playerid, 50, 0, i);
					cowTake[playerid] = 1;
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, -956.6041,-503.3005,27.4829))
        {
		    if(cowMeat[playerid] == 1)
		    {
				cowCutMeat[playerid] = 1;
				cowMeat[playerid] = 0;
                ApplyAnimation(playerid, "INT_SHOP", "shop_cashier", 4.0, 1, 0, 0, 0, 0, 1);
				StartProgress(playerid, 50, 0, INVALID_OBJECT_ID);
            }
            else
            {
                SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีซากวัวอยู่ในตัว");
            }
        }
        else if (IsPlayerInRangeOfPoint(playerid, 2.5, 1114.8167,-1444.6161,15.7969))
        {
            Dialog_Show(playerid, DIALOG_SELLCOW, DIALOG_STYLE_TABLIST_HEADERS, "[รายการรับซื้อ]", "\
				ชื่อรายการ\tราคา\n\
				"#COWNAME"\t{00FF00}$%d", "ขาย", "ออก", CowCash);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLCOW(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, COWNAME);
			    new price = ammo*CowCash;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มี"#COWNAME"อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย"#COWNAME" {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, COWNAME, ammo);
		    }
		}
	}
	return 1;
}

PlayerCutCowMeatUnfreeze(playerid)
{
	cowCutMeat[playerid] = 0;
    RemovePlayerAttachedObject(playerid, 1);
    RemovePlayerAttachedObject(playerid, 2);
	ClearAnimations(playerid);
	
    Inventory_Add(playerid, COWNAME, 1);
	GivePlayerExp(playerid, 20);
	SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}"#COWNAME" +1{FFFFFF} ชิ้น");
	return 1;
}

PlayerCowUnfreeze(playerid, number)
{
	new hour, minute, second;
	gettime(hour, minute, second);
	printf("[%02d:%02d:%02d] Unfreeze %s cowID %d", hour, minute, second, GetPlayerNameEx(playerid), cowData[number][cowID]);
	cowMeat[playerid] = 1;
    SetPlayerAttachedObject(playerid, 1, 2805,1,0.000000,-0.225000,0.000000,0.000000,88.300033,0.000000,1.000000,1.000000,1.000000);
    SetPlayerAttachedObject(playerid, 2, 2804,6,0.277999,-0.027000,0.071999,4.499979,-5.999972,-81.900062,1.000000,1.000000,1.000000);
	SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ซากวัว +1{FFFFFF} นำไปแร่ซะ");
	ClearAnimations(playerid);

	cowData[number][cowOn] = 0;
	cowTake[playerid] = 0;
}

hook OnProgressFinish(playerid, objectid)
{
	if(cowTake[playerid] == 1)
		PlayerCowUnfreeze(playerid, objectid);

	if(cowCutMeat[playerid] == 1)
		PlayerCutCowMeatUnfreeze(playerid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(cowTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(cowCutMeat[playerid] == 1)
	{
		ApplyAnimation(playerid, "INT_SHOP", "shop_cashier", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

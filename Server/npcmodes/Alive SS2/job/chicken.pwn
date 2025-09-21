#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     CHICKENOBJECT       1451
#define     CHICKENTEXT         "Objective: {FFFFFF}ไก่\nกดปุ่ม {FFFF00}N {FFFFFF}เพื่อฆ่า!"
#define     CHICKENNAME         "Chicken"
#define		CHICKENTIMER		10

static chickenTake[MAX_PLAYERS];
static chickenMeat[MAX_PLAYERS];
static chickenCutMeat[MAX_PLAYERS];

enum CHICKEN_DATA
{
    chickenID,
    chickenObject,
    Float: chickenPosX,
	Float: chickenPosY,
	Float: chickenPosZ,
    Float: chickenPosRotX,
	Float: chickenPosRotY,
	Float: chickenPosRotZ,
    Text3D: chicken3D,
    chicken3DMSG[80],
    chickenOn
};
new const chickenData[][CHICKEN_DATA] =
{
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1382.55835, -1504.63831, 101.85750,   0.00000, 0.00000, 270.09821, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1382.55835, -1507.83826, 101.87750,   0.00000, 0.00000, 270.09821, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1382.55835, -1510.91846, 101.91750,   0.00000, 0.00000, 270.09821, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1382.55835, -1513.79834, 101.95750,   0.00000, 0.00000, 270.09821, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1382.55835, -1516.95825, 101.95750,   0.00000, 0.00000, 270.09821, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1382.55835, -1519.99829, 101.95750,   0.00000, 0.00000, 270.09821, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1392.55115, -1522.91736, 101.77750,   0.00000, 0.00000, 90.37550, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1382.55835, -1522.77832, 101.95750,   0.00000, 0.00000, 270.09821, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1392.53113, -1520.13831, 101.77750,   0.00000, 0.00000, 90.37550, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1392.53113, -1517.13831, 101.77750,   0.00000, 0.00000, 90.37550, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1392.53235, -1514.23828, 101.77750,   0.00000, 0.00000, 90.26590, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1392.53113, -1511.09827, 101.77750,   0.00000, 0.00000, 89.56340, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1392.53113, -1507.99829, 101.75750,   0.00000, 0.00000, 89.56340, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 },
	{ INVALID_STREAMER_ID, CHICKENOBJECT, -1392.53113, -1504.85828, 101.75750,   0.00000, 0.00000, 89.56340, Text3D: INVALID_3DTEXT_ID, CHICKENTEXT, 0 }
};

hook OnPlayerConnect(playerid)
{
	chickenTake[playerid] = 0;
	chickenMeat[playerid] = 0;
	chickenCutMeat[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (chickenTake[playerid] != 0)
	{
		if (chickenData[ProgressObject[playerid]][chickenOn] == 1)
		{
			chickenData[ProgressObject[playerid]][chickenOn] = 0;
			StopProgress(playerid);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(chickenData); i++)
	{
		chickenData[i][chickenID] = CreateDynamicObject(chickenData[i][chickenObject], chickenData[i][chickenPosX], chickenData[i][chickenPosY], chickenData[i][chickenPosZ], chickenData[i][chickenPosRotX], chickenData[i][chickenPosRotY], chickenData[i][chickenPosRotZ]);
		chickenData[i][chicken3D] = CreateDynamic3DTextLabel(chickenData[i][chicken3DMSG], COLOR_GREEN, chickenData[i][chickenPosX], chickenData[i][chickenPosY], chickenData[i][chickenPosZ] + 1.5, 5.0);
	}
	CreateDynamicPickup(1239, 23, -1336.2587,-1451.7659,103.6752);
	CreateDynamic3DTextLabel("แร่เนื้อ:{FFFFFF} ไก่\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการแร่"#CHICKENNAME"", COLOR_GREEN, -1336.2587,-1451.7659,103.6752, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	CreateDynamicPickup(1239, 23, 1114.8081,-1450.8354,15.7969);
	CreateDynamic3DTextLabel("ร้านค้า:{FFFFFF} ไก่\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการขาย"#CHICKENNAME"", COLOR_GREEN, 1114.8081,-1450.8354,15.7969, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof chickenData; i++)
        {
            GetDynamicObjectPos(chickenData[i][chickenID], chickenData[i][chickenPosX], chickenData[i][chickenPosY], chickenData[i][chickenPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, chickenData[i][chickenPosX], chickenData[i][chickenPosY], chickenData[i][chickenPosZ]))
            {
                if(IsValidDynamicObject(chickenData[i][chickenID]) && chickenData[i][chickenOn] == 0)
                {
					if(chickenMeat[playerid] == 1)
						return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีซากไก่อยู่แล้ว นำไปแร่ก่อน!");

					chickenData[i][chickenOn] = 1;
					ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
					StartProgress(playerid, 50, 0, i);
					chickenTake[playerid] = 1;
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, -1336.2587,-1451.7659,103.6752))
        {
		    if(chickenMeat[playerid] == 1)
		    {
		        chickenMeat[playerid] = 0;
				chickenCutMeat[playerid] = 1;
                ApplyAnimation(playerid, "INT_SHOP", "shop_cashier", 4.0, 1, 0, 0, 0, 0, 1);
				StartProgress(playerid, 50, 0, INVALID_OBJECT_ID);
            }
            else
            {
                SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีซากไก่อยู่ในตัว");
            }
        }
        else if (IsPlayerInRangeOfPoint(playerid, 2.5, 1114.8081,-1450.8354,15.7969))
        {
            Dialog_Show(playerid, DIALOG_SELLCHICK, DIALOG_STYLE_TABLIST_HEADERS, "[รายการรับซื้อ]", "\
				ชื่อรายการ\tราคา\n\
				"#CHICKENNAME"\t{00FF00}$%d", "ขาย", "ออก", CKCash);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLCHICK(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, CHICKENNAME);
			    new price = ammo*CKCash;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มี"#CHICKENNAME"อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย"#CHICKENNAME" {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, CHICKENNAME, ammo);
		    }
		}
	}
	return 1;
}

PlayerCutChickMeatUnfreeze(playerid)
{
	chickenCutMeat[playerid] = 0;
    RemovePlayerAttachedObject(playerid, 2);
	ClearAnimations(playerid);
	
    Inventory_Add(playerid, CHICKENNAME, 1);
	GivePlayerExp(playerid, 20);
	SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}"#CHICKENNAME" +1{FFFFFF} ชิ้น");
	return 1;
}

PlayerChickUnfreeze(playerid, number)
{
	chickenMeat[playerid] = 1;
    SetPlayerAttachedObject(playerid, 2, 2804,6,0.277999,-0.027000,0.071999,4.499979,-5.999972,-81.900062,1.000000,1.000000,1.000000);
	SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ซากไก่ +1{FFFFFF} นำไปแร่ซะ");
	ClearAnimations(playerid);

	chickenData[number][chickenOn] = 0;
	chickenTake[playerid] = 0;
	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	if(chickenTake[playerid] == 1)
		PlayerChickUnfreeze(playerid, objectid);

	if(chickenCutMeat[playerid] == 1)
		PlayerCutChickMeatUnfreeze(playerid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(chickenTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(chickenCutMeat[playerid] == 1)
	{
		ApplyAnimation(playerid, "INT_SHOP", "shop_cashier", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

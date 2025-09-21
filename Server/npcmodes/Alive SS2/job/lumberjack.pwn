#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     WOODOBJECT       	727
#define     WOODTEXT           	"Objective: {FFFFFF}ต้นไม้\nกดปุ่ม {FFFF00}N {FFFFFF}เพื่อตัดต้นไม้!"
#define     WOODNAME            "Woods"
#define		WOODTIMER			10

static woodTake[MAX_PLAYERS];
static woodCut[MAX_PLAYERS];
static woodCutChange[MAX_PLAYERS];
static woodDrop[MAX_PLAYERS];

enum WOOD_DATA
{
    woodID,
    woodObject,
    Float: woodPosX,
	Float: woodPosY,
	Float: woodPosZ,
	Float: woodPosRotX,
	Float: woodPosRotY,
	Float: woodPosRotZ,
    Text3D: wood3D,
    wood3DMSG[80],
    woodOn
};
new const woodData[][WOOD_DATA] =
{
	{ INVALID_STREAMER_ID, WOODOBJECT, -525.63513, -147.27882, 74.06760,   0.00000, 0.00000, 0.00000, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -540.97101, -161.62750, 77.16000,   -6.00000, 0.00000, 0.00000, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -578.14050, -150.97729, 76.50000,   0.00000, 0.00000, 0.00000, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -487.58411, -147.80020, 73.46900,   -8.00000, 11.00000, 42.09540, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -555.72113, -52.52490, 62.94000,   0.00000, 0.00000, 0.00000, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -537.65381, -128.23129, 68.52000,   -10.00000, 0.00000, 0.00000, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -522.64038, -111.51510, 63.00000,   -15.00000, 0.00000, 1.87760, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -460.59619, -82.46150, 58.81120,   0.00000, 0.00000, 1.87760, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -471.86560, -140.47279, 70.40000,   -19.00000, 0.00000, 1.87760, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -557.86292, -135.69380, 72.22000,   -10.00000, 19.22000, 51.00000, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -499.34741, -130.68381, 67.68000,   -20.00000, 0.00000, 1.87760, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -445.62219, -118.85800, 61.59940,   0.00000, 18.00000, 2.00000, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -488.29630, -99.09050, 60.88000,   -8.00000, 0.00000, 1.87760, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -549.12457, -98.11770, 62.60000,   0.00000, 0.00000, 0.00000, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 },
	{ INVALID_STREAMER_ID, WOODOBJECT, -523.27222, -65.35170, 61.37090,   0.00000, 0.00000, 0.00000, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0 }
};

hook OnPlayerConnect(playerid)
{
	woodTake[playerid] = 0;
	woodCut[playerid] = 0;
	woodCutChange[playerid] = 0;
	woodDrop[playerid] = INVALID_OBJECT_ID;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (woodTake[playerid] != 0)
	{
		if (woodData[ProgressObject[playerid]][woodOn] == 1)
		{
			woodData[ProgressObject[playerid]][woodOn] = 0;
			StopProgress(playerid);
		}
	}
	DestroyDynamicObject(woodDrop[playerid]);
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(woodData); i++)
	{
		woodData[i][woodID] = CreateDynamicObject(woodData[i][woodObject], woodData[i][woodPosX], woodData[i][woodPosY], woodData[i][woodPosZ], woodData[i][woodPosRotX], woodData[i][woodPosRotY], woodData[i][woodPosRotZ]);
		woodData[i][wood3D] = CreateDynamic3DTextLabel(woodData[i][wood3DMSG], COLOR_GREEN, woodData[i][woodPosX], woodData[i][woodPosY], woodData[i][woodPosZ] + 1.5, 5.0);
	}
	CreateDynamicPickup(1239, 23, -534.9971,-179.3291,78.4047);
	CreateDynamic3DTextLabel("โรงไม้:{FFFFFF} แปรรูปท่อนไม้\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการแปรรูปท่อนไม้", COLOR_GREEN, -534.9971,-179.3291,78.4047, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	CreateDynamicPickup(1239, 23, -537.9170,-177.3017,78.4047);
	CreateDynamic3DTextLabel("โรงไม้:{FFFFFF} แปรรูปท่อนไม้\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการแปรรูปท่อนไม้", COLOR_GREEN, -537.9170,-177.3017,78.4047, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	CreateDynamicPickup(1239, 23, -534.8915,-174.9744,78.4047);
	CreateDynamic3DTextLabel("โรงไม้:{FFFFFF} แปรรูปท่อนไม้\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการแปรรูปท่อนไม้", COLOR_GREEN, -534.8915,-174.9744,78.4047, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	CreateDynamicPickup(1239, 23, -531.7052,-177.2744,78.4047);
	CreateDynamic3DTextLabel("โรงไม้:{FFFFFF} แปรรูปท่อนไม้\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการแปรรูปท่อนไม้", COLOR_GREEN, -531.7052,-177.2744,78.4047, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	CreateDynamicPickup(1239, 23, 1114.8434,-1457.2538,15.7969);
	CreateDynamic3DTextLabel("ร้านค้า:{FFFFFF} "#WOODNAME"\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการขาย"#WOODNAME"", COLOR_GREEN, 1114.8434,-1457.2538,15.7969, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
		for(new i = 0; i < sizeof woodData; i++)
        {
            GetDynamicObjectPos(woodData[i][woodID], woodData[i][woodPosX], woodData[i][woodPosY], woodData[i][woodPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, woodData[i][woodPosX], woodData[i][woodPosY], woodData[i][woodPosZ]))
            {
                if(IsValidDynamicObject(woodData[i][woodID]) && woodData[i][woodOn] == 0)
                {
					if (!Inventory_HasItem(playerid, "Hacksaw"))
						return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีเลื่อยตัดไม้อยู่ในตัวเลย");

					if (woodCut[playerid] == 1)
						return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีท่อนไม้อยู่แล้ว นำไปแปรรูปก่อน!");

					woodData[i][woodOn] = 1;
					SetPlayerAttachedObject(playerid, 1, 341, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.0, 1, 0, 0, 0, 0, 1);
					StartProgress(playerid, 50, 0, i);
					woodTake[playerid] = 1;
					break;
                }
            }
		}
        if (IsPlayerInRangeOfPoint(playerid, 2.5, -534.9971,-179.3291,78.4047))
        {
		    if(woodCut[playerid] == 1)
		    {
		        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

		        RemovePlayerAttachedObject(playerid, 1);
				woodCutChange[playerid] = 1;
				woodCut[playerid] = 0;

				SetPlayerPos(playerid, -534.9971,-179.3291,78.4047);
				SetPlayerFacingAngle(playerid, 180.4837);

			    SetPlayerAttachedObject(playerid, 1, 341, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
			    ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.0, 1, 0, 0, 0, 0, 1);

				woodDrop[playerid] = CreateDynamicObject(19793, -534.97510, -180.16000, 78.40880, 0.0, 0.0, 0.0);
				Streamer_Update(playerid);

				StartProgress(playerid, 50, 0, woodDrop[playerid]);
            }
            else
            {
                SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีท่อนไม้อยู่ในตัว");
            }
        }
        else if (IsPlayerInRangeOfPoint(playerid, 2.5, -537.9170,-177.3017,78.4047))
        {
		    if(woodCut[playerid] == 1)
		    {
		        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

		        RemovePlayerAttachedObject(playerid, 1);
				woodCutChange[playerid] = 1;
				woodCut[playerid] = 0;

				SetPlayerPos(playerid, -537.9170,-177.3017,78.4047);
				SetPlayerFacingAngle(playerid, 90.2428);

			    SetPlayerAttachedObject(playerid, 1, 341, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
			    ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.0, 1, 0, 0, 0, 0, 1);

                woodDrop[playerid] = CreateDynamicObject(19793, -538.73651, -177.29829, 78.41420, 0.00000, 0.00000, 90.00000);
				Streamer_Update(playerid);

				StartProgress(playerid, 50, 0, woodDrop[playerid]);
            }
            else
            {
                SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีท่อนไม้อยู่ในตัว");
            }
        }
        else if (IsPlayerInRangeOfPoint(playerid, 2.5, -534.8915,-174.9744,78.4047))
        {
		    if(woodCut[playerid] == 1)
		    {
		        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

		        RemovePlayerAttachedObject(playerid, 1);
				woodCutChange[playerid] = 1;
				woodCut[playerid] = 0;

				SetPlayerPos(playerid, -534.8915,-174.9744,78.4047);
				SetPlayerFacingAngle(playerid, 0.9419);

			    SetPlayerAttachedObject(playerid, 1, 341, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
			    ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.0, 1, 0, 0, 0, 0, 1);

                woodDrop[playerid] = CreateDynamicObject(19793, -534.88959, -174.08141, 78.41430, 0.0, 0.0, 0.0);
				Streamer_Update(playerid);

				StartProgress(playerid, 50, 0, woodDrop[playerid]);
            }
            else
            {
                SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีท่อนไม้อยู่ในตัว");
            }
        }
        else if (IsPlayerInRangeOfPoint(playerid, 2.5, -531.7052,-177.2744,78.4047))
        {
		    if(woodCut[playerid] == 1)
		    {
		        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

		        RemovePlayerAttachedObject(playerid, 1);
				woodCutChange[playerid] = 1;
				woodCut[playerid] = 0;

				SetPlayerPos(playerid, -531.7052,-177.2744,78.4047);
				SetPlayerFacingAngle(playerid, 270.0744);

			    SetPlayerAttachedObject(playerid, 1, 341, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
			    ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.0, 1, 0, 0, 0, 0, 1);

				woodDrop[playerid] = CreateDynamicObject(19793, -530.91602, -177.28149, 78.41360, 0.00000, 0.00000, 90.00000);
				Streamer_Update(playerid);

				StartProgress(playerid, 50, 0, woodDrop[playerid]);
            }
            else
            {
                SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีท่อนไม้อยู่ในตัว");
            }
        }
        else if (IsPlayerInRangeOfPoint(playerid, 2.5, 1114.8434,-1457.2538,15.7969))
        {
            Dialog_Show(playerid, DIALOG_SELLWOOD, DIALOG_STYLE_TABLIST_HEADERS, "[รายการรับซื้อ]", "\
				ชื่อรายการ\tราคา\n\
				"#WOODNAME"\t{00FF00}$%d", "ขาย", "ออก", WoodCash);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLWOOD(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, WOODNAME);
			    new price = ammo*WoodCash;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มี"#WOODNAME"อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย"#WOODNAME" {00FF00}%d {FFFFFF}ท่อน", FormatMoney(price), ammo);
				Inventory_Remove(playerid, WOODNAME, ammo);
		    }
		}
	}
	return 1;
}

PlayerChangeWoodUnfreeze(playerid)
{
    RemovePlayerAttachedObject(playerid, 1);
    DestroyDynamicObject(woodDrop[playerid]);

	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	ClearAnimations(playerid);
	
	woodCutChange[playerid] = 0;
	woodCut[playerid] = 0;
	woodDrop[playerid] = INVALID_OBJECT_ID;

    Inventory_Add(playerid, WOODNAME, 1);
	GivePlayerExp(playerid, 20);
	SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}"#WOODNAME" +1{FFFFFF} ท่อน");
	return 1;
}

PlayerWoodUnfreeze(playerid, number)
{
	new hour, minute, second;
	gettime(hour, minute, second);
	printf("[%02d:%02d:%02d] Unfreeze %s woodID %d", hour, minute, second, GetPlayerNameEx(playerid), woodData[number][woodID]);
	
	woodCut[playerid] = 1;
	woodTake[playerid] = 0;
	RemovePlayerAttachedObject(playerid, 1);
	SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}Woods +1{FFFFFF} นำไปแปรรูปซะ");
	ClearAnimations(playerid);

	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	SetPlayerAttachedObject(playerid, 1, 19793, 6, 0.077999, 0.043999, -0.170999, -13.799953, 79.70, 0.0);
	
	woodData[number][woodOn] = 0;
}

hook OnProgressFinish(playerid, objectid)
{
	if(woodTake[playerid] == 1)
		PlayerWoodUnfreeze(playerid, objectid);

	if(woodCutChange[playerid] == 1)
		PlayerChangeWoodUnfreeze(playerid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(woodTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(woodCutChange[playerid] == 1)
	{
		ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

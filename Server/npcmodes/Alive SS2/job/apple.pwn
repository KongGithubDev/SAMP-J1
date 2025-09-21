#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     APPLEOBJECT       	717
#define     APPLETEXT         	"Objective: {FFFFFF}แอปเปิ้ล\nกดปุ่ม {FFFF00}N {FFFFFF}เพื่อเก็บแอปเปิ้ล!"
#define     APPLENAME           "Apple"
#define		APPLETIMER			10

static appleTake[MAX_PLAYERS];

enum APPLE_DATA
{
    appleID,
    appleObject,
    Float: applePosX,
	Float: applePosY,
	Float: applePosZ,
    Text3D: apple3D,
    apple3DMSG[80],
    appleOn
};
new const appleData[][APPLE_DATA] =
{
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1117.64026, -1261.82129, 125.59157, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1117.64026, -1268.58130, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1117.64026, -1275.28125, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1117.64026, -1282.04138, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1111.48035, -1261.82129, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1111.66040, -1268.58130, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1111.86035, -1275.28125, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1112.04028, -1282.04138, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1105.48035, -1261.82129, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1105.66040, -1268.58130, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1105.78027, -1275.28125, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 },
	{ INVALID_STREAMER_ID, APPLEOBJECT, -1105.78027, -1282.04138, 125.59160, Text3D: INVALID_3DTEXT_ID, APPLETEXT, 0 }
};

hook OnPlayerConnect(playerid)
{
	appleTake[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (appleTake[playerid] != 0)
	{
		if (appleData[ProgressObject[playerid]][appleOn] == 1)
		{
			appleData[ProgressObject[playerid]][appleOn] = 0;
			StopProgress(playerid);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(appleData); i++)
	{
		appleData[i][appleID] = CreateDynamicObject(appleData[i][appleObject], appleData[i][applePosX], appleData[i][applePosY], appleData[i][applePosZ], 0.00000, 0.00000, 0.00000);
		appleData[i][apple3D] = CreateDynamic3DTextLabel(appleData[i][apple3DMSG], COLOR_GREEN, appleData[i][applePosX], appleData[i][applePosY], appleData[i][applePosZ] + 3.5, 5.0);
	}
	CreateDynamicPickup(1239, 23, 1124.1899,-1445.1256,15.7969);
	CreateDynamic3DTextLabel("ร้านค้า:{FFFFFF} "#APPLENAME"\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการขาย"#APPLENAME"", COLOR_GREEN, 1124.1899,-1445.1256,15.7969, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof appleData; i++)
        {
            GetDynamicObjectPos(appleData[i][appleID], appleData[i][applePosX], appleData[i][applePosY], appleData[i][applePosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, appleData[i][applePosX], appleData[i][applePosY], appleData[i][applePosZ] + 3.5))
            {
                if(IsValidDynamicObject(appleData[i][appleID]) && appleData[i][appleOn] == 0)
				{
                    appleData[i][appleOn] = 1;
	                ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 0, 0, 1);
					StartProgress(playerid, 100, 0, i);
					appleTake[playerid] = 1;
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 1124.1899,-1445.1256,15.7969))
        {
            Dialog_Show(playerid, DIALOG_SELLAPPLE, DIALOG_STYLE_TABLIST_HEADERS, "[รายการรับซื้อ]", "\
				ชื่อรายการ\tราคา\n\
				"#APPLENAME"\t{00FF00}$%d", "ขาย", "ออก", MarketCash[5]);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLAPPLE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, APPLENAME);
			    new price = ammo*MarketCash[5];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มี"#APPLENAME"อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย"#APPLENAME" {00FF00}%d {FFFFFF}ลูก", FormatMoney(price), ammo);
				Inventory_Remove(playerid, APPLENAME, ammo);
		    }
		}
	}
	return 1;
}

PlayerAppleUnfreeze(playerid, number)
{
	ClearAnimations(playerid);
	appleData[number][appleOn] = 0;
	appleTake[playerid] = 0;

    Inventory_Add(playerid, APPLENAME, 1);
	GivePlayerExp(playerid, 20);
	SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}"#APPLENAME" +1{FFFFFF}");
	return 1;
}
hook OnProgressFinish(playerid, objectid)
{
	if(appleTake[playerid] == 1)
		PlayerAppleUnfreeze(playerid, objectid);
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(appleTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_WOOD        15
#define     WOODOBJECT      1463 // โมเดลไม้
#define     WOODTEXT        "{FFFFFF}กด {00FF00}N {FFFFFF}เพื่อเก็บไม้"
#define     WOODNAME        "เศษไม้"

static WoodTake[MAX_PLAYERS];

enum WOOD_DATA {
    woodID,
    woodObject,
    Float: woodPos[3],
    Text3D: wood3D,
    wood3DMSG[80],
    woodOn
};

// ข้อมูลไม้
new const woodData[MAX_WOOD][WOOD_DATA] = {
    {0, WOODOBJECT, {-553.4666,-145.0333,76.3573}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {1, WOODOBJECT, {-554.8967,-151.8054,77.1376}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {2, WOODOBJECT, {-555.3898,-160.7454,78.1192}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {3, WOODOBJECT, {-563.3995,-160.6192,78.1639}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {4, WOODOBJECT, {-562.9707,-154.2046,77.5596}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {5, WOODOBJECT, {-562.5092,-145.7395,76.6247}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {6, WOODOBJECT, {-570.4342,-143.6340,76.6609}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {7, WOODOBJECT, {-572.5320,-149.5870,77.2258}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {8, WOODOBJECT, {-575.4850,-157.8168,78.0063}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {9, WOODOBJECT, {-584.1594,-161.3616,79.1038}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {10, WOODOBJECT, {-582.8398,-154.1313,78.0924}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {11, WOODOBJECT, {-581.2263,-146.4687,77.2407}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {12, WOODOBJECT, {-572.3961,-140.8936,75.9058}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {13, WOODOBJECT, {-560.1671,-142.0896,75.9447}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0},
    {14, WOODOBJECT, {-550.5973,-143.0593,75.9017}, Text3D: INVALID_3DTEXT_ID, WOODTEXT, 0}
};

// โหลดไม้และ 3D Text ตอน Init
hook OnGameModeInit() {
    for(new i = 0; i < MAX_WOOD; i++) {
        woodData[i][woodID] = CreateDynamicObject(woodData[i][woodObject], woodData[i][woodPos][0], woodData[i][woodPos][1], woodData[i][woodPos][2], 0.0, 0.0, 0.0);
        woodData[i][wood3D] = CreateDynamic3DTextLabel(woodData[i][wood3DMSG], COLOR_GREEN, woodData[i][woodPos][0], woodData[i][woodPos][1], woodData[i][woodPos][2] + 1.5, 5.0);
    }
    return 1;
}

// รีเซ็ตตัวผู้เล่น
hook OnPlayerSpawn(playerid){
    WoodTake[playerid] = 0;
    return 1;
}

// กดเก็บไม้
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
    if(newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
        for(new i = 0; i < MAX_WOOD; i++) {
            new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(woodData[i][woodID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
                if(IsValidDynamicObject(woodData[i][woodID])) {
                    if(WoodTake[playerid] == 0) {
                        new ammo = Inventory_Count(playerid, WOODNAME);
                        if(ammo >= 50)
                            return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);

                        woodData[i][woodOn] = 1;
                        TogglePlayerControllable(playerid, false);
                        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
                        defer PlayerWoodUnfreeze[3*1000](playerid, i);
                        WoodTake[playerid] = 1;
                        StartProgress(playerid, 30, 0, 0);
                        return 1;
                    }
                }
            }
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
				new price = ammo * priceWood;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี เศษไม้ อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKET ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย เศษไม้ {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, WOODNAME , ammo);
		    }
		}
	}
	return 1;
}

// ปลดล็อคและเก็บไม้
timer PlayerWoodUnfreeze[1000](playerid, number){
    PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid);
    WoodTake[playerid] = 0;
    DestroyDynamicObject(woodData[number][woodID]);
    DestroyDynamic3DTextLabel(woodData[number][wood3D]);
    woodData[number][woodOn] = 0;
    defer CreateWoodObject[10000](number);

    new ammo = Inventory_Count(playerid, WOODNAME);
    if(ammo >= 50)
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);
    new id = Inventory_Add(playerid, WOODNAME, 1);
    if(id == -1)
        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");

    SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}เศษไม้ +1");
    return 1;
}

// สร้างไม้ใหม่
timer CreateWoodObject[10000](number){
    woodData[number][woodID] = CreateDynamicObject(woodData[number][woodObject], woodData[number][woodPos][0], woodData[number][woodPos][1], woodData[number][woodPos][2], 0.0, 0.0, 0.0);
    woodData[number][wood3D] = CreateDynamic3DTextLabel(woodData[number][wood3DMSG], COLOR_GREEN, woodData[number][woodPos][0], woodData[number][woodPos][1], woodData[number][woodPos][2] + 1.5, 5.0);
}

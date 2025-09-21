#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_IRON        20
#define     IRONOBJECT      3594 // เปลี่ยนเป็นโมเดลเศษเหล็กที่ต้องการ
#define     IRONTEXT        "{FFFFFF}กด {00FF00}N {FFFFFF}เพื่อเก็บเศษเหล็ก"
#define     IRONNAME        "เศษเหล็ก"

static IronTake[MAX_PLAYERS];

enum IRON_DATA {
    ironID,
    ironObject,
    Float: ironPos[3],
    Text3D: iron3D,
    iron3DMSG[80],
    ironOn
};

// ข้อมูลพิกัดเศษเหล็ก (ตัวอย่าง)
new const ironData[MAX_IRON][IRON_DATA] = {
    {0, IRONOBJECT, {-1673.5465,76.5664,-11.2344}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {1, IRONOBJECT, {-1666.6517,83.9272,-11.2344}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {2, IRONOBJECT, {-1658.0096,93.0484,-11.2344}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {3, IRONOBJECT, {-1649.3585,102.1788,-11.2235}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {4, IRONOBJECT, {-1642.1544,109.2382,-11.2131}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {5, IRONOBJECT, {-1634.9773,116.1216,-11.2113}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {6, IRONOBJECT, {-1627.7456,123.2097,-11.2104}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {7, IRONOBJECT, {-1620.3004,129.8390,-11.2080}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {8, IRONOBJECT, {-1613.4026,136.6309,-11.2125}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {9, IRONOBJECT, {-1606.9220,143.4710,-11.1960}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {10, IRONOBJECT, {-1596.5062,134.5597,-10.5202}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {11, IRONOBJECT, {-1604.3972,128.7371,-11.2266}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {12, IRONOBJECT, {-1611.3417,122.1192,-11.2009}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {13, IRONOBJECT, {-1617.3396,115.9621,-11.2015}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {14, IRONOBJECT, {-1623.7130,109.6206,-11.2014}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {15, IRONOBJECT, {-1630.0474,102.8773,-11.1925}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {16, IRONOBJECT, {-1636.3069,96.5419,-11.1867}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {17, IRONOBJECT, {-1643.4208,89.8511,-11.1889}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {18, IRONOBJECT, {-1649.8070,83.5706,-11.1883}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0},
    {19, IRONOBJECT, {-1657.2577,76.5635,-11.1981}, Text3D: INVALID_3DTEXT_ID, IRONTEXT, 0}
};

// โหลดเศษเหล็กและ 3D Text ตอน Init
hook OnGameModeInit() {
    for(new i = 0; i < MAX_IRON; i++) {
        ironData[i][ironID] = CreateDynamicObject(ironData[i][ironObject], ironData[i][ironPos][0], ironData[i][ironPos][1], ironData[i][ironPos][2], 0.0, 0.0, 0.0);
        ironData[i][iron3D] = CreateDynamic3DTextLabel(ironData[i][iron3DMSG], COLOR_GREEN, ironData[i][ironPos][0], ironData[i][ironPos][1], ironData[i][ironPos][2] + 1.5, 5.0);
    }
    return 1;
}

// รีเซ็ตผู้เล่น
hook OnPlayerSpawn(playerid){
    IronTake[playerid] = 0;
    return 1;
}

// กดเก็บเศษเหล็ก
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
    if(newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
        for(new i = 0; i < MAX_IRON; i++) {
            new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(ironData[i][ironID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
                if(IsValidDynamicObject(ironData[i][ironID])) {
                    if(IronTake[playerid] == 0) {
                        new ammo = Inventory_Count(playerid, IRONNAME);
                        if(ammo >= 50)
                            return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);

                        ironData[i][ironOn] = 1;
                        TogglePlayerControllable(playerid, false);
                        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
                        defer PlayerIronUnfreeze[3*1000](playerid, i);
                        IronTake[playerid] = 1;
                        StartProgress(playerid, 30, 0, 0);
                        return 1;
                    }
                }
            }
        }
    }
    return 1;
}

Dialog:DIALOG_SELLIRON(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, IRONNAME);
				new price = ammo * priceIron;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี เศษเหล็ก อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKET ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย เศษเหล็ก {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, IRONNAME , ammo);
		    }
		}
	}
	return 1;
}

// ปลดล็อคและเก็บเศษเหล็ก
timer PlayerIronUnfreeze[1000](playerid, number){
    PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid);
    IronTake[playerid] = 0;
    DestroyDynamicObject(ironData[number][ironID]);
    DestroyDynamic3DTextLabel(ironData[number][iron3D]);
    ironData[number][ironOn] = 0;
    defer CreateIronObject[10000](number);

    new ammo = Inventory_Count(playerid, IRONNAME);
    if(ammo >= 50)
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);
    new id = Inventory_Add(playerid, IRONNAME, 1);
    if(id == -1)
        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");

    SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}เศษเหล็ก +1");
    return 1;
}

// สร้างเศษเหล็กใหม่
timer CreateIronObject[10000](number){
    ironData[number][ironID] = CreateDynamicObject(ironData[number][ironObject], ironData[number][ironPos][0], ironData[number][ironPos][1], ironData[number][ironPos][2], 0.0, 0.0, 0.0);
    ironData[number][iron3D] = CreateDynamic3DTextLabel(ironData[number][iron3DMSG], COLOR_GREEN, ironData[number][ironPos][0], ironData[number][ironPos][1], ironData[number][ironPos][2] + 1.5, 5.0);
}

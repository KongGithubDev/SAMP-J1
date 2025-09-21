
#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_FISH                (7)

static fishTake[MAX_PLAYERS];

enum FISH_DATA
{
    fishID,
    Float: fishPosX,
	Float: fishPosY,
	Float: fishPosZ,
	Float: fishPosA,
    Text3D: fish3D,
    fishPickup
};
new const fishData[MAX_FISH][FISH_DATA] =
{
	{ 0, 403.7578, -2088.7981, 7.8359, 173.1471, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 1, 396.0985, -2088.7979, 7.8359, 183.8005, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 2, 383.3300, -2088.7959, 7.8359, 177.8471, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 3, 369.7913, -2088.7942, 7.8359, 172.8337, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 4, 362.1161, -2088.7971, 7.8359, 183.1738, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 5, 409.1762, -2083.8491, 7.8359, 272.7881, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 6, 349.9218, -2083.8589, 7.8301, 91.3664, Text3D: INVALID_3DTEXT_ID, -1 }
};

hook OnPlayerConnect(playerid)
{
    fishTake[playerid] = 0;
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if (fishTake[playerid] != 0)
    {
		StopProgress(playerid);
    }
    return 1;
}

hook OnGameModeInit()
{
    for(new i = 0; i < sizeof(fishData); i++)
	{
        fishData[i][fishPickup] = CreateDynamicPickup(1239, 23, fishData[i][fishPosX], fishData[i][fishPosY], fishData[i][fishPosZ]);
		fishData[i][fish3D] = CreateDynamic3DTextLabel("Fishing point:{FFFFFF} ตกปลา\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการตกปลา", COLOR_GREEN, fishData[i][fishPosX], fishData[i][fishPosY], fishData[i][fishPosZ], 5.0);
	}
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
		for(new i = 0; i < sizeof(fishData); i++)
		{
		    if (IsPlayerInRangeOfPoint(playerid, 2.5, fishData[i][fishPosX], fishData[i][fishPosY], fishData[i][fishPosZ]))
		    {
                if (!Inventory_HasItem(playerid, "Bait"))
                    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีเหยื่ออยู่ในตัวเลย");

                if (fishTake[playerid] == 1)
                    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณกำลังตกปลาอยู่!");

				SetPlayerPos(playerid, fishData[i][fishPosX], fishData[i][fishPosY], fishData[i][fishPosZ]);
				SetPlayerFacingAngle(playerid, fishData[i][fishPosA]);

				ApplyAnimation(playerid, "SWORD", "sword_block", 50.0, 0, 1, 0, 1, 1);
				SetPlayerAttachedObject(playerid, 0, 18632, 6, 0.079376, 0.037070, 0.007706, 181.482910, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);

				new rand = randomEx(100, 200);
                StartProgress(playerid, rand, 0, INVALID_OBJECT_ID);
	        	fishTake[playerid] = 1;
	        	Inventory_Remove(playerid, "Bait", 1);
	        	SendClientMessage(playerid, COLOR_YELLOW, "[Fishing] {FFFFFF}คุณได้เหวี่ยงเบ็ดเพื่อตกปลา...");
	        	break;
	    	}
		}
		
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 1133.3646,-1438.6182,15.7969))
        {
            Dialog_Show(playerid, DIALOG_SELLFISH, DIALOG_STYLE_TABLIST_HEADERS, "[รายการรับซื้อ]", "\
				ชื่อรายการ\tราคา\n\
				Grouper\t{00FF00}$%d\n\
				Salmon\t{00FF00}$%d\n\
				Stingray\t{00FF00}$%d\n\
				Shark\t{00FF00}$%d", "ขาย", "ออก", MarketCash[6], MarketCash[7], MarketCash[8], MarketCash[9]);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLFISH(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "Grouper");
			    new price = ammo*MarketCash[6];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีGrouperอยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขายGrouper {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "Grouper", ammo);
		    }
	        case 1:
	        {
			    new ammo = Inventory_Count(playerid, "Salmon");
			    new price = ammo*MarketCash[7];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีSalmonอยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขายSalmon {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "Salmon", ammo);
		    }
			case 2:
	        {
			    new ammo = Inventory_Count(playerid, "Stingray");
			    new price = ammo*MarketCash[8];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีStingrayอยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขายStingray {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "Stingray", ammo);
		    }
	        case 3:
	        {
			    new ammo = Inventory_Count(playerid, "Shark");
			    new price = ammo*MarketCash[9];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีSharkอยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขายShark {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "Shark", ammo);
		    }
		}
	}
	return 1;
}

PlayerFishingUnfreeze(playerid)
{
	fishTake[playerid] = 0;
	RemovePlayerAttachedObject(playerid, 0);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	ClearAnimations(playerid);
	new rand = randomEx(1, 75);
	switch(rand)
	{
	    case 1..15: SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}เสียใจด้วย คุณตกไม่ได้ปลาอะไรเลย!");
	    case 16..40:
	    {

            Inventory_Add(playerid, "Grouper", 1);
			GivePlayerExp(playerid, 20);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}Grouper +1{FFFFFF} ตัว");
	    }
	    case 41..60:
	    {
            Inventory_Add(playerid, "Salmon", 1);
			GivePlayerExp(playerid, 20);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}Salmon +1{FFFFFF} ตัว");
	    }
	    case 61..70:
	    {
            Inventory_Add(playerid, "Stingray", 1);
			GivePlayerExp(playerid, 20);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}Stingray +1{FFFFFF} ตัว");
	    }
	    case 71..75:
	    {
            Inventory_Add(playerid, "Shark", 1);
			GivePlayerExp(playerid, 20);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}Shark +1{FFFFFF} ตัว");
	    }
	}
	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	if(fishTake[playerid] == 1)
		PlayerFishingUnfreeze(playerid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(fishTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "SWORD", "sword_block", 50.0, 0, 1, 0, 1, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}

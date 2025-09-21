#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MININGOBJECT       	867
#define     MININGTEXT          "Objective: {FFFFFF}หิน\nกดปุ่ม {FFFF00}N {FFFFFF}เพื่อทุบหิน!"
#define     MININGNAME          "แร่"
#define		MININGTIMER			10

static miningTake[MAX_PLAYERS];

enum MINING_DATA
{
    miningID,
    miningObject,
    Float: miningPosX,
	Float: miningPosY,
	Float: miningPosZ,
    Text3D: mining3D,
    mining3DMSG[80],
    miningOn
};
new const miningData[][MINING_DATA] =
{
	{ INVALID_STREAMER_ID, MININGOBJECT, 670.9289, 924.4347, -40.8362, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 679.2260, 910.9626, -40.2984, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 694.2642, 893.2392, -38.9191, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 679.1199, 859.1469, -42.5630, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 653.2411, 856.3355, -42.8609, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 637.4725, 888.5446, -42.8534, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 610.1895, 929.4417, -40.6701, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 574.6299, 925.5773, -42.8609, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 565.4653, 907.8234, -42.8609, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 562.4312, 883.2036, -43.3480, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 551.3918, 848.2975, -41.9032, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 576.5177, 845.8309, -42.1218, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 604.8858, 816.6300, -42.8534, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 },
	{ INVALID_STREAMER_ID, MININGOBJECT, 637.6296, 839.8778, -42.8609, Text3D: INVALID_3DTEXT_ID, MININGTEXT, 0 }
};

hook OnPlayerConnect(playerid)
{
	miningTake[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (miningTake[playerid] != 0)
	{
		if (miningData[ProgressObject[playerid]][miningOn] == 1)
		{
			miningData[ProgressObject[playerid]][miningOn] = 0;
			StopProgress(playerid);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(miningData); i++)
	{
		miningData[i][miningID] = CreateDynamicObject(miningData[i][miningObject], miningData[i][miningPosX], miningData[i][miningPosY], miningData[i][miningPosZ], 0.0, 0.0, 0.0);
		miningData[i][mining3D] = CreateDynamic3DTextLabel(miningData[i][mining3DMSG], COLOR_GREEN, miningData[i][miningPosX], miningData[i][miningPosY], miningData[i][miningPosZ] + 1.5, 5.0);
	}
	CreateDynamicPickup(1239, 23, 1142.1163,-1447.3569,15.7969);
	CreateDynamic3DTextLabel("ร้านค้า:{FFFFFF} แร่\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการขายแร่", COLOR_GREEN, 1142.1163,-1447.3569,15.7969, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof miningData; i++)
        {
            GetDynamicObjectPos(miningData[i][miningID], miningData[i][miningPosX], miningData[i][miningPosY], miningData[i][miningPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, miningData[i][miningPosX], miningData[i][miningPosY], miningData[i][miningPosZ]))
            {
                if(IsValidDynamicObject(miningData[i][miningID]) && miningData[i][miningOn] == 0)
                {
                    miningData[i][miningOn] = 1;
					SetPlayerAttachedObject(playerid, 3, 19631, 6, 0.048, 0.029, 0.103, -80.0, 80.0, 0.0);
					SetPlayerArmedWeapon(playerid, 0);
					ApplyAnimation(playerid, "BASEBALL", "Bat_1", 4.1, 1, 0, 0, 1, 0, 1);
					StartProgress(playerid, 100, 0, i);
	                miningTake[playerid] = 1;
	                break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 1142.1163,-1447.3569,15.7969))
        {
            Dialog_Show(playerid, DIALOG_SELLMINING, DIALOG_STYLE_TABLIST_HEADERS, "[รายการรับซื้อ]", "\
				ชื่อรายการ\tราคา\n\
				Hematite\t{00FF00}$%d\n\
				Rock Salt\t{00FF00}$%d\n\
				Coal Ore\t{00FF00}$%d\n\
				Uranium Ore\t{00FF00}$%d", "ขาย", "ออก", MarketCash[11], MarketCash[12], MarketCash[13], MarketCash[14]);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLMINING(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "Hematite");
			    new price = ammo*MarketCash[11];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีHematiteอยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขายHematite {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "Hematite", ammo);
		    }
	        case 1:
	        {
			    new ammo = Inventory_Count(playerid, "Rock Salt");
			    new price = ammo*MarketCash[12];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีRock Saltอยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขายRock Salt {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "Rock Salt", ammo);
		    }
	        case 2:
	        {
			    new ammo = Inventory_Count(playerid, "Coal Ore");
			    new price = ammo*MarketCash[13];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีCoal Oreอยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขายCoal Ore {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "Coal Ore", ammo);
		    }
	        case 3:
	        {
			    new ammo = Inventory_Count(playerid, "Uranium Ore");
			    new price = ammo*MarketCash[14];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีUranium Oreอยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขายUranium Ore {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "Uranium Ore", ammo);
		    }
		}
	}
	return 1;
}

PlayerMiningUnfreeze(playerid, number)
{
	new rand = randomEx(1, 200);
	new ore[24];
	switch(rand)
	{
	    case 1..100: ore = "Hematite";
	    case 101..102: ore = "Uranium Ore";
	    case 103..150: ore = "Rock Salt";
	    case 151..200: ore = "Coal Ore";
	}

	ClearAnimations(playerid);
	
	new hour, minute, second;
	gettime(hour, minute, second);
	printf("[%02d:%02d:%02d] Unfreeze %s miningID %d", hour, minute, second, GetPlayerNameEx(playerid), miningData[number][miningID]);
	
	RemovePlayerAttachedObject(playerid, 3);

	miningData[number][miningOn] = 0;

	miningTake[playerid] = 0;
	
    Inventory_Add(playerid, ore, 1);
	GivePlayerExp(playerid, 20);
	SendClientMessageEx(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}%s +1", ore);
	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	if(miningTake[playerid] == 1)
		PlayerMiningUnfreeze(playerid, objectid);
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(miningTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BASEBALL", "Bat_1", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

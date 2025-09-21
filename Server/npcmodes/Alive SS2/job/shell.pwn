#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     SHELLOBJECT       	953
#define     SHELLTEXT           "Objective: {FFFFFF}หอย\nกดปุ่ม {FFFF00}N {FFFFFF}เพื่อก้มเก็บ!"
#define     SHELLNAME           "Shell"
#define		SHELLTIMER			10

new shellTake[MAX_PLAYERS];

enum SHELL_DATA
{
    shellID,
    shellObject,
    Float: shellPosX,
	Float: shellPosY,
	Float: shellPosZ,
    Text3D: shell3D,
    shell3DMSG[80],
    shellOn
};
new const shellData[][SHELL_DATA] =
{
	{ INVALID_STREAMER_ID, SHELLOBJECT, 537.9000200, -1902.8000000, 1.0000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 544.9000200, -1895.3000000, 2.3000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 531.9000200, -1892.7000000, 2.4000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 540.7000100, -1883.0000000, 2.9000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 515.9000200, -1897.5000000, 0.8000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 554.4000200, -1903.5000000, 1.3000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 566.5999800, -1908.4000000, 0.5000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 546.0000000, -1906.8000000, 0.6000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 526.5999800, -1900.6000000, 0.8000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 504.7000100, -1900.4000000, 0.6000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 556.2999900, -1890.3000000, 2.8000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 563.0000000, -1897.8000000, 2.4000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 507.2000100, -1888.7000000, 1.7000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 },
	{ INVALID_STREAMER_ID, SHELLOBJECT, 520.0000000, -1885.6000000, 2.6000000, Text3D: INVALID_3DTEXT_ID, SHELLTEXT, 0 }
};

hook OnPlayerConnect(playerid)
{
	shellTake[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (shellTake[playerid] != 0)
	{
		if (shellData[ProgressObject[playerid]][shellOn] == 1)
		{
			shellData[ProgressObject[playerid]][shellOn] = 0;
			StopProgress(playerid);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(shellData); i++)
	{
		shellData[i][shellID] = CreateDynamicObject(shellData[i][shellObject], shellData[i][shellPosX], shellData[i][shellPosY], shellData[i][shellPosZ], 0.0, 0.0, 0.0);
		shellData[i][shell3D] = CreateDynamic3DTextLabel(shellData[i][shell3DMSG], COLOR_GREEN, shellData[i][shellPosX], shellData[i][shellPosY], shellData[i][shellPosZ] + 1.5, 5.0);
	}
	CreateDynamicPickup(1239, 23, 1133.4604,-1444.7606,15.7969);
	CreateDynamic3DTextLabel("ร้านค้า:{FFFFFF} "#SHELLNAME"\nกดปุ่ม {FFFF00}N{FFFFFF}\nในการขาย"#SHELLNAME"", COLOR_GREEN, 1133.4604,-1444.7606,15.7969, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof shellData; i++)
        {
            GetDynamicObjectPos(shellData[i][shellID], shellData[i][shellPosX], shellData[i][shellPosY], shellData[i][shellPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, shellData[i][shellPosX], shellData[i][shellPosY], shellData[i][shellPosZ]))
            {
                if(IsValidDynamicObject(shellData[i][shellID]) && shellData[i][shellOn] == 0)
                {
                    shellData[i][shellOn] = 1;
					ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
					StartProgress(playerid, 100, 0, i);
					shellTake[playerid] = 1;
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 1133.4604,-1444.7606,15.7969))
        {
            Dialog_Show(playerid, DIALOG_SELLSHELL, DIALOG_STYLE_TABLIST_HEADERS, "[รายการรับซื้อ]", "\
				ชื่อรายการ\tราคา\n\
				"#SHELLNAME"\t{00FF00}$%d", "ขาย", "ออก", MarketCash[10]);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLSHELL(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, SHELLNAME);
			    new price = ammo*MarketCash[10];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มี"#SHELLNAME"อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย"#SHELLNAME" {00FF00}%d {FFFFFF}ฝา", FormatMoney(price), ammo);
				Inventory_Remove(playerid, SHELLNAME, ammo);
		    }
		}
	}
	return 1;
}

PlayerShellUnfreeze(playerid, number)
{
	ClearAnimations(playerid);

	shellData[number][shellOn] = 0;
	shellTake[playerid] = 0;

    Inventory_Add(playerid, SHELLNAME, 1);
	GivePlayerExp(playerid, 15);
    SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}"#SHELLNAME" +1");
	if (playerData[playerid][pQuest] == 1) {
		if (playerData[playerid][pQuestProgress] < 20) {
			playerData[playerid][pQuestProgress]++;
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[ภารกิจ] {FFFFFF}"SHELLNAME" +%d/20", playerData[playerid][pQuestProgress]);
		}
	}
    return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	if(shellTake[playerid] == 1)
		PlayerShellUnfreeze(playerid, objectid);

	// คราฟอาวุธ
	if(shellTake[playerid] == 2)
		PlayerShellUnfreeze2(playerid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(shellTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	// คราฟอาวุธ
	if(shellTake[playerid] == 2)
	{
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

// คราฟอาวุธ
PlayerShellUnfreeze2(playerid)
{
	ClearAnimations(playerid);
	shellTake[playerid] = 0;
	
	if (CraftType[playerid] == 1)
	{
	    playerData[playerid][pMaterials] -= 50;
	    playerData[playerid][pWoods] -= 100;
	    playerData[playerid][pIrons] -= 100;
	    GivePlayerMoneyEx(playerid, -20000);
	    
		new success = random(100);
		switch (success)
		{
		    case 0..49:
		    {
				Inventory_Add(playerid, "Cane", 1);
		    
		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 50");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 100");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 100");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $20,000");
		        SendClientMessage(playerid, COLOR_YELLOW, "คุณได้รับอาวุธ 'Cane' จากการสร้างอาวุธ");
		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		    }
		    case 50..99:
		    {
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 50");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 100");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 100");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $20,000");
		        SendClientMessage(playerid, COLOR_LIGHTRED, "คุณล้มเหลวในการสร้าง 'Cane'");
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		    }
		}
	}

	if (CraftType[playerid] == 2)
	{
	    playerData[playerid][pMaterials] -= 80;
	    playerData[playerid][pWoods] -= 50;
	    playerData[playerid][pIrons] -= 150;
	    GivePlayerMoneyEx(playerid, -30000);

		new success = random(100);
		switch (success)
		{
		    case 0..45:
		    {
				Inventory_Add(playerid, "Pool Cue", 1);

		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 80");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 50");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 150");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $30,000");
		        SendClientMessage(playerid, COLOR_YELLOW, "คุณได้รับอาวุธ 'Pool Cue' จากการสร้างอาวุธ");
		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		    }
		    case 46..99:
		    {
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 80");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 50");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 150");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $30,000");
		        SendClientMessage(playerid, COLOR_LIGHTRED, "คุณล้มเหลวในการสร้าง 'Pool Cue'");
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		    }
		}
	}

	if (CraftType[playerid] == 3)
	{
	    playerData[playerid][pMaterials] -= 100;
	    playerData[playerid][pWoods] -= 200;
	    playerData[playerid][pIrons] -= 200;
	    GivePlayerMoneyEx(playerid, -40000);

		new success = random(100);
		switch (success)
		{
		    case 0..40:
		    {
				Inventory_Add(playerid, "Baseball Bat", 1);

		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 100");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 200");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 200");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $40,000");
		        SendClientMessage(playerid, COLOR_YELLOW, "คุณได้รับอาวุธ 'Baseball Bat' จากการสร้างอาวุธ");
		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		    }
		    case 41..99:
		    {
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 100");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 200");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 200");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $40,000");
		        SendClientMessage(playerid, COLOR_LIGHTRED, "คุณล้มเหลวในการสร้าง 'Baseball Bat'");
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		    }
		}
	}

	if (CraftType[playerid] == 4)
	{
	    playerData[playerid][pMaterials] -= 130;
	    playerData[playerid][pWoods] -= 150;
	    playerData[playerid][pIrons] -= 150;
	    GivePlayerMoneyEx(playerid, -40000);

		new success = random(100);
		switch (success)
		{
		    case 0..35:
		    {
				Inventory_Add(playerid, "Brass Knuckles", 1);

		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 130");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 150");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 150");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $40,000");
		        SendClientMessage(playerid, COLOR_YELLOW, "คุณได้รับอาวุธ 'Brass Knuckles' จากการสร้างอาวุธ");
		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		    }
		    case 36..99:
		    {
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 130");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 150");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 150");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $40,000");
		        SendClientMessage(playerid, COLOR_LIGHTRED, "คุณล้มเหลวในการสร้าง 'Brass Knuckles'");
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		    }
		}
	}

	if (CraftType[playerid] == 5)
	{
	    playerData[playerid][pMaterials] -= 200;
	    playerData[playerid][pWoods] -= 250;
	    playerData[playerid][pIrons] -= 300;
	    GivePlayerMoneyEx(playerid, -50000);

		new success = random(100);
		switch (success)
		{
		    case 0..30:
		    {
				Inventory_Add(playerid, "Golf Club", 1);

		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 200");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 250");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 300");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $50,000");
		        SendClientMessage(playerid, COLOR_YELLOW, "คุณได้รับอาวุธ 'Golf Club' จากการสร้างอาวุธ");
		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		    }
		    case 31..99:
		    {
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 200");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 250");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 300");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $50,000");
		        SendClientMessage(playerid, COLOR_LIGHTRED, "คุณล้มเหลวในการสร้าง 'Golf Club'");
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		    }
		}
	}

	if (CraftType[playerid] == 6)
	{
	    playerData[playerid][pMaterials] -= 200;
	    playerData[playerid][pWoods] -= 250;
	    playerData[playerid][pIrons] -= 300;
	    GivePlayerMoneyEx(playerid, -50000);

		new success = random(100);
		switch (success)
		{
		    case 0..20:
		    {
				Inventory_Add(playerid, "Katana", 1);

		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 200");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 250");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 300");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $50,000");
		        SendClientMessage(playerid, COLOR_YELLOW, "คุณได้รับอาวุธ 'Katana' จากการสร้างอาวุธ");
		        SendClientMessage(playerid, COLOR_GREEN, "|=================================|");
		    }
		    case 21..99:
		    {
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		        SendClientMessage(playerid, -1, "คุณเสีย ดินปืน - 200");
		        SendClientMessage(playerid, -1, "คุณเสีย ไม้ - 250");
		        SendClientMessage(playerid, -1, "คุณเสีย เหล็ก - 300");
		        SendClientMessage(playerid, -1, "คุณเสีย เงินเขียว - $50,000");
		        SendClientMessage(playerid, COLOR_LIGHTRED, "คุณล้มเหลวในการสร้าง 'Katana'");
		        SendClientMessage(playerid, COLOR_RED, "|=================================|");
		    }
		}
	}

    return 1;
}


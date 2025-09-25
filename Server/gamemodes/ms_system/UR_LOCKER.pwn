/*
		Crafting Menu
	UI/Design by M SHOP
	Coded by Emperor
*/
// HandleClickLockerTD(playerid, PlayerText:playertextid)

#include <YSI_Coding\y_hooks>

#define 	MAX_LOCKER_AMOUNT		500  ///สูงสุดต่อชิ้น ในตู้เซฟ

#define		LKX		3.5944  ///X //3.5944,1534.9674,24.0014
#define		LKY		1534.9674  ///Y
#define		LKZ		24.0014  ///Z

new PlayerText:Locker_TD[MAX_PLAYERS][124];
new lockerShow[MAX_PLAYERS];
new lockerPage[MAX_PLAYERS];
new depIndex[MAX_PLAYERS];
new createLockerTD[MAX_PLAYERS];

hook OnGameModeInit()
{
	CreateDynamicPickup(15105, 23,LKX,LKY,LKZ);
	CreateDynamic3DTextLabel("ตู้เซฟ\n{FFFFFF} กด N", COLOR_PINK,LKX,LKY,LKZ, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	return 1;
}
hook OnPlayerConnect(playerid)
{
	lockerShow[playerid] = 0;
	createLockerTD[playerid] = 0;
	CreateBaseLocker(playerid);
	return 1;
}
hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if (lockerShow[playerid])
	{
		if (clickedid == Text:0xFFFF)
		{
			HidePlayerLockerTD(playerid);
		}
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO)
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.5, LKX, LKY, LKZ))
		{
			if (Inventory_Count(playerid, "กุญแจตู้เซฟ") <= 0) return SendClientMessage(playerid, COLOR_RED, "คุณไม่มีกุญแจตู้เซฟ!");

			lockerShow[playerid] = 1;

			Locker_TD[playerid][0] = CreatePlayerTextDraw(playerid, 83.000000, 78.000000, "UR_LOCKER:UR_LOCKER");
			PlayerTextDrawFont(playerid, Locker_TD[playerid][0], 4);
			PlayerTextDrawLetterSize(playerid, Locker_TD[playerid][0], 0.600000, 2.000000);
			PlayerTextDrawTextSize(playerid, Locker_TD[playerid][0], 468.000000, 317.500000);
			PlayerTextDrawSetOutline(playerid, Locker_TD[playerid][0], 1);
			PlayerTextDrawSetShadow(playerid, Locker_TD[playerid][0], 0);
			PlayerTextDrawAlignment(playerid, Locker_TD[playerid][0], 1);
			PlayerTextDrawColor(playerid, Locker_TD[playerid][0], -1);
			PlayerTextDrawBackgroundColor(playerid, Locker_TD[playerid][0], 255);
			PlayerTextDrawBoxColor(playerid, Locker_TD[playerid][0], 50);
			PlayerTextDrawUseBox(playerid, Locker_TD[playerid][0], 1);
			PlayerTextDrawSetProportional(playerid, Locker_TD[playerid][0], 1);
			PlayerTextDrawSetSelectable(playerid, Locker_TD[playerid][0], 0);
			ShowBGLocker(playerid);

			new query[256];
			mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `inventory` WHERE `invOwner` = %d LIMIT 30", playerData[playerid][pID]);
			mysql_tquery(g_SQL, query, "ShowPlayerLockerTD", "ii", playerid, 1);
			SelectTextDraw(playerid, 0xFF0000FF);
		}
	}
	return 1;
}
CreateBaseLocker(playerid)
{
	Locker_TD[playerid][0] = CreatePlayerTextDraw(playerid, 83.000000, 78.000000, "UR_LOCKER:UR_LOCKER");
	PlayerTextDrawFont(playerid, Locker_TD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Locker_TD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Locker_TD[playerid][0], 468.000000, 317.500000);
	PlayerTextDrawSetOutline(playerid, Locker_TD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Locker_TD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Locker_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, Locker_TD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, Locker_TD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Locker_TD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Locker_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Locker_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Locker_TD[playerid][0], 0);

	Locker_TD[playerid][121] = CreatePlayerTextDraw(playerid, 393.000000, 89.000000, "<<");
	PlayerTextDrawFont(playerid, Locker_TD[playerid][121], 2);
	PlayerTextDrawLetterSize(playerid, Locker_TD[playerid][121], 0.174999, 1.250000);
	PlayerTextDrawTextSize(playerid, Locker_TD[playerid][121], 12.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, Locker_TD[playerid][121], 1);
	PlayerTextDrawSetShadow(playerid, Locker_TD[playerid][121], 0);
	PlayerTextDrawAlignment(playerid, Locker_TD[playerid][121], 2);
	PlayerTextDrawColor(playerid, Locker_TD[playerid][121], -1);
	PlayerTextDrawBackgroundColor(playerid, Locker_TD[playerid][121], 255);
	PlayerTextDrawBoxColor(playerid, Locker_TD[playerid][121], 200);
	PlayerTextDrawUseBox(playerid, Locker_TD[playerid][121], 1);
	PlayerTextDrawSetProportional(playerid, Locker_TD[playerid][121], 1);
	PlayerTextDrawSetSelectable(playerid, Locker_TD[playerid][121], 1);

	Locker_TD[playerid][122] = CreatePlayerTextDraw(playerid, 408.000000, 89.000000, "0");
	PlayerTextDrawFont(playerid, Locker_TD[playerid][122], 1);
	PlayerTextDrawLetterSize(playerid, Locker_TD[playerid][122], 0.170833, 1.200000);
	PlayerTextDrawTextSize(playerid, Locker_TD[playerid][122], 310.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Locker_TD[playerid][122], 1);
	PlayerTextDrawSetShadow(playerid, Locker_TD[playerid][122], 0);
	PlayerTextDrawAlignment(playerid, Locker_TD[playerid][122], 2);
	PlayerTextDrawColor(playerid, Locker_TD[playerid][122], -1);
	PlayerTextDrawBackgroundColor(playerid, Locker_TD[playerid][122], 255);
	PlayerTextDrawBoxColor(playerid, Locker_TD[playerid][122], 50);
	PlayerTextDrawUseBox(playerid, Locker_TD[playerid][122], 0);
	PlayerTextDrawSetProportional(playerid, Locker_TD[playerid][122], 1);
	PlayerTextDrawSetSelectable(playerid, Locker_TD[playerid][122], 0);

	Locker_TD[playerid][123] = CreatePlayerTextDraw(playerid, 423.000000, 89.000000, ">>");
	PlayerTextDrawFont(playerid, Locker_TD[playerid][123], 2);
	PlayerTextDrawLetterSize(playerid, Locker_TD[playerid][123], 0.174999, 1.250000);
	PlayerTextDrawTextSize(playerid, Locker_TD[playerid][123], 12.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, Locker_TD[playerid][123], 1);
	PlayerTextDrawSetShadow(playerid, Locker_TD[playerid][123], 0);
	PlayerTextDrawAlignment(playerid, Locker_TD[playerid][123], 2);
	PlayerTextDrawColor(playerid, Locker_TD[playerid][123], -1);
	PlayerTextDrawBackgroundColor(playerid, Locker_TD[playerid][123], 255);
	PlayerTextDrawBoxColor(playerid, Locker_TD[playerid][123], 200);
	PlayerTextDrawUseBox(playerid, Locker_TD[playerid][123], 1);
	PlayerTextDrawSetProportional(playerid, Locker_TD[playerid][123], 1);
	PlayerTextDrawSetSelectable(playerid, Locker_TD[playerid][123], 1);
	PlayerTextDrawShow(playerid, Locker_TD[playerid][0]);
	PlayerTextDrawHide(playerid, Locker_TD[playerid][0]);
	return 1;
}

HandleClickLockerTD(playerid, PlayerText:playertextid)
{
	if (lockerShow[playerid])
	{
		new query[128];
		if (playertextid == Locker_TD[playerid][121])
		{
			if (lockerPage[playerid] <= 1) return 1;
			lockerPage[playerid] = 1;
			ClearLockerItem(playerid);

			mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `lockers` WHERE `ownerid` = %d LIMIT 30", playerData[playerid][pID]);
			mysql_tquery(g_SQL, query, "CreateLockerItem", "ii", playerid, lockerPage[playerid]);
		}
		if (playertextid == Locker_TD[playerid][123])
		{
			if (lockerPage[playerid] >= 2) return 1;
			lockerPage[playerid] = 2;
			mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `lockers` WHERE `ownerid` = %d LIMIT 30 OFFSET 31", playerData[playerid][pID]);
			mysql_tquery(g_SQL, query, "CreateLockerItem", "ii", playerid, lockerPage[playerid]);
		}
		else {
			for (new i=1;i<31;i++)
			{
				if (playertextid == Locker_TD[playerid][i])
				{
					mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `inventory` WHERE `invOwner` = %d", playerData[playerid][pID]);
					mysql_tquery(g_SQL, query, "PutItemToLocker", "ii", playerid, i);
					return 1;
				}
			}
			for (new i=61;i<91;i++)
			{
				if (playertextid == Locker_TD[playerid][i])
				{
					mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM lockers WHERE ownerid = %d", playerData[playerid][pID]);
					mysql_tquery(g_SQL, query, "PutItemToInv", "ii", playerid, i);
					return 1;
				}
			}
		}
	}
	return 1;
}

HidePlayerLockerTD(playerid)
{
	lockerShow[playerid] = 0;
	//new text[128];
	for (new i=0;i<124;i++)
	{
		PlayerTextDrawHide(playerid, Locker_TD[playerid][i]);
		if (i < 121)
			PlayerTextDrawDestroy(playerid, Locker_TD[playerid][i]);
	}
	CancelSelectTextDraw(playerid);
	createLockerTD[playerid] = 0;
	return 1;
}

forward ShowPlayerLockerTD(playerid, first);
public ShowPlayerLockerTD(playerid, first)
{
	lockerPage[playerid] = 1;
	static rows;

	cache_get_row_count(rows);
	CreateInvLocker(playerid, rows, lockerPage[playerid]);
	if (first) 
	{	
		PlayerTextDrawShow(playerid, Locker_TD[playerid][121]);
		PlayerTextDrawShow(playerid, Locker_TD[playerid][122]);
		PlayerTextDrawShow(playerid, Locker_TD[playerid][123]);
	}
	return 1;
}

CreateInvLocker(playerid, count, page)
{
	#pragma unused count
	//ฝั่งกระเป๋า //////////////////////////////////////////////////////
	//item txd
	if (!createLockerTD[playerid])
	{
		new Float:startX = 85.00;	
		new Float:startY = 112.00;	
		
		for (new i=1;i<30+1;i++)
		{
			Locker_TD[playerid][i] = CreatePlayerTextDraw(playerid, startX, startY, "UR_LOCKER:item_0");
			PlayerTextDrawFont(playerid, Locker_TD[playerid][i], 4);
			PlayerTextDrawLetterSize(playerid, Locker_TD[playerid][i], 0.600000, 2.000000);
			PlayerTextDrawTextSize(playerid, Locker_TD[playerid][i], 37.500000, 52.500000);
			PlayerTextDrawSetOutline(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawSetShadow(playerid, Locker_TD[playerid][i], 0);
			PlayerTextDrawAlignment(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawColor(playerid, Locker_TD[playerid][i], -1);
			PlayerTextDrawBackgroundColor(playerid, Locker_TD[playerid][i], 255);
			PlayerTextDrawBoxColor(playerid, Locker_TD[playerid][i], 50);
			PlayerTextDrawUseBox(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawSetProportional(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawSetSelectable(playerid, Locker_TD[playerid][i], 1);
			startX += 38.0;
			if (startX > 275)
			{
				startX = 85.00;
				startY += 54.0;
			}
		}

		//item amount
		startX = 89.00;
		startY = 114.00;
		for (new i=31;i<(30+31);i++)
		{
			Locker_TD[playerid][i] = CreatePlayerTextDraw(playerid, startX, startY, "0/0");
			PlayerTextDrawFont(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawLetterSize(playerid, Locker_TD[playerid][i], 0.141666, 0.850000);
			PlayerTextDrawTextSize(playerid, Locker_TD[playerid][i], 119.500000, 17.000000);
			PlayerTextDrawSetOutline(playerid, Locker_TD[playerid][i], 0);
			PlayerTextDrawSetShadow(playerid, Locker_TD[playerid][i], 0);
			PlayerTextDrawAlignment(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawColor(playerid, Locker_TD[playerid][i], -1);
			PlayerTextDrawBackgroundColor(playerid, Locker_TD[playerid][i], -16776961);
			PlayerTextDrawBoxColor(playerid, Locker_TD[playerid][i], -16777166);
			PlayerTextDrawUseBox(playerid, Locker_TD[playerid][i], 0);
			PlayerTextDrawSetProportional(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawSetSelectable(playerid, Locker_TD[playerid][i], 0);
			startX += 38.0;
			if (startX > 279)
			{
				startX = 89.00;
				startY += 54.0;
			}
		}
	}
	///ตู้เซฟ //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    new query[128];
	if (page == 1)
	{
		mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `lockers` WHERE `ownerid` = %d LIMIT 30", playerData[playerid][pID]);
		mysql_tquery(g_SQL, query, "CreateLockerItem", "ii", playerid, 1);
	}
	else
	{
		mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `lockers` WHERE `ownerid` = %d LIMIT 30 OFFSET 31", playerData[playerid][pID]);
		mysql_tquery(g_SQL, query, "CreateLockerItem", "ii", playerid, 2);

	}

    mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `inventory` WHERE `invOwner` = %d", playerData[playerid][pID]);
	mysql_tquery(g_SQL, query, "SetStringTDInvItem", "i", playerid);
	return 1;
}

forward CreateLockerItem(playerid, page);
public CreateLockerItem(playerid, page)
{
	static rows;
	new query[128];

	cache_get_row_count(rows);
	if (page == 2 && !rows)
	{
		lockerPage[playerid] = 1;
		return 1;
	}
	else if (page == 2)
	{
		ClearLockerItem(playerid);
	}
	if(!rows) return 1;

	if (!createLockerTD[playerid])
	{

		new Float:startX = 321.00;
		new Float:startY = 112.00;
		for (new i=61;i<30+61;i++)
		{
			// if (Locker_TD[playerid][i] != PlayerText:0xFFFF) continue;

			Locker_TD[playerid][i] = CreatePlayerTextDraw(playerid, startX, startY, "UR_LOCKER:item_0");
			PlayerTextDrawFont(playerid, Locker_TD[playerid][i], 4);
			PlayerTextDrawLetterSize(playerid, Locker_TD[playerid][i], 0.600000, 2.000000);
			PlayerTextDrawTextSize(playerid, Locker_TD[playerid][i], 37.500000, 52.500000);
			PlayerTextDrawSetOutline(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawSetShadow(playerid, Locker_TD[playerid][i], 0);
			PlayerTextDrawAlignment(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawColor(playerid, Locker_TD[playerid][i], -1);
			PlayerTextDrawBackgroundColor(playerid, Locker_TD[playerid][i], 255);
			PlayerTextDrawBoxColor(playerid, Locker_TD[playerid][i], 50);
			PlayerTextDrawUseBox(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawSetProportional(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawSetSelectable(playerid, Locker_TD[playerid][i], 1);
			startX += 38.0;
			if (startX > 511)
			{
				startX = 321.00;
				startY += 54.0;
			}
		}
		startX = 324.00;
		startY = 114.00;
		for (new i=91;i<30+91;i++)
		{
			// if (Locker_TD[playerid][i] != PlayerText:0xFFFF) continue;

			Locker_TD[playerid][i] = CreatePlayerTextDraw(playerid, startX, startY, "0");
			PlayerTextDrawFont(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawLetterSize(playerid, Locker_TD[playerid][i], 0.141666, 0.850000);
			PlayerTextDrawTextSize(playerid, Locker_TD[playerid][i], 310.000000, 17.000000);
			PlayerTextDrawSetOutline(playerid, Locker_TD[playerid][i], 0);
			PlayerTextDrawSetShadow(playerid, Locker_TD[playerid][i], 0);
			PlayerTextDrawAlignment(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawColor(playerid, Locker_TD[playerid][i], -1);
			PlayerTextDrawBackgroundColor(playerid, Locker_TD[playerid][i], -16776961);
			PlayerTextDrawBoxColor(playerid, Locker_TD[playerid][i], -16777166);
			PlayerTextDrawUseBox(playerid, Locker_TD[playerid][i], 0);
			PlayerTextDrawSetProportional(playerid, Locker_TD[playerid][i], 1);
			PlayerTextDrawSetSelectable(playerid, Locker_TD[playerid][i], 0);
			startX += 38.0;
			if (startX > 514)
			{
				startX = 324.00;
				startY += 54.0;
			}
		}
	}
	if (page == 1)
	{
		mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `lockers` WHERE `ownerID` = %d LIMIT 30", playerData[playerid][pID]);
		mysql_tquery(g_SQL, query, "SetStringTDLockerItem", "i", playerid);
	}
	else
	{
		mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `lockers` WHERE `ownerID` = %d LIMIT 30 OFFSET 31", playerData[playerid][pID]);
		mysql_tquery(g_SQL, query, "SetStringTDLockerItem", "ii", playerid);
	}
	new str[2];
	format(str, 2, "%d", page);
	PlayerTextDrawSetString(playerid, Locker_TD[playerid][122], str);
    return 1;
}

ClearLockerItem(playerid, d = false)
{
	#pragma unused d
	for (new i=61;i<121;i++)
	{
		PlayerTextDrawHide(playerid, Locker_TD[playerid][i]);
	}
    return 1;
}

ClearInvItem(playerid, d=true)
{
	#pragma unused d
	for (new i=1;i<61;i++)
	{
		PlayerTextDrawHide(playerid, Locker_TD[playerid][i]);
	}
    return 1;
}

SetStringAll(playerid)
{
	new query[256];
	ShowBGLocker(playerid);
    mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `inventory` WHERE `invOwner` = %d LIMIT 30", playerData[playerid][pID]);
	mysql_tquery(g_SQL, query, "ShowPlayerLockerTD", "ii", playerid, 0);
}

forward SetStringTDLockerItem(playerid);
public SetStringTDLockerItem(playerid)
{
	static rows;

	cache_get_row_count(rows);
    new amount, item[32], str[64];  

	for (new i = 0; i < rows ; i ++)
	{
        cache_get_value_name(i, "itemName", item, 32);
        cache_get_value_name_int(i, "amount", amount);

		new invIndex = GetItemInvIndex(item);
		// if (invIndex == -1) continue;
		PlayerTextDrawHide(playerid, Locker_TD[playerid][61+i]);
		PlayerTextDrawHide(playerid, Locker_TD[playerid][91+i]);

        format(str, 64, "%s", itemData[invIndex][itemPng]);
        PlayerTextDrawSetString(playerid, Locker_TD[playerid][61+i], str);

        format(str, 64, "%d", amount);
        PlayerTextDrawSetString(playerid, Locker_TD[playerid][91+i], str);

		PlayerTextDrawShow(playerid, Locker_TD[playerid][61+i]);
		PlayerTextDrawShow(playerid, Locker_TD[playerid][91+i]);
	}
	return 1;
}

forward SetStringTDInvItem(playerid);
public SetStringTDInvItem(playerid)
{
	static rows;

	cache_get_row_count(rows);
    new id, amount, item[32], str[64];  

	for (new i = 0; i < rows && i < MAX_INVENTORY; i ++)
	{
        cache_get_value_name_int(i, "invID", id);
        cache_get_value_name_int(i, "invQuantity", amount);
        cache_get_value_name(i, "invItem", item, 32);

        new invIndex = GetItemInvIndex(item);
		// if (invIndex == -1) 
		// {
		// 	// SendClientMessage(playerid, COLOR_RED, "มีข้อมูลไอเท็มผิดพลาดโปรดติดต่อผู้พัฒนา");
		// 	continue;
		// }
		PlayerTextDrawHide(playerid, Locker_TD[playerid][1+i]);
		PlayerTextDrawHide(playerid, Locker_TD[playerid][31+i]);

        format(str, 64, "%s", itemData[invIndex][itemPng]);
        PlayerTextDrawSetString(playerid, Locker_TD[playerid][1+i], str);

        format(str, 64, "%d/%d", amount, itemData[invIndex][itemQuantity]);
        PlayerTextDrawSetString(playerid, Locker_TD[playerid][31+i], str);

		PlayerTextDrawShow(playerid, Locker_TD[playerid][1+i]);
		PlayerTextDrawShow(playerid, Locker_TD[playerid][31+i]);
	}
	createLockerTD[playerid] = 1;
    return 1;
}

forward PutItemToLocker(playerid, click);
public PutItemToLocker(playerid, click)
{
	static rows;

	cache_get_row_count(rows);
    new id, amount, item[32];  

	for (new i = 0; i < rows && i < MAX_INVENTORY; i ++)
	{
		if (i == click-1)
		{
			cache_get_value_name_int(i, "invID", id);
			cache_get_value_name_int(i, "invQuantity", amount);
			cache_get_value_name(i, "invItem", item, 32);

			depIndex[playerid] = GetItemInvIndex(item);
			// if (depIndex[playerid] == -1) return SendClientMessage(playerid, COLOR_RED, "มีข้อมูลไอเท็มผิดพลาดโปรดติดต่อผู้พัฒนา");
			new msg[256];
			format(msg, sizeof(msg), "กรอกจำนวน%sที่คุณต้องการจะฝาก\nคุณมีอยู่ %d", item, amount);
			Dialog_Show(playerid, PUT_TO_LOCKER, DIALOG_STYLE_INPUT, "[ตู้เซฟ]", msg, "ตกลง", "ยกเลิก");
			break;
		}
	}
    return 1;
}

forward PutItemToInv(playerid, click);
public PutItemToInv(playerid, click)
{
	static rows;

	cache_get_row_count(rows);
    new amount, item[32];  

	for (new i = 0; i < rows; i ++)
	{
		if (i == click-61)
		{
			cache_get_value_name_int(i, "amount", amount);
			cache_get_value_name(i, "itemName", item, 32);

			depIndex[playerid] = GetItemInvIndex(item);
			new msg[256];
			format(msg, sizeof(msg), "กรอกจำนวน%sที่คุณต้องการจะนำออก\nคุณมีอยู่ %d", item, amount);
			Dialog_Show(playerid, PUT_TO_INV, DIALOG_STYLE_INPUT, "[ตู้เซฟ]", msg, "ตกลง", "ยกเลิก");
			break;
		}
	}
    return 1;
}

Dialog:PUT_TO_INV(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new amount = strval(inputtext);
		if (amount <= 0) return SendClientMessage(playerid, COLOR_RED, "จำนวนต้องมากกว่า 0");
		AddItemToInvPlayer(playerid, itemData[depIndex[playerid]][itemName], amount);
	}
	return 1;
}
Dialog:PUT_TO_LOCKER(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new amount = strval(inputtext);
		if (amount <= 0) return SendClientMessage(playerid, COLOR_RED, "จำนวนต้องมากกว่า 0");
		if (Inventory_Count(playerid, itemData[depIndex[playerid]][itemName]) < amount) return SendClientMessageEx(playerid, COLOR_RED, "จำนวน %s ของคุณไม่เพียงพอ", itemData[depIndex[playerid]][itemName]);
		CheckAndAddItemToLocker(playerid, itemData[depIndex[playerid]][itemName], amount);
	}
	return 1;
}
CheckAndAddItemToLocker(playerid, const item[], amount)
{
    new query[256];

    mysql_format(g_SQL, query, sizeof(query),"SELECT amount FROM lockers WHERE ownerid = %d AND itemName = '%s'",playerData[playerid][pID], item);
    mysql_tquery(g_SQL, query, "AddItemToLocker", "isi", playerid, item, amount);

    return 1;
}

forward AddItemToLocker(playerid, const item[], amount);
public AddItemToLocker(playerid, const item[], amount)
{
	static rows;
	new query[256];
    new amountSQL = 0;

	cache_get_row_count(rows);
	if (!rows)
	{
		if (amount > MAX_LOCKER_AMOUNT) {
			SendClientMessageEx(playerid, COLOR_RED, "จำนวนของในตู้เซฟจะเกิน %d ไม่สามารถเพิ่มได้", MAX_LOCKER_AMOUNT);
			return 1;
		}
		mysql_format(g_SQL, query, sizeof(query), "INSERT INTO lockers (ownerid, itemName, amount) VALUES (%d, '%s', %d)", playerData[playerid][pID], item, amount);
		mysql_tquery(g_SQL, query);
	}
	else
	{
		cache_get_value_name_int(0, "amount", amountSQL);
		if (amountSQL + amount > MAX_LOCKER_AMOUNT) {
			SendClientMessageEx(playerid, COLOR_RED, "จำนวนของในตู้เซฟจะเกิน %d ไม่สามารถเพิ่มได้", MAX_LOCKER_AMOUNT);
			return 1;
		}
		mysql_format(g_SQL, query, sizeof(query), "UPDATE lockers SET amount = amount + %d WHERE ownerid = %d and itemName = '%s'", amount, playerData[playerid][pID], item);
		mysql_tquery(g_SQL, query);
	}


	SendClientMessageEx(playerid, COLOR_GREEN, "คุณได้ฝาก %s เข้าตู้เซฟจำนวน %d", itemData[depIndex[playerid]][itemName], amount);
	Inventory_Remove(playerid, itemData[depIndex[playerid]][itemName], amount);
	UpdateplayerData(playerid);
	if (!Inventory_Count(playerid, itemData[depIndex[playerid]][itemName]))
	{
		UpdateLockerSystem(playerid);
		return 1;
	}
	UpdateLockerSystem(playerid);
	return 1;
}

AddItemToInvPlayer(playerid, const item[], amount)
{
	new query[128];
	mysql_format(g_SQL, query, sizeof(query), "SELECT amount FROM lockers WHERE ownerid = %d and itemName = '%s'", playerData[playerid][pID], item);
	mysql_tquery(g_SQL, query, "AddItemToInv", "isi", playerid, item, amount);
}

forward AddItemToInv(playerid, const item[], amount);
public AddItemToInv(playerid, const item[], amount)
{
	static rows;
	cache_get_row_count(rows);
	if (!rows) return 1;
	new amountSQL, query[128];
	cache_get_value_name_int(0, "amount", amountSQL);
	if (amountSQL < amount) return SendClientMessageEx(playerid, COLOR_RED, "จำนวนไอเท็มในตู้เซฟของคุณไม่เพียงพอ %d", amountSQL);
	if ((Inventory_Count(playerid, item) + amount) > itemData[depIndex[playerid]][itemQuantity]) return SendClientMessageEx(playerid, COLOR_RED, "ความจุกระเป๋าของคุณไม่เพียงพอ");
	if (amount == amountSQL)
	{
		mysql_format(g_SQL, query, sizeof(query), "DELETE FROM lockers WHERE itemName = '%s' and ownerid = %d", item, playerData[playerid][pID]);
		mysql_tquery(g_SQL, query);
		ClearLockerItem(playerid, true);
	}
	else
	{
		mysql_format(g_SQL, query, sizeof(query), "UPDATE lockers SET amount = amount - %d WHERE itemName = '%s' and ownerid = %d", amount, item, playerData[playerid][pID]);
		mysql_tquery(g_SQL, query);

	}
	SendClientMessageEx(playerid, COLOR_GREEN, "คุณได้นำ %s ออกจากตู้เซฟจำนวน %d", item, amount);
	Inventory_Add(playerid, item, amount);
	UpdateLockerSystem(playerid);
	return 1;
}

UpdateLockerSystem(playerid)
{
	ClearInvItem(playerid);
	ClearLockerItem(playerid);
	SetStringAll(playerid);
	SelectTextDraw(playerid, 0xFF0000FF);
}

ShowBGLocker(playerid)
{
	PlayerTextDrawHide(playerid, Locker_TD[playerid][0]);
	PlayerTextDrawShow(playerid, Locker_TD[playerid][0]);
}
stock GetItemInvIndex(const item[]) {
	new x = 0;
    for (new i = 0; i < sizeof(itemData); i ++) {
        if(!strcmp(itemData[i][itemName], item, true)) {
            x = i;
            break;
        }
    }
    return x;
}

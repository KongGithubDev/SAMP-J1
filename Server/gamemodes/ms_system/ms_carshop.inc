#include <YSI_Coding\y_hooks>

new indexCarShop[MAX_PLAYERS], carfor_Test[MAX_PLAYERS], bool:SelectCarShop[MAX_PLAYERS], enterShopID[MAX_PLAYERS];
new slotcshop[MAX_PLAYERS];
new PlayerText:TextDraw_carshop[MAX_PLAYERS][6];
new
    bool:player_carshop_opened[MAX_PLAYERS];

new CarColor[MAX_PLAYERS];
enum ENUM_CARSHOP_DATA
{
	carModel,
	carPrice
};
new CarShopInfo[][ENUM_CARSHOP_DATA] =
{
	{ 402, 190000},	//ปรับเพิ่มรถ แก้ไขเองได้เลย   ตัวอย่าง (400 idรถ, 100000 ราคา )
	{ 560, 150000 }, 	
	{ 495, 500000 }, 	
	{ 541, 390000 }, 		
	{ 551, 700000 }, 	
	{ 565, 3000000 }, 	
	{ 587, 500000 }, 
	{ 521, 50000 }, 	
	{ 445, 300000 }
	
};

hook OnPlayerConnect(playerid)
{
    indexCarShop[playerid] = 0;
    SelectCarShop[playerid] = false;
    player_carshop_opened[playerid] = false;	
    carfor_Test[playerid] = INVALID_VEHICLE_ID;
    enterShopID[playerid] = -1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (carfor_Test[playerid] != INVALID_VEHICLE_ID)
	{
	    DestroyVehicle(carfor_Test[playerid]);
	    carfor_Test[playerid] = INVALID_VEHICLE_ID;
	}
}

hook OnGameModeInit(){ 

	CreateDynamicPickup(1239, 23, 2131.9856,-1151.3218,24.0622);
	CreateDynamic3DTextLabel("ร้านขายรถ :{FFFFFF} \nกดปุ่ม [ N ] เพื่อเลือกซื้อรถ", COLOR_YELLOW, 2131.9856,-1151.3218,24.0622, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
		if (IsPlayerInRangeOfPoint(playerid, 3.0, 2131.9856,-1151.3218,24.0622  )){
    		new shopid = Shop_Nearest(playerid);			
			enterShopID[playerid] = shopid;
			player_carshop_opened[playerid] = true;
			ShowPlayerSelectCar(playerid);
			indexCarShop[playerid] = 0;
			NextCar_ForPlayerShop(playerid, indexCarShop[playerid]);
			SelectCarShop[playerid] = true;
		}
	}
	return 1;
}

ShowPlayerSelectCar(playerid){
    TextDraw_carshop[playerid][0] = CreatePlayerTextDraw(playerid, 324.000000, 348.000000, "_");
	PlayerTextDrawFont(playerid, TextDraw_carshop[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, TextDraw_carshop[playerid][0], 0.600000, 6.499998);
	PlayerTextDrawTextSize(playerid, TextDraw_carshop[playerid][0], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, TextDraw_carshop[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TextDraw_carshop[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, TextDraw_carshop[playerid][0], 2);
	PlayerTextDrawColor(playerid, TextDraw_carshop[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDraw_carshop[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, TextDraw_carshop[playerid][0], 1296911871);
	PlayerTextDrawUseBox(playerid, TextDraw_carshop[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TextDraw_carshop[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, TextDraw_carshop[playerid][0], 0);

	TextDraw_carshop[playerid][1] = CreatePlayerTextDraw(playerid, 324.000000, 366.000000, "BUY");
	PlayerTextDrawFont(playerid, TextDraw_carshop[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, TextDraw_carshop[playerid][1], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, TextDraw_carshop[playerid][1], 16.500000, 72.500000);
	PlayerTextDrawSetOutline(playerid, TextDraw_carshop[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TextDraw_carshop[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, TextDraw_carshop[playerid][1], 2);
	PlayerTextDrawColor(playerid, TextDraw_carshop[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDraw_carshop[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, TextDraw_carshop[playerid][1], 9109704);
	PlayerTextDrawUseBox(playerid, TextDraw_carshop[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, TextDraw_carshop[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, TextDraw_carshop[playerid][1], 1);

	TextDraw_carshop[playerid][2] = CreatePlayerTextDraw(playerid, 324.000000, 389.000000, "CLOSE");
	PlayerTextDrawFont(playerid, TextDraw_carshop[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, TextDraw_carshop[playerid][2], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, TextDraw_carshop[playerid][2], 16.500000, 72.500000);
	PlayerTextDrawSetOutline(playerid, TextDraw_carshop[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, TextDraw_carshop[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, TextDraw_carshop[playerid][2], 2);
	PlayerTextDrawColor(playerid, TextDraw_carshop[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDraw_carshop[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, TextDraw_carshop[playerid][2], -16777016);
	PlayerTextDrawUseBox(playerid, TextDraw_carshop[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, TextDraw_carshop[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, TextDraw_carshop[playerid][2], 1);

	TextDraw_carshop[playerid][3] = CreatePlayerTextDraw(playerid, 324.000000, 347.000000, "1000000");
	PlayerTextDrawFont(playerid, TextDraw_carshop[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, TextDraw_carshop[playerid][3], 0.287499, 1.500000);
	PlayerTextDrawTextSize(playerid, TextDraw_carshop[playerid][3], 400.000000, 147.500000);
	PlayerTextDrawSetOutline(playerid, TextDraw_carshop[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, TextDraw_carshop[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, TextDraw_carshop[playerid][3], 2);
	PlayerTextDrawColor(playerid, TextDraw_carshop[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDraw_carshop[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, TextDraw_carshop[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, TextDraw_carshop[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, TextDraw_carshop[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, TextDraw_carshop[playerid][3], 0);

	TextDraw_carshop[playerid][4] = CreatePlayerTextDraw(playerid, 260.000000, 365.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, TextDraw_carshop[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, TextDraw_carshop[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TextDraw_carshop[playerid][4], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TextDraw_carshop[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, TextDraw_carshop[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, TextDraw_carshop[playerid][4], 1);
	PlayerTextDrawColor(playerid, TextDraw_carshop[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDraw_carshop[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, TextDraw_carshop[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, TextDraw_carshop[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, TextDraw_carshop[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, TextDraw_carshop[playerid][4], 1);

	TextDraw_carshop[playerid][5] = CreatePlayerTextDraw(playerid, 372.000000, 365.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, TextDraw_carshop[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, TextDraw_carshop[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TextDraw_carshop[playerid][5], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TextDraw_carshop[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, TextDraw_carshop[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, TextDraw_carshop[playerid][5], 1);
	PlayerTextDrawColor(playerid, TextDraw_carshop[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDraw_carshop[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, TextDraw_carshop[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, TextDraw_carshop[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, TextDraw_carshop[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, TextDraw_carshop[playerid][5], 1);

	
	for (new i = 0; i < 6; i ++)
	{
		PlayerTextDrawShow(playerid, TextDraw_carshop[playerid][i]);
	}
	SetPlayerPos(playerid, 2131.9485,-1150.2505,24.1794); //คน

	InterpolateCameraPos(playerid, 2126.1074,-1134.3247,25.5147, 2126.1074,-1134.3247,25.5147, 1000);
	InterpolateCameraLookAt(playerid, 2130.1958,-1131.5610,25.6173, 2130.1958,-1131.5610,25.6173, 1000);

	return SelectTextDraw(playerid, -1);
}

DestroyPlayerSelectCar(playerid)
{
	for (new i = 0; i < 6; i ++)
	{
		PlayerTextDrawDestroy(playerid, TextDraw_carshop[playerid][i]);
	}
	return CancelSelectTextDraw(playerid);
}

NextCar_ForPlayerShop(playerid, slots)
{
	if (carfor_Test[playerid] != INVALID_VEHICLE_ID)
	{
	    DestroyVehicle(carfor_Test[playerid]);
	    carfor_Test[playerid] = INVALID_VEHICLE_ID;
	}
	SetPlayerVirtualWorld(playerid, playerid+1);

 	carfor_Test[playerid] = CreateVehicle(CarShopInfo[slots][carModel], 2133.6118,-1129.7118,25.6515, 42.0791, -1, -1, -1);

	slotcshop[playerid] = slots;
	SetVehicleVirtualWorld(carfor_Test[playerid], playerid+1);
	LinkVehicleToInterior(carfor_Test[playerid], GetPlayerInterior(playerid));

    new str[32];
    format(str, sizeof(str), "%s", FormatMoney(CarShopInfo[slots][carPrice]));
	PlayerTextDrawSetString(playerid, TextDraw_carshop[playerid][3], str);
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:textid)
{
	if (SelectCarShop[playerid])
	{
	    if (textid == TextDraw_carshop[playerid][5])
	    {
	        if (indexCarShop[playerid] == 0)
	            return ErrorMsg(playerid, "กด '<' เพื่อดูรถที่ขายในร้านคันถัดไป");

		    indexCarShop[playerid] --;
		    NextCar_ForPlayerShop(playerid, indexCarShop[playerid]);
	    }
	    else if (textid == TextDraw_carshop[playerid][4])
	    {
	        if (indexCarShop[playerid] == 8)
	            return ErrorMsg(playerid, "กด '>' เพื่อย้อนดูรถที่ขายในร้านก่อนหน้านี้");

		    indexCarShop[playerid] ++;
		    NextCar_ForPlayerShop(playerid, indexCarShop[playerid]);
	    }
	    else if (textid == TextDraw_carshop[playerid][1])
	    {
	        new index = indexCarShop[playerid], query[256];

	        if (GetPlayerMoneyEx(playerid) < CarShopInfo[index][carPrice])
	            return ErrorMsg(playerid, "คุณมีเงินไม่เพียงพอสำหรับการซื้อรถ");

			mysql_format(g_SQL, query, sizeof(query), "SELECT COUNT(*) FROM vehicles WHERE carOwnerID = %d", playerData[playerid][pID]);
			mysql_tquery(g_SQL, query, "OnPlayerBuyVehicle_Killer", "ii", playerid, index);
	    }
	    else if (textid == TextDraw_carshop[playerid][2])
		{
			if (carfor_Test[playerid] != INVALID_VEHICLE_ID)
			{
			    DestroyVehicle(carfor_Test[playerid]);
			    carfor_Test[playerid] = INVALID_VEHICLE_ID;
			}

	        DestroyPlayerSelectCar(playerid);
		    SetCameraBehindPlayer(playerid);

			SetPlayerPos(playerid, 2131.9485,-1150.2505,24.1794);
	        SetPlayerInterior(playerid, 0);
		    SetPlayerVirtualWorld(playerid, 0);

	        SendClientMessage(playerid, -1, "{FF00FF}[ ร้านขายรถ ] {FFFFFF}คุณได้ออกจากการซื้อรถในร้านค้าแล้ว");
			SelectCarShop[playerid] = false;
			
			enterShopID[playerid] = -1;
	    }
	}
	return 1;
}

forward OnPlayerBuyVehicle_Killer(playerid, index);
public OnPlayerBuyVehicle_Killer(playerid, index)
{
	new count;
	cache_get_value_index_int(0, 0, count);

	new string[20], query[1080], modelid = CarShopInfo[index][carModel];

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO vehicles (carOwnerID, carOwner, carModel, carPrice, carFuel, carPosX, carPosY, carPosZ, carPosA, carHealth, carColor1, carColor2) VALUES(%d, '%s', %d, %d, %.1f, '562.3970', '-1283.8485', '17.0007', '0.0000', '1000.0', %d, %d)", playerData[playerid][pID], GetPlayerNameEx(playerid), CarShopInfo[index][carModel], CarShopInfo[index][carPrice], vehicleData[modelid - 400][vFuel], CarColor[playerid], CarColor[playerid]);
	mysql_tquery(g_SQL, query);

	GivePlayerMoneyEx(playerid, -CarShopInfo[index][carPrice]);

	format(string, sizeof(string), "~r~-$%d", CarShopInfo[index][carPrice]);
	GameTextForPlayer(playerid, string, 5000, 1);

	SendClientMessageEx(playerid, -1, "{FFFFFF}คุณได้ทำการซื้อรถ {FF00FF}'%s' {33CCFF}จากร้านขายรถในราคา {FF00FF}'%s' {FFFFFF}เรียบร้อยแล้ว", ReturnVehicleModelName(CarShopInfo[index][carModel]), FormatMoney(CarShopInfo[index][carPrice]));
	return SendClientMessage(playerid, -1, "{FF00FF}[ ร้านขายรถ ] {FFFFFF}กดที่ 'CLOSE' เพื่อออกจากร้านขายรถ");
}

carshopUI_User(playerid, Show = false) {
    if(Show)
	{
        player_carshop_opened[playerid] = true;
        SelectTextDraw(playerid, -1);
    }
    else
	{
		if (carfor_Test[playerid] != INVALID_VEHICLE_ID)
		{
			DestroyVehicle(carfor_Test[playerid]);
			carfor_Test[playerid] = INVALID_VEHICLE_ID;
		}

	    DestroyPlayerSelectCar(playerid);
		SetCameraBehindPlayer(playerid);

		SetPlayerPos(playerid, 2131.9485,-1150.2505,24.1794);
	    SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);

	    SendClientMessage(playerid, -1, "{FF00FF}[ ร้านขายรถ ] {FFFFFF}คุณได้ออกจากการซื้อรถในร้านค้าแล้ว");
		SelectCarShop[playerid] = false;
			
		enterShopID[playerid] = -1;
        player_carshop_opened[playerid] = false;
    }
    return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:textid)
{
	if(player_carshop_opened[playerid] == true) {
        carshopUI_User(playerid);
        TogglePlayerControllable(playerid, true);        
        return Y_HOOKS_BREAK_RETURN_1;       
    }
	return 1;
}
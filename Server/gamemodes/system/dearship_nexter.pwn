
#include <YSI_Coding\y_hooks>

new indexCarShop[MAX_PLAYERS], carfor_Test[MAX_PLAYERS], bool:SelectCarShop[MAX_PLAYERS], EnterCarShop[MAX_PLAYERS];

new PlayerText:Dearship_nexter[MAX_PLAYERS][7];

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
	EnterCarShop[playerid] = 0;
    SelectCarShop[playerid] = false;
    carfor_Test[playerid] = INVALID_VEHICLE_ID;

	//--> ลบแมพ ร้านขายรถ GTA V
	RemoveBuildingForPlayer(playerid, 6100, 1251.789, -1541.281, 36.914, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1229.148, -1537.351, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 6107, 1251.789, -1541.281, 36.914, 0.250);
	RemoveBuildingForPlayer(playerid, 6195, 1236.523, -1488.164, 40.687, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1218.281, -1554.085, 15.234, 0.250);
	RemoveBuildingForPlayer(playerid, 792, 1219.851, -1561.335, 12.617, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1229.148, -1557.648, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1238.906, -1560.523, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1264.000, -1560.523, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1266.546, -1557.617, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 792, 1279.734, -1552.945, 12.218, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1210.648, -1546.812, 12.406, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1218.281, -1540.945, 15.234, 0.250);
	RemoveBuildingForPlayer(playerid, 792, 1219.851, -1547.898, 12.617, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1229.148, -1550.937, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 6100, 1251.789, -1541.281, 36.914, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1273.609, -1542.375, 15.234, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1266.546, -1544.000, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1266.546, -1550.882, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 792, 1219.851, -1534.468, 12.617, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1266.546, -1537.296, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 792, 1280.031, -1531.140, 12.070, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1266.546, -1530.585, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1229.148, -1530.617, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1218.281, -1528.398, 15.234, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1231.953, -1527.828, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 792, 1219.851, -1521.367, 12.617, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1238.828, -1527.828, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1257.046, -1527.828, 13.265, 0.250);
	RemoveBuildingForPlayer(playerid, 638, 1263.921, -1527.828, 13.265, 0.250);

	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (carfor_Test[playerid] != INVALID_VEHICLE_ID)
	{
	    DestroyVehicle(carfor_Test[playerid]);
	    carfor_Test[playerid] = INVALID_VEHICLE_ID;
	}
	return 1;
}

hook OnGameModeInit()
{
	LoadObjectCarShop();

	CreateDynamicPickup(1239, 23, 1259.7430,-1531.8827,13.4546);
	CreateDynamic3DTextLabel("{FA5727}[ ร้านขายยานพาหนะ ]\n{ffffff}กดปุ่ม N เพื่อเลือกซื้อรถ", -1, 1259.7430,-1531.8827,13.4546, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{

	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
		if (IsPlayerInRangeOfPoint(playerid, 3.0, 1259.7430,-1531.8827,13.4546))
		{
		    ShowPlayerSelectCar(playerid);
		    indexCarShop[playerid] = 0;
		    NextCar_ForPlayerShop(playerid, indexCarShop[playerid]);
			SelectCarShop[playerid] = true;
			EnterCarShop[playerid] = 1;
		}
	}
	return 1;
}

// กด ESC ออกจาก SelectTextDraw
/*hook OnPlayerCancelTextDraw(playerid)
{
    if(SelectCarShop[playerid]) // อยู่ในร้านขายรถอยู่
    {
        CancelCarShop(playerid);
    }
    return 1;
}

// ฟังก์ชันยกเลิก CarShop
CancelCarShop(playerid)
{
    if(carfor_Test[playerid] != INVALID_VEHICLE_ID)
    {
        DestroyVehicle(carfor_Test[playerid]);
        carfor_Test[playerid] = INVALID_VEHICLE_ID;
    }

    DestroyPlayerSelectCar(playerid); // ลบ TextDraw และ CancelSelectTextDraw
    SetCameraBehindPlayer(playerid);

    SetPlayerPosExten(playerid, 1263.7188,-1531.3578,13.4546);
    SetPlayerFacingAngle(playerid, 180.2103);
    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);

    SelectCarShop[playerid] = false;
    EnterCarShop[playerid] = 0;
    indexCarShop[playerid] = 0;

    TogglePlayerControllable(playerid, 1); // ปลดล็อกการบังคับ
    SendClientMessage(playerid, -1, "{FC6216}[!] {FFFFFF}คุณได้ออกจากร้านขายรถแล้ว.");
    return 1;
}*/

ShowPlayerSelectCar(playerid)
{
	Dearship_nexter[playerid][0] = CreatePlayerTextDraw(playerid, 185.000000, 291.000000, "krcui:carshop-server");
	PlayerTextDrawFont(playerid, Dearship_nexter[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Dearship_nexter[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dearship_nexter[playerid][0], 271.000000, 168.500000);
	PlayerTextDrawSetOutline(playerid, Dearship_nexter[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Dearship_nexter[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Dearship_nexter[playerid][0], 1);
	PlayerTextDrawColor(playerid, Dearship_nexter[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, Dearship_nexter[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Dearship_nexter[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Dearship_nexter[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, Dearship_nexter[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Dearship_nexter[playerid][0], 0);

	Dearship_nexter[playerid][1] = CreatePlayerTextDraw(playerid, 321.000000, 341.000000, "BULLET");
	PlayerTextDrawFont(playerid, Dearship_nexter[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, Dearship_nexter[playerid][1], 0.304166, 1.750000);
	PlayerTextDrawTextSize(playerid, Dearship_nexter[playerid][1], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, Dearship_nexter[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, Dearship_nexter[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Dearship_nexter[playerid][1], 2);
	PlayerTextDrawColor(playerid, Dearship_nexter[playerid][1], -60680449);
	PlayerTextDrawBackgroundColor(playerid, Dearship_nexter[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Dearship_nexter[playerid][1], 200);
	PlayerTextDrawUseBox(playerid, Dearship_nexter[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, Dearship_nexter[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Dearship_nexter[playerid][1], 0);

	Dearship_nexter[playerid][2] = CreatePlayerTextDraw(playerid, 321.000000, 364.000000, "100,000");
	PlayerTextDrawFont(playerid, Dearship_nexter[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, Dearship_nexter[playerid][2], 0.349999, 2.049999);
	PlayerTextDrawTextSize(playerid, Dearship_nexter[playerid][2], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, Dearship_nexter[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, Dearship_nexter[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Dearship_nexter[playerid][2], 2);
	PlayerTextDrawColor(playerid, Dearship_nexter[playerid][2], 9109759);
	PlayerTextDrawBackgroundColor(playerid, Dearship_nexter[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Dearship_nexter[playerid][2], 200);
	PlayerTextDrawUseBox(playerid, Dearship_nexter[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, Dearship_nexter[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Dearship_nexter[playerid][2], 0);

	Dearship_nexter[playerid][3] = CreatePlayerTextDraw(playerid, 247.000000, 366.000000, "<");
	PlayerTextDrawFont(playerid, Dearship_nexter[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, Dearship_nexter[playerid][3], 0.399999, 2.599996);
	PlayerTextDrawTextSize(playerid, Dearship_nexter[playerid][3], 16.500000, 13.000000);
	PlayerTextDrawSetOutline(playerid, Dearship_nexter[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, Dearship_nexter[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Dearship_nexter[playerid][3], 2);
	PlayerTextDrawColor(playerid, Dearship_nexter[playerid][3], -60680449);
	PlayerTextDrawBackgroundColor(playerid, Dearship_nexter[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Dearship_nexter[playerid][3], 200);
	PlayerTextDrawUseBox(playerid, Dearship_nexter[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, Dearship_nexter[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Dearship_nexter[playerid][3], 1);

	Dearship_nexter[playerid][4] = CreatePlayerTextDraw(playerid, 395.000000, 366.000000, ">");
	PlayerTextDrawFont(playerid, Dearship_nexter[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, Dearship_nexter[playerid][4], 0.399999, 2.599996);
	PlayerTextDrawTextSize(playerid, Dearship_nexter[playerid][4], 16.500000, 13.000000);
	PlayerTextDrawSetOutline(playerid, Dearship_nexter[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, Dearship_nexter[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Dearship_nexter[playerid][4], 2);
	PlayerTextDrawColor(playerid, Dearship_nexter[playerid][4], -60680449);
	PlayerTextDrawBackgroundColor(playerid, Dearship_nexter[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Dearship_nexter[playerid][4], 200);
	PlayerTextDrawUseBox(playerid, Dearship_nexter[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, Dearship_nexter[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Dearship_nexter[playerid][4], 1);

	Dearship_nexter[playerid][5] = CreatePlayerTextDraw(playerid, 297.000000, 390.000000, "___");
	PlayerTextDrawFont(playerid, Dearship_nexter[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, Dearship_nexter[playerid][5], 0.258332, 1.450000);
	PlayerTextDrawTextSize(playerid, Dearship_nexter[playerid][5], 16.500000, 33.500000);
	PlayerTextDrawSetOutline(playerid, Dearship_nexter[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, Dearship_nexter[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Dearship_nexter[playerid][5], 2);
	PlayerTextDrawColor(playerid, Dearship_nexter[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, Dearship_nexter[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Dearship_nexter[playerid][5], 200);
	PlayerTextDrawUseBox(playerid, Dearship_nexter[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Dearship_nexter[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Dearship_nexter[playerid][5], 1);

	Dearship_nexter[playerid][6] = CreatePlayerTextDraw(playerid, 343.000000, 390.000000, "___");
	PlayerTextDrawFont(playerid, Dearship_nexter[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, Dearship_nexter[playerid][6], 0.258332, 1.450000);
	PlayerTextDrawTextSize(playerid, Dearship_nexter[playerid][6], 16.500000, 33.500000);
	PlayerTextDrawSetOutline(playerid, Dearship_nexter[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, Dearship_nexter[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Dearship_nexter[playerid][6], 2);
	PlayerTextDrawColor(playerid, Dearship_nexter[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, Dearship_nexter[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Dearship_nexter[playerid][6], 200);
	PlayerTextDrawUseBox(playerid, Dearship_nexter[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, Dearship_nexter[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Dearship_nexter[playerid][6], 1);

	for (new i = 0; i < 7; i ++)
	{
		PlayerTextDrawShow(playerid, Dearship_nexter[playerid][i]);
	}

	SetPlayerPosExten(playerid, 1267.1543,-1527.7606,13.4409);

	SetPlayerCameraPos(playerid, 1260.1560, -1549.4043, 14.4645);
	SetPlayerCameraLookAt(playerid, 1259.8237, -1548.4559, 14.2944);
	
	return SelectTextDraw(playerid, 0xFF0000FF);
}

DestroyPlayerSelectCar(playerid)
{
	for (new i = 0; i < 7; i ++)
	{
		PlayerTextDrawDestroy(playerid, Dearship_nexter[playerid][i]);
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
	SetPlayerVirtualWorld(playerid, 0);

 	carfor_Test[playerid] = CreateVehicle(CarShopInfo[slots][carModel], 1257.9899,-1543.0524,13.2000,229.3082, -1, -1, -1);

	SetVehicleVirtualWorld(carfor_Test[playerid], 0);
	LinkVehicleToInterior(carfor_Test[playerid], GetPlayerInterior(playerid));

	new str[32];
	
 	format(str, sizeof(str), "%s", ReturnVehicleModelName(CarShopInfo[slots][carModel]));
	PlayerTextDrawSetString(playerid, Dearship_nexter[playerid][1], str);

 	format(str, sizeof(str), "%s", FormatMoney(CarShopInfo[slots][carPrice]));
	PlayerTextDrawSetString(playerid, Dearship_nexter[playerid][2], str);
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
	if (EnterCarShop[playerid] == 1)
	{
		if (playertextid == Dearship_nexter[playerid][3]) // Left
		{
			if (indexCarShop[playerid] == 0)
				return SendClientMessage(playerid, COLOR_RED, "{FC6216}[!] {FFFFFF}กรุณากด > เพื่อเลื่อนดูรถที่ขายในร้านขายรถคันถัดไป!");
		
			indexCarShop[playerid] --;
			NextCar_ForPlayerShop(playerid, indexCarShop[playerid]);
		}
		else if (playertextid == Dearship_nexter[playerid][4]) // Right
		{
			if (indexCarShop[playerid] == 8)
				return SendClientMessage(playerid, COLOR_RED, "{FC6216}[!] {FFFFFF}กรุณากด < เพื่อย้อนดูรถที่ขายในร้านขายรถก่อนหน้านี้!");

			indexCarShop[playerid] ++;
			NextCar_ForPlayerShop(playerid, indexCarShop[playerid]);
		}
		else if (playertextid == Dearship_nexter[playerid][5]) // Buy
		{
			new index = indexCarShop[playerid], string[32], query[256], modelid = CarShopInfo[index][carModel];
			
			if (GetPlayerMoneyEx(playerid) < CarShopInfo[index][carPrice])
				return SendClientMessage(playerid, COLOR_RED, "{FC6216}[!] {FFFFFF}คุณมีเงินไม่เพียงพอสำหรับการซื้อยานพาหนะ!");
			
			mysql_format(g_SQL, query, sizeof(query), "INSERT INTO vehicles (carOwnerID, carOwner, carModel, carPrice, carFuel, carPosX, carPosY, carPosZ, carPosA) VALUES(%d, '%s', %d, %d, %.1f, '562.3970', '-1283.8485', '17.0007', '0.0000')", playerData[playerid][pID], GetPlayerNameEx(playerid), CarShopInfo[index][carModel], CarShopInfo[index][carPrice], vehicleData[modelid - 400][vFuel]);
			mysql_tquery(g_SQL, query);

			GivePlayerMoneyEx(playerid, -CarShopInfo[index][carPrice]);

			format(string, sizeof(string), "~r~-$%d", CarShopInfo[index][carPrice]);
			GameTextForPlayer(playerid, string, 5000, 1);
			
			SendClientMessageEx(playerid, COLOR_YELLOW, "{FC6216}[!] {FFFFFF} คุณได้ซื้อรถรุ่น %s ในราคา %s สำเร็จ ไปที่การาจในการเรียกรถออกมา", ReturnVehicleModelName(CarShopInfo[index][carModel]), FormatMoney(CarShopInfo[index][carPrice]));
			SendClientMessage(playerid, COLOR_YELLOW, "{FC6216}[!] {FFFFFF} คลิกที่ EXIT เพื่อออกจากร้านขายรถ");
			TogglePlayerControllable(playerid, 1);
		}
		else if (playertextid == Dearship_nexter[playerid][6]) // Quit
		{
			if (carfor_Test[playerid] != INVALID_VEHICLE_ID)
			{
				DestroyVehicle(carfor_Test[playerid]);
				carfor_Test[playerid] = INVALID_VEHICLE_ID;
			}

			DestroyPlayerSelectCar(playerid);
			SetCameraBehindPlayer(playerid);

			SetPlayerPosExten(playerid, 1263.7188,-1531.3578,13.4546);
			SetPlayerFacingAngle(playerid, 180.2103);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			TogglePlayerControllable(playerid, 1);

			SelectCarShop[playerid] = false;
			EnterCarShop[playerid] = 0;
		}
	}
	return 1;
}

Csrshopui(playerid) 
{
    if(carfor_Test[playerid] != INVALID_VEHICLE_ID)
    {
        DestroyVehicle(carfor_Test[playerid]);
        carfor_Test[playerid] = INVALID_VEHICLE_ID;
    }

    DestroyPlayerSelectCar(playerid);
    SetCameraBehindPlayer(playerid);

    SetPlayerPosExten(playerid, 1263.7188,-1531.3578,13.4546);
    SetPlayerFacingAngle(playerid, 180.2103);
    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);
    TogglePlayerControllable(playerid, 1);

    SelectCarShop[playerid] = false;
    EnterCarShop[playerid] = 0;

    return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:textid)
{
    // กด ESC
    if(textid == Text:INVALID_TEXT_DRAW && SelectCarShop[playerid])
    {
        Csrshopui(playerid);
        TogglePlayerControllable(playerid, true);
        SendClientMessage(playerid, -1, "{FC6216}[!] {FFFFFF}คุณได้ออกจากร้านขายรถแล้ว.");
        return Y_HOOKS_BREAK_RETURN_1;
    }
    return 1;
}


LoadObjectCarShop()
{
	new object_world = -1, object_int = -1;

	tmpobjid = CreateDynamicObject(1368, 1278.256347, -1557.627075, 13.216816, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1235.763671, -1551.755981, 26.030908, -0.000059, 0.000000, -89.999816, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1250.572875, -1551.752075, 26.031908, -0.000037, 0.000000, -89.999885, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1235.775756, -1551.732055, 26.801925, -0.000059, 0.000000, -89.999816, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1250.572875, -1551.732055, 26.801925, -0.000037, 0.000000, -89.999885, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1240.806518, -1550.042358, 17.225751, 89.999992, 180.000015, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19480, 1246.536987, -1550.042358, 17.225751, 89.999992, 180.000015, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(8947, 1242.984130, -1550.120483, 9.491624, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1242.112792, -1550.034423, 10.315841, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1246.661376, -1549.935791, 17.951023, 0.000000, 90.000030, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1242.393676, -1550.064453, 24.795869, -89.999992, -89.999984, 90.000007, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1235.075561, -1550.042358, 17.225751, 89.999992, 180.000015, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19741, 1242.095458, -1550.034423, 24.555864, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1248.342895, -1550.034423, 10.315841, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1236.122436, -1549.935791, 17.951023, 0.000000, 90.000030, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1252.266967, -1550.042358, 17.225751, 89.999992, 180.000015, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19741, 1248.634155, -1550.064453, 24.795869, -89.999992, -89.999984, 90.000007, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1248.334960, -1550.034423, 24.555864, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1235.872924, -1550.034423, 10.315841, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1259.530273, -1550.855102, 24.734653, 90.000000, 90.000000, -180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1236.144165, -1550.064453, 24.795869, -89.999992, -89.999984, 90.000007, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1235.853637, -1550.034423, 24.555864, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1261.053344, -1550.735107, 15.705842, -0.000014, 90.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1232.650878, -1549.935791, 17.951023, 0.000000, 90.000030, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1261.053344, -1550.735107, 21.955852, -0.000014, 90.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1260.769775, -1550.855102, 25.394666, 90.000000, 90.000000, -180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1254.583251, -1550.034423, 10.315841, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1229.345458, -1550.042358, 17.225751, 89.999992, 180.000015, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19741, 1254.574096, -1550.034423, 24.555864, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1254.824340, -1550.064453, 24.795869, -89.999992, -89.999984, 90.000007, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1262.090454, -1550.855102, 25.394666, 90.000000, 90.000000, -180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1243.629150, -1549.308471, 14.994640, 89.999992, 90.000022, -89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1243.630126, -1549.305541, 19.185659, 89.999992, 90.000022, -89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1229.622802, -1550.034423, 10.315841, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1257.997070, -1550.042358, 17.225751, 89.999992, 180.000015, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19866, 1258.025146, -1550.038940, 14.994647, 89.999992, 424.471191, -64.471237, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1229.894897, -1550.064453, 24.795869, -89.999992, -89.999984, 90.000007, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1264.084350, -1550.789672, 14.994647, 89.999992, 270.000000, -89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1258.025146, -1550.038940, 19.984663, 89.999992, 424.471191, -64.471237, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1229.636596, -1550.060546, 24.795869, -89.999992, -89.999984, 90.000007, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1237.917480, -1549.308471, 14.994640, 89.999992, 90.000007, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1264.084350, -1550.789672, 19.984663, 89.999992, 270.000000, -89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1229.632934, -1550.034423, 24.555864, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1237.918457, -1549.305541, 19.185659, 89.999992, 90.000007, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1257.733398, -1550.120483, 9.491624, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1228.234252, -1550.120483, 9.491624, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1263.420532, -1550.855102, 24.734653, 90.000000, 90.000000, -180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1249.421630, -1549.308471, 14.994640, 89.999992, 90.000038, -89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1249.422607, -1549.305541, 19.185659, 89.999992, 90.000038, -89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1258.025146, -1550.038940, 24.954677, 89.999992, 424.471191, -64.471237, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1264.084350, -1550.789672, 24.954677, 89.999992, 270.000000, -89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1259.573486, -1549.935791, 17.951023, 0.000000, 90.000030, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1260.803222, -1550.034423, 15.675841, -0.000022, 90.000000, -89.999931, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1232.185302, -1549.308471, 14.994640, 89.999992, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1232.186279, -1549.305541, 19.185659, 89.999992, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1261.323120, -1550.034423, 15.615839, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1260.803222, -1550.034423, 21.895858, -0.000022, 90.000000, -89.999931, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1261.323120, -1550.034423, 19.795843, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19864, 1261.170898, -1549.939086, 16.656984, -0.000007, 0.000000, -179.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "Auto_Slamvan2", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1255.142089, -1549.308471, 14.994640, 89.999992, 90.000053, -89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1255.143066, -1549.305541, 19.185659, 89.999992, 90.000053, -89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19864, 1261.170898, -1549.939086, 20.116987, -0.000007, 0.000000, -179.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "Auto_monstera", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1262.938354, -1550.042358, 17.225751, 89.999992, 180.000015, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19864, 1261.170898, -1549.939086, 23.586996, -0.000007, 0.000000, -179.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "Auto_feltzer", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1262.644531, -1550.054443, 10.315841, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1262.695190, -1550.064453, 24.795869, -89.999992, -89.999984, 90.000007, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1262.684448, -1550.036376, 24.555864, -0.000007, 90.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1226.413330, -1549.358520, 14.994640, 89.999992, 90.000007, -90.000022, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1226.414306, -1549.355590, 19.185659, 89.999992, 90.000007, -90.000022, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1265.884277, -1549.994140, 14.974638, 90.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1265.884277, -1549.994140, 19.164661, 90.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1272.482910, -1550.120483, 9.491624, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1213.484741, -1550.120483, 9.491624, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(1561, 1266.919433, -1548.775390, 13.425040, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18008, "intclothesa", "shop_wall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1224.329467, -1547.852539, 17.225751, 89.999992, 139.902709, 85.097328, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19741, 1224.331176, -1547.847900, 16.513845, 0.000003, 90.000007, 44.999988, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1224.331176, -1547.847900, 20.113853, 0.000003, 90.000007, 44.999988, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1224.331176, -1547.847900, 10.313840, 0.000003, 90.000007, 44.999988, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1269.159179, -1548.914062, 12.542640, 180.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1224.331176, -1547.862060, 24.793867, -89.999992, 125.264381, 80.264373, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1224.331176, -1547.847900, 24.563861, 0.000003, 90.000007, 44.999988, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1268.897216, -1548.652099, 12.752649, 180.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1229.625610, -1546.903686, 12.507854, 0.000003, 0.000000, 89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1268.649414, -1548.404296, 12.952651, 180.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1267.700439, -1548.177001, 16.026651, 0.000000, -89.999931, -44.999965, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1267.680419, -1548.197998, 13.334658, 180.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1268.394531, -1548.149414, 13.152658, 180.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1267.941772, -1547.801269, 19.185855, -89.999992, 49.902698, 94.902671, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1267.938476, -1547.794067, 19.215801, 0.000003, 89.999992, 135.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(1561, 1267.931274, -1547.763549, 13.425040, 0.000000, 0.000000, -64.599983, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18008, "intclothesa", "shop_wall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1247.074340, -1545.897949, 25.015014, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1267.973876, -1547.829467, 10.305861, 0.000003, 89.999992, 135.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1267.973876, -1547.829467, 24.555864, 0.000003, 89.999992, 135.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1267.977172, -1547.836669, 24.795869, -89.999992, 54.735618, 99.735610, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1234.594726, -1545.897949, 25.040000, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1247.102783, -1545.878295, 27.804052, 0.000000, -0.000037, 179.999771, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1268.315429, -1547.562988, 16.024650, 0.000000, -89.999931, -44.999965, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1268.129882, -1547.745239, 24.734653, 0.000000, 360.000000, 135.000030, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1268.323730, -1547.554687, 13.332657, 180.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1232.755004, -1545.895019, 25.016014, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1268.129882, -1547.745239, 26.144649, 0.000000, 360.000000, 135.000030, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1234.612426, -1545.878295, 27.798055, 0.000000, -0.000037, 179.999771, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1267.105712, -1546.981079, 13.152658, 0.000000, -89.999946, 135.000045, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 1278.256347, -1549.185913, 13.216816, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1226.764526, -1545.887451, 25.028007, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1266.850830, -1546.726196, 12.952651, 0.000000, -89.999946, 135.000045, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1259.563354, -1545.897949, 25.015014, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1226.523803, -1545.655273, 12.503849, 0.000003, 0.000000, 44.999988, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1226.779785, -1545.877319, 27.802053, 0.000000, -0.000037, 179.999771, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1266.603027, -1546.478393, 12.752649, 0.000000, -89.999946, 135.000045, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1259.563354, -1545.878295, 27.804052, 0.000000, -0.000037, 179.999771, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(1561, 1268.942382, -1546.752441, 13.425040, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18008, "intclothesa", "shop_wall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1222.061523, -1545.726806, 14.994647, -89.999992, 180.000030, 90.000030, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1222.062500, -1545.723876, 19.165672, -89.999992, 180.000030, 90.000030, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1283.952148, -1550.120239, 9.398628, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(3437, 1251.519287, -1544.714233, 25.230209, 90.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2823, "gb_kitchtake", "GB_pizzabox01", 0x00000000);
	tmpobjid = CreateDynamicObject(3437, 1232.798339, -1544.714233, 25.230209, 90.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2823, "gb_kitchtake", "GB_pizzabox01", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1265.774658, -1545.620727, 12.503849, 0.000003, 0.000000, 44.999988, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1265.805419, -1545.636596, 24.959915, 0.000000, 0.000000, -135.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1247.003906, -1543.777465, 12.447985, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1234.513305, -1543.777465, 12.447985, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1265.805419, -1545.636596, 27.859901, 0.000000, 0.000000, -135.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1270.141235, -1545.737182, 14.974638, 90.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1270.148315, -1545.730102, 19.124658, 90.000000, 90.000053, -224.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(1561, 1269.996459, -1545.698364, 13.425040, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18008, "intclothesa", "shop_wall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1259.482788, -1543.777465, 12.447985, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1257.598144, -1543.232788, 21.078645, 90.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1257.508056, -1543.142700, 21.078645, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1260.011474, -1543.150024, 17.830627, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1260.009765, -1543.144287, 23.547662, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1265.000732, -1543.150024, 17.830627, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1265.009887, -1543.144287, 23.547662, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1222.157470, -1542.798583, 17.225751, 89.999992, 90.000022, 90.000038, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19866, 1267.487915, -1543.152954, 17.827629, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1267.474609, -1543.137451, 23.551660, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.140258, -1542.557739, 10.313840, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.130859, -1542.581542, 24.793867, -89.999992, 180.000000, 89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.149780, -1542.557128, 24.565860, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1268.608520, -1543.142700, 21.078645, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1269.359008, -1543.142700, 21.078645, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1270.147949, -1542.861450, 17.175750, 89.999992, 180.000015, -179.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19866, 1257.599731, -1540.729980, 17.828628, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.154296, -1542.559082, 10.305861, 0.000000, 89.999992, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.154296, -1542.559082, 24.555870, 0.000000, 89.999992, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.168212, -1542.546264, 24.795869, -89.999992, 0.000007, 89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1257.599365, -1540.744018, 23.547662, 180.000000, 179.999984, 0.000014, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1246.029663, -1539.998168, 26.031908, 0.000033, 0.000067, 89.999687, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1246.045532, -1540.009277, 26.802925, 0.000033, 0.000067, 89.999687, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1228.423217, -1539.466186, 12.452987, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.154296, -1541.119873, 18.325866, 0.000000, 89.999992, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.154296, -1541.119995, 12.085865, 0.000000, 89.999992, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1265.599731, -1540.231201, 13.583307, 0.000000, 0.000000, -26.800003, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1222.111572, -1539.915161, 14.994647, -89.999992, 180.000015, 89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1222.112548, -1539.912231, 19.165672, -89.999992, 180.000015, 89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.176025, -1540.868408, 18.765874, -89.999992, 0.000007, 89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1257.598144, -1539.002319, 21.078645, 90.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1222.231201, -1539.425415, 17.951023, 0.000000, 90.000030, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.913818, -1539.386230, 12.456992, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1250.562744, -1538.132934, 13.583307, 0.000000, 0.000000, -26.800003, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1266.776733, -1539.689331, 13.469076, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1239.447021, -1537.893310, 13.583307, 0.000000, 0.000000, -26.800003, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19925, 1265.508178, -1539.503051, 12.563021, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3042, "ct_ventx", "liftdoorsac128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.968261, -1539.376586, 25.018013, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.975341, -1539.377075, 27.798055, 0.000000, -0.000037, -0.000228, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1257.598144, -1538.261596, 21.078645, 90.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19925, 1268.070312, -1539.503051, 12.563021, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3042, "ct_ventx", "liftdoorsac128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1266.876831, -1539.288940, 13.468072, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1226.764526, -1538.194702, 25.021011, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1270.081176, -1539.395385, 17.951009, 0.000000, 90.000030, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 1278.256347, -1540.605712, 13.216816, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1265.695922, -1538.188354, 13.468072, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1265.285522, -1538.078247, 13.471076, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1232.641235, -1536.828491, 26.031908, 0.000037, 0.000049, 179.999542, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1238.971313, -1536.595092, 27.010997, 0.000000, 180.000030, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAFFFFFFF);
	tmpobjid = CreateDynamicObject(8650, 1232.632324, -1536.812622, 26.802925, 0.000037, 0.000049, 179.999542, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1251.470947, -1536.595092, 27.010997, 0.000000, 180.000030, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAFFFFFFF);
	tmpobjid = CreateDynamicObject(8650, 1258.093994, -1536.812622, 26.031908, 0.000033, 0.000059, -0.000449, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1258.102905, -1536.828491, 26.802925, 0.000033, 0.000059, -0.000449, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19480, 1222.157470, -1537.068603, 17.225751, 89.999992, 90.000022, 90.000038, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0xAAFFFFFF);
	tmpobjid = CreateDynamicObject(19700, 1263.761962, -1536.995971, 17.951023, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19864, 1269.811401, -1537.778930, 16.446979, -0.000007, 0.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "Auto_monstera", 0x00000000);
	tmpobjid = CreateDynamicObject(2247, 1265.578247, -1537.129516, 13.946954, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(18244, 1270.192749, -1537.791870, 15.191967, 89.999992, 0.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15040, "cuntcuts", "GB_phone02", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1245.029296, -1535.425415, 13.583307, 0.000000, 0.000000, -26.800003, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1257.597778, -1535.801513, 17.826629, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1220.883178, -1536.895507, 26.030908, 0.000000, 0.000049, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1265.443359, -1536.891967, 26.031908, 0.000000, -0.000037, 179.999771, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1220.892089, -1536.871582, 26.801925, 0.000000, 0.000049, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1257.601318, -1535.810424, 23.549661, 180.000000, 179.999984, 0.000014, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1265.433593, -1536.872558, 26.801925, 0.000000, -0.000037, -179.999771, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.140258, -1536.337402, 10.313840, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1270.084960, -1537.175048, 19.298000, 0.000000, 90.000038, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.130859, -1536.341796, 24.793867, -89.999992, 180.000000, 89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.149780, -1536.316772, 24.565860, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1265.285522, -1536.197875, 13.471076, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1265.695922, -1536.187744, 13.468072, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.155273, -1536.595581, 12.085865, 0.000000, 89.999992, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.172119, -1536.311523, 18.765874, -89.999992, 0.000007, 89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.168212, -1536.306030, 24.795869, -89.999992, 0.000007, 89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.958251, -1535.195434, 25.025009, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1250.183715, -1533.778564, 13.583307, -0.000017, 0.000000, -116.799926, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1238.326904, -1533.652099, 13.583307, -0.000009, 0.000003, -116.799949, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1234.542602, -1533.778564, 13.583307, -0.000009, 0.000003, -116.799949, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1241.313232, -1533.395507, 17.825630, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1243.064819, -1533.401367, 21.078645, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1239.142333, -1533.440551, 12.439985, 0.000000, 0.000029, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.155273, -1535.657226, 18.326866, 0.000000, 89.999992, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1257.598144, -1534.052001, 21.078645, 90.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1245.746215, -1533.401367, 21.078645, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1248.241455, -1533.395507, 17.825630, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1236.322875, -1533.395507, 17.825630, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1253.968017, -1533.652099, 13.583307, -0.000017, 0.000000, -116.799926, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1244.852661, -1533.396484, 23.552658, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1239.852783, -1533.396484, 23.552658, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1251.643310, -1533.440551, 12.439985, 0.000000, 0.000029, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19925, 1265.508178, -1534.762207, 12.563021, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3042, "ct_ventx", "liftdoorsac128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1249.852905, -1533.396484, 23.552658, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1253.231445, -1533.395507, 17.825630, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1234.852783, -1533.396484, 23.552658, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1220.895385, -1534.791381, 26.030908, 0.000000, 0.000049, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1231.322143, -1533.395507, 17.825630, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1255.026733, -1533.401367, 17.828628, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1220.904296, -1534.767456, 26.801925, 0.000000, 0.000049, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1243.184448, -1532.846557, 19.073314, 0.000000, 0.000000, -26.800003, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1254.853881, -1533.396484, 23.552658, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1255.191284, -1533.400390, 23.549661, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1246.454589, -1532.830078, 19.073314, 0.000000, 0.000000, -26.800003, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1256.817382, -1533.401367, 21.078645, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1229.852539, -1533.396484, 23.552658, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1226.322143, -1533.395507, 17.825630, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1265.643554, -1534.024291, 13.583307, 0.000000, 0.000000, -26.800003, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1224.836791, -1533.399414, 17.822631, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1226.771728, -1533.455810, 27.804058, 0.000000, -0.000037, -0.000228, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1224.862792, -1533.396484, 23.552658, 180.000000, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1223.291992, -1533.396484, 21.082643, 89.999992, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1223.114379, -1533.401367, 21.078645, 89.999992, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1222.364257, -1533.401367, 21.078645, 89.999992, 179.999984, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1222.186401, -1533.157470, 14.994647, 89.999992, 358.225982, -88.225845, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1222.186401, -1533.157470, 19.984663, 89.999992, 358.225982, -88.225845, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.975341, -1533.507324, 27.803052, 0.000000, -0.000037, -0.000228, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1242.983154, -1531.774658, 9.498626, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1222.186401, -1533.157470, 24.954677, 89.999992, 358.225982, -88.225845, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(630, 1244.902832, -1531.641113, 13.583307, 0.000000, 0.000000, -26.800003, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobjid, 1, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1246.045532, -1531.648071, 26.031908, 0.000033, 0.000059, -90.000251, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1246.029663, -1531.636962, 26.802925, 0.000033, 0.000059, -90.000251, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1257.733398, -1531.777587, 9.498627, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1228.234252, -1531.777587, 9.498627, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19787, 1270.001831, -1533.214965, 21.120054, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 11631, "mp_ranchcut", "CJ_PAINTING22", 0x00000000);
	tmpobjid = CreateDynamicObject(19787, 1222.302001, -1531.323242, 20.350038, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10434, "hashblock2b_sfs", "ws_mural2", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.149780, -1531.066650, 18.415849, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.151733, -1531.064697, 12.297853, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1272.482910, -1531.777587, 9.498627, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1213.484741, -1531.777587, 9.498627, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1221.484375, -1530.122558, 15.615839, -0.000018, 90.000022, 0.000127, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.140258, -1530.117309, 10.313840, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1221.484375, -1530.122558, 21.865850, -0.000018, 90.000022, 0.000127, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.149780, -1530.095703, 24.565860, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.130859, -1530.100830, 24.793867, -89.999992, 180.000000, 89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.155273, -1530.355468, 15.595874, 0.000000, 89.999992, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.172119, -1530.069702, 18.765874, -89.999992, 0.000007, 89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.168212, -1530.066772, 24.795869, -89.999992, 0.000007, 89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1240.922851, -1527.344726, 12.445984, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1240.912841, -1527.244628, 17.936031, 0.000007, 0.000029, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1253.403198, -1527.344726, 12.445984, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1253.401855, -1527.244628, 17.936031, 0.000007, 0.000029, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1228.423217, -1527.344726, 12.445984, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1228.423217, -1527.244628, 17.936031, 0.000007, 0.000029, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19787, 1270.001831, -1528.644531, 20.360040, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10439, "hashblock3_sfs", "ws_mural1", 0x00000000);
	tmpobjid = CreateDynamicObject(19864, 1269.811401, -1528.548095, 16.446979, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "Auto_hustler", 0x00000000);
	tmpobjid = CreateDynamicObject(19864, 1222.498168, -1527.622558, 16.446979, 0.000014, 0.000022, 89.999855, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7418, "vgnbballsign2", "autobahn3_256", 0x00000000);
	tmpobjid = CreateDynamicObject(18244, 1270.192749, -1528.561035, 15.191967, 89.999992, 0.000011, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15040, "cuntcuts", "GB_phone02", 0x00000000);
	tmpobjid = CreateDynamicObject(3437, 1251.519287, -1526.744384, 25.230209, 89.999992, 180.000000, -89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2823, "gb_kitchtake", "GB_pizzabox01", 0x00000000);
	tmpobjid = CreateDynamicObject(18244, 1222.116821, -1527.609619, 15.191967, 89.999992, 185.442413, -95.442367, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15040, "cuntcuts", "GB_phone02", 0x00000000);
	tmpobjid = CreateDynamicObject(18244, 1222.116821, -1527.609619, 15.191967, 89.999992, 185.442413, -95.442367, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15040, "cuntcuts", "GB_phone02", 0x00000000);
	tmpobjid = CreateDynamicObject(3437, 1232.798339, -1526.744384, 25.230209, 89.999992, 180.000000, -89.999992, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2823, "gb_kitchtake", "GB_pizzabox01", 0x00000000);
	tmpobjid = CreateDynamicObject(19787, 1222.302001, -1527.423706, 20.920051, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 11631, "mp_ranchcut", "CJ_PAINTING22", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1222.244750, -1527.305419, 19.298000, 0.000000, 90.000038, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.913818, -1527.344726, 12.451990, 0.000000, 0.000029, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.761962, -1527.244628, 17.944026, 0.000007, 0.000029, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14708, "labig1int2", "ab_mottleGrey", 0x00000000);
	tmpobjid = CreateDynamicObject(8947, 1287.213378, -1531.777587, 9.408628, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1221.433959, -1527.087768, 14.994647, 89.999992, 538.837402, -88.837387, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1221.433959, -1527.087768, 14.994647, 89.999992, 538.837402, -88.837387, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1221.433959, -1527.087768, 19.984663, 89.999992, 538.837402, -88.837387, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1239.254516, -1525.754150, 25.018013, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1221.433959, -1527.087768, 24.954677, 89.999992, 538.837402, -88.837387, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1270.084960, -1527.562988, 19.298000, 0.000000, 90.000038, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1239.005737, -1525.763549, 27.811054, 0.000000, -0.000037, -0.000228, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1251.754394, -1525.754150, 25.018013, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1251.485595, -1525.753540, 27.811054, 0.000000, -0.000037, -0.000228, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1226.764526, -1525.754150, 25.018013, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1226.771728, -1525.873901, 27.814058, 0.000000, -0.000037, -0.000228, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.968261, -1525.754150, 25.018013, 0.000000, 0.000037, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.975341, -1525.753540, 27.811054, 0.000000, -0.000037, -0.000228, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.145874, -1524.126586, 15.645875, 0.000000, 89.999992, 359.999938, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.130859, -1524.132568, 18.765874, -89.999992, 0.000007, -90.000038, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1222.139160, -1524.130859, 24.805887, -89.999992, 0.000007, -90.000038, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19787, 1222.302001, -1523.393066, 20.350038, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 2702, "pick_up", "cj_fambly", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.155273, -1524.126586, 15.595874, 0.000000, 89.999992, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19787, 1270.001831, -1524.144287, 21.120054, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 11631, "mp_ranchcut", "CJ_PAINTING22", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.170166, -1524.100585, 18.765874, -89.999992, 0.000007, 89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1270.163330, -1524.113891, 24.795869, -89.999992, 0.000007, 89.999961, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19864, 1237.802612, -1521.424804, 16.446979, -0.000014, 0.000037, 0.000014, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "Auto_feltzer", 0x00000000);
	tmpobjid = CreateDynamicObject(13648, 1246.233642, -1521.359375, 17.814210, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19864, 1249.313842, -1521.424804, 16.446979, -0.000014, 0.000029, 0.000014, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "Auto_windsor", 0x00000000);
	tmpobjid = CreateDynamicObject(13648, 1246.226806, -1521.333251, 18.034215, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1240.872436, -1521.134277, 19.298000, 0.000000, 90.000038, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1243.936279, -1521.055664, 15.645875, 0.000000, 89.999992, 449.999938, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1242.137329, -1521.029052, 18.765874, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1237.696411, -1521.055664, 15.645875, 0.000000, 89.999992, 449.999938, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(18244, 1237.815551, -1521.043457, 15.191967, 89.999992, 86.601226, -86.601173, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15040, "cuntcuts", "GB_phone02", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1248.378540, -1521.029052, 18.765874, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(18244, 1249.326782, -1521.043457, 15.191967, 89.999992, 83.226013, -83.225975, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15040, "cuntcuts", "GB_phone02", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1250.175781, -1521.055664, 15.645875, 0.000000, 89.999992, 449.999938, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1235.896606, -1521.029052, 18.765874, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1242.134521, -1521.036865, 24.805887, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1253.352905, -1521.134277, 19.298000, 0.000000, 90.000038, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1248.384643, -1521.036865, 24.805887, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1235.883789, -1521.036865, 24.805887, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1231.446289, -1521.055664, 15.645875, 0.000000, 89.999992, 449.999938, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1254.628784, -1521.029052, 18.765874, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1256.406494, -1521.055664, 15.645874, 0.000000, 89.999992, 449.999938, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19864, 1260.832519, -1521.424804, 16.446979, -0.000014, 0.000022, 0.000014, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "Auto_Slamvan2", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1229.656494, -1521.029052, 18.765874, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1228.373168, -1521.134277, 19.298000, 0.000000, 90.000038, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1254.625000, -1521.036865, 24.805887, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1229.643554, -1521.036865, 24.805887, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1225.206176, -1521.055664, 15.645875, 0.000000, 89.999992, 449.999938, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1260.957641, -1521.055664, 15.645875, 0.000000, 89.999992, 449.999938, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(18244, 1260.845458, -1521.043457, 15.191967, 89.999992, 76.631515, -76.631484, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15040, "cuntcuts", "GB_phone02", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1225.192749, -1521.031982, 18.765874, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1260.878051, -1521.029052, 18.765874, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1225.199584, -1521.040771, 24.805887, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1260.874389, -1521.036865, 24.805887, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(19700, 1263.913574, -1521.134277, 19.298000, 0.000000, 90.000038, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1235.762329, -1519.904052, 26.030908, 0.000017, 0.000067, 89.999809, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1235.778198, -1519.915161, 26.801925, 0.000017, 0.000067, 89.999809, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1267.094848, -1521.046020, 15.595874, 0.000000, 89.999992, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1267.118896, -1521.029052, 18.765874, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1254.962646, -1519.896240, 26.031908, 0.000024, 0.000067, 89.999786, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(8650, 1254.978515, -1519.907348, 26.802925, 0.000024, 0.000067, 89.999786, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3267, "milbase", "lightblue_64", 0x00000000);
	tmpobjid = CreateDynamicObject(19741, 1267.114013, -1521.033935, 24.805887, -89.999992, 0.000007, -0.000037, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(1633, 1246.503295, -1546.366943, 12.693948, -8.800000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1252.263183, -1546.366943, 12.693948, -8.800000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1240.693115, -1546.366943, 12.693948, -8.800000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1235.033203, -1546.366943, 12.693948, -8.800000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1225.637329, -1536.936401, 12.686928, -8.800000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1225.637329, -1524.515136, 12.686928, -8.800000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1225.637329, -1530.795532, 12.686928, -8.800000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1235.033203, -1524.683227, 12.693948, -8.800008, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1240.793090, -1524.683227, 12.693948, -8.800008, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1246.603271, -1524.683227, 12.693948, -8.800008, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1252.263183, -1524.683227, 12.693948, -8.800008, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1257.975952, -1524.683227, 12.693948, -8.800008, 0.000009, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1633, 1263.635864, -1524.683227, 12.693948, -8.800008, 0.000009, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(6129, 1205.167236, -1572.198486, 12.521869, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19790, 1218.066040, -1564.779296, 7.569114, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1253.672729, -1562.258300, 12.026139, -0.000007, 0.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1241.712646, -1561.787841, 12.036142, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1247.702636, -1561.787841, 12.036142, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1235.733032, -1561.787841, 12.036142, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1253.692749, -1561.787841, 12.036142, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1229.763427, -1561.787841, 12.036142, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1223.823852, -1561.787841, 12.036142, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(737, 1226.097290, -1560.123657, 12.727169, 0.000000, 0.000000, -360.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1212.114257, -1562.258300, 12.036142, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1209.272827, -1561.787841, 12.036142, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(737, 1284.927734, -1561.473388, 12.567174, 0.000000, 0.000000, -270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1279.473754, -1559.129638, 12.035140, 0.000000, -0.000014, -179.999908, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1206.502685, -1558.997802, 12.036142, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19279, 1241.108886, -1551.982666, 12.743336, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19279, 1247.039428, -1551.982666, 12.743336, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19279, 1235.408691, -1551.982666, 12.743336, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19279, 1252.389648, -1551.982666, 12.743336, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19279, 1229.868652, -1551.982666, 12.743336, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19479, 1233.774536, -1550.195068, 23.520084, -0.000012, 0.000012, -89.999938, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19479, 1233.814819, -1550.165039, 23.540084, -0.000012, 0.000012, -89.999938, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19482, 1261.099487, -1550.830688, 18.740062, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19482, 1261.079467, -1550.820678, 18.760063, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1279.473754, -1553.188720, 12.035140, 0.000000, -0.000014, -179.999908, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1206.502685, -1553.077270, 12.036142, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19279, 1223.305175, -1549.238891, 12.743336, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1262.006713, -1549.093383, 12.555191, -0.000007, -0.000014, -179.999862, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(737, 1284.887084, -1550.119018, 12.567175, 0.000000, -0.000007, -179.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1279.473754, -1547.248291, 12.035140, 0.000000, -0.000014, -179.999908, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1206.502685, -1547.127563, 12.036142, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1259.965087, -1543.086059, 18.782592, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1263.415039, -1543.086059, 18.782592, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1266.875488, -1543.086059, 18.782592, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1257.675048, -1540.735107, 18.782592, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(5130, 1244.656250, -1539.198608, 15.074666, 0.000000, 0.000000, -136.199966, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1279.473754, -1541.298095, 12.035140, 0.000000, -0.000014, -179.999908, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1206.502685, -1541.187500, 12.036142, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19893, 1265.645141, -1538.203247, 13.465352, 0.000000, 0.000000, 113.700019, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 1267.177124, -1537.814453, 12.549983, 0.000000, 0.000000, -69.999992, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1257.675048, -1535.784667, 18.782592, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19481, 1242.727661, -1535.381591, 27.145755, 180.000000, 450.000000, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19893, 1265.584472, -1536.122802, 13.465352, 0.000000, 0.000000, 54.600025, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1245.294433, -1534.523193, 12.555191, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1235.444824, -1534.043701, 12.555191, 0.000007, 0.000007, 0.000007, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1251.085937, -1534.043701, 12.555191, 0.000007, 0.000014, 0.000007, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 1267.360595, -1535.676147, 12.549983, 0.000000, 0.000000, -93.999977, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19700, 1239.142333, -1533.440551, 12.439985, 0.000000, 0.000029, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1241.312255, -1533.312988, 18.782592, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1237.852172, -1533.312988, 18.782592, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1248.253173, -1533.312988, 18.782592, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1234.391723, -1533.312988, 18.782592, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1251.713623, -1533.312988, 18.782592, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1237.525390, -1533.022705, 12.555191, -0.000007, -0.000007, -179.999908, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1230.931884, -1533.312988, 18.782592, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1255.174194, -1533.312988, 18.782592, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(737, 1284.887084, -1538.377441, 12.567175, -0.000007, 0.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1253.166503, -1533.022705, 12.555191, -0.000007, -0.000014, -179.999862, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1227.471435, -1533.312988, 18.782592, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1238.756347, -1532.592285, 18.055192, -0.000007, -0.000014, -179.999862, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1244.273437, -1532.442626, 12.555191, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1252.926269, -1532.592285, 18.055192, -0.000007, -0.000014, -179.999862, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1224.020751, -1533.312988, 18.782592, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1753, 1230.396240, -1532.592285, 18.055192, -0.000007, -0.000014, -179.999862, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1279.473754, -1535.369262, 12.035140, 0.000000, -0.000014, -179.999908, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1206.502685, -1535.248046, 12.036142, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2714, 1241.161621, -1527.188354, 17.794553, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2714, 1246.892211, -1527.188354, 17.794553, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2714, 1235.260498, -1527.188354, 17.794553, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2714, 1252.462646, -1527.188354, 17.794553, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2714, 1258.083496, -1527.188354, 17.794553, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19864, 1222.498168, -1527.622558, 16.446979, 0.000014, 0.000022, 89.999855, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19700, 1222.244750, -1527.305419, 19.298000, 0.000000, 90.000038, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2714, 1263.314086, -1527.188354, 17.794553, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1279.473754, -1529.429565, 12.035140, 0.000000, -0.000014, -179.999908, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1206.502685, -1529.308227, 12.036142, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(737, 1284.887084, -1527.339233, 12.567175, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1240.994506, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1246.964233, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1235.034912, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1252.903930, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1229.064819, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1258.843750, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1279.473754, -1523.469848, 12.035140, 0.000000, -0.000014, -179.999908, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1206.502685, -1523.398437, 12.036142, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1223.154663, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1264.813720, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1217.224975, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1270.743774, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(906, 1294.683837, -1525.554443, 11.975179, 0.000000, 0.000000, 103.600021, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1211.343505, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1276.683715, -1520.619873, 12.035140, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3475, 1209.192871, -1520.617919, 12.036142, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(906, 1295.783691, -1520.549194, 11.925181, 0.000000, 0.000000, -133.399917, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(6125, 1196.089111, -1488.995361, 12.475000, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(6101, 1268.292236, -1467.768798, 11.920310, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    return 1;
}

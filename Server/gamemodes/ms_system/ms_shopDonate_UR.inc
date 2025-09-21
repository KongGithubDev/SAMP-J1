/*
	System Shop Donate by M SHOP
	UI/Design by M SHOP
	Coded by Emperor F.
*/
#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define URSDN_X  839.3643 // x 
#define URSDN_Y  -2032.7064  // y
#define URSDN_Z  14.0741  // z

new PlayerText:UR_DSTD[MAX_PLAYERS][31];
new dstdOpen[MAX_PLAYERS];
new sortSelected[MAX_PLAYERS];
new dsBuyIdx[MAX_PLAYERS];

/// HandleClickDonateTD(playerid, PlayerText:playertextid)

// ชื่อไอเท็ม ************************* ไม่มี ให้ใส่ ว่าง "" *****************************
new dshopTXD[6][10][64] = {
    { "UR_Shop_Donate:General_item1", "UR_Shop_Donate:General_item2", "UR_Shop_Donate:General_item3", "", "", "", "", "", "", "" },
    { "UR_Shop_Donate:Gacha_item1", "UR_Shop_Donate:Gacha_item2", "", "", "", "", "", "", "", "" },
    { "UR_Shop_Donate:fashion_item1", "UR_Shop_Donate:fashion_item2", "UR_Shop_Donate:fashion_item6", "UR_Shop_Donate:fashion_item3", "UR_Shop_Donate:fashion_item4", "UR_Shop_Donate:fashion_item5", "UR_Shop_Donate:fashion_item7", "UR_Shop_Donate:fashion_item8", "", "" },
    { "UR_Shop_Donate:CarD_item1", "UR_Shop_Donate:CarD_item2", "UR_Shop_Donate:CarD_item3", "", "", "", "", "", "", "" },
    { "", "", "", "", "", "", "", "", "", "" },
    { "UR_Shop_Donate:Skins_item1", "UR_Shop_Donate:Skins_item2", "UR_Shop_Donate:Skins_item3", "UR_Shop_Donate:Skins_item4", "UR_Shop_Donate:Skins_item5", "UR_Shop_Donate:Skins_item6", "", "", "", "" } 
};

// ราคาสินค้า ************************* ไม่มี ให้ใส่ 0 *****************************
new dshopPrice[6][10] = {
    { 99, 199, 150, 0, 0, 0, 0, 0, 0, 0 },
    { 2, 10, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 299, 99, 199, 199, 99, 149, 149, 249, 0, 0 },
    { 299, 699, 199, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 100, 350, 350, 150, 150, 99, 0, 0, 0, 0 }
};

hook OnGameModeInit()
{
	CreateDynamicPickup(1274, 23, URSDN_X,URSDN_Y,URSDN_Z, -1);
    CreateDynamic3DTextLabel("{FFFF00}Shop-Donate\n{FFFFFF}กด 'N' เพื่อซื้อของ", COLOR_LIGHTRED,URSDN_X,URSDN_Y,URSDN_Z, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 30.0);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO)
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.5, URSDN_X,URSDN_Y,URSDN_Z))
		{
			ShowURDSTD(playerid, true);
		}
	}
	return 1;
}

CreateDShop(playerid)
{
	UR_DSTD[playerid][0] = CreatePlayerTextDraw(playerid, 174.000000, 99.000000, "UR_Shop_Donate:UR_Donate_Main");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][0], 297.000000, 270.500000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][0], 0);

	UR_DSTD[playerid][1] = CreatePlayerTextDraw(playerid, 441.000000, 121.000000, "0"); //จำนวน Coin 
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][1], 0.266667, 1.100000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][1], 3);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][1], 0);

	UR_DSTD[playerid][2] = CreatePlayerTextDraw(playerid, 457.000000, 121.000000, "_"); //ปุ่มกดปิด
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][2], 0.600000, 1.450000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][2], 13.500000, 12.500000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][2], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][2], 1);

	UR_DSTD[playerid][3] = CreatePlayerTextDraw(playerid, 204.000000, 146.000000, "_"); //ปุ่มกดหน้าแรก
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][3], 0.600000, 1.500000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][3], 13.500000, 21.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][3], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][3], 1);

	UR_DSTD[playerid][4] = CreatePlayerTextDraw(playerid, 246.000000, 146.000000, "_"); //ปุ่มกด หน้าไอเท็มทั่วไป
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][4], 0.600000, 1.500000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][4], 13.500000, 28.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][4], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][4], 1);

	UR_DSTD[playerid][5] = CreatePlayerTextDraw(playerid, 287.000000, 146.000000, "_"); //ปุ่มกด หน้ากาชาปอง
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][5], 0.600000, 1.500000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][5], 13.500000, 28.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][5], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][5], 1);

	UR_DSTD[playerid][6] = CreatePlayerTextDraw(playerid, 323.000000, 146.000000, "_");//ปุ่มกด หน้าแฟชั่น
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][6], 0.600000, 1.500000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][6], 13.500000, 23.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][6], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][6], 1);

	UR_DSTD[playerid][7] = CreatePlayerTextDraw(playerid, 362.000000, 146.000000, "_");//ปุ่มกด หน้ารถโดเนท
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][7], 0.600000, 1.500000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][7], 13.500000, 27.500000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][7], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][7], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][7], 1);

	UR_DSTD[playerid][8] = CreatePlayerTextDraw(playerid, 394.000000, 146.000000, "_"); //ปุ่มกด หน้าVIP
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][8], 0.600000, 1.500000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][8], 13.500000, 18.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][8], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][8], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][8], 1);

	UR_DSTD[playerid][9] = CreatePlayerTextDraw(playerid, 422.000000, 146.000000, "_"); //ปุ่มกด หน้าสกิน
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][9], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][9], 0.600000, 1.500000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][9], 13.500000, 18.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][9], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][9], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][9], 1);

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	UR_DSTD[playerid][10] = CreatePlayerTextDraw(playerid, 174.000000, 99.000000, "UR_Shop_Donate:Slot_Promote");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][10], 297.000000, 270.500000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][10], 0);


    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	UR_DSTD[playerid][11] = CreatePlayerTextDraw(playerid, 184.000000, 185.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][11], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][11], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][11], 1);

	UR_DSTD[playerid][12] = CreatePlayerTextDraw(playerid, 210.000000, 249.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][12], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][12], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][12], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][12], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][12], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][12], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][12], 0);

	UR_DSTD[playerid][13] = CreatePlayerTextDraw(playerid, 240.000000, 185.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][13], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][13], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][13], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][13], 1);

	UR_DSTD[playerid][14] = CreatePlayerTextDraw(playerid, 266.000000, 249.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][14], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][14], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][14], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][14], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][14], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][14], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][14], 0);

	UR_DSTD[playerid][15] = CreatePlayerTextDraw(playerid, 296.000000, 185.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][15], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][15], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][15], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][15], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][15], 1);

	UR_DSTD[playerid][16] = CreatePlayerTextDraw(playerid, 322.000000, 249.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][16], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][16], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][16], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][16], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][16], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][16], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][16], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][16], 0);

	UR_DSTD[playerid][17] = CreatePlayerTextDraw(playerid, 352.000000, 185.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][17], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][17], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][17], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][17], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][17], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][17], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][17], 1);

	UR_DSTD[playerid][18] = CreatePlayerTextDraw(playerid, 378.000000, 249.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][18], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][18], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][18], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][18], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][18], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][18], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][18], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][18], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][18], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][18], 0);

	UR_DSTD[playerid][19] = CreatePlayerTextDraw(playerid, 408.000000, 185.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][19], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][19], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][19], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][19], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][19], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][19], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][19], 1);

	UR_DSTD[playerid][20] = CreatePlayerTextDraw(playerid, 434.000000, 249.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][20], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][20], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][20], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][20], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][20], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][20], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][20], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][20], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][20], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][20], 0);

	UR_DSTD[playerid][21] = CreatePlayerTextDraw(playerid, 184.000000, 276.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][21], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][21], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][21], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][21], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][21], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][21], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][21], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][21], 1);

	UR_DSTD[playerid][22] = CreatePlayerTextDraw(playerid, 210.000000, 340.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][22], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][22], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][22], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][22], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][22], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][22], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][22], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][22], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][22], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][22], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][22], 0);

	UR_DSTD[playerid][23] = CreatePlayerTextDraw(playerid, 240.000000, 276.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][23], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][23], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][23], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][23], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][23], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][23], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][23], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][23], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][23], 1);

	UR_DSTD[playerid][24] = CreatePlayerTextDraw(playerid, 266.000000, 340.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][24], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][24], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][24], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][24], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][24], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][24], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][24], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][24], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][24], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][24], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][24], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][24], 0);

	UR_DSTD[playerid][25] = CreatePlayerTextDraw(playerid, 296.000000, 276.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][25], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][25], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][25], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][25], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][25], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][25], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][25], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][25], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][25], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][25], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][25], 1);

	UR_DSTD[playerid][26] = CreatePlayerTextDraw(playerid, 322.000000, 340.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][26], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][26], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][26], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][26], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][26], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][26], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][26], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][26], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][26], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][26], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][26], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][26], 0);

	UR_DSTD[playerid][27] = CreatePlayerTextDraw(playerid, 352.000000, 276.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][27], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][27], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][27], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][27], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][27], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][27], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][27], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][27], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][27], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][27], 1);

	UR_DSTD[playerid][28] = CreatePlayerTextDraw(playerid, 378.000000, 340.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][28], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][28], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][28], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][28], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][28], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][28], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][28], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][28], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][28], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][28], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][28], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][28], 0);

	UR_DSTD[playerid][29] = CreatePlayerTextDraw(playerid, 408.000000, 276.000000, "UR_Shop_Donate:Item_Slot1");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][29], 4);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][29], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][29], 53.000000, 76.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][29], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][29], 1);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][29], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][29], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][29], 50);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][29], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][29], 1);

	UR_DSTD[playerid][30] = CreatePlayerTextDraw(playerid, 434.000000, 340.000000, "100 : Coin");
	PlayerTextDrawFont(playerid, UR_DSTD[playerid][30], 1);
	PlayerTextDrawLetterSize(playerid, UR_DSTD[playerid][30], 0.162500, 0.949999);
	PlayerTextDrawTextSize(playerid, UR_DSTD[playerid][30], 400.000000, 48.000000);
	PlayerTextDrawSetOutline(playerid, UR_DSTD[playerid][30], 0);
	PlayerTextDrawSetShadow(playerid, UR_DSTD[playerid][30], 0);
	PlayerTextDrawAlignment(playerid, UR_DSTD[playerid][30], 2);
	PlayerTextDrawColor(playerid, UR_DSTD[playerid][30], 255);
	PlayerTextDrawBackgroundColor(playerid, UR_DSTD[playerid][30], 255);
	PlayerTextDrawBoxColor(playerid, UR_DSTD[playerid][30], -16777166);
	PlayerTextDrawUseBox(playerid, UR_DSTD[playerid][30], 0);
	PlayerTextDrawSetProportional(playerid, UR_DSTD[playerid][30], 1);
	PlayerTextDrawSetSelectable(playerid, UR_DSTD[playerid][30], 0);
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if (clickedid == Text:INVALID_TEXT_DRAW) {
        for (new i = 0; i < 31; i++) {
            PlayerTextDrawHide(playerid, UR_DSTD[playerid][i]);
        }
    }
    return true;
}

HandleClickDonateTD(playerid, PlayerText:playertextid)
{
	if (dstdOpen[playerid])
	{
		if (playertextid == UR_DSTD[playerid][2])
		{
			ShowURDSTD(playerid, false);
			PlayerPlaySound(playerid, 1055, 0.0, 0.0, 0.0);
		}
		else
		{
			new found = 0;
			for (new i=3;i<10;i++)
			{
				if (playertextid == UR_DSTD[playerid][i])
				{
					PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
					sortSelected[playerid] = i-4;
					ProcessDS(playerid);
					found ++;
					break;
				}
			}
			
			for (new i = 10; i <= 29; i++)
			{
				if (found) break;
				if (i >= 11 && (i - 11) % 2 == 0)
				{
					if (playertextid == UR_DSTD[playerid][i])
					{
						dsBuyIdx[playerid] = (i - 11) / 2;
						ProcessDS(playerid, true);
						break;
					}
				}
			}
		}
	}
	return 1;
}

ProcessDS(playerid, bool:click = false)
{
	if (!click)
	{
		new str[64];

		for (new i = 10; i < 31; i++)
		{
			PlayerTextDrawHide(playerid, UR_DSTD[playerid][i]);
		}
		if (sortSelected[playerid] == -1)
		{
			PlayerTextDrawShow(playerid, UR_DSTD[playerid][10]);
		}
		else
		{
			new dsLen;
			for (new i=0;i<10;i++)
			{
				if (dshopPrice[sortSelected[playerid]][i] > 0)
					dsLen ++;
			}
			for (new i = 0; i < dsLen; i++)
			{
				new tid = 11 + (i * 2);

				format(str, sizeof str, "%s", dshopTXD[sortSelected[playerid]][i]);
				PlayerTextDrawSetString(playerid, UR_DSTD[playerid][tid], str);
				PlayerTextDrawShow(playerid, UR_DSTD[playerid][tid]);

				format(str, sizeof str, "%d : Coin", dshopPrice[sortSelected[playerid]][i]);
				PlayerTextDrawSetString(playerid, UR_DSTD[playerid][tid+1], str);
				PlayerTextDrawShow(playerid, UR_DSTD[playerid][tid+1]);
			}
		}
	}
	else
	{
		if (sortSelected[playerid] >= 0)
		{
			BuyDS(playerid);
		}
	}
}

BuyDS(playerid)
{
	new idx = dsBuyIdx[playerid];
	// DEBUG
	//SendClientMessageEx(playerid, -1, "กดช่องที่ %d หมวดหมู่ที่ %d ราคา %d", idx, sortSelected[playerid], dshopPrice[sortSelected[playerid]][idx]);

	Dialog_Show(playerid, DIALOG_COMFIRM_BUYDS, DIALOG_STYLE_MSGBOX, "[ยืนยันการซื้อ]", "คุณต้องการซื้อไอเท็มนี้ในราคา %d หรือไม่?", "ซื้อ", "ยกเลิก", dshopPrice[sortSelected[playerid]][idx]);
}
Dialog:DIALOG_COMFIRM_BUYDS(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new price = dshopPrice[sortSelected[playerid]][dsBuyIdx[playerid]];
	    if (playerData[playerid][pCoin] < price)
			return SendClientMessageEx(playerid, COLOR_RED, "คุณมี Coin ไม่เพียงพอ!");
		
		playerData[playerid][pCoin] -= price;
		new str[64];
		format(str, 64, "%d", playerData[playerid][pCoin]);
		PlayerTextDrawSetString(playerid, UR_DSTD[playerid][1], str);

		//เริ่มจาก 0 หน้าแรกไม่ประมวลผล (หน้าแรก-1)
		//SendClientMessageEx(playerid, -1, "หมวดที่ %d ช่องที่ %d", sortSelected[playerid], dsBuyIdx[playerid]);
		GiveItemFromDSToPlayer(playerid);

	}
	return 1;
}

GiveItemFromDSToPlayer(playerid) //ให้ไอเท็มตามหมวดหมู่ ตามช่องที่ซื้อ
{
	switch(sortSelected[playerid]) //หาหมวดที่กด
	{
		case 0: 
		{
			switch(dsBuyIdx[playerid]) // ทั่วไป
			{
				case 0: {
					Inventory_Add(playerid, "บัตรเทรดอาวุธ", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}บัตรเทรดอาวุธ +1");

					UrLogShopDonate1(playerid);

				}
				case 1: {
					Inventory_Add(playerid, "กล่องตีอาวุธv1", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}กล่องตีอาวุธv1 +1");

					UrLogShopDonate2(playerid);
				}
				case 2: {
					Inventory_Add(playerid, "บลูปริ้นกุญแจตู้", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}บลูปริ้นกุญแจตู้] +1");
				}
			}
		}
		case 1:
		{
			switch(dsBuyIdx[playerid]) // กาชาปอง
			{
				case 0: {
					Inventory_Add(playerid, "GACHAPON-MONEY", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}กาชาเงินเขียว +1");
				
					UrLogShopDonate3(playerid);
				}
				case 1: {
					Inventory_Add(playerid, "GACHAPON-BLACK", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}กาชางานดำ +1");
				}
			}
		}
		case 2:
		{
			switch(dsBuyIdx[playerid]) // แฟชั่น
			{
				case 0: {
					Inventory_Add(playerid, "หมัดสายฟ้า", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}หมัดสายฟ้า +1");

					UrLogShopDonate4(playerid);
				}
				case 1: {
					Inventory_Add(playerid, "รองเท้าหมา", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}รองเท้าหมา +1");

					UrLogShopDonate5(playerid);
                }
				case 2: {
					Inventory_Add(playerid, "หมัดไฟ", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}หมัดไฟ +1");
				}
				case 3: {
					Inventory_Add(playerid, "หมวกชินนาม่อน", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}หมวกชินนาม่อน +1");
				}
				case 4: {
					Inventory_Add(playerid, "ถือชินนาม่อน", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}ถือชินนาม่อน +1");
				}
				case 5: {
					Inventory_Add(playerid, "เป๋าชินนาม่อน", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}เป๋าชินนาม่อน +1");
				}
				case 6: {
					Inventory_Add(playerid, "หมาเกาะหัว", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}หมาเกาะหัว +1");
				}
				case 7: {
					Inventory_Add(playerid, "ห่วงยางหมา", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}ห่วงยางหมา +1");
				}
			}
		}
		case 3:
		{
			switch(dsBuyIdx[playerid]) // รถโดเนท
			{
				case 0: {
					new query[512];
					mysql_format(g_SQL, query, sizeof(query), "INSERT INTO vehicles (carOwnerID, carOwner, carModel, carPrice, carFuel, carPosX, carPosY, carPosZ, carPosA) VALUES(%d, '%s', 603, 0, 100.0, '552.8177', '-1284.1307', '17.0007', '0.0000')", playerData[playerid][pID], GetPlayerNameEx(playerid));
					mysql_tquery(g_SQL, query);

					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00} BMW i8 +1 คัน");
					UrLogShopDonate6(playerid);
				}
				case 1: {
					new query[512];
					mysql_format(g_SQL, query, sizeof(query), "INSERT INTO vehicles (carOwnerID, carOwner, carModel, carPrice, carFuel, carPosX, carPosY, carPosZ, carPosA) VALUES(%d, '%s', 562, 0, 100.0, '552.8177', '-1284.1307', '17.0007', '0.0000')", playerData[playerid][pID], GetPlayerNameEx(playerid));
					mysql_tquery(g_SQL, query);

					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00} GTR R35 +1 คัน");
					UrLogShopDonate7(playerid);
				}
				case 2: {
					new query[512];
					mysql_format(g_SQL, query, sizeof(query), "INSERT INTO vehicles (carOwnerID, carOwner, carModel, carPrice, carFuel, carPosX, carPosY, carPosZ, carPosA) VALUES(%d, '%s', 411, 0, 100.0, '552.8177', '-1284.1307', '17.0007', '0.0000')", playerData[playerid][pID], GetPlayerNameEx(playerid));
					mysql_tquery(g_SQL, query);

					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00} McLaren 720s +1 คัน");
					UrLogShopDonate8(playerid);
				}
			}
		}
		case 4:
		{
			switch(dsBuyIdx[playerid]) // VIP
			{
				//case 0: {}
				//case 1: {}
			}
		}
		case 5:
		{
			switch(dsBuyIdx[playerid]) // สกิน
			{
				case 0: {
					Inventory_Add(playerid, "กล่องสกิน193", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}กล่องสกิน193 +1");
					UrLogShopDonate9(playerid);
				}
				case 1: {
					Inventory_Add(playerid, "กล่องสกิน202", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}กล่องสกิน202 +1");
					UrLogShopDonate10(playerid);
				}
				case 2: {
					Inventory_Add(playerid, "กล่องสกิน216", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}กล่องสกิน216 +1");
				}
				case 3: {
					Inventory_Add(playerid, "กล่องสกิน214", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}กล่องสกิน214 +1");
				}
				case 4: {
					Inventory_Add(playerid, "กล่องสกิน238", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}กล่องสกิน238 +1");
				}
				case 5: {
					Inventory_Add(playerid, "กล่องสกิน64", 1);
					SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้ซื้อ {00FF00}กล่องสกิน64 +1");
				}
			}
		}
	}
}

ShowURDSTD(playerid, bool:enable)
{
	if (enable)
	{
		CreateDShop(playerid);
		SelectTextDraw(playerid, -1);
		for (new i =0;i<11;i++)
		{
			PlayerTextDrawShow(playerid, UR_DSTD[playerid][i]);
		}
		new str[64];
		format(str, 64, "%d", playerData[playerid][pCoin]);
		PlayerTextDrawSetString(playerid, UR_DSTD[playerid][1], str);
	}
	else
	{
		for (new i =0;i<31;i++)
		{
			PlayerTextDrawHide(playerid, UR_DSTD[playerid][i]);
			PlayerTextDrawDestroy(playerid, UR_DSTD[playerid][i]);
		}
		CancelSelectTextDraw(playerid);
	}
	dstdOpen[playerid] = enable;
}

CMD:ttyd(playerid, params[])
{
	ShowURDSTD(playerid, true);
	return 0;
}


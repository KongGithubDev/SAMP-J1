#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define		MAX_TRUNK_SHOW_PER_PAGE		30
#define		TRUNK_TD_ALL				126

new PlayerText:TrunkTD[MAX_PLAYERS][TRUNK_TD_ALL];
enum TrunkDataEnum
{
    bool:trunkExists,
	trunkID,
	trunkItemName[32],
	trunkQuantity
}
new TrunkData[MAX_VEHICLES][MAX_INVENTORY][TrunkDataEnum];

hook OnGameModeInit()
{
    for (new i = 0; i < MAX_VEHICLES; i++) {
        for (new j = 0; j < MAX_INVENTORY; j++) {
			if (TrunkData[i][j][trunkExists])
			{
				TrunkData[i][j][trunkExists] = false;
				TrunkData[i][j][trunkQuantity] = 0;
				format(TrunkData[i][j][trunkItemName], 32, "");
			}
		}
    }
    return 1;
}

hook OnPlayerConnect(playerid)
{
    SetPVarInt(playerid, "ShowTrunk", 0);
	SetPVarInt(playerid, "Trunk_Page", 1);
	SetPVarInt(playerid, "Trunk_VehicleID", INVALID_VEHICLE_ID);

	for (new j = 0; j < 2; j++) {
		for (new k = 0; k < MAX_TRUNK_SHOW_PER_PAGE; k++) {
			SetPVarInt(playerid, sprintf("Trunk_%d_%s", k, j == 0 ? "Item" : "TItem"), -1);
		}
	}
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_NO) {
		new vehicleid = GetNearbyVehicle(playerid), Float:pos[3];
		GetPosNearVehiclePart(vehicleid, VEH_PART_TRUNK, pos[0], pos[1], pos[2],0.25);
		if(IsPlayerInRangeOfPoint(playerid, 3.5, pos[0], pos[1], pos[2])) {
			return ShowTrunk(playerid, vehicleid);
		}
	}
	return 0;
}

stock ShowTrunk(playerid, vehicleid)
{
	if(!IsACar(vehicleid) || GetPVarInt(playerid, "ShowTrunk") || vehicleid == INVALID_VEHICLE_ID || !IsVehicleOwner(playerid, vehicleid)) return 0;
	new Float:pos[3];
	GetPosNearVehiclePart(vehicleid, VEH_PART_TRUNK, pos[0], pos[1], pos[2],0.25);
	if(!IsPlayerInRangeOfPoint(playerid, 3.5, pos[0], pos[1], pos[2])) return 0;

	
	TrunkTD[playerid][121] = CreatePlayerTextDraw(playerid, 190.000000, 93.000000, "100/100.G"); //ฝั่งกระเป่า
	PlayerTextDrawFont(playerid, TrunkTD[playerid][121], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][121], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][121], 232.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][121], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][121], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][121], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][121], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][121], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][121], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][121], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][121], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][121], 0);

	TrunkTD[playerid][122] = CreatePlayerTextDraw(playerid, 443.000000, 93.000000, "100/100.G"); //ฝั่งรถ
	PlayerTextDrawFont(playerid, TrunkTD[playerid][122], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][122], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][122], 90.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][122], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][122], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][122], 3);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][122], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][122], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][122], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][122], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][122], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][122], 0);

	TrunkTD[playerid][0] = CreatePlayerTextDraw(playerid, 83.000000, 78.000000, "UR_CARTRUNK:UR_CARTRUNK");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][0], 468.000000, 317.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][0], 0);

	//ฝั่งกระเป๋า
	TrunkTD[playerid][1] = CreatePlayerTextDraw(playerid, 85.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][1], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][1], 1);

	TrunkTD[playerid][2] = CreatePlayerTextDraw(playerid, 123.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][2], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][2], 1);

	TrunkTD[playerid][3] = CreatePlayerTextDraw(playerid, 161.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][3], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][3], 1);

	TrunkTD[playerid][4] = CreatePlayerTextDraw(playerid, 199.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][4], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][4], 1);

	TrunkTD[playerid][5] = CreatePlayerTextDraw(playerid, 237.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][5], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][5], 1);

	TrunkTD[playerid][6] = CreatePlayerTextDraw(playerid, 275.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][6], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][6], 1);

	TrunkTD[playerid][7] = CreatePlayerTextDraw(playerid, 85.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][7], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][7], 1);

	TrunkTD[playerid][8] = CreatePlayerTextDraw(playerid, 123.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][8], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][8], 1);

	TrunkTD[playerid][9] = CreatePlayerTextDraw(playerid, 161.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][9], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][9], 1);

	TrunkTD[playerid][10] = CreatePlayerTextDraw(playerid, 199.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][10], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][10], 1);

	TrunkTD[playerid][11] = CreatePlayerTextDraw(playerid, 237.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][11], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][11], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][11], 1);

	TrunkTD[playerid][12] = CreatePlayerTextDraw(playerid, 275.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][12], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][12], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][12], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][12], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][12], 1);

	TrunkTD[playerid][13] = CreatePlayerTextDraw(playerid, 85.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][13], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][13], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][13], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][13], 1);

	TrunkTD[playerid][14] = CreatePlayerTextDraw(playerid, 123.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][14], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][14], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][14], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][14], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][14], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][14], 1);

	TrunkTD[playerid][15] = CreatePlayerTextDraw(playerid, 161.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][15], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][15], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][15], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][15], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][15], 1);

	TrunkTD[playerid][16] = CreatePlayerTextDraw(playerid, 199.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][16], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][16], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][16], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][16], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][16], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][16], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][16], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][16], 1);

	TrunkTD[playerid][17] = CreatePlayerTextDraw(playerid, 237.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][17], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][17], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][17], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][17], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][17], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][17], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][17], 1);

	TrunkTD[playerid][18] = CreatePlayerTextDraw(playerid, 275.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][18], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][18], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][18], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][18], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][18], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][18], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][18], 1);

	TrunkTD[playerid][19] = CreatePlayerTextDraw(playerid, 85.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][19], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][19], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][19], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][19], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][19], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][19], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][19], 1);

	TrunkTD[playerid][20] = CreatePlayerTextDraw(playerid, 123.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][20], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][20], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][20], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][20], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][20], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][20], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][20], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][20], 1);

	TrunkTD[playerid][21] = CreatePlayerTextDraw(playerid, 161.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][21], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][21], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][21], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][21], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][21], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][21], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][21], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][21], 1);

	TrunkTD[playerid][22] = CreatePlayerTextDraw(playerid, 199.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][22], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][22], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][22], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][22], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][22], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][22], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][22], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][22], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][22], 1);

	TrunkTD[playerid][23] = CreatePlayerTextDraw(playerid, 237.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][23], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][23], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][23], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][23], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][23], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][23], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][23], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][23], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][23], 1);

	TrunkTD[playerid][24] = CreatePlayerTextDraw(playerid, 275.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][24], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][24], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][24], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][24], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][24], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][24], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][24], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][24], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][24], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][24], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][24], 1);

	TrunkTD[playerid][25] = CreatePlayerTextDraw(playerid, 85.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][25], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][25], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][25], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][25], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][25], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][25], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][25], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][25], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][25], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][25], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][25], 1);

	TrunkTD[playerid][26] = CreatePlayerTextDraw(playerid, 123.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][26], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][26], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][26], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][26], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][26], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][26], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][26], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][26], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][26], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][26], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][26], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][26], 1);

	TrunkTD[playerid][27] = CreatePlayerTextDraw(playerid, 161.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][27], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][27], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][27], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][27], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][27], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][27], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][27], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][27], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][27], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][27], 1);

	TrunkTD[playerid][28] = CreatePlayerTextDraw(playerid, 199.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][28], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][28], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][28], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][28], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][28], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][28], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][28], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][28], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][28], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][28], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][28], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][28], 1);

	TrunkTD[playerid][29] = CreatePlayerTextDraw(playerid, 237.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][29], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][29], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][29], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][29], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][29], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][29], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][29], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][29], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][29], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][29], 1);

	TrunkTD[playerid][30] = CreatePlayerTextDraw(playerid, 275.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][30], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][30], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][30], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][30], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][30], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][30], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][30], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][30], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][30], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][30], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][30], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][30], 1);

	TrunkTD[playerid][31] = CreatePlayerTextDraw(playerid, 89.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][31], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][31], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][31], 119.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][31], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][31], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][31], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][31], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][31], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][31], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][31], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][31], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][31], 0);

	TrunkTD[playerid][32] = CreatePlayerTextDraw(playerid, 126.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][32], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][32], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][32], 157.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][32], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][32], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][32], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][32], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][32], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][32], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][32], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][32], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][32], 0);

	TrunkTD[playerid][33] = CreatePlayerTextDraw(playerid, 164.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][33], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][33], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][33], 195.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][33], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][33], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][33], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][33], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][33], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][33], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][33], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][33], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][33], 0);

	TrunkTD[playerid][34] = CreatePlayerTextDraw(playerid, 202.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][34], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][34], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][34], 233.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][34], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][34], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][34], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][34], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][34], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][34], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][34], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][34], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][34], 0);

	TrunkTD[playerid][35] = CreatePlayerTextDraw(playerid, 240.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][35], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][35], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][35], 272.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][35], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][35], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][35], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][35], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][35], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][35], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][35], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][35], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][35], 0);

	TrunkTD[playerid][36] = CreatePlayerTextDraw(playerid, 278.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][36], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][36], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][36], 310.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][36], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][36], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][36], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][36], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][36], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][36], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][36], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][36], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][36], 0);

	TrunkTD[playerid][37] = CreatePlayerTextDraw(playerid, 89.000000, 169.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][37], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][37], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][37], 119.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][37], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][37], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][37], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][37], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][37], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][37], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][37], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][37], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][37], 0);

	TrunkTD[playerid][38] = CreatePlayerTextDraw(playerid, 126.000000, 169.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][38], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][38], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][38], 157.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][38], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][38], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][38], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][38], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][38], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][38], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][38], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][38], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][38], 0);

	TrunkTD[playerid][39] = CreatePlayerTextDraw(playerid, 164.000000, 169.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][39], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][39], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][39], 195.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][39], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][39], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][39], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][39], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][39], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][39], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][39], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][39], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][39], 0);

	TrunkTD[playerid][40] = CreatePlayerTextDraw(playerid, 202.000000, 169.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][40], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][40], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][40], 233.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][40], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][40], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][40], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][40], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][40], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][40], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][40], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][40], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][40], 0);

	TrunkTD[playerid][41] = CreatePlayerTextDraw(playerid, 240.000000, 169.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][41], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][41], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][41], 271.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][41], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][41], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][41], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][41], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][41], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][41], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][41], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][41], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][41], 0);

	TrunkTD[playerid][42] = CreatePlayerTextDraw(playerid, 278.000000, 169.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][42], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][42], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][42], 310.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][42], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][42], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][42], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][42], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][42], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][42], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][42], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][42], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][42], 0);

	TrunkTD[playerid][43] = CreatePlayerTextDraw(playerid, 89.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][43], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][43], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][43], 119.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][43], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][43], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][43], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][43], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][43], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][43], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][43], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][43], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][43], 0);

	TrunkTD[playerid][44] = CreatePlayerTextDraw(playerid, 126.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][44], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][44], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][44], 157.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][44], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][44], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][44], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][44], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][44], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][44], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][44], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][44], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][44], 0);

	TrunkTD[playerid][45] = CreatePlayerTextDraw(playerid, 164.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][45], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][45], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][45], 195.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][45], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][45], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][45], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][45], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][45], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][45], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][45], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][45], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][45], 0);

	TrunkTD[playerid][46] = CreatePlayerTextDraw(playerid, 202.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][46], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][46], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][46], 233.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][46], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][46], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][46], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][46], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][46], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][46], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][46], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][46], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][46], 0);

	TrunkTD[playerid][47] = CreatePlayerTextDraw(playerid, 240.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][47], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][47], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][47], 271.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][47], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][47], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][47], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][47], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][47], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][47], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][47], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][47], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][47], 0);

	TrunkTD[playerid][48] = CreatePlayerTextDraw(playerid, 278.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][48], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][48], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][48], 310.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][48], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][48], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][48], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][48], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][48], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][48], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][48], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][48], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][48], 0);

	TrunkTD[playerid][49] = CreatePlayerTextDraw(playerid, 89.000000, 277.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][49], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][49], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][49], 119.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][49], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][49], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][49], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][49], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][49], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][49], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][49], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][49], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][49], 0);

	TrunkTD[playerid][50] = CreatePlayerTextDraw(playerid, 126.000000, 277.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][50], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][50], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][50], 157.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][50], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][50], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][50], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][50], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][50], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][50], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][50], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][50], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][50], 0);

	TrunkTD[playerid][51] = CreatePlayerTextDraw(playerid, 164.000000, 277.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][51], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][51], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][51], 195.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][51], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][51], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][51], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][51], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][51], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][51], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][51], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][51], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][51], 0);

	TrunkTD[playerid][52] = CreatePlayerTextDraw(playerid, 202.000000, 277.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][52], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][52], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][52], 233.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][52], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][52], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][52], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][52], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][52], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][52], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][52], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][52], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][52], 0);

	TrunkTD[playerid][53] = CreatePlayerTextDraw(playerid, 240.000000, 277.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][53], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][53], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][53], 271.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][53], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][53], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][53], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][53], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][53], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][53], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][53], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][53], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][53], 0);

	TrunkTD[playerid][54] = CreatePlayerTextDraw(playerid, 278.000000, 277.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][54], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][54], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][54], 310.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][54], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][54], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][54], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][54], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][54], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][54], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][54], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][54], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][54], 0);

	TrunkTD[playerid][55] = CreatePlayerTextDraw(playerid, 89.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][55], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][55], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][55], 119.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][55], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][55], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][55], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][55], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][55], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][55], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][55], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][55], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][55], 0);

	TrunkTD[playerid][56] = CreatePlayerTextDraw(playerid, 126.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][56], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][56], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][56], 157.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][56], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][56], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][56], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][56], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][56], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][56], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][56], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][56], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][56], 0);

	TrunkTD[playerid][57] = CreatePlayerTextDraw(playerid, 164.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][57], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][57], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][57], 195.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][57], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][57], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][57], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][57], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][57], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][57], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][57], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][57], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][57], 0);

	TrunkTD[playerid][58] = CreatePlayerTextDraw(playerid, 202.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][58], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][58], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][58], 233.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][58], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][58], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][58], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][58], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][58], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][58], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][58], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][58], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][58], 0);

	TrunkTD[playerid][59] = CreatePlayerTextDraw(playerid, 240.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][59], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][59], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][59], 271.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][59], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][59], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][59], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][59], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][59], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][59], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][59], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][59], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][59], 0);

	TrunkTD[playerid][60] = CreatePlayerTextDraw(playerid, 278.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][60], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][60], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][60], 310.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][60], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][60], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][60], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][60], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][60], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][60], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][60], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][60], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][60], 0);
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//ฝั่งรถ
	TrunkTD[playerid][61] = CreatePlayerTextDraw(playerid, 321.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][61], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][61], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][61], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][61], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][61], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][61], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][61], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][61], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][61], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][61], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][61], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][61], 1);

	TrunkTD[playerid][62] = CreatePlayerTextDraw(playerid, 359.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][62], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][62], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][62], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][62], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][62], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][62], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][62], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][62], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][62], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][62], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][62], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][62], 1);

	TrunkTD[playerid][63] = CreatePlayerTextDraw(playerid, 397.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][63], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][63], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][63], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][63], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][63], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][63], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][63], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][63], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][63], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][63], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][63], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][63], 1);

	TrunkTD[playerid][64] = CreatePlayerTextDraw(playerid, 435.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][64], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][64], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][64], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][64], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][64], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][64], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][64], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][64], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][64], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][64], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][64], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][64], 1);

	TrunkTD[playerid][65] = CreatePlayerTextDraw(playerid, 473.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][65], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][65], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][65], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][65], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][65], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][65], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][65], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][65], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][65], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][65], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][65], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][65], 1);

	TrunkTD[playerid][66] = CreatePlayerTextDraw(playerid, 511.000000, 112.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][66], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][66], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][66], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][66], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][66], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][66], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][66], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][66], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][66], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][66], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][66], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][66], 1);

	TrunkTD[playerid][67] = CreatePlayerTextDraw(playerid, 321.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][67], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][67], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][67], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][67], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][67], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][67], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][67], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][67], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][67], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][67], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][67], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][67], 1);

	TrunkTD[playerid][68] = CreatePlayerTextDraw(playerid, 359.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][68], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][68], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][68], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][68], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][68], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][68], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][68], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][68], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][68], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][68], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][68], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][68], 1);

	TrunkTD[playerid][69] = CreatePlayerTextDraw(playerid, 397.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][69], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][69], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][69], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][69], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][69], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][69], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][69], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][69], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][69], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][69], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][69], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][69], 1);

	TrunkTD[playerid][70] = CreatePlayerTextDraw(playerid, 435.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][70], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][70], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][70], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][70], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][70], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][70], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][70], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][70], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][70], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][70], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][70], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][70], 1);

	TrunkTD[playerid][71] = CreatePlayerTextDraw(playerid, 473.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][71], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][71], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][71], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][71], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][71], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][71], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][71], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][71], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][71], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][71], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][71], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][71], 1);

	TrunkTD[playerid][72] = CreatePlayerTextDraw(playerid, 511.000000, 166.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][72], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][72], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][72], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][72], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][72], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][72], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][72], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][72], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][72], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][72], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][72], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][72], 1);

	TrunkTD[playerid][73] = CreatePlayerTextDraw(playerid, 321.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][73], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][73], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][73], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][73], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][73], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][73], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][73], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][73], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][73], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][73], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][73], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][73], 1);

	TrunkTD[playerid][74] = CreatePlayerTextDraw(playerid, 359.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][74], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][74], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][74], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][74], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][74], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][74], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][74], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][74], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][74], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][74], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][74], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][74], 1);

	TrunkTD[playerid][75] = CreatePlayerTextDraw(playerid, 397.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][75], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][75], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][75], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][75], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][75], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][75], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][75], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][75], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][75], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][75], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][75], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][75], 1);

	TrunkTD[playerid][76] = CreatePlayerTextDraw(playerid, 435.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][76], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][76], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][76], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][76], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][76], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][76], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][76], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][76], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][76], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][76], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][76], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][76], 1);

	TrunkTD[playerid][77] = CreatePlayerTextDraw(playerid, 473.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][77], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][77], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][77], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][77], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][77], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][77], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][77], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][77], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][77], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][77], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][77], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][77], 1);

	TrunkTD[playerid][78] = CreatePlayerTextDraw(playerid, 511.000000, 220.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][78], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][78], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][78], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][78], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][78], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][78], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][78], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][78], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][78], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][78], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][78], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][78], 1);

	TrunkTD[playerid][79] = CreatePlayerTextDraw(playerid, 321.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][79], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][79], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][79], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][79], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][79], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][79], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][79], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][79], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][79], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][79], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][79], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][79], 1);

	TrunkTD[playerid][80] = CreatePlayerTextDraw(playerid, 359.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][80], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][80], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][80], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][80], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][80], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][80], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][80], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][80], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][80], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][80], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][80], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][80], 1);

	TrunkTD[playerid][81] = CreatePlayerTextDraw(playerid, 397.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][81], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][81], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][81], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][81], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][81], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][81], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][81], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][81], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][81], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][81], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][81], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][81], 1);

	TrunkTD[playerid][82] = CreatePlayerTextDraw(playerid, 435.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][82], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][82], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][82], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][82], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][82], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][82], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][82], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][82], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][82], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][82], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][82], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][82], 1);

	TrunkTD[playerid][83] = CreatePlayerTextDraw(playerid, 473.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][83], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][83], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][83], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][83], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][83], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][83], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][83], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][83], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][83], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][83], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][83], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][83], 1);

	TrunkTD[playerid][84] = CreatePlayerTextDraw(playerid, 511.000000, 274.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][84], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][84], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][84], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][84], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][84], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][84], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][84], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][84], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][84], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][84], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][84], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][84], 1);

	TrunkTD[playerid][85] = CreatePlayerTextDraw(playerid, 321.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][85], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][85], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][85], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][85], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][85], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][85], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][85], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][85], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][85], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][85], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][85], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][85], 1);

	TrunkTD[playerid][86] = CreatePlayerTextDraw(playerid, 359.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][86], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][86], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][86], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][86], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][86], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][86], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][86], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][86], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][86], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][86], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][86], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][86], 1);

	TrunkTD[playerid][87] = CreatePlayerTextDraw(playerid, 397.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][87], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][87], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][87], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][87], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][87], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][87], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][87], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][87], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][87], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][87], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][87], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][87], 1);

	TrunkTD[playerid][88] = CreatePlayerTextDraw(playerid, 435.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][88], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][88], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][88], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][88], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][88], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][88], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][88], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][88], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][88], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][88], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][88], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][88], 1);

	TrunkTD[playerid][89] = CreatePlayerTextDraw(playerid, 473.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][89], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][89], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][89], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][89], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][89], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][89], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][89], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][89], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][89], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][89], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][89], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][89], 1);

	TrunkTD[playerid][90] = CreatePlayerTextDraw(playerid, 511.000000, 328.000000, "UR_CARTRUNK:item_1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][90], 4);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][90], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][90], 37.500000, 52.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][90], 1);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][90], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][90], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][90], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][90], 255);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][90], 50);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][90], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][90], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][90], 1);

	TrunkTD[playerid][91] = CreatePlayerTextDraw(playerid, 324.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][91], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][91], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][91], 355.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][91], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][91], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][91], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][91], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][91], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][91], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][91], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][91], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][91], 0);

	TrunkTD[playerid][92] = CreatePlayerTextDraw(playerid, 362.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][92], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][92], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][92], 394.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][92], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][92], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][92], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][92], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][92], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][92], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][92], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][92], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][92], 0);

	TrunkTD[playerid][93] = CreatePlayerTextDraw(playerid, 400.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][93], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][93], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][93], 432.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][93], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][93], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][93], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][93], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][93], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][93], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][93], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][93], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][93], 0);

	TrunkTD[playerid][94] = CreatePlayerTextDraw(playerid, 438.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][94], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][94], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][94], 469.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][94], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][94], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][94], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][94], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][94], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][94], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][94], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][94], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][94], 0);

	TrunkTD[playerid][95] = CreatePlayerTextDraw(playerid, 476.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][95], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][95], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][95], 508.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][95], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][95], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][95], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][95], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][95], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][95], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][95], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][95], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][95], 0);

	TrunkTD[playerid][96] = CreatePlayerTextDraw(playerid, 514.000000, 114.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][96], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][96], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][96], 546.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][96], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][96], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][96], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][96], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][96], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][96], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][96], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][96], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][96], 0);

	TrunkTD[playerid][97] = CreatePlayerTextDraw(playerid, 324.000000, 168.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][97], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][97], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][97], 355.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][97], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][97], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][97], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][97], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][97], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][97], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][97], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][97], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][97], 0);

	TrunkTD[playerid][98] = CreatePlayerTextDraw(playerid, 362.000000, 168.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][98], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][98], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][98], 394.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][98], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][98], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][98], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][98], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][98], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][98], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][98], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][98], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][98], 0);

	TrunkTD[playerid][99] = CreatePlayerTextDraw(playerid, 400.000000, 168.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][99], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][99], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][99], 432.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][99], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][99], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][99], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][99], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][99], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][99], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][99], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][99], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][99], 0);

	TrunkTD[playerid][100] = CreatePlayerTextDraw(playerid, 438.000000, 168.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][100], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][100], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][100], 470.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][100], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][100], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][100], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][100], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][100], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][100], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][100], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][100], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][100], 0);

	TrunkTD[playerid][101] = CreatePlayerTextDraw(playerid, 476.000000, 168.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][101], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][101], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][101], 508.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][101], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][101], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][101], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][101], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][101], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][101], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][101], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][101], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][101], 0);

	TrunkTD[playerid][102] = CreatePlayerTextDraw(playerid, 514.000000, 168.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][102], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][102], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][102], 546.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][102], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][102], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][102], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][102], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][102], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][102], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][102], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][102], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][102], 0);

	TrunkTD[playerid][103] = CreatePlayerTextDraw(playerid, 324.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][103], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][103], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][103], 355.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][103], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][103], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][103], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][103], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][103], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][103], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][103], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][103], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][103], 0);

	TrunkTD[playerid][104] = CreatePlayerTextDraw(playerid, 362.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][104], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][104], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][104], 394.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][104], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][104], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][104], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][104], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][104], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][104], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][104], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][104], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][104], 0);

	TrunkTD[playerid][105] = CreatePlayerTextDraw(playerid, 400.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][105], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][105], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][105], 432.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][105], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][105], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][105], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][105], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][105], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][105], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][105], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][105], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][105], 0);

	TrunkTD[playerid][106] = CreatePlayerTextDraw(playerid, 438.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][106], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][106], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][106], 470.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][106], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][106], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][106], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][106], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][106], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][106], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][106], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][106], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][106], 0);

	TrunkTD[playerid][107] = CreatePlayerTextDraw(playerid, 476.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][107], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][107], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][107], 508.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][107], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][107], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][107], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][107], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][107], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][107], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][107], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][107], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][107], 0);

	TrunkTD[playerid][108] = CreatePlayerTextDraw(playerid, 514.000000, 223.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][108], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][108], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][108], 545.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][108], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][108], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][108], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][108], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][108], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][108], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][108], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][108], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][108], 0);

	TrunkTD[playerid][109] = CreatePlayerTextDraw(playerid, 324.000000, 276.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][109], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][109], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][109], 355.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][109], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][109], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][109], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][109], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][109], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][109], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][109], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][109], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][109], 0);

	TrunkTD[playerid][110] = CreatePlayerTextDraw(playerid, 362.000000, 276.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][110], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][110], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][110], 394.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][110], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][110], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][110], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][110], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][110], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][110], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][110], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][110], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][110], 0);

	TrunkTD[playerid][111] = CreatePlayerTextDraw(playerid, 400.000000, 276.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][111], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][111], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][111], 432.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][111], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][111], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][111], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][111], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][111], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][111], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][111], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][111], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][111], 0);

	TrunkTD[playerid][112] = CreatePlayerTextDraw(playerid, 438.000000, 276.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][112], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][112], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][112], 470.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][112], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][112], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][112], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][112], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][112], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][112], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][112], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][112], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][112], 0);

	TrunkTD[playerid][113] = CreatePlayerTextDraw(playerid, 476.000000, 276.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][113], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][113], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][113], 508.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][113], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][113], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][113], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][113], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][113], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][113], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][113], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][113], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][113], 0);

	TrunkTD[playerid][114] = CreatePlayerTextDraw(playerid, 514.000000, 277.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][114], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][114], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][114], 545.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][114], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][114], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][114], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][114], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][114], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][114], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][114], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][114], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][114], 0);

	TrunkTD[playerid][115] = CreatePlayerTextDraw(playerid, 324.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][115], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][115], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][115], 355.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][115], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][115], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][115], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][115], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][115], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][115], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][115], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][115], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][115], 0);

	TrunkTD[playerid][116] = CreatePlayerTextDraw(playerid, 362.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][116], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][116], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][116], 394.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][116], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][116], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][116], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][116], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][116], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][116], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][116], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][116], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][116], 0);

	TrunkTD[playerid][117] = CreatePlayerTextDraw(playerid, 400.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][117], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][117], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][117], 432.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][117], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][117], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][117], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][117], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][117], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][117], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][117], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][117], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][117], 0);

	TrunkTD[playerid][118] = CreatePlayerTextDraw(playerid, 438.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][118], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][118], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][118], 470.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][118], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][118], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][118], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][118], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][118], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][118], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][118], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][118], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][118], 0);

	TrunkTD[playerid][119] = CreatePlayerTextDraw(playerid, 476.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][119], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][119], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][119], 508.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][119], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][119], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][119], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][119], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][119], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][119], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][119], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][119], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][119], 0);

	TrunkTD[playerid][120] = CreatePlayerTextDraw(playerid, 514.000000, 331.000000, "0(0)");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][120], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][120], 0.141662, 0.850000);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][120], 545.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][120], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][120], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][120], 1);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][120], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][120], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][120], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][120], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][120], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][120], 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	TrunkTD[playerid][123] = CreatePlayerTextDraw(playerid, 436.000000, 390.000000, "1");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][123], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][123], 0.162495, 1.049999);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][123], 90.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][123], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][123], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][123], 2);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][123], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][123], -16776961);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][123], -16777166);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][123], 0);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][123], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][123], 0);

	TrunkTD[playerid][124] = CreatePlayerTextDraw(playerid, 452.000000, 392.000000, ">");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][124], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][124], 0.162495, 1.049999);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][124], 14.000000, 10.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][124], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][124], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][124], 2);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][124], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][124], -65281);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][124], -65486);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][124], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][124], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][124], 1);

	TrunkTD[playerid][125] = CreatePlayerTextDraw(playerid, 420.000000, 392.000000, "<");
	PlayerTextDrawFont(playerid, TrunkTD[playerid][125], 1);
	PlayerTextDrawLetterSize(playerid, TrunkTD[playerid][125], 0.162495, 1.049999);
	PlayerTextDrawTextSize(playerid, TrunkTD[playerid][125], 14.000000, 10.500000);
	PlayerTextDrawSetOutline(playerid, TrunkTD[playerid][125], 0);
	PlayerTextDrawSetShadow(playerid, TrunkTD[playerid][125], 0);
	PlayerTextDrawAlignment(playerid, TrunkTD[playerid][125], 2);
	PlayerTextDrawColor(playerid, TrunkTD[playerid][125], -1);
	PlayerTextDrawBackgroundColor(playerid, TrunkTD[playerid][125], -65281);
	PlayerTextDrawBoxColor(playerid, TrunkTD[playerid][125], -65486);
	PlayerTextDrawUseBox(playerid, TrunkTD[playerid][125], 1);
	PlayerTextDrawSetProportional(playerid, TrunkTD[playerid][125], 1);
	PlayerTextDrawSetSelectable(playerid, TrunkTD[playerid][125], 1);

    for (new i = 0; i<TRUNK_TD_ALL; i++) {
        PlayerTextDrawShow(playerid, TrunkTD[playerid][i]);
		if(i + 1 >= 121) break;
    }

	UpdateTrunk(playerid, vehicleid);

    SetPVarInt(playerid, "ShowTrunk", 1);
	SetPVarInt(playerid, "Trunk_VehicleID", vehicleid);
    SelectTextDraw(playerid, COLOR_YELLOW);
    return 1;
}
stock UpdateTrunk(playerid, vehicleid, page=1)
{
	//RESET
	for (new i = 0; i<MAX_TRUNK_SHOW_PER_PAGE; i++) {
		SetPVarInt(playerid, sprintf("Trunk_%d_Item", i), -1);
		SetPVarInt(playerid, sprintf("Trunk_%d_TItem", i), -1);

		PlayerTextDrawHide(playerid, TrunkTD[playerid][i + 1]);
		PlayerTextDrawHide(playerid, TrunkTD[playerid][i + 31]);

		PlayerTextDrawHide(playerid, TrunkTD[playerid][i + 61]);
		PlayerTextDrawHide(playerid, TrunkTD[playerid][i + 91]);
	}
	
	new count[2] = 0;
	for (new i = 0; i<Inventory_Items(playerid); i++) {
		if(count[0] >= MAX_TRUNK_SHOW_PER_PAGE) break;

		if(invData[playerid][i][invExists]) {
			PlayerTextDrawSetString(playerid, TrunkTD[playerid][count[0] + 1], itemData[Item_GetIDFromName(invData[playerid][i][invItem])][itemPng]);
			PlayerTextDrawShow(playerid, TrunkTD[playerid][count[0] + 1]);

			PlayerTextDrawSetString(playerid, TrunkTD[playerid][count[0] + 31], sprintf("%d(%.1f)", invData[playerid][i][invQuantity], itemData[Item_GetIDFromName(invData[playerid][i][invItem])][itemWeight] * invData[playerid][i][invQuantity]));
			PlayerTextDrawShow(playerid, TrunkTD[playerid][count[0] + 31]);

			SetPVarInt(playerid, sprintf("Trunk_%d_Item", count[0]), Item_GetIDFromName(invData[playerid][i][invItem]));
			count[0] ++;
		}
	}

	for (new it = 0; it<Trunk_Items(vehicleid); it++) {
		if(count[1] >= MAX_TRUNK_SHOW_PER_PAGE) break;

		if(TrunkData[vehicleid][it][trunkExists]) {
			PlayerTextDrawSetString(playerid, TrunkTD[playerid][count[1] + 61], itemData[Item_GetIDFromName(TrunkData[vehicleid][it][trunkItemName])][itemPng]);
			PlayerTextDrawShow(playerid, TrunkTD[playerid][count[1] + 61]);

			PlayerTextDrawSetString(playerid, TrunkTD[playerid][count[1] + 91], sprintf("%d(%.1f)", TrunkData[vehicleid][it][trunkQuantity], itemData[Item_GetIDFromName(TrunkData[vehicleid][it][trunkItemName])][itemWeight] * TrunkData[vehicleid][it][trunkQuantity]));
			PlayerTextDrawShow(playerid, TrunkTD[playerid][count[1] + 91]);

			SetPVarInt(playerid, sprintf("Trunk_%d_TItem", count[1]), Item_GetIDFromName(TrunkData[vehicleid][it][trunkItemName]));
			count[1] ++;
		}
	}

	new Float:playerMaxWeight;
	Inventory_Items_KG(playerid, playerMaxWeight);
	PlayerTextDrawSetString(playerid, TrunkTD[playerid][121], sprintf("%.1f/%.1f G", playerMaxWeight, playerData[playerid][pMaxWeight]));
	PlayerTextDrawShow(playerid, TrunkTD[playerid][121]);

	new Float:vehMaxWeight;
	Trunk_Items_KG(vehicleid, vehMaxWeight);
	PlayerTextDrawSetString(playerid, TrunkTD[playerid][122], sprintf("%.1f/%.1f G", vehMaxWeight, carData[vehicleid][carMaxWeight]));
	PlayerTextDrawShow(playerid, TrunkTD[playerid][122]);

	PlayerTextDrawSetString(playerid, TrunkTD[playerid][123], sprintf("%d", page));
	PlayerTextDrawShow(playerid, TrunkTD[playerid][123]);

	if(Trunk_Pages(vehicleid) > page) {
		PlayerTextDrawSetString(playerid, TrunkTD[playerid][124], ">");
		PlayerTextDrawShow(playerid, TrunkTD[playerid][124]);
	} else {
		PlayerTextDrawHide(playerid, TrunkTD[playerid][124]);
	}
	
	if(page > 1) {
		PlayerTextDrawSetString(playerid, TrunkTD[playerid][125], "<");
		PlayerTextDrawShow(playerid, TrunkTD[playerid][125]);
	} else {
		PlayerTextDrawHide(playerid, TrunkTD[playerid][125]);
	}

	SetPVarInt(playerid, "Trunk_Page", page);
	return 1;
}
stock HideTrunk(playerid)
{
	if(!GetPVarInt(playerid, "ShowTrunk")) return 0;
    for (new i = 0; i<TRUNK_TD_ALL; i++) {
        PlayerTextDrawHide(playerid, TrunkTD[playerid][i]);
        PlayerTextDrawDestroy(playerid, TrunkTD[playerid][i]);
    }
    SetPVarInt(playerid, "ShowTrunk", 0);
    CancelSelectTextDraw(playerid);
    return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(clickedid == Text:INVALID_TEXT_DRAW && GetPVarInt(playerid, "ShowTrunk") == 1) {
        HideTrunk(playerid);
    }
    return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid) {
	if(GetPVarInt(playerid, "ShowTrunk")) {
		if(playertextid == TrunkTD[playerid][125]) {
			UpdateTrunk(playerid, GetPVarInt(playerid, "Trunk_VehicleID"), GetPVarInt(playerid, "Trunk_Page") - 1);
		} else if(playertextid == TrunkTD[playerid][124]) {
			UpdateTrunk(playerid, GetPVarInt(playerid, "Trunk_VehicleID"), GetPVarInt(playerid, "Trunk_Page") + 1);
		} else {
			for (new i = 0; i < MAX_TRUNK_SHOW_PER_PAGE; i++) {
				if(playertextid == TrunkTD[playerid][i + 1]) {
					new itemid = GetPVarInt(playerid, sprintf("Trunk_%d_Item", i));
					if(itemid != -1 && Inventory_HasItem(playerid, itemData[itemid][itemName])) {
						SetPVarInt(playerid, "Trunk_SelectItemID", itemid);
						Dialog_Show(playerid, DIALOG_DEPOSIT_TRUNK, DIALOG_STYLE_INPUT, "[ฝากของเข้า]", "โปรดระบุจำนวนไอเท็ม '%s' ที่ต้องการฝากเข้า", "ยืนยัน", "ยกเลิก", itemData[itemid][itemName]);
					} else {
						Dialog_Show(playerid, SHOWONLY, DIALOG_STYLE_MSGBOX, "[ฝากของเข้า]", "คุณไม่มีไอเท็ม '%s' ที่ต้องการฝากเข้า", "ตกลง", "", itemData[itemid][itemName]);
					}
					break;
				} else if(playertextid == TrunkTD[playerid][i + 61]) {
					new itemid = GetPVarInt(playerid, sprintf("Trunk_%d_TItem", i));
					if(itemid != -1 && Trunk_HasItem(GetPVarInt(playerid, "Trunk_VehicleID"), itemData[itemid][itemName])) {
						SetPVarInt(playerid, "Trunk_SelectItemID", itemid);
						Dialog_Show(playerid, DIALOG_WITHDRAW_TRUNK, DIALOG_STYLE_INPUT, "[ถอนของออกจากรถ]", "โปรดระบุจำนวนไอเท็ม '%s' ที่ต้องการถอนออกจากรถ", "ยืนยัน", "ยกเลิก", itemData[itemid][itemName]);
					} else {
						Dialog_Show(playerid, SHOWONLY, DIALOG_STYLE_MSGBOX, "[ถอนของออกจากรถ]", "คุณไม่มีไอเท็ม '%s' ที่ต้องการถอนออกจากรถ", "ตกลง", "", itemData[itemid][itemName]);
					}
					break;
				}
			}
		}
	}
	return 1;
}

stock ClearTrunkItem(vehicleid)
{
    for (new i = 0; i<MAX_INVENTORY; i++) {
        TrunkData[vehicleid][i][trunkExists] = false;
        format(TrunkData[vehicleid][i][trunkItemName], 32, "");
        TrunkData[vehicleid][i][trunkQuantity] = 0;
    }
    return 1;
}

Trunk_Add(vehicleid, const item[], quantity = 1)
{
    new itemid = Trunk_GetItemID(vehicleid, item);
    new string[2048];

    if (itemid == -1)
    {
        itemid = Trunk_GetFreeID(vehicleid);

		new Float:kgall;
		Trunk_Items_KG(vehicleid, kgall);

        if (kgall + (itemData[Item_GetIDFromName(item)][itemWeight] * quantity) > carData[vehicleid][carMaxWeight]) {
            return -1;
        }

        if (itemid != -1)
        {
            TrunkData[vehicleid][itemid][trunkExists]   = true;
            TrunkData[vehicleid][itemid][trunkQuantity] = quantity;

            format(TrunkData[vehicleid][itemid][trunkItemName], 32, item);

            mysql_format(g_SQL, string, sizeof(string),
                "INSERT INTO `trunk` (`trunkOwner`, `trunkItem`, `trunkQuantity`) VALUES ('%d', '%e', '%d')",
                carData[vehicleid][carID], item, quantity);
            mysql_tquery(g_SQL, string, "OnTrunkAdd", "dd", vehicleid, itemid);

            return itemid;
        }
    }
    else
    {
		new Float:kgall;
		Trunk_Items_KG(vehicleid, kgall);

        if (kgall + (itemData[Item_GetIDFromName(item)][itemWeight] * quantity) > carData[vehicleid][carMaxWeight]) {
            return -1;
        }

        mysql_format(g_SQL, string, sizeof(string),
            "UPDATE `trunk` SET `trunkQuantity` = `trunkQuantity` + %d WHERE `trunkOwner` = '%d' AND `trunkID` = '%d'",
            quantity, carData[vehicleid][carID], TrunkData[vehicleid][itemid][trunkID]);
        mysql_tquery(g_SQL, string);

        TrunkData[vehicleid][itemid][trunkQuantity] += quantity;

        return itemid;
    }
    return -1;
}

Trunk_Remove(vehicleid, const item[], quantity = 1)
{
	new
		itemid = Trunk_GetItemID(vehicleid, item),
		string[128];

	if (itemid != -1)
	{
	    if (TrunkData[vehicleid][itemid][trunkQuantity] > 0)
	    {
	        TrunkData[vehicleid][itemid][trunkQuantity] -= quantity;
		}
		if (quantity == -1 || TrunkData[vehicleid][itemid][trunkQuantity] < 1)
		{
		    TrunkData[vehicleid][itemid][trunkExists] = false;
		    TrunkData[vehicleid][itemid][trunkQuantity] = 0;

		    mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `trunk` WHERE `trunkOwner` = '%d' AND `trunkID` = '%d'", carData[vehicleid][carID], TrunkData[vehicleid][itemid][trunkID]);
	        mysql_tquery(g_SQL, string);
		}
		else if (quantity != -1 && TrunkData[vehicleid][itemid][trunkQuantity] > 0)
		{
			mysql_format(g_SQL, string, sizeof(string), "UPDATE `trunk` SET `trunkQuantity` = `trunkQuantity` - %d WHERE `trunkOwner` = '%d' AND `trunkID` = '%d'", quantity, carData[vehicleid][carID], TrunkData[vehicleid][itemid][trunkID]);
            mysql_tquery(g_SQL, string);
		}
		return 1;
	}
	return 0;
}

forward Trunk_Load(vehicleid);
public Trunk_Load(vehicleid)
{
    static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows && i < MAX_INVENTORY; i ++)
	{
	    TrunkData[vehicleid][i][trunkExists] = true;
	    cache_get_value_name_int(i, "trunkID", TrunkData[vehicleid][i][trunkID]);
        cache_get_value_name_int(i, "trunkQuantity", TrunkData[vehicleid][i][trunkQuantity]);

		cache_get_value_name(i, "trunkItem", TrunkData[vehicleid][i][trunkItemName], 32);
	}
	return 1;
}

forward OnTrunkAdd(vehicleid, itemid);
public OnTrunkAdd(vehicleid, itemid)
{
	TrunkData[vehicleid][itemid][trunkID] = cache_insert_id();
	return 1;
}

stock Trunk_Set(vehicleid, const item[], amount)
{
	new itemid = Trunk_GetItemID(vehicleid, item);

	if (itemid == -1 && amount > 0)
	{
		Trunk_Add(vehicleid, item, amount);
	}
	else if (amount > 0 && itemid != -1)
	{
	    Trunk_SetQuantity(vehicleid, item, amount);
	}
	else if (amount < 1 && itemid != -1)
	{
	    Trunk_Remove(vehicleid, item, -1);
	}
	return 1;
}

stock Trunk_GetItemID(vehicleid, const item[])
{
	for (new i = 0; i < MAX_INVENTORY; i ++)
	{
	    if (!TrunkData[vehicleid][i][trunkExists])
	        continue;

		if (!strcmp(TrunkData[vehicleid][i][trunkItemName], item)) return i;
	}
	return -1;
}

Trunk_GetFreeID(vehicleid)
{
	// if (Trunk_Items(vehicleid) >= MAX_INVENTORY)
	// 	return -1;

	new Float:kgall;
	Trunk_Items_KG(vehicleid, kgall);
	if (kgall > carData[vehicleid][carMaxWeight])
		return -1;

	for (new i = 0; i < MAX_INVENTORY; i ++)
	{
	    if (!TrunkData[vehicleid][i][trunkExists])
	        return i;
	}
	return -1;
}

Trunk_Items_KG(vehicleid, &Float:retkg)
{
    new Float:kgall = 0.0;
	retkg = 0.0;

    for (new i = 0; i != MAX_INVENTORY; i ++) if (TrunkData[vehicleid][i][trunkExists])
	{
		new Float:kgret_getitem;
		Trunk_GetItemWeightByName(TrunkData[vehicleid][i][trunkItemName], kgret_getitem);
        kgall += kgret_getitem * TrunkData[vehicleid][i][trunkQuantity];
	}
	retkg = kgall;
	return 1;
}

Trunk_GetItemWeightByName(const item[], &Float:retkg)
{
	retkg = 0.0;
	for (new i = 0; i < sizeof(itemData); i ++) 
	{
		if (!strcmp(itemData[i][itemName], item)) 
		{
			retkg = itemData[i][itemWeight]; 
			return 1;
		}
	}
	return 0;
}

Trunk_Items(vehicleid)
{
    new count;

    for (new i = 0; i != MAX_INVENTORY; i ++) if (TrunkData[vehicleid][i][trunkExists])
	{
        count++;
	}
	return count;
}

Trunk_Count(vehicleid, const item[])
{
	new itemid = Trunk_GetItemID(vehicleid, item);

	if (itemid != -1)
	    return TrunkData[vehicleid][itemid][trunkQuantity];

	return 0;
}

Trunk_HasItem(vehicleid, const item[])
{
	return (Trunk_GetItemID(vehicleid, item) != -1);
}

stock Trunk_SetQuantity(vehicleid, const item[], quantity)
{
	new
	    itemid = Trunk_GetItemID(vehicleid, item),
	    string[128];

	if (itemid != -1)
	{
		mysql_format(g_SQL, string, sizeof(string), "UPDATE `trunk` SET `trunkQuantity` = %d WHERE `trunkOwner` = '%d' AND `trunkID` = '%d'", quantity, vehicleid, TrunkData[vehicleid][itemid][trunkID]);
	    mysql_tquery(g_SQL, string);

	    TrunkData[vehicleid][itemid][trunkQuantity] = quantity;
	}
	return 1;
}

Dialog:DIALOG_DEPOSIT_TRUNK(playerid, response, listitem, inputtext[])
{
	if (!response) return 0;
	
	new amount = strval(inputtext);
	if(amount <= 0 || amount == 0) 
		return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ต้องระบุจำนวนให้ถูกต้อง");
	
	if(amount > Inventory_Count(playerid, itemData[GetPVarInt(playerid, "Trunk_SelectItemID")][itemName]))
		return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ระบุจำนวนมากกว่าที่มี โปรดระบุใหม่");
	
	if(Trunk_Add(GetPVarInt(playerid, "Trunk_VehicleID"), itemData[GetPVarInt(playerid, "Trunk_SelectItemID")][itemName], amount) == -1)
		return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของรถของคุณไม่เพียงพอ");
	
	Inventory_Remove(playerid, itemData[GetPVarInt(playerid, "Trunk_SelectItemID")][itemName], amount);
	UpdateTrunk(playerid, GetPVarInt(playerid, "Trunk_VehicleID"));
	return 1;
}

Dialog:DIALOG_WITHDRAW_TRUNK(playerid, response, listitem, inputtext[])
{
	if (!response) return 0;
	
	new amount = strval(inputtext);
	if(amount <= 0 || amount == 0) return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ต้องระบุจำนวนให้ถูกต้อง");
	if(amount > Trunk_Count(GetPVarInt(playerid, "Trunk_VehicleID"), itemData[GetPVarInt(playerid, "Trunk_SelectItemID")][itemName])) return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ระบุจำนวนมากกว่าที่มี โปรดระบุใหม่");
	if(Inventory_Add(playerid, itemData[GetPVarInt(playerid, "Trunk_SelectItemID")][itemName], amount) == -1) {
		return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าของคุณไม่เพียงพอ");
	}
	Trunk_Remove(GetPVarInt(playerid, "Trunk_VehicleID"), itemData[GetPVarInt(playerid, "Trunk_SelectItemID")][itemName], amount);
	UpdateTrunk(playerid, GetPVarInt(playerid, "Trunk_VehicleID"));
	return 1;
}

stock Trunk_Pages(vehicleid)
{
    new items = Trunk_Items(vehicleid);
    return (items + 29) / 30;
}
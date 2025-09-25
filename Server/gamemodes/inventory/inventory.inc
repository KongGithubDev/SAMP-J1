#include <YSI_Coding\y_hooks>
new INVENTORY_PLAYING[MAX_PLAYERS];
new INVENTORY_SELECT[MAX_PLAYERS][MAX_INVENTORY];
new PlayerText:INVENTORY_TDMOD[MAX_PLAYERS][4];
new PlayerText:INVENTORY_ITEMSLOT[MAX_PLAYERS][60];
hook OnPlayerConnect(playerid) {	
	INVENTORY_PLAYING[playerid] = 0;
	return true;
}

CreateInventoryTD(playerid)
{
	INVENTORY_TDMOD[playerid][0] = CreatePlayerTextDraw(playerid, 123.000000, 96.000000, "ms_uiinv:ms_inventory");
	PlayerTextDrawFont(playerid, INVENTORY_TDMOD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_TDMOD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_TDMOD[playerid][0], 355.000000, 335.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_TDMOD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_TDMOD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_TDMOD[playerid][0], 1);
	PlayerTextDrawColor(playerid, INVENTORY_TDMOD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_TDMOD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_TDMOD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_TDMOD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_TDMOD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_TDMOD[playerid][0], 0);

	INVENTORY_TDMOD[playerid][1] = CreatePlayerTextDraw(playerid, 401.000000, 403.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_TDMOD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_TDMOD[playerid][1], 0.108332, 0.849999);
	PlayerTextDrawTextSize(playerid, INVENTORY_TDMOD[playerid][1], 400.000000, 99.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_TDMOD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_TDMOD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_TDMOD[playerid][1], 2);
	PlayerTextDrawColor(playerid, INVENTORY_TDMOD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_TDMOD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_TDMOD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_TDMOD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_TDMOD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_TDMOD[playerid][1], 0);

	INVENTORY_TDMOD[playerid][2] = CreatePlayerTextDraw(playerid, 436.000000, 403.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_TDMOD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_TDMOD[playerid][2], 0.108332, 0.849999);
	PlayerTextDrawTextSize(playerid, INVENTORY_TDMOD[playerid][2], 400.000000, 99.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_TDMOD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_TDMOD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_TDMOD[playerid][2], 2);
	PlayerTextDrawColor(playerid, INVENTORY_TDMOD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_TDMOD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_TDMOD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_TDMOD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_TDMOD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_TDMOD[playerid][2], 0);

	INVENTORY_TDMOD[playerid][3] = CreatePlayerTextDraw(playerid, 399.000000, 100.000000, "ms_uiinv:ms_escc");
	PlayerTextDrawFont(playerid, INVENTORY_TDMOD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_TDMOD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_TDMOD[playerid][3], 45.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_TDMOD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_TDMOD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_TDMOD[playerid][3], 1);
	PlayerTextDrawColor(playerid, INVENTORY_TDMOD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_TDMOD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_TDMOD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_TDMOD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_TDMOD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_TDMOD[playerid][3], 1);	

	INVENTORY_ITEMSLOT[playerid][0] = CreatePlayerTextDraw(playerid, 195.000000, 126.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][0], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][0], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][0], 1);

	INVENTORY_ITEMSLOT[playerid][1] = CreatePlayerTextDraw(playerid, 237.000000, 126.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][1], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][1], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][1], 1);

	INVENTORY_ITEMSLOT[playerid][2] = CreatePlayerTextDraw(playerid, 279.000000, 126.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][2], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][2], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][2], 1);

	INVENTORY_ITEMSLOT[playerid][3] = CreatePlayerTextDraw(playerid, 320.500000, 126.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][3], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][3], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][3], 1);

	INVENTORY_ITEMSLOT[playerid][4] = CreatePlayerTextDraw(playerid, 362.500000, 126.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][4], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][4], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][4], 1);

	INVENTORY_ITEMSLOT[playerid][5] = CreatePlayerTextDraw(playerid, 404.500000, 126.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][5], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][5], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][5], 1);

	INVENTORY_ITEMSLOT[playerid][6] = CreatePlayerTextDraw(playerid, 195.000000, 178.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][6], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][6], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][6], 1);

	INVENTORY_ITEMSLOT[playerid][7] = CreatePlayerTextDraw(playerid, 237.000000, 178.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][7], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][7], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][7], 1);

	INVENTORY_ITEMSLOT[playerid][8] = CreatePlayerTextDraw(playerid, 279.000000, 178.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][8], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][8], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][8], 1);

	INVENTORY_ITEMSLOT[playerid][9] = CreatePlayerTextDraw(playerid, 320.500000, 178.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][9], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][9], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][9], 1);

	INVENTORY_ITEMSLOT[playerid][10] = CreatePlayerTextDraw(playerid, 362.500000, 178.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][10], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][10], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][10], 1);

	INVENTORY_ITEMSLOT[playerid][11] = CreatePlayerTextDraw(playerid, 404.500000, 178.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][11], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][11], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][11], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][11], 1);

	INVENTORY_ITEMSLOT[playerid][12] = CreatePlayerTextDraw(playerid, 195.000000, 229.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][12], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][12], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][12], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][12], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][12], 1);

	INVENTORY_ITEMSLOT[playerid][13] = CreatePlayerTextDraw(playerid, 237.000000, 229.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][13], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][13], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][13], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][13], 1);

	INVENTORY_ITEMSLOT[playerid][14] = CreatePlayerTextDraw(playerid, 279.000000, 229.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][14], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][14], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][14], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][14], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][14], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][14], 1);

	INVENTORY_ITEMSLOT[playerid][15] = CreatePlayerTextDraw(playerid, 320.500000, 229.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][15], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][15], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][15], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][15], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][15], 1);

	INVENTORY_ITEMSLOT[playerid][16] = CreatePlayerTextDraw(playerid, 362.500000, 229.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][16], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][16], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][16], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][16], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][16], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][16], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][16], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][16], 1);

	INVENTORY_ITEMSLOT[playerid][17] = CreatePlayerTextDraw(playerid, 404.500000, 229.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][17], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][17], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][17], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][17], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][17], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][17], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][17], 1);

	INVENTORY_ITEMSLOT[playerid][18] = CreatePlayerTextDraw(playerid, 195.000000, 281.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][18], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][18], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][18], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][18], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][18], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][18], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][18], 1);

	INVENTORY_ITEMSLOT[playerid][19] = CreatePlayerTextDraw(playerid, 237.000000, 281.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][19], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][19], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][19], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][19], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][19], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][19], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][19], 1);

	INVENTORY_ITEMSLOT[playerid][20] = CreatePlayerTextDraw(playerid, 279.000000, 281.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][20], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][20], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][20], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][20], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][20], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][20], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][20], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][20], 1);

	INVENTORY_ITEMSLOT[playerid][21] = CreatePlayerTextDraw(playerid, 320.500000, 281.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][21], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][21], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][21], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][21], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][21], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][21], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][21], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][21], 1);

	INVENTORY_ITEMSLOT[playerid][22] = CreatePlayerTextDraw(playerid, 362.500000, 281.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][22], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][22], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][22], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][22], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][22], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][22], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][22], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][22], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][22], 1);

	INVENTORY_ITEMSLOT[playerid][23] = CreatePlayerTextDraw(playerid, 404.500000, 281.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][23], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][23], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][23], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][23], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][23], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][23], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][23], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][23], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][23], 1);

	INVENTORY_ITEMSLOT[playerid][24] = CreatePlayerTextDraw(playerid, 195.000000, 333.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][24], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][24], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][24], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][24], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][24], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][24], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][24], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][24], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][24], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][24], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][24], 1);

	INVENTORY_ITEMSLOT[playerid][25] = CreatePlayerTextDraw(playerid, 237.000000, 333.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][25], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][25], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][25], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][25], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][25], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][25], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][25], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][25], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][25], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][25], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][25], 1);

	INVENTORY_ITEMSLOT[playerid][26] = CreatePlayerTextDraw(playerid, 279.000000, 333.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][26], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][26], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][26], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][26], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][26], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][26], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][26], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][26], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][26], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][26], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][26], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][26], 1);

	INVENTORY_ITEMSLOT[playerid][27] = CreatePlayerTextDraw(playerid, 320.500000, 333.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][27], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][27], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][27], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][27], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][27], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][27], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][27], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][27], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][27], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][27], 1);

	INVENTORY_ITEMSLOT[playerid][28] = CreatePlayerTextDraw(playerid, 362.500000, 333.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][28], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][28], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][28], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][28], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][28], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][28], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][28], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][28], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][28], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][28], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][28], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][28], 1);

	INVENTORY_ITEMSLOT[playerid][29] = CreatePlayerTextDraw(playerid, 404.500000, 333.500000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][29], 4);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][29], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][29], 40.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][29], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][29], 1);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][29], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][29], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][29], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][29], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][29], 1);

	INVENTORY_ITEMSLOT[playerid][30] = CreatePlayerTextDraw(playerid, 216.000000, 128.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][30], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][30], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][30], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][30], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][30], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][30], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][30], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][30], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][30], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][30], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][30], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][30], 0);

	INVENTORY_ITEMSLOT[playerid][31] = CreatePlayerTextDraw(playerid, 257.000000, 128.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][31], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][31], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][31], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][31], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][31], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][31], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][31], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][31], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][31], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][31], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][31], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][31], 0);

	INVENTORY_ITEMSLOT[playerid][32] = CreatePlayerTextDraw(playerid, 299.000000, 128.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][32], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][32], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][32], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][32], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][32], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][32], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][32], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][32], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][32], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][32], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][32], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][32], 0);

	INVENTORY_ITEMSLOT[playerid][33] = CreatePlayerTextDraw(playerid, 340.000000, 128.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][33], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][33], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][33], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][33], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][33], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][33], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][33], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][33], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][33], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][33], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][33], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][33], 0);

	INVENTORY_ITEMSLOT[playerid][34] = CreatePlayerTextDraw(playerid, 382.500000, 128.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][34], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][34], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][34], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][34], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][34], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][34], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][34], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][34], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][34], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][34], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][34], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][34], 0);

	INVENTORY_ITEMSLOT[playerid][35] = CreatePlayerTextDraw(playerid, 423.500000, 128.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][35], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][35], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][35], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][35], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][35], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][35], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][35], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][35], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][35], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][35], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][35], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][35], 0);

	INVENTORY_ITEMSLOT[playerid][36] = CreatePlayerTextDraw(playerid, 216.000000, 180.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][36], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][36], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][36], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][36], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][36], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][36], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][36], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][36], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][36], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][36], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][36], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][36], 0);

	INVENTORY_ITEMSLOT[playerid][37] = CreatePlayerTextDraw(playerid, 257.000000, 180.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][37], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][37], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][37], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][37], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][37], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][37], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][37], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][37], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][37], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][37], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][37], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][37], 0);

	INVENTORY_ITEMSLOT[playerid][38] = CreatePlayerTextDraw(playerid, 299.000000, 180.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][38], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][38], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][38], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][38], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][38], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][38], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][38], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][38], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][38], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][38], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][38], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][38], 0);

	INVENTORY_ITEMSLOT[playerid][39] = CreatePlayerTextDraw(playerid, 340.000000, 180.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][39], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][39], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][39], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][39], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][39], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][39], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][39], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][39], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][39], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][39], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][39], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][39], 0);

	INVENTORY_ITEMSLOT[playerid][40] = CreatePlayerTextDraw(playerid, 382.500000, 180.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][40], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][40], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][40], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][40], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][40], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][40], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][40], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][40], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][40], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][40], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][40], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][40], 0);

	INVENTORY_ITEMSLOT[playerid][41] = CreatePlayerTextDraw(playerid, 423.500000, 180.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][41], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][41], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][41], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][41], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][41], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][41], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][41], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][41], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][41], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][41], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][41], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][41], 0);

	INVENTORY_ITEMSLOT[playerid][42] = CreatePlayerTextDraw(playerid, 216.000000, 232.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][42], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][42], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][42], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][42], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][42], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][42], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][42], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][42], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][42], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][42], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][42], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][42], 0);

	INVENTORY_ITEMSLOT[playerid][43] = CreatePlayerTextDraw(playerid, 257.000000, 232.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][43], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][43], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][43], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][43], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][43], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][43], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][43], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][43], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][43], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][43], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][43], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][43], 0);

	INVENTORY_ITEMSLOT[playerid][44] = CreatePlayerTextDraw(playerid, 299.000000, 232.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][44], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][44], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][44], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][44], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][44], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][44], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][44], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][44], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][44], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][44], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][44], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][44], 0);

	INVENTORY_ITEMSLOT[playerid][45] = CreatePlayerTextDraw(playerid, 340.000000, 232.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][45], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][45], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][45], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][45], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][45], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][45], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][45], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][45], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][45], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][45], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][45], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][45], 0);

	INVENTORY_ITEMSLOT[playerid][46] = CreatePlayerTextDraw(playerid, 382.500000, 232.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][46], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][46], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][46], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][46], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][46], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][46], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][46], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][46], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][46], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][46], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][46], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][46], 0);

	INVENTORY_ITEMSLOT[playerid][47] = CreatePlayerTextDraw(playerid, 423.500000, 232.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][47], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][47], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][47], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][47], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][47], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][47], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][47], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][47], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][47], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][47], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][47], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][47], 0);

	INVENTORY_ITEMSLOT[playerid][48] = CreatePlayerTextDraw(playerid, 216.000000, 283.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][48], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][48], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][48], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][48], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][48], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][48], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][48], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][48], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][48], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][48], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][48], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][48], 0);

	INVENTORY_ITEMSLOT[playerid][49] = CreatePlayerTextDraw(playerid, 257.000000, 283.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][49], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][49], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][49], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][49], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][49], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][49], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][49], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][49], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][49], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][49], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][49], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][49], 0);

	INVENTORY_ITEMSLOT[playerid][50] = CreatePlayerTextDraw(playerid, 299.000000, 283.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][50], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][50], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][50], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][50], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][50], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][50], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][50], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][50], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][50], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][50], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][50], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][50], 0);

	INVENTORY_ITEMSLOT[playerid][51] = CreatePlayerTextDraw(playerid, 340.000000, 283.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][51], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][51], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][51], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][51], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][51], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][51], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][51], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][51], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][51], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][51], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][51], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][51], 0);

	INVENTORY_ITEMSLOT[playerid][52] = CreatePlayerTextDraw(playerid, 382.500000, 283.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][52], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][52], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][52], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][52], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][52], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][52], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][52], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][52], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][52], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][52], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][52], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][52], 0);

	INVENTORY_ITEMSLOT[playerid][53] = CreatePlayerTextDraw(playerid, 423.500000, 283.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][53], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][53], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][53], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][53], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][53], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][53], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][53], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][53], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][53], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][53], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][53], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][53], 0);

	INVENTORY_ITEMSLOT[playerid][54] = CreatePlayerTextDraw(playerid, 216.000000, 335.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][54], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][54], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][54], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][54], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][54], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][54], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][54], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][54], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][54], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][54], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][54], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][54], 0);

	INVENTORY_ITEMSLOT[playerid][55] = CreatePlayerTextDraw(playerid, 257.000000, 335.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][55], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][55], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][55], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][55], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][55], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][55], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][55], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][55], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][55], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][55], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][55], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][55], 0);

	INVENTORY_ITEMSLOT[playerid][56] = CreatePlayerTextDraw(playerid, 299.000000, 335.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][56], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][56], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][56], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][56], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][56], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][56], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][56], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][56], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][56], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][56], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][56], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][56], 0);

	INVENTORY_ITEMSLOT[playerid][57] = CreatePlayerTextDraw(playerid, 340.000000, 335.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][57], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][57], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][57], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][57], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][57], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][57], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][57], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][57], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][57], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][57], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][57], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][57], 0);

	INVENTORY_ITEMSLOT[playerid][58] = CreatePlayerTextDraw(playerid, 382.500000, 335.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][58], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][58], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][58], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][58], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][58], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][58], 2);
	PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][58], -1);
	PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][58], 255);
	PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][58], 50);
	PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][58], 0);
	PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][58], 1);
	PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][58], 0);

	INVENTORY_ITEMSLOT[playerid][59] = CreatePlayerTextDraw(playerid, 423.500000, 335.000000, "");
	PlayerTextDrawFont(playerid, INVENTORY_ITEMSLOT[playerid][59], 1);
	PlayerTextDrawLetterSize(playerid, INVENTORY_ITEMSLOT[playerid][59], 0.129999, 0.600000);
	PlayerTextDrawTextSize(playerid, INVENTORY_ITEMSLOT[playerid][59], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INVENTORY_ITEMSLOT[playerid][59], 0);
	PlayerTextDrawSetShadow(playerid, INVENTORY_ITEMSLOT[playerid][59], 0);
	PlayerTextDrawAlignment(playerid, INVENTORY_ITEMSLOT[playerid][59], 2);
    PlayerTextDrawColor(playerid, INVENTORY_ITEMSLOT[playerid][59], -1);
    PlayerTextDrawBackgroundColor(playerid, INVENTORY_ITEMSLOT[playerid][59], 255);
    PlayerTextDrawBoxColor(playerid, INVENTORY_ITEMSLOT[playerid][59], 50);
    PlayerTextDrawUseBox(playerid, INVENTORY_ITEMSLOT[playerid][59], 0);
    PlayerTextDrawSetProportional(playerid, INVENTORY_ITEMSLOT[playerid][59], 1);
    PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][59], 0);
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) { 
    if(INVENTORY_PLAYING[playerid] == 1) {
        if(clickedid == Text: INVALID_TEXT_DRAW) {
            INVENTORY_INTERFACE(playerid, false); 
			ShowPlayerStats(playerid, true);
            return true;
        }
    }
    return true;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid) {

	if(INVENTORY_PLAYING[playerid] == 1)
        if(playertextid == INVENTORY_TDMOD[playerid][3])
        {
            INVENTORY_INTERFACE(playerid, false); // ใช้ฟังก์ชันปิดอินเวนทอรีของคุณ
            ShowPlayerStats(playerid, true); // ถ้าต้องการแสดง stat คืน
            CancelSelectTextDraw(playerid); // ยกเลิกการ select ถ้ามี
            return true;
        }
    if(INVENTORY_PLAYING[playerid] == 1) {
        for (new i = 0; i < 30; i ++) {
            if(playertextid == INVENTORY_ITEMSLOT[playerid][i]) {
                new index = INVENTORY_SELECT[playerid][i];
                if(invData[playerid][index][invExists]) {
                    CancelSelectTextDraw(playerid);
                    OnPlayerClickItem(playerid, index, invData[playerid][index][invItem]);          
                    break;
                }
            }
        }
    }
    return true;
}
stock INVENTORY_ITEMGET(const item[]) {
	new string;
    for (new i = 0; i < sizeof(itemData); i ++) {
        if(!strcmp(itemData[i][itemName], item, true)) {
            string = i;
            break;
        }
    }
    return string;
}
stock INVENTORY_UPDATE(playerid, enable = false) {
    new string[300], slot;
    for (new i = 0*30; i < 30; i ++) {
        if(invData[playerid][i][invExists]) {
            if(enable) {
                PlayerTextDrawHide(playerid, INVENTORY_ITEMSLOT[playerid][slot]); 
                PlayerTextDrawHide(playerid, INVENTORY_ITEMSLOT[playerid][30+slot]);
            }
            new index = INVENTORY_ITEMGET(invData[playerid][i][invItem]);
            INVENTORY_SELECT[playerid][slot] = i;


            format(string, sizeof(string), "_%d", playerid);
	        PlayerTextDrawSetString(playerid, INVENTORY_TDMOD[playerid][2], string);

            PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][slot], 1);
            PlayerTextDrawSetString(playerid, INVENTORY_ITEMSLOT[playerid][slot], itemData[index][itemPng]);
            PlayerTextDrawShow(playerid, INVENTORY_ITEMSLOT[playerid][slot]);

			new Float:kgret_getitem;
			Inventory_GetItemWeightByName(invData[playerid][i][invItem], kgret_getitem);
            format(string, sizeof(string), "%d.%d (%.1f)", invData[playerid][i][invQuantity], itemData[index][itemQuantity], (kgret_getitem * invData[playerid][i][invQuantity]));
            PlayerTextDrawSetString(playerid, INVENTORY_ITEMSLOT[playerid][30+slot], string);
            PlayerTextDrawShow(playerid, INVENTORY_ITEMSLOT[playerid][30+slot]);
        }
        else {
            if(enable) {
                PlayerTextDrawHide(playerid, INVENTORY_ITEMSLOT[playerid][slot]);
            }
            PlayerTextDrawSetSelectable(playerid, INVENTORY_ITEMSLOT[playerid][slot], 0);
            PlayerTextDrawHide(playerid,INVENTORY_ITEMSLOT[playerid][30+slot]);
            slot --;
        }
        slot ++;
        if(slot == 30) {
            break;
        }
    }
	new Float:kgall;
	Inventory_Items_KG(playerid, kgall);
	format(string, sizeof(string), "%d/%d (%.1f/%.1f g)", Inventory_Items(playerid), playerData[playerid][pMaxItem], kgall, GetPlayerMaxWeight(playerid));
	PlayerTextDrawSetString(playerid, INVENTORY_TDMOD[playerid][1], string);
    return true;
}
stock INVENTORY_INTERFACE(playerid, bool:enable) {
	if(enable == true) {
		CreateInventoryTD(playerid);
		playerData[playerid][pMaxItem] = 30;
        INVENTORY_PLAYING[playerid] = 1;
		INVENTORY_UPDATE(playerid, true);
        for (new i = 0; i < 4; i ++) {
            PlayerTextDrawShow(playerid, INVENTORY_TDMOD[playerid][i]);
        }
		SelectTextDraw(playerid, 0x8C8C8CFF);
    }
    else {
		INVENTORY_PLAYING[playerid] = 0;
        for (new i = 0; i < 4; i ++) {
            PlayerTextDrawHide(playerid, INVENTORY_TDMOD[playerid][i]);
			PlayerTextDrawDestroy(playerid, INVENTORY_TDMOD[playerid][i]);
        }
        for (new i = 0; i < 60; i ++) {
            PlayerTextDrawHide(playerid, INVENTORY_ITEMSLOT[playerid][i]);
        }
		for (new i = 0; i < 60; i++)
		{
			PlayerTextDrawDestroy(playerid, INVENTORY_ITEMSLOT[playerid][i]);
		}
    }
    return true;
}

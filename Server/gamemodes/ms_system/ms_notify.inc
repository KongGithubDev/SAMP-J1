#include <YSI_Coding\y_hooks>

new PlayerText:UI_NOTIFY_TEXTDRAW[MAX_PLAYERS][15];
new bool:NOTIFY_PLAYER[MAX_PLAYERS][5];

hook OnPlayerConnect(playerid)
{
    UI_NOTIFY_TEXTDRAW[playerid][0] = CreatePlayerTextDraw(playerid, 538.000000, 358.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 100.000000, 40.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], 0);

    UI_NOTIFY_TEXTDRAW[playerid][1] = CreatePlayerTextDraw(playerid, 543.000000, 359.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 22.500000, 37.750000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], 0);

    UI_NOTIFY_TEXTDRAW[playerid][2] = CreatePlayerTextDraw(playerid, 571.000000, 384.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 0.166666, 0.850000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], 0);

    UI_NOTIFY_TEXTDRAW[playerid][3] = CreatePlayerTextDraw(playerid, 538.000000, 311.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 100.000000, 40.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], 0);

    UI_NOTIFY_TEXTDRAW[playerid][4] = CreatePlayerTextDraw(playerid, 543.000000, 312.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 22.500000, 37.750000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], 0);

    UI_NOTIFY_TEXTDRAW[playerid][5] = CreatePlayerTextDraw(playerid, 571.000000, 337.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 1);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 0.166666, 0.850000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 0);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 0);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], 0);

    UI_NOTIFY_TEXTDRAW[playerid][6] = CreatePlayerTextDraw(playerid, 538.000000, 265.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 100.000000, 40.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], 0);

    UI_NOTIFY_TEXTDRAW[playerid][7] = CreatePlayerTextDraw(playerid, 543.000000, 266.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 22.500000, 37.750000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], 0);

    UI_NOTIFY_TEXTDRAW[playerid][8] = CreatePlayerTextDraw(playerid, 571.000000, 291.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 1);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 0.166666, 0.850000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 0);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 0);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], 0);

    UI_NOTIFY_TEXTDRAW[playerid][9] = CreatePlayerTextDraw(playerid, 538.000000, 219.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 100.000000, 40.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], 0);

    UI_NOTIFY_TEXTDRAW[playerid][10] = CreatePlayerTextDraw(playerid, 543.000000, 220.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 22.500000, 37.750000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], 0);

    UI_NOTIFY_TEXTDRAW[playerid][11] = CreatePlayerTextDraw(playerid, 571.000000, 245.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 1);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 0.166666, 0.850000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 0);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 0);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], 0);

    UI_NOTIFY_TEXTDRAW[playerid][12] = CreatePlayerTextDraw(playerid, 538.000000, 172.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 100.000000, 40.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], 0);

    UI_NOTIFY_TEXTDRAW[playerid][13] = CreatePlayerTextDraw(playerid, 543.000000, 173.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 4);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 22.500000, 37.750000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 1);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 1);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], 0);

    UI_NOTIFY_TEXTDRAW[playerid][14] = CreatePlayerTextDraw(playerid, 571.000000, 198.000000, "");
    PlayerTextDrawFont(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 1);
    PlayerTextDrawLetterSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 0.166666, 0.850000);
    PlayerTextDrawTextSize(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 0);
    PlayerTextDrawSetShadow(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 0);
    PlayerTextDrawAlignment(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 1);
    PlayerTextDrawColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 255);
    PlayerTextDrawBoxColor(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 50);
    PlayerTextDrawUseBox(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 0);
    PlayerTextDrawSetProportional(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 1);
    PlayerTextDrawSetSelectable(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], 0);

    for (new i = 0; i < 5; i++)
	{
        NOTIFY_PLAYER[playerid][i] = false;
    }
	return 1;
}

stock NOTIFY_GETNAME(const item[])
{
	new itemid;
    for (new i = 0; i < sizeof(itemData); i ++)
	{
        if(!strcmp(itemData[i][itemName], item, true))
		{
            itemid = i;
            break;
        }
    }
    return itemid;
}

stock NOTIFY_CHECK(playerid)
{
    new count = 0;
    for (new i = 0; i < 5; i++)
    {
        if(!NOTIFY_PLAYER[playerid][i])
        {
            count = i;
            break;
        }
    }
    return count;
}

stock NOTIFY_ADD(playerid, const name[], quantity)
{
    new slot = NOTIFY_CHECK(playerid), index = NOTIFY_GETNAME(name), string[32];
    switch (slot)
    {
        case 0:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], "ms_uiinv:ms_add");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][0]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][1]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][2]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
        case 1:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], "ms_uiinv:ms_add");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][3]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][4]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][5]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
        case 2:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], "ms_uiinv:ms_add");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][6]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][7]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][8]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
        case 3:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], "ms_uiinv:ms_add");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][9]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][10]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][11]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
        case 4:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], "ms_uiinv:ms_add");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][12]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][13]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][14]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
    }
	return 1;
}

stock NOTIFY_REMOVE(playerid, const name[], quantity)
{
    new slot = NOTIFY_CHECK(playerid), index = NOTIFY_GETNAME(name), string[32];
    switch (slot)
    {
        case 0:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][0], "ms_uiinv:ms_remove");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][1], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][2], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][0]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][1]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][2]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
        case 1:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][3], "ms_uiinv:ms_remove");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][4], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][5], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][3]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][4]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][5]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
        case 2:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][6], "ms_uiinv:ms_remove");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][7], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][8], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][6]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][7]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][8]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
        case 3:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][9], "ms_uiinv:ms_remove");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][10], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][11], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][9]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][10]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][11]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
        case 4:
        {
			format(string, sizeof(string), "%d", quantity);
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][12], "ms_uiinv:ms_remove");
			PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][13], itemData[index][itemPng]);
            PlayerTextDrawSetString(playerid, UI_NOTIFY_TEXTDRAW[playerid][14], string);

            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][12]);
            PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][13]);
			PlayerTextDrawShow(playerid, UI_NOTIFY_TEXTDRAW[playerid][14]);
            NOTIFY_PLAYER[playerid][slot] = true;
            defer NOTIFY_UPDATE_SERVER(playerid, slot);
        }
    }
	return 1;
}

timer NOTIFY_UPDATE_SERVER[5000](playerid, slot)
{
    switch (slot)
    {
        case 0:
        {
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][0]);
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][1]);
			PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][2]);
            NOTIFY_PLAYER[playerid][slot] = false;
        }
        case 1:
        {
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][3]);
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][4]);
			PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][5]);
            NOTIFY_PLAYER[playerid][slot] = false;
        }
        case 2:
        {
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][6]);
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][7]);
			PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][8]);
            NOTIFY_PLAYER[playerid][slot] = false;
        }
        case 3:
        {
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][9]);
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][10]);
			PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][11]);
            NOTIFY_PLAYER[playerid][slot] = false;
        }
        case 4:
        {
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][12]);
            PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][13]);
			PlayerTextDrawHide(playerid, UI_NOTIFY_TEXTDRAW[playerid][14]);
            NOTIFY_PLAYER[playerid][slot] = false;
        }                        
    }
	return 1;
}
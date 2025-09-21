#include <YSI_Coding\y_hooks>

new PlayerBar:UI_STATUS_PROGRESS[MAX_PLAYERS][2];
new PlayerText:UI_STATUS_NEWLAND[MAX_PLAYERS][5];
new STATUS_PLAYER[MAX_PLAYERS];


hook OnPlayerConnect(playerid)
{
    UI_STATUS_PROGRESS[playerid][0] = CreatePlayerProgressBar(playerid, 5.0, 421.0, 121.0, 17.5, 0xFFA500FF, 100.0, 0);
    SetPlayerProgressBarValue(playerid, UI_STATUS_PROGRESS[playerid][0], 50.000000);
	SetPlayerProgressBarBackColour(playerid, UI_STATUS_PROGRESS[playerid][0], 0x00000000);
	SetPlayerProgressBarBgColour(playerid, UI_STATUS_PROGRESS[playerid][0], 0x6C6C6CFF, true);

    UI_STATUS_PROGRESS[playerid][1] = CreatePlayerProgressBar(playerid, 5.0, 438.0, 121.0, 5.5, 0xFFA500FF, 100.0, 0);
    SetPlayerProgressBarValue(playerid, UI_STATUS_PROGRESS[playerid][1], 50.000000);
	SetPlayerProgressBarBackColour(playerid, UI_STATUS_PROGRESS[playerid][1], 0x00000000);
	SetPlayerProgressBarBgColour(playerid, UI_STATUS_PROGRESS[playerid][1], 0x6C6C6CFF, true);

    UI_STATUS_NEWLAND[playerid][0] = CreatePlayerTextDraw(playerid, 3.000000, 413.000000, "NEWLAND:NEWLAND_HPMAIN");
    PlayerTextDrawFont(playerid, UI_STATUS_NEWLAND[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, UI_STATUS_NEWLAND[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_STATUS_NEWLAND[playerid][0], 160.500000, 32.500000);
    PlayerTextDrawSetOutline(playerid, UI_STATUS_NEWLAND[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, UI_STATUS_NEWLAND[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, UI_STATUS_NEWLAND[playerid][0], 1);
    PlayerTextDrawColor(playerid, UI_STATUS_NEWLAND[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_STATUS_NEWLAND[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, UI_STATUS_NEWLAND[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, UI_STATUS_NEWLAND[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, UI_STATUS_NEWLAND[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, UI_STATUS_NEWLAND[playerid][0], 0);

    UI_STATUS_NEWLAND[playerid][1] = CreatePlayerTextDraw(playerid, 11.000000, 414.000000, "");
    PlayerTextDrawFont(playerid, UI_STATUS_NEWLAND[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, UI_STATUS_NEWLAND[playerid][1], 0.145833, 0.650000);
    PlayerTextDrawTextSize(playerid, UI_STATUS_NEWLAND[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_STATUS_NEWLAND[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, UI_STATUS_NEWLAND[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, UI_STATUS_NEWLAND[playerid][1], 1);
    PlayerTextDrawColor(playerid, UI_STATUS_NEWLAND[playerid][1], -1145324545);
    PlayerTextDrawBackgroundColor(playerid, UI_STATUS_NEWLAND[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, UI_STATUS_NEWLAND[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, UI_STATUS_NEWLAND[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, UI_STATUS_NEWLAND[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, UI_STATUS_NEWLAND[playerid][1], 0);

    UI_STATUS_NEWLAND[playerid][2] = CreatePlayerTextDraw(playerid, 128.000000, 423.000000, "");
    PlayerTextDrawFont(playerid, UI_STATUS_NEWLAND[playerid][2], 4);
    PlayerTextDrawLetterSize(playerid, UI_STATUS_NEWLAND[playerid][2], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_STATUS_NEWLAND[playerid][2], 15.500000, 20.500000);
    PlayerTextDrawSetOutline(playerid, UI_STATUS_NEWLAND[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, UI_STATUS_NEWLAND[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, UI_STATUS_NEWLAND[playerid][2], 1);
    PlayerTextDrawColor(playerid, UI_STATUS_NEWLAND[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_STATUS_NEWLAND[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, UI_STATUS_NEWLAND[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, UI_STATUS_NEWLAND[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, UI_STATUS_NEWLAND[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, UI_STATUS_NEWLAND[playerid][2], 0);

    UI_STATUS_NEWLAND[playerid][3] = CreatePlayerTextDraw(playerid, 147.000000, 423.000000, "");
    PlayerTextDrawFont(playerid, UI_STATUS_NEWLAND[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, UI_STATUS_NEWLAND[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_STATUS_NEWLAND[playerid][3], 15.500000, 20.500000);
    PlayerTextDrawSetOutline(playerid, UI_STATUS_NEWLAND[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, UI_STATUS_NEWLAND[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, UI_STATUS_NEWLAND[playerid][3], 1);
    PlayerTextDrawColor(playerid, UI_STATUS_NEWLAND[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_STATUS_NEWLAND[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, UI_STATUS_NEWLAND[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, UI_STATUS_NEWLAND[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, UI_STATUS_NEWLAND[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, UI_STATUS_NEWLAND[playerid][3], 0);

    UI_STATUS_NEWLAND[playerid][4] = CreatePlayerTextDraw(playerid, 96.000000, 423.000000, "");
    PlayerTextDrawFont(playerid, UI_STATUS_NEWLAND[playerid][4], 1);
    PlayerTextDrawLetterSize(playerid, UI_STATUS_NEWLAND[playerid][4], 0.216667, 1.200000);
    PlayerTextDrawTextSize(playerid, UI_STATUS_NEWLAND[playerid][4], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_STATUS_NEWLAND[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, UI_STATUS_NEWLAND[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, UI_STATUS_NEWLAND[playerid][4], 1);
    PlayerTextDrawColor(playerid, UI_STATUS_NEWLAND[playerid][4], -1145324545);
    PlayerTextDrawBackgroundColor(playerid, UI_STATUS_NEWLAND[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, UI_STATUS_NEWLAND[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, UI_STATUS_NEWLAND[playerid][4], 0);
    PlayerTextDrawSetProportional(playerid, UI_STATUS_NEWLAND[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, UI_STATUS_NEWLAND[playerid][4], 0);

    STATUS_PLAYER[playerid] = 0;
	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
        Protex_Interface(playerid, false);
    }
    if(newstate == PLAYER_STATE_ONFOOT)
    {
        Protex_Interface(playerid, true);
    }
    return 1;
}

hook OnPlayerSpawn(playerid)
{
	Protex_Interface(playerid, true);
    return 1;
}

hook OnPlayerUpdate(playerid)
{
    new string[300], hour, minute, second, Float:health, Float:armor;

    GetPlayerHealth(playerid, health);
    GetPlayerArmour(playerid, armor);

    if(STATUS_PLAYER[playerid] == 1)
    {
        gettime(hour, minute, second);
		format(string, sizeof(string), "%02d:%02d:%02d", hour, minute, second);
		PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][1], string);

        format(string, sizeof(string), "HP:%.0f", health);
	    PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][4], string);

        SetPlayerProgressBarValue(playerid, UI_STATUS_PROGRESS[playerid][0], health);
        SetPlayerProgressBarValue(playerid, UI_STATUS_PROGRESS[playerid][1], armor);

        if(playerData[playerid][pHungry] <= 0)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][2], "");
        }
        else if(playerData[playerid][pHungry] <= 20)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][2], "NEWLAND:NEWLAND_HP_1_20");
        }
        else if(playerData[playerid][pHungry] <= 40)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][2], "NEWLAND:NEWLAND_HP_1_40");
        }
        else if(playerData[playerid][pHungry] <= 60)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][2], "NEWLAND:NEWLAND_HP_1_60");
        }
        else if(playerData[playerid][pHungry] <= 80)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][2], "NEWLAND:NEWLAND_HP_1_80");
        }
        else if(playerData[playerid][pHungry] <= 100)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][2], "NEWLAND:NEWLAND_HP_1_100");
        }

        if(playerData[playerid][pThirsty] <= 0)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][3], "");
        }
        else if(playerData[playerid][pThirsty] <= 20)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][3], "NEWLAND:NEWLAND_HP_1_20");
        }
        else if(playerData[playerid][pThirsty] <= 40)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][3], "NEWLAND:NEWLAND_HP_1_40");
        }
        else if(playerData[playerid][pThirsty] <= 60)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][3], "NEWLAND:NEWLAND_HP_1_60");
        }
        else if(playerData[playerid][pThirsty] <= 80)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][3], "NEWLAND:NEWLAND_HP_1_80");
        }
        else if(playerData[playerid][pThirsty] <= 100)
        {
            PlayerTextDrawSetString(playerid, UI_STATUS_NEWLAND[playerid][3], "NEWLAND:NEWLAND_HP_1_100");
        }

        PlayerTextDrawShow(playerid, UI_STATUS_NEWLAND[playerid][2]);
        PlayerTextDrawShow(playerid, UI_STATUS_NEWLAND[playerid][3]);
    }
    return 1;
}

stock Protex_Interface(playerid, bool:enable)
{
	if(enable == true)
	{
        for (new i = 0; i < 2; i ++)
        {
            ShowPlayerProgressBar(playerid, UI_STATUS_PROGRESS[playerid][i]);
        }
        for (new i = 0; i < 5; i ++)
        {
            PlayerTextDrawShow(playerid, UI_STATUS_NEWLAND[playerid][i]);
        }
        STATUS_PLAYER[playerid] = 1;
    }
    else {
        for (new i = 0; i < 2; i ++)
        {
            HidePlayerProgressBar(playerid, UI_STATUS_PROGRESS[playerid][i]);
        }
        for (new i = 0; i < 5; i ++)
        {
            PlayerTextDrawHide(playerid, UI_STATUS_NEWLAND[playerid][i]);
        }
        STATUS_PLAYER[playerid] = 0;
    }
    return 1;
}
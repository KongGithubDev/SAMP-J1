#include <YSI_Coding\y_hooks>
#include <stamina>

new PlayerText:ms_statsTD[MAX_PLAYERS][5];
new PlayerBar:ms_StatsBar[MAX_PLAYERS][5];

hook OnPlayerConnect(playerid){

	ms_StatsBar[playerid][0] = CreatePlayerProgressBar(playerid, 35.0, 409.0, 98.5, 9.5, 0xFFFF00FF, 100.0, 0);
	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][0], 50.000000);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);

	ms_StatsBar[playerid][1] = CreatePlayerProgressBar(playerid, 29.0, 425.0, 103.0, 10.0, 0xFFFF00FF, 100.0, 0);
	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][1], 50.000000);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);

	ms_StatsBar[playerid][2] = CreatePlayerProgressBar(playerid, 34.0, 422.0, 98.5, 0.0, 0xFFFF00FF, 100.0, 0);
	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][2], 50.000000);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);

	ms_StatsBar[playerid][3] = CreatePlayerProgressBar(playerid, 156.0, 437.0, 18.0, 26.5, 0xFFFF00FF, 100.0, 2);
	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][3], 50.000000);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);

	ms_StatsBar[playerid][4] = CreatePlayerProgressBar(playerid, 177.0, 437.0, 17.0, 26.5, 0xFFFF00FF, 100.0, 2);
	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][4], 50.000000);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);
	SetPlayerProgressBarBgColour(playerid, ms_StatsBar[playerid][0], 0xFF000000, true);

    ms_statsTD[playerid][0] = CreatePlayerTextDraw(playerid, 3.000000, 413.000000, "NEWLAND:NEWLAND_HPMAIN");
    PlayerTextDrawFont(playerid, ms_statsTD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, ms_statsTD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, ms_statsTD[playerid][0], 160.500000, 32.500000);
    PlayerTextDrawSetOutline(playerid, ms_statsTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, ms_statsTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, ms_statsTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, ms_statsTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, ms_statsTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, ms_statsTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, ms_statsTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, ms_statsTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, ms_statsTD[playerid][0], 0);

    ms_statsTD[playerid][1] = CreatePlayerTextDraw(playerid, 11.000000, 414.000000, "");
    PlayerTextDrawFont(playerid, ms_statsTD[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, ms_statsTD[playerid][1], 0.145833, 0.650000);
    PlayerTextDrawTextSize(playerid, ms_statsTD[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, ms_statsTD[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, ms_statsTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, ms_statsTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, ms_statsTD[playerid][1], -1145324545);
    PlayerTextDrawBackgroundColor(playerid, ms_statsTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, ms_statsTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, ms_statsTD[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, ms_statsTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, ms_statsTD[playerid][1], 0);

    ms_statsTD[playerid][2] = CreatePlayerTextDraw(playerid, 128.000000, 423.000000, "");
    PlayerTextDrawFont(playerid, ms_statsTD[playerid][2], 4);
    PlayerTextDrawLetterSize(playerid, ms_statsTD[playerid][2], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, ms_statsTD[playerid][2], 15.500000, 20.500000);
    PlayerTextDrawSetOutline(playerid, ms_statsTD[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, ms_statsTD[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, ms_statsTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, ms_statsTD[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, ms_statsTD[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, ms_statsTD[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, ms_statsTD[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, ms_statsTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, ms_statsTD[playerid][2], 0);

    ms_statsTD[playerid][3] = CreatePlayerTextDraw(playerid, 147.000000, 423.000000, "");
    PlayerTextDrawFont(playerid, ms_statsTD[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, ms_statsTD[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, ms_statsTD[playerid][3], 15.500000, 20.500000);
    PlayerTextDrawSetOutline(playerid, ms_statsTD[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, ms_statsTD[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, ms_statsTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, ms_statsTD[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, ms_statsTD[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, ms_statsTD[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, ms_statsTD[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, ms_statsTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, ms_statsTD[playerid][3], 0);

	ms_statsTD[playerid][4] = CreatePlayerTextDraw(playerid, 96.000000, 423.000000, "");
    PlayerTextDrawFont(playerid, ms_statsTD[playerid][4], 1);
    PlayerTextDrawLetterSize(playerid, ms_statsTD[playerid][4], 0.216667, 1.200000);
    PlayerTextDrawTextSize(playerid, ms_statsTD[playerid][4], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, ms_statsTD[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, ms_statsTD[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, ms_statsTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, ms_statsTD[playerid][4], -1145324545);
    PlayerTextDrawBackgroundColor(playerid, ms_statsTD[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, ms_statsTD[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, ms_statsTD[playerid][4], 0);
    PlayerTextDrawSetProportional(playerid, ms_statsTD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, ms_statsTD[playerid][4], 0);

    SetPlayerMaxStamina(playerid, 100);
	SetPlayerStamina(playerid, 100);
	return 1;
}

ShowPlayerStats(playerid, bool:enable){

    if(enable == true){
        for (new i = 0; i < 4; i++){
            PlayerTextDrawShow(playerid, ms_statsTD[playerid][i]);
        }
        for (new i = 0; i < 5; i++){

            ShowPlayerProgressBar(playerid, ms_StatsBar[playerid][i]);
        }
    }
    else{
        for (new i = 0; i < 4; i++) 
        {
            PlayerTextDrawHide(playerid, ms_statsTD[playerid][i]);
        }
        for (new i = 0; i < 5; i++) 
        {
            HidePlayerProgressBar(playerid, ms_StatsBar[playerid][i]);
        }
    }
}

ptask MsStats[200](playerid)
{
	if (!playerData[playerid][IsLoggedIn])
		return 0;

	new string[32];

	new Float:hp, Float:ap;
	GetPlayerHealth(playerid, hp);
	GetPlayerArmour(playerid, ap);

	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][0], hp);//���ʹ

	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][1], ap);//����

	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][2], GetPlayerStamina(playerid)); // �˹����

	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][3], playerData[playerid][pHungry]); // �����

	SetPlayerProgressBarValue(playerid, ms_StatsBar[playerid][4], playerData[playerid][pThirsty]); // ���

	format(string, sizeof(string), "%.0f", playerData[playerid][pHungry]);
    PlayerTextDrawSetString(playerid, ms_statsTD[playerid][1], string);

    format(string, sizeof(string), "%.0f", playerData[playerid][pThirsty]);
    PlayerTextDrawSetString(playerid, ms_statsTD[playerid][2], string);

	format(string, sizeof(string), "_%d", playerid);
	PlayerTextDrawSetString(playerid, ms_statsTD[playerid][3], string);

	return 1;
}

ptask StaminaTimer[250](playerid)
{
    if (!playerData[playerid][IsLoggedIn])
		return 0;

	if (IsPlayerRunning(playerid))
	{
		GivePlayerStamina(playerid, -1);
	}
    else if (GetPlayerStamina(playerid) < GetPlayerMaxStamina(playerid))
	{
		GivePlayerStamina(playerid, 1);
	}
    return 1;
}

public OnPlayerStaminaOver(playerid) 
{
	SetPlayerExhausted(playerid, true); 
	return 1;
}
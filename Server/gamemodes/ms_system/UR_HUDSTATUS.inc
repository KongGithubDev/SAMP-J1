//Ms
#include <YSI_Coding\y_hooks>

new PlayerText:HUDSTATUS_TD[MAX_PLAYERS][2];
new PlayerBar:URProgressBar[MAX_PLAYERS][4];

hook OnPlayerConnect(playerid)
{
    URProgressBar[playerid][0] = CreatePlayerProgressBar(playerid, 15.000000, 413.000000, 116.000000, 20.000000, -65281, 100.000000, 0);
	SetPlayerProgressBarValue(playerid, URProgressBar[playerid][0], 50.000000);
    SetPlayerProgressBarBackColour(playerid, URProgressBar[playerid][0], 0x424242FF);
	SetPlayerProgressBarBgColour(playerid, URProgressBar[playerid][0], 0x424242FF, true);

	URProgressBar[playerid][1] = CreatePlayerProgressBar(playerid, 19.000000, 435.000000, 91.000000, 4.000000, -1, 100.000000, 0);
	SetPlayerProgressBarValue(playerid, URProgressBar[playerid][1], 50.000000);
    SetPlayerProgressBarBackColour(playerid, URProgressBar[playerid][1], 0x424242FF);
	SetPlayerProgressBarBgColour(playerid, URProgressBar[playerid][1], 0x424242FF, true);

	URProgressBar[playerid][2] = CreatePlayerProgressBar(playerid, 153.000000, 436.000000, 17.500000, 26.500000, -65281, 100.000000, 2);
	SetPlayerProgressBarValue(playerid, URProgressBar[playerid][2], 50.000000);
    SetPlayerProgressBarBackColour(playerid, URProgressBar[playerid][2], 0x424242FF);
	SetPlayerProgressBarBgColour(playerid, URProgressBar[playerid][2], 0x424242FF, true);

	URProgressBar[playerid][3] = CreatePlayerProgressBar(playerid, 175.000000, 436.000000, 17.000000, 26.500000, -65281, 100.000000, 2);
	SetPlayerProgressBarValue(playerid, URProgressBar[playerid][3], 50.000000);
    SetPlayerProgressBarBackColour(playerid, URProgressBar[playerid][3], 0x424242FF);
	SetPlayerProgressBarBgColour(playerid, URProgressBar[playerid][3], 0x424242FF, true);

	HUDSTATUS_TD[playerid][0] = CreatePlayerTextDraw(playerid, 5.000000, 378.000000, "UR_HUDSTATUS:UR_HUDSTATUS");
	PlayerTextDrawFont(playerid, HUDSTATUS_TD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, HUDSTATUS_TD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HUDSTATUS_TD[playerid][0], 184.000000, 89.500000);
	PlayerTextDrawSetOutline(playerid, HUDSTATUS_TD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, HUDSTATUS_TD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, HUDSTATUS_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, HUDSTATUS_TD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, HUDSTATUS_TD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, HUDSTATUS_TD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, HUDSTATUS_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, HUDSTATUS_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, HUDSTATUS_TD[playerid][0], 0);

	HUDSTATUS_TD[playerid][1] = CreatePlayerTextDraw(playerid, 105.000000, 420.000000, "");
	PlayerTextDrawFont(playerid, HUDSTATUS_TD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, HUDSTATUS_TD[playerid][1], 0.174998, 0.800000);
	PlayerTextDrawTextSize(playerid, HUDSTATUS_TD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, HUDSTATUS_TD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, HUDSTATUS_TD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, HUDSTATUS_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, HUDSTATUS_TD[playerid][1], 255);
	PlayerTextDrawBackgroundColor(playerid, HUDSTATUS_TD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, HUDSTATUS_TD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, HUDSTATUS_TD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, HUDSTATUS_TD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, HUDSTATUS_TD[playerid][1], 0);
	return 1;
}

hook OnPlayerSpawn(playerid)
{
	ShowPlayerStats(playerid, true);
    return 1;
}

ShowPlayerStats(playerid, bool:enable){

    if(enable == true){
        for (new i = 0; i < 2; i++){
            PlayerTextDrawShow(playerid, HUDSTATUS_TD[playerid][i]);
        }
        for (new i = 0; i < 4; i++){

            ShowPlayerProgressBar(playerid, URProgressBar[playerid][i]);
        }
    }
    else{
        for (new i = 0; i < 2; i++) 
        {
            PlayerTextDrawHide(playerid, HUDSTATUS_TD[playerid][i]);
        }
        for (new i = 0; i < 4; i++) 
        {
            HidePlayerProgressBar(playerid, URProgressBar[playerid][i]);
        }
    }
}

ptask UrStatus[200](playerid)
{
	if (!playerData[playerid][IsLoggedIn])
		return 0;

	new string[32];
	new Float:hp, Float:ap;
	GetPlayerHealth(playerid, hp);
	GetPlayerArmour(playerid, ap);

	SetPlayerProgressBarValue(playerid, URProgressBar[playerid][0], hp);
	SetPlayerProgressBarValue(playerid, URProgressBar[playerid][1], ap);
	SetPlayerProgressBarValue(playerid, URProgressBar[playerid][2], playerData[playerid][pHungry]); 
	SetPlayerProgressBarValue(playerid, URProgressBar[playerid][3], playerData[playerid][pThirsty]);

    format(string, sizeof(string), "HP:%.0f", hp);
    PlayerTextDrawSetString(playerid, HUDSTATUS_TD[playerid][1], string);
	return 1;
}
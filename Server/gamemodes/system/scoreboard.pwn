#include <YSI_Coding\y_hooks>

new PlayerText:nuteye_scoreboard[MAX_PLAYERS][8];
new PlayerOn;
new stats_scoreboard[MAX_PLAYERS];

hook OnPlayerConnect(playerid){
    nuteye_scoreboard[playerid][0] = CreatePlayerTextDraw(playerid, 170.000000, -5.000000, "nuteye_scoreboard:nuteye_scoreboard");
	PlayerTextDrawFont(playerid, nuteye_scoreboard[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, nuteye_scoreboard[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, nuteye_scoreboard[playerid][0], 285.500000, 327.000000);
	PlayerTextDrawSetOutline(playerid, nuteye_scoreboard[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, nuteye_scoreboard[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, nuteye_scoreboard[playerid][0], 1);
	PlayerTextDrawColor(playerid, nuteye_scoreboard[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, nuteye_scoreboard[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, nuteye_scoreboard[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, nuteye_scoreboard[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, nuteye_scoreboard[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, nuteye_scoreboard[playerid][0], 0);

	nuteye_scoreboard[playerid][1] = CreatePlayerTextDraw(playerid, 283.000000, 104.000000, "Nuteye_Dev");
	PlayerTextDrawFont(playerid, nuteye_scoreboard[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, nuteye_scoreboard[playerid][1], 0.116667, 0.800000);
	PlayerTextDrawTextSize(playerid, nuteye_scoreboard[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, nuteye_scoreboard[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, nuteye_scoreboard[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, nuteye_scoreboard[playerid][1], 1);
	PlayerTextDrawColor(playerid, nuteye_scoreboard[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, nuteye_scoreboard[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, nuteye_scoreboard[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, nuteye_scoreboard[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, nuteye_scoreboard[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, nuteye_scoreboard[playerid][1], 0);

	nuteye_scoreboard[playerid][2] = CreatePlayerTextDraw(playerid, 287.000000, 125.000000, "12345");
	PlayerTextDrawFont(playerid, nuteye_scoreboard[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, nuteye_scoreboard[playerid][2], 0.116667, 0.800000);
	PlayerTextDrawTextSize(playerid, nuteye_scoreboard[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, nuteye_scoreboard[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, nuteye_scoreboard[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, nuteye_scoreboard[playerid][2], 1);
	PlayerTextDrawColor(playerid, nuteye_scoreboard[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, nuteye_scoreboard[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, nuteye_scoreboard[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, nuteye_scoreboard[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, nuteye_scoreboard[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, nuteye_scoreboard[playerid][2], 0);

	nuteye_scoreboard[playerid][3] = CreatePlayerTextDraw(playerid, 362.000000, 96.000000, "50");
	PlayerTextDrawFont(playerid, nuteye_scoreboard[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, nuteye_scoreboard[playerid][3], 0.116667, 0.800000);
	PlayerTextDrawTextSize(playerid, nuteye_scoreboard[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, nuteye_scoreboard[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, nuteye_scoreboard[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, nuteye_scoreboard[playerid][3], 1);
	PlayerTextDrawColor(playerid, nuteye_scoreboard[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, nuteye_scoreboard[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, nuteye_scoreboard[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, nuteye_scoreboard[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, nuteye_scoreboard[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, nuteye_scoreboard[playerid][3], 0);

	nuteye_scoreboard[playerid][4] = CreatePlayerTextDraw(playerid, 362.000000, 112.000000, "50");
	PlayerTextDrawFont(playerid, nuteye_scoreboard[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, nuteye_scoreboard[playerid][4], 0.116667, 0.800000);
	PlayerTextDrawTextSize(playerid, nuteye_scoreboard[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, nuteye_scoreboard[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, nuteye_scoreboard[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, nuteye_scoreboard[playerid][4], 1);
	PlayerTextDrawColor(playerid, nuteye_scoreboard[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, nuteye_scoreboard[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, nuteye_scoreboard[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, nuteye_scoreboard[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, nuteye_scoreboard[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, nuteye_scoreboard[playerid][4], 0);

	nuteye_scoreboard[playerid][5] = CreatePlayerTextDraw(playerid, 362.000000, 129.000000, "50");
	PlayerTextDrawFont(playerid, nuteye_scoreboard[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, nuteye_scoreboard[playerid][5], 0.116667, 0.800000);
	PlayerTextDrawTextSize(playerid, nuteye_scoreboard[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, nuteye_scoreboard[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, nuteye_scoreboard[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, nuteye_scoreboard[playerid][5], 1);
	PlayerTextDrawColor(playerid, nuteye_scoreboard[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, nuteye_scoreboard[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, nuteye_scoreboard[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, nuteye_scoreboard[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, nuteye_scoreboard[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, nuteye_scoreboard[playerid][5], 0);

	nuteye_scoreboard[playerid][6] = CreatePlayerTextDraw(playerid, 413.000000, 131.000000, "150");
	PlayerTextDrawFont(playerid, nuteye_scoreboard[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, nuteye_scoreboard[playerid][6], 0.116667, 0.800000);
	PlayerTextDrawTextSize(playerid, nuteye_scoreboard[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, nuteye_scoreboard[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, nuteye_scoreboard[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, nuteye_scoreboard[playerid][6], 1);
	PlayerTextDrawColor(playerid, nuteye_scoreboard[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, nuteye_scoreboard[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, nuteye_scoreboard[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, nuteye_scoreboard[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, nuteye_scoreboard[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, nuteye_scoreboard[playerid][6], 0);

	nuteye_scoreboard[playerid][7] = CreatePlayerTextDraw(playerid, 217.000000, 144.000000, "ID:999");
	PlayerTextDrawFont(playerid, nuteye_scoreboard[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, nuteye_scoreboard[playerid][7], 0.116667, 0.800000);
	PlayerTextDrawTextSize(playerid, nuteye_scoreboard[playerid][7], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, nuteye_scoreboard[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, nuteye_scoreboard[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, nuteye_scoreboard[playerid][7], 1);
	PlayerTextDrawColor(playerid, nuteye_scoreboard[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, nuteye_scoreboard[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, nuteye_scoreboard[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, nuteye_scoreboard[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, nuteye_scoreboard[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, nuteye_scoreboard[playerid][7], 0);

    stats_scoreboard[playerid] = 0;
    PlayerOn++;
    return 1;
}


hook OnPlayerDisconnect(playerid){
	PlayerOn--;
	return 1;
}


Scoreboard(playerid, bool:enable){
	if(enable == true){
		for(new i = 0; i < 8; i ++){
			PlayerTextDrawShow(playerid, nuteye_scoreboard[playerid][i]);
		}
	}
	else{
		for(new i = 0; i < 8; i ++){
			PlayerTextDrawHide(playerid, nuteye_scoreboard[playerid][i]);
		}
	}
}

ptask buildscoreboard[1000](playerid){
    new str[1024];

    format(str, sizeof(str), "%s", GetPlayerNameEx(playerid));
	PlayerTextDrawSetString(playerid, nuteye_scoreboard[playerid][1], str);

    format(str, sizeof(str), "%d", playerData[playerid][pPhone]);
    PlayerTextDrawSetString(playerid, nuteye_scoreboard[playerid][2], str);

   	format(str, sizeof(str), "ID: %d", playerid);
    PlayerTextDrawSetString(playerid, nuteye_scoreboard[playerid][7], str);

    format(str, sizeof(str), "_%d", PlayerOn);
    PlayerTextDrawSetString(playerid, nuteye_scoreboard[playerid][6], str);

    format(str, sizeof(str), "_%d", CopOnline());
    PlayerTextDrawSetString(playerid, nuteye_scoreboard[playerid][4], str);

    format(str, sizeof(str), "_%d", MedicOnline());
    PlayerTextDrawSetString(playerid, nuteye_scoreboard[playerid][5], str);

    format(str, sizeof(str), "_%d", GovOnline());
    PlayerTextDrawSetString(playerid, nuteye_scoreboard[playerid][3], str);

    return 1;
} 

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
    if (newkeys & KEY_WALK){
        if (stats_scoreboard[playerid] == 0){
            stats_scoreboard[playerid] = 1;
            Scoreboard(playerid, true);
        }
        else{
            stats_scoreboard[playerid] = 0;
            Scoreboard(playerid, false);
        }
    }
    return 1;
}
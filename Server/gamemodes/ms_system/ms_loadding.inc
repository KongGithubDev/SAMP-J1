#include <YSI_Coding\y_hooks>

new PlayerText:ms_LoadingTD[MAX_PLAYERS][6];

hook OnPlayerConnect(playerid)
{	
    ms_LoadingTD[playerid][0] = CreatePlayerTextDraw(playerid, 291.000000, 349.000000, "ms_loadding:ms_loadding0");
	PlayerTextDrawFont(playerid, ms_LoadingTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, ms_LoadingTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_LoadingTD[playerid][0], 65.000000, 66.500000);
	PlayerTextDrawSetOutline(playerid, ms_LoadingTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, ms_LoadingTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, ms_LoadingTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, ms_LoadingTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_LoadingTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, ms_LoadingTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, ms_LoadingTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ms_LoadingTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, ms_LoadingTD[playerid][0], 0);

	ms_LoadingTD[playerid][1] = CreatePlayerTextDraw(playerid, 291.000000, 349.000000, "ms_loadding:ms_loadding1");
	PlayerTextDrawFont(playerid, ms_LoadingTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, ms_LoadingTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_LoadingTD[playerid][1], 65.000000, 66.500000);
	PlayerTextDrawSetOutline(playerid, ms_LoadingTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, ms_LoadingTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, ms_LoadingTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, ms_LoadingTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_LoadingTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, ms_LoadingTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, ms_LoadingTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, ms_LoadingTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ms_LoadingTD[playerid][1], 0);

	ms_LoadingTD[playerid][2] = CreatePlayerTextDraw(playerid, 291.000000, 349.000000, "ms_loadding:ms_loadding2");
	PlayerTextDrawFont(playerid, ms_LoadingTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, ms_LoadingTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_LoadingTD[playerid][2], 65.000000, 66.500000);
	PlayerTextDrawSetOutline(playerid, ms_LoadingTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, ms_LoadingTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, ms_LoadingTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, ms_LoadingTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_LoadingTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, ms_LoadingTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, ms_LoadingTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, ms_LoadingTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, ms_LoadingTD[playerid][2], 0);

	ms_LoadingTD[playerid][3] = CreatePlayerTextDraw(playerid, 291.000000, 349.000000, "ms_loadding:ms_loadding3");
	PlayerTextDrawFont(playerid, ms_LoadingTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, ms_LoadingTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_LoadingTD[playerid][3], 65.000000, 66.500000);
	PlayerTextDrawSetOutline(playerid, ms_LoadingTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, ms_LoadingTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, ms_LoadingTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, ms_LoadingTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_LoadingTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, ms_LoadingTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, ms_LoadingTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, ms_LoadingTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, ms_LoadingTD[playerid][3], 0);

	ms_LoadingTD[playerid][4] = CreatePlayerTextDraw(playerid, 291.000000, 349.000000, "ms_loadding:ms_loadding4");
	PlayerTextDrawFont(playerid, ms_LoadingTD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, ms_LoadingTD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_LoadingTD[playerid][4], 65.000000, 66.500000);
	PlayerTextDrawSetOutline(playerid, ms_LoadingTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, ms_LoadingTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, ms_LoadingTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, ms_LoadingTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_LoadingTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, ms_LoadingTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, ms_LoadingTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, ms_LoadingTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, ms_LoadingTD[playerid][4], 0);

	ms_LoadingTD[playerid][5] = CreatePlayerTextDraw(playerid, 291.000000, 349.000000, "ms_loadding:ms_loadding5");
	PlayerTextDrawFont(playerid, ms_LoadingTD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, ms_LoadingTD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_LoadingTD[playerid][5], 65.000000, 66.500000);
	PlayerTextDrawSetOutline(playerid, ms_LoadingTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, ms_LoadingTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, ms_LoadingTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, ms_LoadingTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_LoadingTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, ms_LoadingTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, ms_LoadingTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, ms_LoadingTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, ms_LoadingTD[playerid][5], 0);

	return 1;
}

StartProgress(playerid, duration, startvalue = 0, objectid)
{
	if(ProgressState[playerid] == 1) 
		return 0;
	
	stop ProgressTimer[playerid];
	ProgressTimer[playerid] = repeat ProgressUpdate(playerid, objectid);

	ProgressLimit[playerid] = duration;
	ProgressCount[playerid] = startvalue;
	ProgressState[playerid] = 1;
	ProgressObject[playerid] = objectid;

	for (new i = 0; i < 1; i ++)
	{
		PlayerTextDrawShow(playerid, ms_LoadingTD[playerid][i]);
	}

	return 1;
}

StopProgress(playerid)
{
	if(ProgressState[playerid] == 0)
		return 0;

	stop ProgressTimer[playerid];
	ProgressLimit[playerid] = 0;
	ProgressCount[playerid] = 0;
	ProgressState[playerid] = 0;
	ProgressObject[playerid] = INVALID_STREAMER_ID;

	ClearAnimations(playerid);

	for (new i = 0; i < 6; i ++)
	{
		PlayerTextDrawHide(playerid, ms_LoadingTD[playerid][i]);
	}

	return 1;
}

timer ProgressUpdate[100](playerid, objectid)
{
	if(ProgressCount[playerid] >= ProgressLimit[playerid])
	{
		StopProgress(playerid);
		CallLocalFunction("OnProgressFinish", "dd", playerid, objectid);
		return;
	}

	CallLocalFunction("OnProgressUpdate", "ddd", playerid, ProgressCount[playerid], objectid);

	ProgressCount[playerid]++;

	new Float:current_progress;
	if (ProgressLimit[playerid] == 0)
	{ } else { current_progress = (ProgressCount[playerid]*100/ProgressLimit[playerid]); }

	if (current_progress > 0 && current_progress < 19)
	{
		PlayerTextDrawShow(playerid, ms_LoadingTD[playerid][0]);
	}
	else if (current_progress > 19 && current_progress < 39)
	{
		PlayerTextDrawShow(playerid, ms_LoadingTD[playerid][1]);
	}
	else if (current_progress > 39 && current_progress < 59)
	{
		PlayerTextDrawShow(playerid, ms_LoadingTD[playerid][2]);
	}
	else if (current_progress > 59 && current_progress < 79)
	{
		PlayerTextDrawShow(playerid, ms_LoadingTD[playerid][3]);
	}
	else if (current_progress > 79 && current_progress < 85)
	{
		PlayerTextDrawShow(playerid, ms_LoadingTD[playerid][4]);
	}
	else if (current_progress > 85 && current_progress < 100)
	{
		PlayerTextDrawShow(playerid, ms_LoadingTD[playerid][5]);
	}
	return;
}

#include <YSI_Coding\y_hooks>

bool:IsAHelicopter(vehicleid);
Float:GetVehicleSpeed(vehicleid);

new PlayerText:ms_speedoTD[MAX_PLAYERS][3];
new PlayerBar:ms_speedoBar[MAX_PLAYERS][2];

hook OnPlayerConnect(playerid){
   
   	ms_speedoBar[playerid][0] = CreatePlayerProgressBar(playerid, 245.0, 413.0, 9.5, 40.0, 0xFFFF00FF, 100.0, 2);
	SetPlayerProgressBarValue(playerid, ms_speedoBar[playerid][0], 50.000000);
    SetPlayerProgressBarBackColour(playerid, ms_speedoBar[playerid][0], 0x424242FF);
	SetPlayerProgressBarBgColour(playerid, ms_speedoBar[playerid][0], 0x424242FF, true);

	ms_speedoBar[playerid][1] = CreatePlayerProgressBar(playerid, 409.0, 412.0, 9.5, 38.5, 0xFFFF00FF, 100.0, 2);
	SetPlayerProgressBarValue(playerid, ms_speedoBar[playerid][1], 50.000000);
    SetPlayerProgressBarBackColour(playerid, ms_speedoBar[playerid][1], 0x424242FF);
	SetPlayerProgressBarBgColour(playerid, ms_speedoBar[playerid][1], 0x424242FF, true);

    ms_speedoTD[playerid][0] = CreatePlayerTextDraw(playerid, 246.000000, 343.000000, "ms_hudserver:ms_speedo");
	PlayerTextDrawFont(playerid, ms_speedoTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, ms_speedoTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_speedoTD[playerid][0], 150.000000, 100.000000);
	PlayerTextDrawSetOutline(playerid, ms_speedoTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, ms_speedoTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, ms_speedoTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, ms_speedoTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_speedoTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, ms_speedoTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, ms_speedoTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ms_speedoTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, ms_speedoTD[playerid][0], 0);

	ms_speedoTD[playerid][1] = CreatePlayerTextDraw(playerid, 280.000000, 383.000000, "234");
	PlayerTextDrawFont(playerid, ms_speedoTD[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, ms_speedoTD[playerid][1], 0.350000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_speedoTD[playerid][1], 400.000000, 86.000000);
	PlayerTextDrawSetOutline(playerid, ms_speedoTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, ms_speedoTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, ms_speedoTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, ms_speedoTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_speedoTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, ms_speedoTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, ms_speedoTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, ms_speedoTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ms_speedoTD[playerid][1], 0);

	ms_speedoTD[playerid][2] = CreatePlayerTextDraw(playerid, 372.000000, 383.000000, "6");
	PlayerTextDrawFont(playerid, ms_speedoTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, ms_speedoTD[playerid][2], 0.350000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_speedoTD[playerid][2], 400.000000, 86.000000);
	PlayerTextDrawSetOutline(playerid, ms_speedoTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, ms_speedoTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, ms_speedoTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, ms_speedoTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_speedoTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, ms_speedoTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, ms_speedoTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, ms_speedoTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, ms_speedoTD[playerid][2], 0);

	return 1;
}

ShowPlayerSpeedo(playerid, bool:enable)
{
	if(enable == true)
	{
        ShowPlayerProgressBar(playerid, ms_speedoBar[playerid][0]);
		ShowPlayerProgressBar(playerid, ms_speedoBar[playerid][1]);

        PlayerTextDrawShow(playerid, ms_speedoTD[playerid][0]);
		PlayerTextDrawShow(playerid, ms_speedoTD[playerid][1]);
		PlayerTextDrawShow(playerid, ms_speedoTD[playerid][2]);
	}
	else
	{
        HidePlayerProgressBar(playerid, ms_speedoBar[playerid][0]);
		HidePlayerProgressBar(playerid, ms_speedoBar[playerid][1]);

        PlayerTextDrawHide(playerid, ms_speedoTD[playerid][0]);
		PlayerTextDrawHide(playerid, ms_speedoTD[playerid][1]);
		PlayerTextDrawHide(playerid, ms_speedoTD[playerid][2]);
	}
}

forward SpeedoTimer(playerid, vehicleid);
public SpeedoTimer(playerid, vehicleid)
{
	if(vehicleid != GetPlayerVehicleID(playerid))
	{
		KillTimer(playerData[playerid][pSpeedoTimer]);
		return 0;
	}
	new Float:returnspeed = GetVehicleSpeed(vehicleid);
	new speed = floatround(returnspeed);
	new str[64];

	new Float:vehiclehealth;
	GetVehicleHealth(vehicleid, vehiclehealth);

	new modelid = GetVehicleModel(vehicleid);
	new Float:speedtest = GetVehicleSpeed(vehicleid);
	new Float:maxspeed = vehicleData[modelid - 400][vSpeed];
	new Float:value = floatmul(floatdiv(speedtest, maxspeed), 0.01);

	SetPlayerProgressBarMaxValue(playerid, ms_speedoBar[playerid][1], 100);
    SetPlayerProgressBarValue(playerid, ms_speedoBar[playerid][1], vehicleFuel[vehicleid]);

	SetPlayerProgressBarMaxValue(playerid, ms_speedoBar[playerid][0], 1000.0);
    SetPlayerProgressBarValue(playerid, ms_speedoBar[playerid][0], vehiclehealth);

	format(str,sizeof(str),"%d", speed);
	PlayerTextDrawSetString(playerid, ms_speedoTD[playerid][1], str);

	if(speed <= 0) {PlayerTextDrawSetString(playerid, ms_speedoTD[playerid][2], "N");}
	if(speed >= 5) {PlayerTextDrawSetString(playerid, ms_speedoTD[playerid][2], "1");}
	if(speed >= 40) {PlayerTextDrawSetString(playerid, ms_speedoTD[playerid][2], "2");}
	if(speed >= 70) {PlayerTextDrawSetString(playerid, ms_speedoTD[playerid][2], "3");}
	if(speed >= 100) {PlayerTextDrawSetString(playerid, ms_speedoTD[playerid][2], "4");}
	if(speed >= 120) {PlayerTextDrawSetString(playerid, ms_speedoTD[playerid][2], "5");}
	if(speed >= 250) {PlayerTextDrawSetString(playerid, ms_speedoTD[playerid][2], "6");}

	if (!IsAHelicopter(vehicleid))
	{
		if (IsEngineVehicle(vehicleid) && GetEngineStatus(vehicleid))
		{
			if(vehicleFuel[vehicleid] > 0)
			{
				vehicleFuel[vehicleid] -= value;
			}
			else
			{
			    SetEngineStatus(vehicleid, false);
			    vehicleFuel[vehicleid] = 0;
			}
		}
	}
	return 1;
}


bool:IsAHelicopter(vehicleid)
{
    switch (GetVehicleModel(vehicleid))
    {
        case 417, 425, 447, 465, 469, 487, 488, 497, 501, 548, 563: 
            return true;
    }
    return false;
}
#include <YSI_Coding\y_hooks>

new PlayerText:AFKHUD[MAX_PLAYERS][2];
new AFKTimer[MAX_PLAYERS];
new Timer:playerAFK_Timer[MAX_PLAYERS], playerATKTime[MAX_PLAYERS];
new bool:IsAFK[MAX_PLAYERS]; 



hook OnPlayerConnect(playerid)
{
    playerATKTime[playerid] = 0;
    playerAFK_Timer[playerid] = repeat PlayerTimerAFK(playerid);

    AFKHUD[playerid][0] = CreatePlayerTextDraw(playerid, 101.000000, 129.000000, "AFKHUD:AFKHUD");
    PlayerTextDrawFont(playerid, AFKHUD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, AFKHUD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, AFKHUD[playerid][0], 145.500000, 183.000000);
    PlayerTextDrawSetOutline(playerid, AFKHUD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, AFKHUD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, AFKHUD[playerid][0], 1);
    PlayerTextDrawColor(playerid, AFKHUD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, AFKHUD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, AFKHUD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, AFKHUD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, AFKHUD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, AFKHUD[playerid][0], 0);

    AFKHUD[playerid][1] = CreatePlayerTextDraw(playerid, 157.000000, 280.000000, "05:00");
    PlayerTextDrawFont(playerid, AFKHUD[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, AFKHUD[playerid][1], 0.233333, 1.400000);
    PlayerTextDrawTextSize(playerid, AFKHUD[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, AFKHUD[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, AFKHUD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, AFKHUD[playerid][1], 1);
    PlayerTextDrawColor(playerid, AFKHUD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, AFKHUD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, AFKHUD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, AFKHUD[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, AFKHUD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, AFKHUD[playerid][1], 0);

    
    return 1;
}


PlayerUISAFKHUD(playerid, bool:enable)
{
    if(enable == true)
    {
        PlayerTextDrawShow(playerid, AFKHUD[playerid][0]);
        PlayerTextDrawShow(playerid, AFKHUD[playerid][1]);
    }
    else
    {
        PlayerTextDrawHide(playerid, AFKHUD[playerid][0]);
        PlayerTextDrawHide(playerid, AFKHUD[playerid][1]);
    }
    return 1;
}


hook OnPlayerDisconnect(playerid, reason)
{
    playerATKTime[playerid] = 0;
    stop playerAFK_Timer[playerid]; 
    IsAFK[playerid] = false; 
    AFKTimer[playerid] = 0; 

    PlayerUISAFKHUD(playerid, false); 
    
    return 1;
}


hook OnPlayerPause(playerid)
{
    if(!IsAFK[playerid])
    {
        IsAFK[playerid] = true; 
        AFKTimer[playerid] = 1;
        PlayerUISAFKHUD(playerid, true);  
    }
    return 1;
}

hook OnPlayerResume(playerid, pausedtime)
{
    if(IsAFK[playerid])
    {
        IsAFK[playerid] = false;  
        AFKTimer[playerid] = 0;   
        PlayerUISAFKHUD(playerid, false);  
    }
    return 1;
}


timer PlayerTimerAFK[1000](playerid)
{
    new str[128];

    if (!playerData[playerid][IsLoggedIn])
        return 0;


    if (!IsPlayerInRangeOfPoint(playerid, 60.0, 456.8277,-2016.9861,7.8249)) //ย้ายพิกัดด้วยถ้าไม่ย้ายอยู่ที่เดียวกับภาพ
    {
        PlayerUISAFKHUD(playerid, false);

        IsAFK[playerid] = false;
        AFKTimer[playerid] = 0;
        
        return 0; 
    }

    PlayerUISAFKHUD(playerid, true); 

    if (playerATKTime[playerid] < 600) 
    {
        playerATKTime[playerid]++;
    }

    new minutes = (600 - playerATKTime[playerid]) / 60;
    new seconds = (600 - playerATKTime[playerid]) % 60;
    
    format(str, sizeof(str), "%02d:%02d", minutes, seconds);
    PlayerTextDrawSetString(playerid, AFKHUD[playerid][1], str);

    if (playerATKTime[playerid] >= 600) 
    {
        Inventory_Add(playerid, "เหรียญAFK", 1);
        playerATKTime[playerid] = 0; 
        SendClientMessage(playerid, COLOR_LIGHTRED, "AFK : {ffffff}คุณได้รับเหรียญAFK +1(จากการAFK5นาที)");
    }
    return 1;
}


#include <YSI_Coding\y_hooks>

#define HIT_TYPE_PLAYER 1
#define HIT_TYPE_VEHICLE 2
#define HIT_TYPE_OBJECT 3
#define HIT_TYPE_PED 4


// Forward
forward UnStunPlayer(playerid);

new TazerCooldown[MAX_PLAYERS];


new PlayerBar:PlayerProgressJob[MAX_PLAYERS][5]; 
new PlayerText:PlayerJobCountTD[MAX_PLAYERS][5];
new Text:PlayerJobCountTD1[5];

hook OnPlayerConnect(playerid)
{
    TazerCooldown[playerid] = 0; // เทเซอร์ 3 วิ
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    // ปืนช็อตไฟฟ้า
    if(weaponid == 23 && playerData[playerid][pTazer])
    {
        if(!TazerCooldown[playerid])
        {
            TazerCooldown[playerid] = 4;
            RemovePlayerWeapon(playerid, 23);

            ShowPlayerProgressBar(playerid, PlayerProgressJob[playerid][0]);
            PlayerTextDrawShow(playerid, PlayerJobCountTD[playerid][0]);
            TextDrawShowForPlayer(playerid, PlayerJobCountTD1[2]);
            TextDrawShowForPlayer(playerid, PlayerJobCountTD1[3]);

            SetPlayerProgressBarValue(playerid, PlayerProgressJob[playerid][0], 0.0);

            // **ล็อกผู้เล่นเป้าหมายถ้าเป็น player**
            if(hittype == HIT_TYPE_PLAYER)
            {
                TogglePlayerControllable(hitid, false); // สตั้น
                SetTimerEx("UnStunPlayer", 5000, false, "i", hitid); // ปลดสตั้น 5 วิ
            }

            defer Tazer[1000](playerid);
            defer TazerNotUsed[200](playerid);
        }
    }
    return 1;
}

timer Tazer[1000](playerid)
{
    if(TazerCooldown[playerid] > 0)
    {
        TazerCooldown[playerid]--;

        if(TazerCooldown[playerid] != 0)
        {
            new strinz[32];
            format(strinz, sizeof(strinz), "%d", TazerCooldown[playerid]);
            PlayerTextDrawSetString(playerid, PlayerJobCountTD[playerid][0], strinz);

            switch(TazerCooldown[playerid])
            {
                case 3: SetPlayerProgressBarValue(playerid, PlayerProgressJob[playerid][0], 35.0);
                case 2: SetPlayerProgressBarValue(playerid, PlayerProgressJob[playerid][0], 75.0);
                case 1: SetPlayerProgressBarValue(playerid, PlayerProgressJob[playerid][0], 100.0);
            }

            SendClientMessageEx(playerid, -1, "{04F584}[!] {ffffff}Taser จะพร้อมใช้ในอีก %d วินาที", TazerCooldown[playerid]);
            defer Tazer[1000](playerid);
        }
        else
        {
            playerData[playerid][pTazer] = 1;
            TazerCooldown[playerid] = 0;

            GivePlayerWeaponEx(playerid, 23, 1);
            SetPlayerArmedWeapon(playerid, 23);
            ApplyAnimation(playerid, "COLT45", "colt45_reload", 4.0, 0, 0, 0, 0, 0);

            HidePlayerProgressBar(playerid, PlayerProgressJob[playerid][0]);
            PlayerTextDrawHide(playerid, PlayerJobCountTD[playerid][0]);
            TextDrawHideForPlayer(playerid, PlayerJobCountTD1[2]);
            TextDrawHideForPlayer(playerid, PlayerJobCountTD1[3]);
        }
    }
    return 1;
}

timer TazerNotUsed[200](playerid)
{
    if(TazerCooldown[playerid] > 0)
    {
        if(GetPlayerWeapon(playerid) == 23)
        {
            SetPlayerArmedWeapon(playerid, 0);
        }
    }
    return 1;
}

// ปลดสตั้นผู้เล่น
public UnStunPlayer(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        TogglePlayerControllable(playerid, true);
        SendClientMessage(playerid, 0xFFFFFF, "คุณกลับมาเคลื่อนที่ได้แล้ว!");
    }
}

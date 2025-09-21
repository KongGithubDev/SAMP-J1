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
    TazerCooldown[playerid] = 0; // ����� 3 ��
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    // �׹��͵俿��
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

            // **��͡������������¶���� player**
            if(hittype == HIT_TYPE_PLAYER)
            {
                TogglePlayerControllable(hitid, false); // ʵ��
                SetTimerEx("UnStunPlayer", 5000, false, "i", hitid); // �Ŵʵ�� 5 ��
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

            SendClientMessageEx(playerid, -1, "{04F584}[!] {ffffff}Taser �о��������ա %d �Թҷ�", TazerCooldown[playerid]);
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

// �Ŵʵ�鹼�����
public UnStunPlayer(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        TogglePlayerControllable(playerid, true);
        SendClientMessage(playerid, 0xFFFFFF, "�س��Ѻ������͹���������!");
    }
}

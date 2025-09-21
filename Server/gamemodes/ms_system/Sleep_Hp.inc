#include <YSI_Coding\y_hooks>

new OnHp[MAX_PLAYERS];

hook OnGameModeInit()
{
    CreateDynamicObject(2603, 1169.4688,-1329.9097,18.7999,170.1416,0,0,0,0,0,0);
    CreateDynamic3DTextLabel("กด N เพื่อนอนเตียง\nเสีย $500", -1, 1169.4688,-1329.9097,18.7999,10.0); 
    return true;
}

hook OnPlayerConnect(playerid)
{
    OnHp[playerid] = 0;
    return true;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (!(newkeys & KEY_NO) || IsPlayerInAnyVehicle(playerid)) return true;

    new Float:bedPos[4][3] = {
        {1169.4688,-1329.9097,18.7999},
        {1169.4706,-1327.5563,18.7998},
        {1156.3212,-1327.9352,18.8801},
        {1159.0060,-1328.0463,18.8801}
    };

    for (new i = 0; i < 4; i++)
    {
        if (IsPlayerInRangeOfPoint(playerid, 1.0, bedPos[i][0], bedPos[i][1], bedPos[i][2]))
        {
            if (OnHp[playerid] == 1)
            {
                SendClientMessage(playerid, -1, "คุณกำลังนอนเตียง");
                return true;
            }

            SendClientMessage(playerid, -1, "คุณกำลังนอนเตียง");
            ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 0, 0, 1, 0, 1);
            StartProgress(playerid, 100, 0, INVALID_OBJECT_ID);
            OnHp[playerid] = 1;
            break;
        }
    }

    return true;
}

OnComHp(playerid)
{
    OnHp[playerid] = 0;
    StopProgress(playerid);
    ClearAnimations(playerid);
    GivePlayerMoneyEx(playerid, -500);
    SetPlayerHealth(playerid, 100.0);
    SendClientMessage(playerid, -1, "คุณนอนบนเตียงรพ.แต่ไอ้นั่นได้นอนในใจเขา");
}

hook OnProgressFinish(playerid, objectid)
{
    if (OnHp[playerid] == 1)
        OnComHp(playerid);
    return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
    if(OnHp[playerid] == 1)
    {
        ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 0, 0, 1, 0, 1);
        return Y_HOOKS_BREAK_RETURN_1;
    }
    return Y_HOOKS_CONTINUE_RETURN_0;
}
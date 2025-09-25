#include <YSI_Coding\y_hooks>

#define WIREOBJECT        1216
#define WIRETEXT          "{D65C0C}[{F98233}����{D65C0C}]\n{FFFFFF}�� {F98233}N {FFFFFF}���͢�������"
#define WIRENAME          "����"
#define WIRE_COOLDOWN     (15 * 60) // 15 �ҷ� (�Թҷ�)
#define CHM_DURATION      360000     // 6 �ҷ� = 360,000 ms

new WIRETake[MAX_PLAYERS];

// CHM ���Ǩ
new bool:WIRE_CHMActive[MAX_PLAYERS];     // �� CHM ����Ѻ��������
new WIRE_CHMTimer[MAX_PLAYERS];           // Timer ID ����Ѻ�Ѿവ���˹�

enum WIRE_DATA
{
    WIREID,
    WIREObject,
    Float: WIREPosX,
    Float: WIREPosY,
    Float: WIREPosZ,
    Text3D: WIRE3D,
    WIRE3DMSG[80],
    WIREOn
};

new const WIREData[][WIRE_DATA] =
{
    { INVALID_STREAMER_ID, WIREOBJECT, 726.0041,-1294.1260,13.5708, Text3D: INVALID_3DTEXT_ID, WIRETEXT, 0},
    { INVALID_STREAMER_ID, WIREOBJECT, 1249.6123,-1225.4196,13.6797, Text3D: INVALID_3DTEXT_ID, WIRETEXT, 0},
    { INVALID_STREAMER_ID, WIREOBJECT, 1436.4645,-1648.5292,13.5469, Text3D: INVALID_3DTEXT_ID, WIRETEXT, 0}
};

new WIRECooldown[sizeof(WIREData)];

forward DisableWIRECHM(playerid);
forward UpdateWIRECHM(playerid);

hook OnPlayerConnect(playerid)
{
    WIRETake[playerid] = 0;
    WIRE_CHMActive[playerid] = false;
    WIRE_CHMTimer[playerid] = -1;
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    WIRETake[playerid] = 0;
    if (WIRE_CHMActive[playerid])
    {
        KillTimer(WIRE_CHMTimer[playerid]);
        WIRE_CHMActive[playerid] = false;
    }
    return 1;
}

hook OnGameModeInit()
{
    for(new i = 0; i < sizeof(WIREData); i++)
    {
        WIREData[i][WIREID] = CreateDynamicObject(WIREData[i][WIREObject], WIREData[i][WIREPosX], WIREData[i][WIREPosY], WIREData[i][WIREPosZ], 0.0, 0.0, 0.0);
        WIREData[i][WIRE3D] = CreateDynamic3DTextLabel(WIREData[i][WIRE3DMSG], COLOR_GREEN, WIREData[i][WIREPosX], WIREData[i][WIREPosY], WIREData[i][WIREPosZ] + 1.5, 5.0);
        WIRECooldown[i] = 0;
    }
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
    {
        for(new i = 0; i < sizeof WIREData; i++)
        {
            if(IsPlayerInRangeOfPoint(playerid, 2.0, WIREData[i][WIREPosX], WIREData[i][WIREPosY], WIREData[i][WIREPosZ]))
            {
                if(gettime() < WIRECooldown[i])
                {
                    new remaining = WIRECooldown[i] - gettime();
                    new min = remaining / 60, sec = remaining % 60;
                    new msg[128];
                    format(msg, sizeof(msg), "[�к�] ��ͧ�� %d �ҷ� %02d �Թҷ� ��͹�Ш����信ͧ����ա����!", min, sec);
                    SendClientMessage(playerid, COLOR_LIGHTRED, msg);
                    return 1;
                }

                if(IsValidDynamicObject(WIREData[i][WIREID]) && WIREData[i][WIREOn] == 0)
                {    
                    if (CopOnline() < 2)
                        return SendClientMessage(playerid, COLOR_LIGHTRED, "��ͧ�����˹�ҷ����Ǩ�͹�Ź����ҧ���� 2 ���");

                    if (GetFactionType(playerid) == FACTION_POLICE || GetFactionType(playerid) == FACTION_GOV)
                        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�������ö�ӧҹ�Դ��������!");

                    new ammo = Inventory_Count(playerid, WIRENAME)+1;

                    if(ammo > 60)
                        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�����آͧ {00FF00}"#WIRENAME" {FFFFFF}�������");

                    WIREData[i][WIREOn] = 1;
                    ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
                    StartProgress(playerid, 200, 0, i);
                    WIRETake[playerid] = 1;
                    break;
                }
            }
        }
    }
    return 1;
}

PlayerWIREUnfreeze(playerid, number)
{
    ClearAnimations(playerid);
    WIRETake[playerid] = 0;
    WIREData[number][WIREOn] = 0;

    new id = Inventory_Add(playerid, WIRENAME, 1);
    if (id == -1)
        return SendClientMessageEx(playerid, COLOR_RED, "[�к�] {FFFFFF}�����آͧ�����������§�� (%d/%d) ���͹��˹ѡ�����������§��", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

    SendClientMessage(playerid, COLOR_WHITE, "�س���Ѻ {FF0000}"#WIRENAME" +1");
    GivePlayerWanted(playerid, 1);
    SendClientMessage(playerid, COLOR_LIGHTRED, "[��դ���] {FFFFFF}�س�Դ������Фس�� "#WIRENAME"");

    WIRECooldown[number] = gettime() + WIRE_COOLDOWN;

    // ?? CHM �Դ��Ǽ������
    WIRE_CHMActive[playerid] = true;
    WIRE_CHMTimer[playerid] = SetTimerEx("UpdateWIRECHM", 2000, true, "i", playerid); // �Ѿവ���˹觷ء 2 ��
    SetTimerEx("DisableWIRECHM", CHM_DURATION, false, "i", playerid);

    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i) && (GetFactionType(i) == FACTION_POLICE || GetFactionType(i) == FACTION_GOV))
        {
            SendClientMessage(i, COLOR_GREY, "�к����Ҽ������: �ա�è�����! CHM �еԴ���������� 6 �ҷ�");
        }
    }
    return 1;
}

public UpdateWIRECHM(playerid)
{
    if(!IsPlayerConnected(playerid) || !WIRE_CHMActive[playerid]) return 0;

    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i) && (GetFactionType(i) == FACTION_POLICE || GetFactionType(i) == FACTION_GOV))
        {
            SetPlayerCheckpoint(i, x, y, z, 5.0);
        }
    }
    return 1;
}

public DisableWIRECHM(playerid)
{
    if(WIRE_CHMActive[playerid])
    {
        KillTimer(WIRE_CHMTimer[playerid]);
        WIRE_CHMActive[playerid] = false;

        for(new i = 0; i < MAX_PLAYERS; i++)
        {
            if(IsPlayerConnected(i) && (GetFactionType(i) == FACTION_POLICE || GetFactionType(i) == FACTION_GOV))
            {
                DisablePlayerCheckpoint(i);
                SendClientMessage(i, COLOR_GREY, "CHM �ͧ������������������");
            }
        }
    }
    return 1;
}

hook OnProgressFinish(playerid, objectid)
{
    if(WIRETake[playerid] == 1)
        PlayerWIREUnfreeze(playerid, objectid);

    return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
    if(WIRETake[playerid] == 1)
    {
        ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
        return Y_HOOKS_BREAK_RETURN_1;
    }
    return Y_HOOKS_CONTINUE_RETURN_0;
}

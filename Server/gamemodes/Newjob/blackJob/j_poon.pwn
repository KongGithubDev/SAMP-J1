#include <YSI_Coding\y_hooks>

#define POONOBJECT        1685
#define POONTEXT          "{D65C0C}[{F98233}ปูน{D65C0C}]\n{FFFFFF}กด {F98233}N {FFFFFF}เพื่อขโมยปูน"
#define POONNAME          "ปูน"
#define POON_COOLDOWN     (15 * 60) // 15 นาที (วินาที)
#define CHM_DURATION_MS   360000     // 6 นาที = 360,000 ms

new POONTake[MAX_PLAYERS];

// CHM ติดตามผู้ร้าย
new bool:POON_CHMActive[MAX_PLAYERS];
new POON_CHMTimer[MAX_PLAYERS];

enum POON_DATA
{
    POONID,
    POONObject,
    Float: POONPosX,
    Float: POONPosY,
    Float: POONPosZ,
    Text3D: POON3D,
    POON3DMSG[80],
    POONOn
};

new const POONData[][POON_DATA] =
{
    { INVALID_STREAMER_ID, POONOBJECT, 1646.5173,-1700.9814,20.4844, Text3D: INVALID_3DTEXT_ID, POONTEXT, 0},
    { INVALID_STREAMER_ID, POONOBJECT, 1656.3961,-1693.3898,20.4472, Text3D: INVALID_3DTEXT_ID, POONTEXT, 0},
    { INVALID_STREAMER_ID, POONOBJECT, -157.3137,-302.1672,1.4297, Text3D: INVALID_3DTEXT_ID, POONTEXT, 0}
};

// คูลดาวน์เป็นของ "กองปูน" (shared ทุกคน)
new POONCooldown[sizeof(POONData)];

forward DisablePOONCHM(playerid);
forward UpdatePOONCHM(playerid);

hook OnPlayerConnect(playerid)
{
    POONTake[playerid] = 0;
    POON_CHMActive[playerid] = false;
    POON_CHMTimer[playerid] = -1;
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    // ถ้าผู้เล่นเป็นผู้ถูกรวบนำมาซึ่ง CHM ที่กำลังติดตาม ให้ยกเลิก CHM
    if (POON_CHMActive[playerid])
    {
        if (POON_CHMTimer[playerid] != -1) KillTimer(POON_CHMTimer[playerid]);
        POON_CHMActive[playerid] = false;

        for(new i = 0; i < MAX_PLAYERS; i++)
        {
            if(IsPlayerConnected(i) && (GetFactionType(i) == FACTION_POLICE || GetFactionType(i) == FACTION_GOV))
            {
                DisablePlayerCheckpoint(i);
                SendClientMessage(i, COLOR_GREY, "CHM ของผู้ร้ายถูกยกเลิก (ผู้ร้ายออกจากเกม)");
            }
        }
    }

    POONTake[playerid] = 0;
    return 1;
}

hook OnGameModeInit()
{
    for(new i = 0; i < sizeof(POONData); i++)
    {
        POONData[i][POONID] = CreateDynamicObject(POONData[i][POONObject], POONData[i][POONPosX], POONData[i][POONPosY], POONData[i][POONPosZ], 0.0, 0.0, 0.0);
        POONData[i][POON3D] = CreateDynamic3DTextLabel(POONData[i][POON3DMSG], COLOR_GREEN, POONData[i][POONPosX], POONData[i][POONPosY], POONData[i][POONPosZ] + 1.5, 5.0);
        POONCooldown[i] = 0; // init
    }
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
    {
        for(new i = 0; i < sizeof POONData; i++)
        {
            if(IsPlayerInRangeOfPoint(playerid, 2.0, POONData[i][POONPosX], POONData[i][POONPosY], POONData[i][POONPosZ]))
            {
                // ใช้คูลดาวน์ของกอง
                if(gettime() < POONCooldown[i])
                {
                    new remaining = POONCooldown[i] - gettime();
                    new min = remaining / 60, sec = remaining % 60;
                    new msg[128];
                    format(msg, sizeof(msg), "[ระบบ] ต้องรอ %d นาที %02d วินาที ก่อนจะจกปูนกองนี้อีกครั้ง!", min, sec);
                    SendClientMessage(playerid, COLOR_LIGHTRED, msg);
                    return 1;
                }

                if(IsValidDynamicObject(POONData[i][POONID]) && POONData[i][POONOn] == 0)
                {
                    if (CopOnline() < 2)
                        return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีเจ้าหน้าที่ตำรวจออนไลน์มากกว่า 2 นาย");

                    if (GetFactionType(playerid) == FACTION_POLICE || GetFactionType(playerid) == FACTION_GOV)
                        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่สามารถทำงานผิดกฎหมายได้!");

                    new ammo = Inventory_Count(playerid, POONNAME) + 1;
                    if(ammo > 60)
                        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของ {00FF00}"#POONNAME" {FFFFFF}ในกระเป๋าคุณเต็มแล้ว");

                    POONData[i][POONOn] = 1;
                    ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
                    StartProgress(playerid, 200, 0, i);
                    POONTake[playerid] = 1;
                    break;
                }
            }
        }
    }
    return 1;
}

PlayerPOONUnfreeze(playerid, number)
{
    new wanted = randomEx(1, 2);
    if(wanted == 2)
    {
        SendFactionMessageEx(FACTION_POLICE, COLOR_RADIO, "แจ้งเหตุ {ffffff}: มีการจกปูน");
        SendFactionMessageEx(FACTION_POLICE, COLOR_RADIO, "หมายเหตุ {ffffff}: ให้ตำรวจทุกนายไปตามจับคนร้ายโดยด่วน !!");
    }

    ClearAnimations(playerid);
    POONTake[playerid] = 0;
    POONData[number][POONOn] = 0;

    new id = Inventory_Add(playerid, POONNAME, 1);
    if (id == -1)
        return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d) หรือน้ำหนักกระเป๋าไม่เพียงพอ", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

    SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {FF0000}"#POONNAME" +1");

    // เพิ่ม wanted 1 ดวง (ระบบลบดาวของคุณกำหนดเวลาไว้แยกต่างหาก)
    GivePlayerWanted(playerid, 1);
    SendClientMessage(playerid, COLOR_LIGHTRED, "[คดีความ] {FFFFFF}คุณติดดาวเพราะคุณมี "#POONNAME"");

    // ตั้งคูลดาวน์ของกองนี้ (shared)
    POONCooldown[number] = gettime() + POON_COOLDOWN;

    // --- CHM ติดตัวผู้ร้าย: เริ่ม Timer อัปเดตทุก 2 วินาที และตั้งลบหลัง 6 นาที ---
    POON_CHMActive[playerid] = true;
    // ถ้ามี Timer เก่าก็เคลียร์ก่อน
    if (POON_CHMTimer[playerid] != -1) { KillTimer(POON_CHMTimer[playerid]); POON_CHMTimer[playerid] = -1; }
    POON_CHMTimer[playerid] = SetTimerEx("UpdatePOONCHM", 2000, true, "i", playerid); // update ทุก 2 วินาที
    SetTimerEx("DisablePOONCHM", CHM_DURATION_MS, false, "i", playerid);

    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i) && (GetFactionType(i) == FACTION_POLICE || GetFactionType(i) == FACTION_GOV))
        {
            SendClientMessage(i, COLOR_GREY, "ระบบค้นหาผู้ร้าย: มีการจกปูน! CHM จะติดตามผู้ร้าย 6 นาที");
        }
    }

    return 1;
}

public UpdatePOONCHM(playerid)
{
    if(!IsPlayerConnected(playerid) || !POON_CHMActive[playerid]) return 0;

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

public DisablePOONCHM(playerid)
{
    if(POON_CHMActive[playerid])
    {
        if (POON_CHMTimer[playerid] != -1)
        {
            KillTimer(POON_CHMTimer[playerid]);
            POON_CHMTimer[playerid] = -1;
        }
        POON_CHMActive[playerid] = false;

        for(new i = 0; i < MAX_PLAYERS; i++)
        {
            if(IsPlayerConnected(i) && (GetFactionType(i) == FACTION_POLICE || GetFactionType(i) == FACTION_GOV))
            {
                DisablePlayerCheckpoint(i);
                SendClientMessage(i, COLOR_GREY, "CHM ของผู้ร้ายหมดเวลาแล้ว");
            }
        }
    }
    return 1;
}

hook OnProgressFinish(playerid, objectid)
{
    if(POONTake[playerid] == 1)
        PlayerPOONUnfreeze(playerid, objectid);

    return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
    if(POONTake[playerid] == 1)
    {
        ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
        return Y_HOOKS_BREAK_RETURN_1;
    }
    return Y_HOOKS_CONTINUE_RETURN_0;
}

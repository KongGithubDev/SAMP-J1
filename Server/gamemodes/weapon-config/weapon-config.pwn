#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>
hook OnGameModeInit()
{
    SetCbugAllowed(true);
    SetVehiclePassengerDamage(true);
    SetDisableSyncBugs(true);
    SetDamageFeed(true);
    SetDamageSounds(true, true);
    SetCustomArmourRules(true, true);
    print("FREE BY IJONE SHOP");
}

// ���ѧ��ⴹ ���ⴹ�� �
public OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart)
{
    // ����������ѧ���蹹��

    // �к� Damages by Aktah (Cross Sign)
    //new Float:health, Float:armour;
    new Float:armour, Float:health;
    GetPlayerHealth(playerid, health);
    GetPlayerArmour(playerid, armour);

    if (issuerid != INVALID_PLAYER_ID) // If not self-inflicted
    {
        // ��ͧ������ظ����������Ѵ
        if (GetPlayerWeapon(playerid) > 0)
        {
            // �������ҹ���ظ
            new itemid = playerData[playerid][pItemSelect];
            if (CheckInventoryIsWeapon(playerid, itemid) == 1)
            {
                DamageCount[playerid] ++;

                if (DamageCount[playerid] >= 10)
                {
                    invData[playerid][itemid][invWeapon] -= 1;
                    DamageCount[playerid] = 0;

                    new query[256];
                    mysql_format(g_SQL, query, sizeof(query), "UPDATE `inventory` SET `invWeapon` = '%d' WHERE `invID` = '%d'", invData[playerid][itemid][invWeapon], invData[playerid][itemid][invID]);
                    mysql_tquery(g_SQL, query);
                }
            }
        }
        for (new Sz; Sz < MAX_SZ; Sz++) //safezone
        {
            if (IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
            {
                TogglePlayerControllable(playerid, false);
                playerData[playerid][pStunned] = 10;
                TogglePlayerControllable(playerid, 0);
                SendClientMessage(playerid, COLOR_LIGHTRED, "(( �س�������ö�Ӵ��������ǳ�����! ))");
                return 1;
            }
        }
        /*if (playerData[playerid][pTazer] && playerData[issuerid][pStunned] < 1 && weapon == 23)
        {
        	if (GetPlayerDistanceFromPlayer(playerid, issuerid) > 30.0)
        		return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}������µ�ͧ�����������ҹ�� 30 ����");

        	playerData[issuerid][pStunned] = 3;
        	TogglePlayerControllable(issuerid, 0);

        	//ApplyAnimation(issuerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);

        	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ���ԧ�׹�ԧ������ %s", GetPlayerNameEx(playerid), GetPlayerNameEx(issuerid));
        	return 1;
        }
        if (playerData[playerid][pTazer] && playerData[issuerid][pStunned] < 1 && weapon == 23)
        {
        	if (GetPlayerDistanceFromPlayer(playerid, issuerid) > 30.0)
        		return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}������µ�ͧ�����������ҹ�� 30 ����");

        	playerData[issuerid][pStunned] = 10;
        	TogglePlayerControllable(issuerid, 0);

        	//ApplyAnimation(issuerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);

        	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ���ԧ�׹��͵俿����� %s", GetPlayerNameEx(playerid), GetPlayerNameEx(issuerid));
        }*/
        // �׹��͵俿��
        if (GetFactionType(issuerid) == FACTION_POLICE)
        {
            if (playerData[issuerid][pTazer] && playerData[playerid][pStunned] < 1 && weapon == 23)
            {
                if (GetPlayerDistanceFromPlayer(issuerid, playerid) > 30.0)
                    return SendClientMessage(issuerid, COLOR_RED, "[�к�] {FFFFFF}������µ�ͧ�����������ҹ�� 30 ����");

                playerData[playerid][pStunned] = 10;
                TogglePlayerControllable(playerid, 0);
                TogglePlayerControllable(playerid, false);

                amount = 0;
                SendNearbyMessage(issuerid, 30.0, COLOR_PURPLE, "** %s ���ԧ�׹��͵俿����������� %s", GetPlayerNameEx(issuerid), GetPlayerNameEx(playerid));
                return 0;
            }
        }
        else
        {
            if (playerData[issuerid][pTazer] && playerData[playerid][pStunned] < 1 && weapon == 23)
            {
                if (useTazer[issuerid])
                {
                    if (GetPlayerDistanceFromPlayer(issuerid, playerid) > 30.0)
                        return SendClientMessage(issuerid, COLOR_RED, "[�к�] {FFFFFF}������µ�ͧ�����������ҹ�� 30 ����");

                    playerData[playerid][pStunned] = 10;
                    TogglePlayerControllable(playerid, 0);
                    TogglePlayerControllable(playerid, false);

                    // �׹��͵俿��
                    //playerData[issuerid][pPoliceTazer] = 60*3;

                    SendNearbyMessage(issuerid, 30.0, COLOR_PURPLE, "** %s ���ԧ�׹��͵俿����� %s", GetPlayerNameEx(issuerid), GetPlayerNameEx(playerid));
                    amount = 0;
                    return 0;
                }
            }
        }

        if (weapon == 33)
        {
            SetPlayerHealth(playerid, health);
            amount = 0;
            return 1;
        }

        // ��駤�Ҵ�������ظ
        if (weapon == 0)
        {
            if (armour > 0)
            {
                SetPlayerArmour(playerid, armour - 2.0);
            }
            else
            {
                SetPlayerHealth(playerid, health - 2.0);
            }
        }
        if (weapon == 1)//--> ʹѺ���
        {
            if (armour > 0)
            {
                SetPlayerArmour(playerid, armour - 3.0);
            }
            else
            {
                SetPlayerHealth(playerid, health - 3.0);
            }
        }
        if (weapon == 2)//--> ������
        {
            if (armour > 0)
            {
                SetPlayerArmour(playerid, armour - 7.0);
            }
            else
            {
                SetPlayerHealth(playerid, health - 7.0);
            }
        }
        /*		if (weapon == 3)//--> ��кͧ
        		{
        			if (armour > 0)
        			{
        				SetPlayerArmour(playerid, armour-30.0);
        			}
        			else
        			{
        				SetPlayerHealth(playerid, health-30.0);
        			}
        		}
        		if (weapon == 4)//--> �մ���
        		{
        			if (armour > 0)
        			{
        				SetPlayerArmour(playerid, armour-20.0);
        			}
        			else
        			{
        				SetPlayerHealth(playerid, health-20.0);
        			}
        		}*/
        if (weapon == 5)//--> ����ʺ��
        {
            if (armour > 0)
            {
                SetPlayerArmour(playerid, armour - 6.0);
            }
            else
            {
                SetPlayerHealth(playerid, health - 6.0);
            }
        }
        if (weapon == 7)//--> �����
        {
            if (armour > 0)
            {
                SetPlayerArmour(playerid, armour - 5.0);
            }
            else
            {
                SetPlayerHealth(playerid, health - 5.0);
            }
        }
        if (weapon == 8)//--> �͵��
        {
            if (armour > 0)
            {
                SetPlayerArmour(playerid, armour - 4.0);
            }
            else
            {
                SetPlayerHealth(playerid, health - 4.0);
            }
        }
        // ------------------------------------------->

        PlayerPlaySound(issuerid, 17802, 0.0, 0.0, 0.0);
        PlayerPlaySound(playerid, 17802, 0.0, 0.0, 0.0);
    }
    return 1;
}

public OnPlayerDamageDone(playerid, Float:amount, issuerid, weapon, bodypart)
{
    new Float:armor, Float:hp;
    GetPlayerHealth(playerid, hp);
    GetPlayerArmour(playerid, armor);

    // �׹����� ������ⴹ
    if (weapon == 33)
    {
        SetPlayerHealth(playerid, hp);
        amount = 0;
        return 1;
    }

    // �׹��͵俿��
    /*    if ((weapon == 23 || weapon == 34) && playerData[issuerid][pTazer]) // ��ͧ�� issuerid �����繤��ԧ
        {
            if (playerData[playerid][pStunned] > 0)
                return SendClientMessage(issuerid, COLOR_GREY, "������¶١��͵��������");

            new Float:dist = GetPlayerDistanceFromPlayer(issuerid, playerid);

            if (weapon == 23 && dist > 30.0)
                return SendClientMessage(issuerid, COLOR_RED, "�����������͡���� 30 ����");

            if (weapon == 34 && dist > 150.0)
                return SendClientMessage(issuerid, COLOR_RED, "������µ�ͧ�����������ҹ�� 150 ����");

            playerData[playerid][pStunned] = 5;
            RemoveFromVehicle(playerid);

            SendClientMessage(issuerid, COLOR_LIGHTBLUE, "�س���͵������������!");
            SendClientMessage(playerid, COLOR_RED, "�س�١��͵俿��!");
        } */

    return 1;
}

/*public OnPlayerPrepareDeath(playerid, animlib[32], animname[32], &anim_lock, &respawn_time) {
	printf("OnPlayerPrepareDeath  %d", playerid);
    return 1;
}*/

public OnPlayerDeathFinished(playerid) // Animation ����м������Դ
{
    new killerid;

    playerData[playerid][pHealth] = 100.0;

    ResetPlayerWeaponsEx(playerid);
    ResetPlayer(playerid);


    if (GetPVarInt(playerid, "DisableFPS") == 0)
    {
        SetPVarInt(playerid, "DisableFPS", 1);
        DestroyObject(CameraFirstPerson[playerid]);
        SetCameraBehindPlayer(playerid);
        IsFPS[playerid] = 0;
    }

    if (playerData[playerid][pStunned] > 0)
    {
        playerData[playerid][pStunned] = 0;
        TogglePlayerControllable(playerid, true);
    }

    if (playerData[playerid][pArmorOn])
    {
        RemovePlayerAttachedObject(playerid, 9);
        playerData[playerid][pArmorOn] = false;
    }
    if (playerData[playerid][pTazer])
    {
        playerData[playerid][pTazer] = 0;
    }

    if (GetPlayerWantedLevelEx(playerid) > 0)
    {
        playerData[playerid][pPrisoned] = 1;
        playerData[playerid][pJailTime] = GetPlayerWantedLevelEx(playerid) * 300;
    }
    else
    {
        if (!IsPlayerInRangeOfPoint(playerid, 60.0, 1912.2245, -1388.4724, 14.0504))
        {
            if (playerData[playerid][pInjured] == 0)
            {
                playerData[playerid][pInjured] = 1;

                if (GetFactionOnline(FACTION_MEDIC) > 1)
                {
                    playerData[playerid][pInjuredTime] = 1200; //20�ҷ�
                }
                else
                {
                    playerData[playerid][pInjuredTime] = 300; //5�ҷ�
                }

                playerData[playerid][pInterior] = GetPlayerInterior(playerid);
                playerData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

                GetPlayerPos(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z]);
                GetPlayerFacingAngle(playerid, playerData[playerid][pPos_A]);
            }
            else
            {
                playerData[playerid][pInjured] = 0;
                playerData[playerid][pInjuredTime] = 0;
                playerData[playerid][pHospital] = 1;
            }
        }
        else
        {
            if (playerData[playerid][pInjured] == 0)
            {
                playerData[playerid][pInjured] = 1;

                inLabel[playerid] = 1;

                playerData[playerid][pInterior] = GetPlayerInterior(playerid);
                playerData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

                GetPlayerPos(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z]);
                GetPlayerFacingAngle(playerid, playerData[playerid][pPos_A]);

            }
            else
            {
                playerData[playerid][pInjured] = 0;
                playerData[playerid][pInjuredTime] = 0;
                playerData[playerid][pHospital] = 1;
            }
        }
    }
    ResetPlayerDeath(playerid);
    UpdatePlayerDeaths(playerid);
    UpdatePlayerKills(killerid, playerid);
    return 1;
}

// public OnRejectedHit(playerid, hit[E_REJECTED_HIT]) // ��������
/*
// Given in OnRejectedHit
enum E_REJECTED_HIT {
	e_Time,
	e_Hour,
	e_Minute,
	e_Second,
	e_Weapon,
	e_Reason,
	e_Info1,
	e_Info2,
	e_Info3,
	e_Name[MAX_PLAYER_NAME]
}

// e_Reason in E_REJECTED_HIT
enum {
	HIT_NO_playerid,
	HIT_INVALID_WEAPON,
	HIT_LAST_SHOT_INVALID,
	HIT_MULTIPLE_PLAYERS,
	HIT_MULTIPLE_PLAYERS_SHOTGUN,
	HIT_DYING_PLAYER,
	HIT_SAME_TEAM,
	HIT_UNSTREAMED,
	HIT_INVALID_HITTYPE,
	HIT_BEING_RESYNCED,
	HIT_NOT_SPAWNED,
	HIT_OUT_OF_RANGE,
	HIT_TOO_FAR_FROM_SHOT,
	SHOOTING_RATE_TOO_FAST,
	SHOOTING_RATE_TOO_FAST_MULTIPLE,
	HIT_RATE_TOO_FAST,
	HIT_RATE_TOO_FAST_MULTIPLE,
	HIT_KNIFE_FAILED,
	HIT_TOO_FAR_FROM_ORIGIN,
	HIT_INVALID_DAMAGE,
	HIT_SAME_VEHICLE,
	HIT_OWN_VEHICLE,
	HIT_INVALID_VEHICLE,
	HIT_DISCONNECTED
}

// Must be in sync with the enum above
// Used in debug messages and GetRejectedHit
stock const g_HitRejectReasons[][] = {
	"None or invalid player shot",
	"Invalid weapon",
	"Last shot invalid",
	"One bullet hit %d players",
	"Hit too many players with shotgun: %d",
	"Hit a dying player",
	"Hit a teammate",
	"Hit someone that can't see you (not streamed in)",
	"Invalid hit type: %d",
	"Hit while being resynced",
	"Hit when not spawned or dying",
	"Hit out of range (%f > %f)",
	"Hit player too far from hit position (dist %f)",
	"Shooting rate too fast: %d (%d samples, max %d)",
	"Shooting rate too fast: %d (%d samples, multiple weapons)",
	"Hit rate too fast: %d (%d samples, max %d)",
	"Hit rate too fast: %d (%d samples, multiple weapons)",
	"The knife kill did not sync",
	"Damage inflicted too far from current position (dist %f)",
	"Invalid weapon damage (%.4f)",
	"Hit a player in the same vehicle",
	"Hit the vehicle you're in",
	"Hit invalid vehicle: %d",
	"Hit a disconnected player ID: %d"
};
*/

/*public OnInvalidWeaponDamage(playerid, damagedid, Float:amount, weapon, bodypart, error, bool:given) // ���Ѻ����ⴹ����������軡��
{
	return 1;
}*/

timer PlayerClearStundDamage[10000](playerid)
{
    TogglePlayerControllable(playerid, true);
}
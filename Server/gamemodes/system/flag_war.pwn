#include 	<YSI_Coding\y_hooks>

new joinFlag[MAX_PLAYERS];
new isTakeFlags[MAX_PLAYERS];

new warTimer;
new warStats;
new warTake;

hook OnGameModeInit()
{
    warTimer = 0;
    warStats = 0;
    warTake = 0;

	// �ִ��
	CreateDynamicPickup(19306, 23, 2618.5613,2722.0105,36.5386);
	CreateDynamic3DTextLabel("{059EF6}�ִ��\n{FFFFFF}������ N\n{99D8FC}(���˹����ִ�������á���繼�骹�!)", COLOR_RED, 2618.5613,2722.0105,36.5386, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
}

hook OnPlayerConnect(playerid)
{
    joinFlag[playerid] = 0;
    isTakeFlags[playerid] = 0;
}

hook OnPlayerDeath(playerid)
{
	if (isTakeFlags[playerid] == 1)
	{
	    warTake = 0;
	    isTakeFlags[playerid] = 0;
	    SendClientMessage(playerid, COLOR_LIGHTRED, "����ִ���������! ���ͧ�ҡ�س���ª��Ե");
	}
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (isTakeFlags[playerid] == 1)
	{
	    warTake = 0;
	    isTakeFlags[playerid] = 0;
	    SendClientMessage(playerid, COLOR_LIGHTRED, "����ִ���������! ���ͧ�ҡ�س���ª��Ե");
	}
}

hook OnPlayerSpawn(playerid)
{
	if (joinFlag[playerid] == 1)
	{
		SendClientMessage(playerid, COLOR_YELLOW, "������¢ͧ�س��� �������ء���������ִ��");
		SendClientMessage(playerid, COLOR_YELLOW, "��������ش��ᴧ !! ����ö�Դ Map �٨ش��");
		SetPlayerPos(playerid, 2647.6450,2740.0479,10.8203);
		SetPlayerFacingAngle(playerid, 265.8659);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		return 1;
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	// �ִ��
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
	    if (IsPlayerInRangeOfPoint(playerid, 3.0, 2618.5613,2722.0105,36.5386))
	    {
		    if (warStats == 0)
		        return SendClientMessage(playerid, COLOR_LIGHTRED, "�Ԩ�����ѧ����Դ����������!");

			if (GetFactionType(playerid) != FACTION_GANG)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "����Ѻ����ҹ��!");

		    if (isTakeFlags[playerid] == 1)
		        return SendClientMessage(playerid, COLOR_LIGHTRED, "�س���������ҧ��� '�ִ��'");

		    if (warTake == 1)
		        return SendClientMessage(playerid, COLOR_LIGHTRED, "�ռ����蹡��ѧ�ִ��!");

            isTakeFlags[playerid] = 1;
			StartProgress(playerid, 1000, 0, INVALID_OBJECT_ID);
			warTake = 1;
	    }
	}
	return 1;
}

CMD:joinwar(playerid)
{
	if (warStats == 0)
		return SendClientMessage(playerid, COLOR_LIGHTRED, "�Ԩ�����ѧ����Դ����������!");

	if (GetFactionType(playerid) != FACTION_GANG)
	    return SendClientMessage(playerid, COLOR_LIGHTRED, "����Ѻ����ҹ��!");

	SendClientMessage(playerid, COLOR_YELLOW, "������¢ͧ�س��� �������ء���������ִ��");
	SendClientMessage(playerid, COLOR_YELLOW, "��������ش��ᴧ !! ����ö�Դ Map �٨ش��");
	SetPlayerPos(playerid, 2647.6450,2740.0479,10.8203);
	SetPlayerFacingAngle(playerid, 265.8659);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	joinFlag[playerid] = 1;
	
	return 1;
}

CMD:quitwar(playerid)
{
	if (warStats == 0)
		return SendClientMessage(playerid, COLOR_LIGHTRED, "�Ԩ�����ѧ����Դ����������!");

	if (GetFactionType(playerid) != FACTION_GANG)
	    return SendClientMessage(playerid, COLOR_LIGHTRED, "����Ѻ����ҹ��!");

	SpawnPlayer(playerid);
	joinFlag[playerid] = 0;
	
	return 1;
}

CMD:openflag(playerid)
{
	if (warStats == 0)
	{
	    warStats = 1;

	    warTimer = 900;
	    warTake = 0;
	    
	    SendClientMessageToAll(COLOR_GREEN, "�Ԩ��������ԧ��������������! ����� (/joinwar) �����������!");
	}
	else
	{
	    warStats = 0;

	    warTimer = 0;
	    warTake = 0;

		foreach (new i : Player)
		{
			if (joinFlag[i] == 1)
			{
				joinFlag[i] = 0;
				SpawnPlayer(i);
				SendClientMessage(i, COLOR_LIGHTRED, "�س�١�觵�ǡ�Ѻ�ش�Դ���ͧ�ҡ�Ԩ������ŧ����!");
			}
		}
		SendClientMessageToAll(COLOR_YELLOW, "�Ԩ��������ԧ����ŧ����! �ͺ�س�ء������������");
		SendClientMessageToAll(COLOR_LIGHTRED, "����ռ�骹�㹡Ԩ��������ԧ��㹤��駹��!");
	}
	return 1;
}

task flagsTimer[1000]()
{
	new str[128];
	if (warStats == 1)
	{
		new
			hours,
			minutes,
			seconds;

		warTimer --;
		GetElapsedTime(warTimer, hours, minutes, seconds);

		foreach (new i : Player)
		{
			if (joinFlag[i] == 1)
			{
				format(str, sizeof(str), "~w~%d:%d", minutes, seconds);
				GameTextForPlayer(i, str, 3000, 3);
				
				SetPlayerCheckpoint(i, 2618.5613,2722.0105,36.5386, 2.0);
			}
		}
		
		if (warTimer == 0)
		{
		    warStats = 0;

		    warTimer = 0;
		    warTake = 0;

			foreach (new i : Player)
			{
				if (joinFlag[i] == 1)
				{
					joinFlag[i] = 0;
					SpawnPlayer(i);
					SendClientMessage(i, COLOR_LIGHTRED, "�س�١�觵�ǡ�Ѻ�ش�Դ���ͧ�ҡ�Ԩ������ŧ����!");
				}
			}
			SendClientMessageToAll(COLOR_YELLOW, "�Ԩ��������ԧ����ŧ����! �ͺ�س�ء������������");
			SendClientMessageToAll(COLOR_LIGHTRED, "����ռ�骹�㹡Ԩ��������ԧ��㹤��駹��!");
		}
	}
	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	if (isTakeFlags[playerid] == 1)
		PlayerTakeFlagsComplete(playerid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if (isTakeFlags[playerid] == 1)
	{
		ApplyAnimation(playerid, "BD_FIRE","wash_up", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
    return Y_HOOKS_CONTINUE_RETURN_0;
}

PlayerTakeFlagsComplete(playerid)
{
	isTakeFlags[playerid] = 0;
	ClearAnimations(playerid);

	warStats = 0;

	warTimer = 0;
	warTake = 0;

	foreach (new i : Player)
	{
		if (joinFlag[i] == 1)
		{
			joinFlag[i] = 0;
			SpawnPlayer(i);
			SendClientMessage(i, COLOR_LIGHTRED, "�س�١�觵�ǡ�Ѻ�ش�Դ���ͧ�ҡ�Ԩ������ŧ����!");
		}
		
		if (playerData[playerid][pFaction] == playerData[i][pFaction])
		{
		    GivePlayerMoneyEx(i, 10000);
		    SendClientMessage(i, COLOR_GREEN, "�س���Ѻ�Թ���� $50,000 �ҡ����繼�骹�㹡Ԩ��������ԧ��!");
		}
	}
	
	SendClientMessageToAll(COLOR_YELLOW, "�Ԩ��������ԧ����ŧ����! �ͺ�س�ء������������");
	SendClientMessageToAllEx(COLOR_GREEN, "������ '%s' �ҡ�� '%s' �繼�骹�㹡Ԩ��������ԧ��㹤��駹�� ", GetPlayerNameEx(playerid), Faction_GetName(playerid));

	return 1;
}

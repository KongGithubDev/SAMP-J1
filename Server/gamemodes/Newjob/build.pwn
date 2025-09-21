#include	<YSI_Coding\y_hooks>

new isPoon_Active[MAX_PLAYERS], StepWorking[MAX_PLAYERS], CountWorking[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    isPoon_Active[playerid] = 0;
    StepWorking[playerid] = 0;
    CountWorking[playerid] = 0;
}

hook OnGameModeInit()
{
	CreateDynamicPickup(2060, 23, 2696.2239,903.3934,10.4616);
	CreateDynamic3DTextLabel("{FA5727}[ ạ�ٹ ]\n{ffffff}������ N", COLOR_RED, 2696.2239,903.3934,10.4616, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	CreateDynamicPickup(19468, 23, 2715.5020,877.8242,10.8984);
	CreateDynamic3DTextLabel("{FA5727}[ ����ٹ ]\n{ffffff}������ N", COLOR_RED, 2715.5020,877.8242,10.8984, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	CreateDynamicPickup(337, 23, 2677.2346,868.5861,10.9395);
	CreateDynamic3DTextLabel("{FA5727}[ ⺡�ٹ ]\n{ffffff}������ N", COLOR_RED, 2677.2346,868.5861,10.9395, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
		if (IsPlayerInRangeOfPoint(playerid, 2.0, 2696.2239,903.3934,10.4616)) // ạ�ٹ
		{
		    if (StepWorking[playerid] != 0)
		        return SendClientMessage(playerid, COLOR_LIGHTRED, "�Դ��Ҵ :: {ffffff}�س���������ҧ��÷ӧҹ! ��سҷ��������������;���� '/¡��ԡ�ҹ' ���������������!");
		
	  		isPoon_Active[playerid] = 1;
	  		StepWorking[playerid] = 1;
			StartProgress(playerid, 50, 0, INVALID_OBJECT_ID);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[ ạ�ٹ ] : {FFFFFF}�س����Ժ�ٹ�����! ��仼���Ѻ�ٹ���ͷӡ��⺡!");
			DisablePlayerCheckpoint(playerid);
		}
		else if (IsPlayerInRangeOfPoint(playerid, 2.0, 2715.5020,877.8242,10.8984)) // ����ٹ
		{
		    if (StepWorking[playerid] != 2)
		        return SendClientMessage(playerid, COLOR_LIGHTRED, "�Դ��Ҵ :: {ffffff}�س��ͧạ�ٹ�ҡ�͹�֧������ö����ٹ��! ���;���� '/¡��ԡ�ҹ' ���������������!");

	  		isPoon_Active[playerid] = 2;
	  		StepWorking[playerid] = 2;
			StartProgress(playerid, 50, 0, INVALID_OBJECT_ID);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[ ����ٹ ] : {FFFFFF}�س���ѧ�ӡ���ҧ�ٹ���ạ�����ǡ��ѧ����Ѻ�ٹ!");
			DisablePlayerCheckpoint(playerid);
		}
		else if (IsPlayerInRangeOfPoint(playerid, 2.0, 2677.2346,868.5861,10.9395)) // ⺡�ٹ
		{
		    if (StepWorking[playerid] != 3)
		        return SendClientMessage(playerid, COLOR_LIGHTRED, "�Դ��Ҵ :: {ffffff}�س��ͧ����ٹ��͹�֧������ö⺡�ٹ��! ���;���� '/¡��ԡ�ҹ' ���������������!");

	  		isPoon_Active[playerid] = 3;
	  		StepWorking[playerid] = 3;
			StartProgress(playerid, 100, 0, INVALID_OBJECT_ID);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[ ����ٹ ] : {FFFFFF}�س��Ӷѧ�ٹ��������ŧ�Ѻ������ǡ��ѧ�ӡ��⺡�ٹ!");
			DisablePlayerCheckpoint(playerid);
		}
	}
	return 1;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if (isPoon_Active[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if (isPoon_Active[playerid] == 2)
	{
		ApplyAnimation(playerid, "BD_FIRE","wash_up", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if (isPoon_Active[playerid] == 3)
	{
		ApplyAnimation(playerid, "BASEBALL", "BAT_4", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressFinish(playerid, objectid)
{
	if (isPoon_Active[playerid] == 1)
		PlayerCompletePickPoon(playerid);

	if (isPoon_Active[playerid] == 2)
		PlayerCompleteDrawPoon(playerid);

	if (isPoon_Active[playerid] == 3)
		PlayerCompleteJobPoon(playerid);

    return Y_HOOKS_CONTINUE_RETURN_0;
}

PlayerCompletePickPoon(playerid)
{
	isPoon_Active[playerid] = 0;
	ClearAnimations(playerid);

	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	SetPlayerAttachedObject(playerid, 1, 2060, 6, 0.095999, 0.050000, -0.182999, 64.600013, 16.199945, 98.500007, 1.000000, 1.000000, 1.000000);
    StepWorking[playerid] = 2;

	SendClientMessage(playerid, -1, "{FA2407}��鹵͹�Ѵ� > {FDC2BA}��仼���ٹ����������������Ѻ���⺡�ٹ������ҧ!");
	SetPlayerCheckpoint(playerid, 2715.5020,877.8242,10.8984, 2.0);
	return 1;
}

PlayerCompleteDrawPoon(playerid)
{
	isPoon_Active[playerid] = 0;
	ClearAnimations(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

	SetPlayerAttachedObject(playerid, 1, 19468, 5, 0.190000, 0.002000, 0.059999, 0.000000, -100.799980, -4.000000, 1.000000, 1.000000, 1.000000);
    SetPlayerAttachedObject(playerid, 2, 337, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);

	StepWorking[playerid] = 3;
	SendClientMessage(playerid, -1, "{FA2407}��鹵͹�Ѵ� > {FDC2BA}���⺡�ٹ����������鹡�á�����ҧ���ú 10 ����!");
	SetPlayerCheckpoint(playerid, 2677.2346,868.5861,10.9395, 2.0);
	return 1;
}

PlayerCompleteJobPoon(playerid)
{
    CountWorking[playerid] ++;
	isPoon_Active[playerid] = 0;
	ClearAnimations(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

	RemovePlayerAttachedObject(playerid, 1);
    RemovePlayerAttachedObject(playerid, 2);

	StepWorking[playerid] = 0;
	
	SendClientMessage(playerid, -1, "{FA2407}�й� > {FDC2BA}��Ѻ�ạ�ٹ���ͷӧҹ���ú 10 �������Ǩ����Թ�ͺ᷹ $5,000");
	SendClientMessageEx(playerid, -1, "{F6E40B}�ӹǹ���駡�÷ӧҹ : {ffffff}%d/10 ����", CountWorking[playerid]);
	
	if (CountWorking[playerid] >= 10)
	{
	    CountWorking[playerid] = 0;
	    GivePlayerMoneyEx(playerid, 5000);
	    SendClientMessage(playerid, COLOR_YELLOW, "�س���Ѻ�Թ�ӹǹ $5,000 �ҡ��÷ӧҹ������ҧ����!");
	}
	return 1;
}

alias:restart_poon("¡��ԡ�ҹ")
CMD:restart_poon(playerid, params[])
{
    isPoon_Active[playerid] = 0;
    StepWorking[playerid] = 0;
    CountWorking[playerid] = 0;

	SendClientMessage(playerid, COLOR_LIGHTRED, "�س��ӡ��������鹡�÷ӧҹ������ҧ��������! ([ Reset ])");
	return 1;
}


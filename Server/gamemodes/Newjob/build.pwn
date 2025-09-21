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
	CreateDynamic3DTextLabel("{FA5727}[ แบกปูน ]\n{ffffff}กดปุ่ม N", COLOR_RED, 2696.2239,903.3934,10.4616, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	CreateDynamicPickup(19468, 23, 2715.5020,877.8242,10.8984);
	CreateDynamic3DTextLabel("{FA5727}[ ผสมปูน ]\n{ffffff}กดปุ่ม N", COLOR_RED, 2715.5020,877.8242,10.8984, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	CreateDynamicPickup(337, 23, 2677.2346,868.5861,10.9395);
	CreateDynamic3DTextLabel("{FA5727}[ โบกปูน ]\n{ffffff}กดปุ่ม N", COLOR_RED, 2677.2346,868.5861,10.9395, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
		if (IsPlayerInRangeOfPoint(playerid, 2.0, 2696.2239,903.3934,10.4616)) // แบกปูน
		{
		    if (StepWorking[playerid] != 0)
		        return SendClientMessage(playerid, COLOR_LIGHTRED, "ผิดพลาด :: {ffffff}คุณอยู่ระหว่างการทำงาน! กรุณาทำให้เสร็จสิ้นหรือพิมพ์ '/ยกเลิกงาน' เพื่อเริ่มต้นใหม่!");
		
	  		isPoon_Active[playerid] = 1;
	  		StepWorking[playerid] = 1;
			StartProgress(playerid, 50, 0, INVALID_OBJECT_ID);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[ แบกปูน ] : {FFFFFF}คุณได้หยิบปูนขึ้นมา! นำไปผสมกับปูนเพื่อทำการโบก!");
			DisablePlayerCheckpoint(playerid);
		}
		else if (IsPlayerInRangeOfPoint(playerid, 2.0, 2715.5020,877.8242,10.8984)) // ผสมปูน
		{
		    if (StepWorking[playerid] != 2)
		        return SendClientMessage(playerid, COLOR_LIGHTRED, "ผิดพลาด :: {ffffff}คุณต้องแบกปูนมาก่อนถึงจะสามารถผสมปูนได้! หรือพิมพ์ '/ยกเลิกงาน' เพื่อเริ่มต้นใหม่!");

	  		isPoon_Active[playerid] = 2;
	  		StepWorking[playerid] = 2;
			StartProgress(playerid, 50, 0, INVALID_OBJECT_ID);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[ ผสมปูน ] : {FFFFFF}คุณกำลังทำการวางปูนที่แบกมาแล้วกำลังผสมกับปูน!");
			DisablePlayerCheckpoint(playerid);
		}
		else if (IsPlayerInRangeOfPoint(playerid, 2.0, 2677.2346,868.5861,10.9395)) // โบกปูน
		{
		    if (StepWorking[playerid] != 3)
		        return SendClientMessage(playerid, COLOR_LIGHTRED, "ผิดพลาด :: {ffffff}คุณต้องผสมปูนก่อนถึงจะสามารถโบกปูนได้! หรือพิมพ์ '/ยกเลิกงาน' เพื่อเริ่มต้นใหม่!");

	  		isPoon_Active[playerid] = 3;
	  		StepWorking[playerid] = 3;
			StartProgress(playerid, 100, 0, INVALID_OBJECT_ID);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[ ผสมปูน ] : {FFFFFF}คุณได้นำถังปูนที่ผสมมาเทลงกับพื้นแล้วกำลังทำการโบกปูน!");
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

	SendClientMessage(playerid, -1, "{FA2407}ขั้นตอนถัดไป > {FDC2BA}นำไปผสมปูนเพื่อเตรียมตัวสำหรับการโบกปูนก่อสร้าง!");
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
	SendClientMessage(playerid, -1, "{FA2407}ขั้นตอนถัดไป > {FDC2BA}นำไปโบกปูนเพื่อเริ่มต้นการก่อสร้างให้ครบ 10 ครั้ง!");
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
	
	SendClientMessage(playerid, -1, "{FA2407}แนะนำ > {FDC2BA}กลับไปแบกปูนเพื่อทำงานให้ครบ 10 ครั้งแล้วจะได้เงินตอบแทน $5,000");
	SendClientMessageEx(playerid, -1, "{F6E40B}จำนวนครั้งการทำงาน : {ffffff}%d/10 ครั้ง", CountWorking[playerid]);
	
	if (CountWorking[playerid] >= 10)
	{
	    CountWorking[playerid] = 0;
	    GivePlayerMoneyEx(playerid, 5000);
	    SendClientMessage(playerid, COLOR_YELLOW, "คุณได้รับเงินจำนวน $5,000 จากการทำงานก่อสร้างแล้ว!");
	}
	return 1;
}

alias:restart_poon("ยกเลิกงาน")
CMD:restart_poon(playerid, params[])
{
    isPoon_Active[playerid] = 0;
    StepWorking[playerid] = 0;
    CountWorking[playerid] = 0;

	SendClientMessage(playerid, COLOR_LIGHTRED, "คุณได้ทำการเริ่มต้นการทำงานก่อสร้างใหม่แล้ว! ([ Reset ])");
	return 1;
}


#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_DURIAN       	9
#define     DURIANOBJECT       	15085
#define     DURIANTEXT           "{FFFFFF}�� {FFFF00}N {FFFFFF}������"
#define     DURIANNAME           "�����¹"

static DurianTake[MAX_PLAYERS];

enum DURIAN_DATA {
    durianID,
    durianObject, 
    Float:durianPos[3],
    Text3D:durian3D,
    durianOn
};

new const durianData[MAX_DURIAN][DURIAN_DATA] = {
	{ 0, DURIANOBJECT, { -264.536865, -1449.018310, 5.362009 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 1, DURIANOBJECT, { -275.168273, -1449.618164, 6.246637 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 2, DURIANOBJECT, { -284.514190, -1449.294311, 7.800273 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 3, DURIANOBJECT, { -284.701049, -1437.756713, 10.132442 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 4, DURIANOBJECT, { -275.884094, -1437.666503, 9.248581 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 5, DURIANOBJECT, { -266.668609, -1437.803833, 8.088487 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 6, DURIANOBJECT, { -262.541595, -1460.745117, 3.783583 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 7, DURIANOBJECT, { -273.763214, -1461.884887, 3.450285 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 8, DURIANOBJECT, { -285.017761, -1459.698364, 5.587922 }, Text3D: INVALID_3DTEXT_ID,  0 }
};

hook OnGameModeInit() {
	for(new i = 0; i < sizeof(durianData); i++) {
		durianData[i][durianID] = CreateDynamicObject(durianData[i][durianObject], durianData[i][durianPos][0], durianData[i][durianPos][1], durianData[i][durianPos][2], 0.0, 0.0, 0.0);
		durianData[i][durian3D] = CreateDynamic3DTextLabel(DURIANTEXT, COLOR_GREEN, durianData[i][durianPos][0], durianData[i][durianPos][1], durianData[i][durianPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid) {
	DurianTake[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
		for(new i = 0; i < sizeof durianData; i++) {   
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(durianData[i][durianID], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
				if(IsValidDynamicObject(durianData[i][durianID]) && durianData[i][durianOn] == 0) {
					if(DurianTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, DURIANNAME);
						if(ammo >= 40)
							return SendClientMessageEx(playerid, COLOR_RED, "%d/40 �������", ammo);

						durianData[i][durianOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
						DurianTake[playerid] = 1;
						StartProgress(playerid, 50, 0, i);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_SELLDURIAN(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "�����¹");
				new price = ammo*priceDurian;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {FFFFFF}�س����� �����¹ ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� �����¹ {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "�����¹" , ammo);
		    }
		}
	}
	return 1;
}

hook OnProgressFinish(playerid, objectid) {
	return ProgressFinish(playerid, objectid);
}

hook OnProgressAFFinish(playerid, objectid) {
	return ProgressFinish(playerid, objectid);
}

static stock ProgressFinish(playerid, objectid) {
	if(DurianTake[playerid] == 1) {
		new number = objectid;
		PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
		DurianTake[playerid] = 0;

		DestroyDynamic3DTextLabel(durianData[number][durian3D]);
		SetDynamicObjectPos(durianData[number][durianID], durianData[number][durianPos][0], durianData[number][durianPos][1], durianData[number][durianPos][2] - 5.0);
		defer CreateDurianObject(number);

		new ammo = Inventory_Count(playerid, DURIANNAME);
		if(AUTOFARM_STARTED(playerid) && AUTOFARM_GETJOBID(playerid) == JOB_DURIAN) {
			if(ammo >= 40)
				return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 �������", ammo));

			new id = Inventory_Add(playerid, DURIANNAME, 1);
			if (id == -1) return AUTOFARM_CANCELWITHREASON(playerid, "�����آͧ�����������§��");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ ����͹ ] {ffffff} �س���Ѻ {00FF00}�����¹ +1");
			AUTOFARM_JOB_Finish(playerid);
		} else {
			if(ammo >= 40)
				return SendClientMessageEx(playerid, COLOR_RED, "%d/40 �������", ammo);

			new id = Inventory_Add(playerid, DURIANNAME, 1);
			
			if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {ffffff} �����آͧ�����������§��");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ ����͹ ] {ffffff} �س���Ѻ {00FF00}�����¹ +1");
		}
	}
	return 1;
}

timer CreateDurianObject[10000](number) {
	SetDynamicObjectPos(durianData[number][durianID], durianData[number][durianPos][0], durianData[number][durianPos][1], durianData[number][durianPos][2]);
	durianData[number][durian3D] = CreateDynamic3DTextLabel(DURIANTEXT, COLOR_GREEN, durianData[number][durianPos][0], durianData[number][durianPos][1], durianData[number][durianPos][2] + 1.5, 5.0);
	durianData[number][durianOn] = 0;
}

hook OnAutoFarmWalk(playerid, jobid) {
	if(jobid == JOB_DURIAN) {
		if(GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND") != -1) {
			new Float:x, Float:y, Float:z, i = GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND");
			GetDynamicObjectPos(durianData[i][durianID], x, y, z);
			if(IsValidDynamicObject(durianData[i][durianID]) && durianData[i][durianOn] == 0) {
				AUTOFARM_SetFacingAnglePostion(playerid, durianData[i][durianPos][0], durianData[i][durianPos][1]);
				AutoFarm_WalkAnimation(playerid);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
					if(DurianTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, DURIANNAME);
						if(ammo >= 40)
							return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 �������", ammo));

						AutoFarm_StopWalkAnimation(playerid);
						AUTOFARM_JOB_GRAB(playerid);

						durianData[i][durianOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);

						DurianTake[playerid] = 1;
						StartProgress(playerid, 50, 0, i);
					}
				}
			} else {
				if(GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND") == i) {
					AutoFarm_StopWalkAnimation(playerid);
					SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", -1);
				}
			}
		} else {
			new i = randomEx(0, sizeof(durianData) - 1), Float:x, Float:y, Float:z;
			GetDynamicObjectPos(durianData[i][durianID], x, y, z);
			if(IsValidDynamicObject(durianData[i][durianID]) && durianData[i][durianOn] == 0) {
				SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", i);
				AUTOFARM_SetFacingAnglePostion(playerid, durianData[i][durianPos][0], durianData[i][durianPos][1]);
				AutoFarm_WalkAnimation(playerid);
			}
		}
	}
	return 1;
}

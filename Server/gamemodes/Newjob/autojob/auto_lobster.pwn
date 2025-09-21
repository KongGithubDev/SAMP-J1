#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_LOBSTER       	9
#define     LOBSTEROBJECT       15086
#define     LOBSTERTEXT         "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     LOBSTERNAME         "กุ้งล็อบสเตอร์"

static LobsterTake[MAX_PLAYERS];

enum LOBSTER_DATA {
    lobsterID,
    lobsterObject, 
    Float:lobsterPos[3],
    Text3D:lobster3D,
    lobsterOn
};

new const lobsterData[MAX_LOBSTER][LOBSTER_DATA] = {
	{ 0, LOBSTEROBJECT, { 618.527954, -1915.012451, 0.217311 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 1, LOBSTEROBJECT, { 607.757446, -1913.734497, 0.237424 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 2, LOBSTEROBJECT, { 595.995422, -1912.230346, 0.217693 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 3, LOBSTEROBJECT, { 596.308959, -1903.546020, 1.899529 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 4, LOBSTEROBJECT, { 609.206298, -1904.503051, 1.948367 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 5, LOBSTEROBJECT, { 619.551940, -1905.234741, 1.949454 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 6, LOBSTEROBJECT, { 619.991577, -1894.428588, 2.499464 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 7, LOBSTEROBJECT, { 609.878295, -1893.896606, 2.542868 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 8, LOBSTEROBJECT, { 596.501281, -1894.379394, 2.595707 }, Text3D: INVALID_3DTEXT_ID,  0 }
};

hook OnGameModeInit() {
	for(new i = 0; i < sizeof(lobsterData); i++) {
		lobsterData[i][lobsterID] = CreateDynamicObject(lobsterData[i][lobsterObject], lobsterData[i][lobsterPos][0], lobsterData[i][lobsterPos][1], lobsterData[i][lobsterPos][2], 0.0, 0.0, 0.0);
		lobsterData[i][lobster3D] = CreateDynamic3DTextLabel(LOBSTERTEXT, COLOR_GREEN, lobsterData[i][lobsterPos][0], lobsterData[i][lobsterPos][1], lobsterData[i][lobsterPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid) {
	LobsterTake[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
		for(new i = 0; i < sizeof lobsterData; i++) {   
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(lobsterData[i][lobsterID], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
				if(IsValidDynamicObject(lobsterData[i][lobsterID]) && lobsterData[i][lobsterOn] == 0) {
					if(LobsterTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, LOBSTERNAME);
						if(ammo >= 40)
							return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

						lobsterData[i][lobsterOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
						LobsterTake[playerid] = 1;
						StartProgress(playerid, 50, 0, i);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_SELLLOBSTER(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "กุ้งล็อบสเตอร์");
				new price = ammo*priceLobster;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี กุ้งล็อบสเตอร์ อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย กุ้งล็อบสเตอร์ {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "กุ้งล็อบสเตอร์" , ammo);
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
	if(LobsterTake[playerid] == 1) {
		new number = objectid;
		PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
		LobsterTake[playerid] = 0;

		DestroyDynamic3DTextLabel(lobsterData[number][lobster3D]);
		SetDynamicObjectPos(lobsterData[number][lobsterID], lobsterData[number][lobsterPos][0], lobsterData[number][lobsterPos][1], lobsterData[number][lobsterPos][2] - 5.0);
		defer CreateLobsterObject(number);

		new ammo = Inventory_Count(playerid, LOBSTERNAME);
		if(AUTOFARM_STARTED(playerid) && AUTOFARM_GETJOBID(playerid) == JOB_LOBSTER) {
			if(ammo >= 40)
				return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

			new id = Inventory_Add(playerid, LOBSTERNAME, 1);
			if (id == -1) return AUTOFARM_CANCELWITHREASON(playerid, "ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}กุ้งล็อบสเตอร์ +1");
			AUTOFARM_JOB_Finish(playerid);
		} else {
			if(ammo >= 40)
				return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

			new id = Inventory_Add(playerid, LOBSTERNAME, 1);
			
			if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}กุ้งล็อบสเตอร์ +1");
		}
	}
	return 1;
}

timer CreateLobsterObject[10000](number) {
	SetDynamicObjectPos(lobsterData[number][lobsterID], lobsterData[number][lobsterPos][0], lobsterData[number][lobsterPos][1], lobsterData[number][lobsterPos][2]);
	lobsterData[number][lobster3D] = CreateDynamic3DTextLabel(LOBSTERTEXT, COLOR_GREEN, lobsterData[number][lobsterPos][0], lobsterData[number][lobsterPos][1], lobsterData[number][lobsterPos][2] + 1.5, 5.0);
	lobsterData[number][lobsterOn] = 0;
}

hook OnAutoFarmWalk(playerid, jobid) {
	if(jobid == JOB_LOBSTER) {
		if(GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND") != -1) {
			new Float:x, Float:y, Float:z, i = GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND");
			GetDynamicObjectPos(lobsterData[i][lobsterID], x, y, z);
			if(IsValidDynamicObject(lobsterData[i][lobsterID]) && lobsterData[i][lobsterOn] == 0) {
				AUTOFARM_SetFacingAnglePostion(playerid, lobsterData[i][lobsterPos][0], lobsterData[i][lobsterPos][1]);
				AutoFarm_WalkAnimation(playerid);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
					if(LobsterTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, LOBSTERNAME);
						if(ammo >= 40)
							return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

						AutoFarm_StopWalkAnimation(playerid);
						AUTOFARM_JOB_GRAB(playerid);

						lobsterData[i][lobsterOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);

						LobsterTake[playerid] = 1;
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
			new i = randomEx(0, sizeof(lobsterData) - 1), Float:x, Float:y, Float:z;
			GetDynamicObjectPos(lobsterData[i][lobsterID], x, y, z);
			if(IsValidDynamicObject(lobsterData[i][lobsterID]) && lobsterData[i][lobsterOn] == 0) {
				SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", i);
				AUTOFARM_SetFacingAnglePostion(playerid, lobsterData[i][lobsterPos][0], lobsterData[i][lobsterPos][1]);
				AutoFarm_WalkAnimation(playerid);
			}
		}
	}
	return 1;
}

#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_RICE       	9
#define     RICEOBJECT      15066
#define     RICETEXT        "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     RICENAME        "ข้าว"

static RiceTake[MAX_PLAYERS];

enum RICE_DATA {
    riceID,
    riceObject, 
    Float:ricePos[3],
    Text3D:rice3D,
    riceOn
};

new const riceData[MAX_RICE][RICE_DATA] = {
	{ 0, RICEOBJECT, { 71.658248, 24.561527, -0.390625 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 1, RICEOBJECT, { 67.518867, 13.378399, -0.390625 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 2, RICEOBJECT, { 62.060188, -1.376613, 0.342583 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 3, RICEOBJECT, { 52.290168, 3.730427, 1.030617 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 4, RICEOBJECT, { 57.249263, 17.842149, 0.345837 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 5, RICEOBJECT, { 61.903156, 30.087671, -0.278597 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 6, RICEOBJECT, { 52.370819, 34.979995, 0.462584 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 7, RICEOBJECT, { 47.495395, 20.987529, 1.101186 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 8, RICEOBJECT, { 42.256633, 7.373112, 1.775504 }, Text3D: INVALID_3DTEXT_ID,  0 }

};

hook OnGameModeInit() {
	for(new i = 0; i < sizeof(riceData); i++) {
		riceData[i][riceID] = CreateDynamicObject(riceData[i][riceObject], riceData[i][ricePos][0], riceData[i][ricePos][1], riceData[i][ricePos][2], 0.0, 0.0, 0.0);
		riceData[i][rice3D] = CreateDynamic3DTextLabel(RICETEXT, COLOR_GREEN, riceData[i][ricePos][0], riceData[i][ricePos][1], riceData[i][ricePos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid) {
	RiceTake[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
		for(new i = 0; i < sizeof riceData; i++) {   
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(riceData[i][riceID], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
				if(IsValidDynamicObject(riceData[i][riceID]) && riceData[i][riceOn] == 0) {
					if(RiceTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, RICENAME);
						if(ammo >= 40)
							return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

						riceData[i][riceOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
						RiceTake[playerid] = 1;
						StartProgress(playerid, 50, 0, i);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_SELLRICE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "ข้าว");
				new price = ammo*priceRice;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ข้าว อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ข้าว {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ข้าว" , ammo);
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
	if(RiceTake[playerid] == 1) {
		new number = objectid;
		PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
		RiceTake[playerid] = 0;

		DestroyDynamic3DTextLabel(riceData[number][rice3D]);
		SetDynamicObjectPos(riceData[number][riceID], riceData[number][ricePos][0], riceData[number][ricePos][1], riceData[number][ricePos][2] - 5.0);
		defer CreateRiceObject(number);

		new ammo = Inventory_Count(playerid, RICENAME);
		if(AUTOFARM_STARTED(playerid) && AUTOFARM_GETJOBID(playerid) == JOB_RICE) {
			if(ammo >= 40)
				return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

			new id = Inventory_Add(playerid, RICENAME, 1);
			if (id == -1) return AUTOFARM_CANCELWITHREASON(playerid, "ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ข้าว +1");
			AUTOFARM_JOB_Finish(playerid);
		} else {
			if(ammo >= 40)
				return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

			new id = Inventory_Add(playerid, RICENAME, 1);
			
			if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ข้าว +1");
			
		}
	}
	return 1;
}

timer CreateRiceObject[10000](number) {
	SetDynamicObjectPos(riceData[number][riceID], riceData[number][ricePos][0], riceData[number][ricePos][1], riceData[number][ricePos][2]);
	riceData[number][rice3D] = CreateDynamic3DTextLabel(RICETEXT, COLOR_GREEN, riceData[number][ricePos][0], riceData[number][ricePos][1], riceData[number][ricePos][2] + 1.5, 5.0);
	riceData[number][riceOn] = 0;
}

hook OnAutoFarmWalk(playerid, jobid) {
	if(jobid == JOB_RICE) {
		if(GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND") != -1) {
			new Float:x, Float:y, Float:z, i = GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND");
			GetDynamicObjectPos(riceData[i][riceID], x, y, z);
			if(IsValidDynamicObject(riceData[i][riceID]) && riceData[i][riceOn] == 0) {
				AUTOFARM_SetFacingAnglePostion(playerid, riceData[i][ricePos][0], riceData[i][ricePos][1]);
				AutoFarm_WalkAnimation(playerid);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
					if(RiceTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, RICENAME);
						if(ammo >= 40)
							return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

						AutoFarm_StopWalkAnimation(playerid);
						AUTOFARM_JOB_GRAB(playerid);

						riceData[i][riceOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);

						RiceTake[playerid] = 1;
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
			new i = randomEx(0, sizeof(riceData) - 1), Float:x, Float:y, Float:z;
			GetDynamicObjectPos(riceData[i][riceID], x, y, z);
			if(IsValidDynamicObject(riceData[i][riceID]) && riceData[i][riceOn] == 0) {
				SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", i);
				AUTOFARM_SetFacingAnglePostion(playerid, riceData[i][ricePos][0], riceData[i][ricePos][1]);
				AutoFarm_WalkAnimation(playerid);
			}
		}
	}
	return 1;
}

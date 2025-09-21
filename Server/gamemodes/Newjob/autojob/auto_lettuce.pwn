#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_LETTUCE       	9
#define     LETTUCEOBJECT       15083
#define     LETTUCETEXT         "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     LETTUCENAME         "ผักกาด"

static LettuceTake[MAX_PLAYERS];

enum LETTUCE_DATA {
    lettuceID,
    lettuceObject, 
    Float:lettucePos[3],
    Text3D:lettuce3D,
    lettuceOn
};

new const lettuceData[MAX_LETTUCE][LETTUCE_DATA] = {
	{ 0, LETTUCEOBJECT, { 1941.306396, 74.846916, 28.126638 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 1, LETTUCEOBJECT, { 1951.720458, 73.540039, 27.462438 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 2, LETTUCEOBJECT, { 1964.059204, 72.465606, 27.144371 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 3, LETTUCEOBJECT, { 1965.494873, 81.578521, 27.530366 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 4, LETTUCEOBJECT, { 1953.931518, 83.003875, 27.642164 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 5, LETTUCEOBJECT, { 1941.273193, 84.550727, 28.390329 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 6, LETTUCEOBJECT, { 1940.860961, 95.981109, 28.834980 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 7, LETTUCEOBJECT, { 1953.365844, 95.906288, 28.363523 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 8, LETTUCEOBJECT, { 1964.776611, 96.384490, 28.242496 }, Text3D: INVALID_3DTEXT_ID,  0 }
};

hook OnGameModeInit() {
	for(new i = 0; i < sizeof(lettuceData); i++) {
		lettuceData[i][lettuceID] = CreateDynamicObject(lettuceData[i][lettuceObject], lettuceData[i][lettucePos][0], lettuceData[i][lettucePos][1], lettuceData[i][lettucePos][2], 0.0, 0.0, 0.0);
		lettuceData[i][lettuce3D] = CreateDynamic3DTextLabel(LETTUCETEXT, COLOR_GREEN, lettuceData[i][lettucePos][0], lettuceData[i][lettucePos][1], lettuceData[i][lettucePos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid) {
	LettuceTake[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
		for(new i = 0; i < sizeof lettuceData; i++) {   
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(lettuceData[i][lettuceID], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
				if(IsValidDynamicObject(lettuceData[i][lettuceID]) && lettuceData[i][lettuceOn] == 0) {
					if(LettuceTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, LETTUCENAME);
						if(ammo >= 40)
							return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

						lettuceData[i][lettuceOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
						LettuceTake[playerid] = 1;
						StartProgress(playerid, 50, 0, i);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_SELLLETTUCE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "ผักกาด");
				new price = ammo*priceLettuce;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ผักกาด อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ผักกาด {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ผักกาด" , ammo);
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
	if(LettuceTake[playerid] == 1) {
		new number = objectid;
		PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
		LettuceTake[playerid] = 0;

		DestroyDynamic3DTextLabel(lettuceData[number][lettuce3D]);
		SetDynamicObjectPos(lettuceData[number][lettuceID], lettuceData[number][lettucePos][0], lettuceData[number][lettucePos][1], lettuceData[number][lettucePos][2] - 5.0);
		defer CreateLettuceObject(number);

		new ammo = Inventory_Count(playerid, LETTUCENAME);
		if(AUTOFARM_STARTED(playerid) && AUTOFARM_GETJOBID(playerid) == JOB_LETTUCE) {
			if(ammo >= 40)
				return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

			new id = Inventory_Add(playerid, LETTUCENAME, 1);
			if (id == -1) return AUTOFARM_CANCELWITHREASON(playerid, "ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ผักกาด +1");
			AUTOFARM_JOB_Finish(playerid);
		} else {
			if(ammo >= 40)
				return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

			new id = Inventory_Add(playerid, LETTUCENAME, 1);
			
			if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ผักกาด +1");
		}
	}
	return 1;
}

timer CreateLettuceObject[10000](number) {
	SetDynamicObjectPos(lettuceData[number][lettuceID], lettuceData[number][lettucePos][0], lettuceData[number][lettucePos][1], lettuceData[number][lettucePos][2]);
	lettuceData[number][lettuce3D] = CreateDynamic3DTextLabel(LETTUCETEXT, COLOR_GREEN, lettuceData[number][lettucePos][0], lettuceData[number][lettucePos][1], lettuceData[number][lettucePos][2] + 1.5, 5.0);
	lettuceData[number][lettuceOn] = 0;
}

hook OnAutoFarmWalk(playerid, jobid) {
	if(jobid == JOB_LETTUCE) {
		if(GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND") != -1) {
			new Float:x, Float:y, Float:z, i = GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND");
			GetDynamicObjectPos(lettuceData[i][lettuceID], x, y, z);
			if(IsValidDynamicObject(lettuceData[i][lettuceID]) && lettuceData[i][lettuceOn] == 0) {
				AUTOFARM_SetFacingAnglePostion(playerid, lettuceData[i][lettucePos][0], lettuceData[i][lettucePos][1]);
				AutoFarm_WalkAnimation(playerid);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
					if(LettuceTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, LETTUCENAME);
						if(ammo >= 40)
							return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

						AutoFarm_StopWalkAnimation(playerid);
						AUTOFARM_JOB_GRAB(playerid);

						lettuceData[i][lettuceOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);

						LettuceTake[playerid] = 1;
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
			new i = randomEx(0, sizeof(lettuceData) - 1), Float:x, Float:y, Float:z;
			GetDynamicObjectPos(lettuceData[i][lettuceID], x, y, z);
			if(IsValidDynamicObject(lettuceData[i][lettuceID]) && lettuceData[i][lettuceOn] == 0) {
				SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", i);
				AUTOFARM_SetFacingAnglePostion(playerid, lettuceData[i][lettucePos][0], lettuceData[i][lettucePos][1]);
				AutoFarm_WalkAnimation(playerid);
			}
		}
	}
	return 1;
}

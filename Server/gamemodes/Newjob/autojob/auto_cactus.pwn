#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_CACTUS       	9
#define     CACTUSOBJECT       	15084
#define     CACTUSTEXT           "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     CACTUSNAME           "กระบองเพชร"

static CactusTake[MAX_PLAYERS];

enum CACTUS_DATA {
    cactusID,
    cactusObject, 
    Float:cactusPos[3],
    Text3D:cactus3D,
    cactusOn
};

new const cactusData[MAX_CACTUS][CACTUS_DATA] = {
	{ 0, CACTUSOBJECT, { 1122.908447, 740.548706, 9.818805 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 1, CACTUSOBJECT, { 1109.271118, 740.355407, 9.818805 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 2, CACTUSOBJECT, { 1096.723876, 740.177429, 9.818805 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 3, CACTUSOBJECT, { 1096.605712, 750.853576, 9.820312 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 4, CACTUSOBJECT, { 1096.785522, 761.176452, 9.820312 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 5, CACTUSOBJECT, { 1109.616699, 759.996582, 9.820312 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 6, CACTUSOBJECT, { 1109.531860, 751.021667, 9.820312 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 7, CACTUSOBJECT, { 1122.838012, 749.292480, 9.820312 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 8, CACTUSOBJECT, { 1122.420654, 758.801269, 9.820312 }, Text3D: INVALID_3DTEXT_ID,  0 }
};

hook OnGameModeInit() {
	for(new i = 0; i < sizeof(cactusData); i++) {
		cactusData[i][cactusID] = CreateDynamicObject(cactusData[i][cactusObject], cactusData[i][cactusPos][0], cactusData[i][cactusPos][1], cactusData[i][cactusPos][2], 0.0, 0.0, 0.0);
		cactusData[i][cactus3D] = CreateDynamic3DTextLabel(CACTUSTEXT, COLOR_GREEN, cactusData[i][cactusPos][0], cactusData[i][cactusPos][1], cactusData[i][cactusPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid) {
	CactusTake[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
		for(new i = 0; i < sizeof cactusData; i++) {   
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(cactusData[i][cactusID], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
				if(IsValidDynamicObject(cactusData[i][cactusID]) && cactusData[i][cactusOn] == 0) {
					if(CactusTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, CACTUSNAME);
						if(ammo >= 40)
							return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

						cactusData[i][cactusOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
						CactusTake[playerid] = 1;
						StartProgress(playerid, 50, 0, i);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_SELLCACTUS(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "กระบองเพชร");
				new price = ammo*priceCactus;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี กระบองเพชร อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย กระบองเพชร {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "กระบองเพชร" , ammo);
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
	if(CactusTake[playerid] == 1) {
		new number = objectid;
		PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
		CactusTake[playerid] = 0;

		DestroyDynamic3DTextLabel(cactusData[number][cactus3D]);
		SetDynamicObjectPos(cactusData[number][cactusID], cactusData[number][cactusPos][0], cactusData[number][cactusPos][1], cactusData[number][cactusPos][2] - 5.0);
		defer CreateCactusObject(number);

		new ammo = Inventory_Count(playerid, CACTUSNAME);
		if(AUTOFARM_STARTED(playerid) && AUTOFARM_GETJOBID(playerid) == JOB_CACTUS) {
			if(ammo >= 40)
				return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

			new id = Inventory_Add(playerid, CACTUSNAME, 1);
			if (id == -1) return AUTOFARM_CANCELWITHREASON(playerid, "ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}กระบองเพชร +1");
			AUTOFARM_JOB_Finish(playerid);
		} else {
			if(ammo >= 40)
				return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

			new id = Inventory_Add(playerid, CACTUSNAME, 1);
			if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}กระบองเพชร +1");
		}
	}
	return 1;
}

timer CreateCactusObject[10000](number) {
	SetDynamicObjectPos(cactusData[number][cactusID], cactusData[number][cactusPos][0], cactusData[number][cactusPos][1], cactusData[number][cactusPos][2]);
	cactusData[number][cactus3D] = CreateDynamic3DTextLabel(CACTUSTEXT, COLOR_GREEN, cactusData[number][cactusPos][0], cactusData[number][cactusPos][1], cactusData[number][cactusPos][2] + 1.5, 5.0);
	cactusData[number][cactusOn] = 0;
}

hook OnAutoFarmWalk(playerid, jobid) {
	if(jobid == JOB_CACTUS) {
		if(GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND") != -1) {
			new Float:x, Float:y, Float:z, i = GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND");
			GetDynamicObjectPos(cactusData[i][cactusID], x, y, z);
			if(IsValidDynamicObject(cactusData[i][cactusID]) && cactusData[i][cactusOn] == 0) {
				AUTOFARM_SetFacingAnglePostion(playerid, cactusData[i][cactusPos][0], cactusData[i][cactusPos][1]);
				AutoFarm_WalkAnimation(playerid);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
					if(CactusTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, CACTUSNAME);
						if(ammo >= 40)
							return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

						AutoFarm_StopWalkAnimation(playerid);
						AUTOFARM_JOB_GRAB(playerid);

						cactusData[i][cactusOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);

						CactusTake[playerid] = 1;
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
			new i = randomEx(0, sizeof(cactusData) - 1), Float:x, Float:y, Float:z;
			GetDynamicObjectPos(cactusData[i][cactusID], x, y, z);
			if(IsValidDynamicObject(cactusData[i][cactusID]) && cactusData[i][cactusOn] == 0) {
				SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", i);
				AUTOFARM_SetFacingAnglePostion(playerid, cactusData[i][cactusPos][0], cactusData[i][cactusPos][1]);
				AutoFarm_WalkAnimation(playerid);
			}
		}
	}
	return 1;
}

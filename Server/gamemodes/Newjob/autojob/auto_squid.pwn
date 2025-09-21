#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_SQUID       	9
#define     SQUIDOBJECT       	15065
#define     SQUIDTEXT          "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     SQUIDNAME          "ปลาหมึก"

static SquidTake[MAX_PLAYERS];

enum SQUID_DATA {
    squidID,
    squidObject, 
    Float:squidPos[3],
    Text3D:squid3D,
    squidOn
};

new const squidData[MAX_SQUID][SQUID_DATA] = {
	{ 0, SQUIDOBJECT, { 2913.134765, -1965.528076, 0.192872 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 1, SQUIDOBJECT, { 2913.003662, -1982.931030, 0.118001 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 2, SQUIDOBJECT, { 2913.124267, -1998.249023, 0.146059 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 3, SQUIDOBJECT, { 2901.762207, -1998.212036, 1.998935 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 4, SQUIDOBJECT, { 2902.312988, -1982.129638, 1.720637 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 5, SQUIDOBJECT, { 2902.570556, -1964.530151, 1.643463 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 6, SQUIDOBJECT, { 2892.323730, -1964.467041, 3.771721 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 7, SQUIDOBJECT, { 2892.536621, -1982.563598, 3.824063 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 8, SQUIDOBJECT, { 2893.075439, -1998.792724, 3.662057 }, Text3D: INVALID_3DTEXT_ID,  0 }

};

hook OnGameModeInit() {
	for(new i = 0; i < sizeof(squidData); i++) {
		squidData[i][squidID] = CreateDynamicObject(squidData[i][squidObject], squidData[i][squidPos][0], squidData[i][squidPos][1], squidData[i][squidPos][2], 0.0, 0.0, 0.0);
		squidData[i][squid3D] = CreateDynamic3DTextLabel(SQUIDTEXT, COLOR_GREEN, squidData[i][squidPos][0], squidData[i][squidPos][1], squidData[i][squidPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid) {
	SquidTake[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
		for(new i = 0; i < sizeof squidData; i++) {   
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(squidData[i][squidID], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
				if(IsValidDynamicObject(squidData[i][squidID]) && squidData[i][squidOn] == 0) {
					if(SquidTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, SQUIDNAME);
						if(ammo >= 40)
							return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

						squidData[i][squidOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
						SquidTake[playerid] = 1;
						StartProgress(playerid, 50, 0, i);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_SELLSQUID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "ปลาหมึก");
				new price = ammo*priceSquid;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ปลาหมึก อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ปลาหมึก {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ปลาหมึก" , ammo);
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
	if(SquidTake[playerid] == 1) {
		new number = objectid;
		PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
		SquidTake[playerid] = 0;

		DestroyDynamic3DTextLabel(squidData[number][squid3D]);
		SetDynamicObjectPos(squidData[number][squidID], squidData[number][squidPos][0], squidData[number][squidPos][1], squidData[number][squidPos][2] - 5.0);
		defer CreateSquidObject(number);

		new ammo = Inventory_Count(playerid, SQUIDNAME);
		if(AUTOFARM_STARTED(playerid) && AUTOFARM_GETJOBID(playerid) == JOB_SQUID) {
			if(ammo >= 40)
				return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

			new id = Inventory_Add(playerid, SQUIDNAME, 1);
			if (id == -1) return AUTOFARM_CANCELWITHREASON(playerid, "ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ปลาหมึก +1");
			AUTOFARM_JOB_Finish(playerid);
		} else {
			if(ammo >= 40)
				return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

			new id = Inventory_Add(playerid, SQUIDNAME, 1);
			
			if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ปลาหมึก +1");
			
		}
	}
	return 1;
}

timer CreateSquidObject[10000](number) {
	SetDynamicObjectPos(squidData[number][squidID], squidData[number][squidPos][0], squidData[number][squidPos][1], squidData[number][squidPos][2]);
	squidData[number][squid3D] = CreateDynamic3DTextLabel(SQUIDTEXT, COLOR_GREEN, squidData[number][squidPos][0], squidData[number][squidPos][1], squidData[number][squidPos][2] + 1.5, 5.0);
	squidData[number][squidOn] = 0;
}

hook OnAutoFarmWalk(playerid, jobid) {
	if(jobid == JOB_SQUID) {
		if(GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND") != -1) {
			new Float:x, Float:y, Float:z, i = GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND");
			GetDynamicObjectPos(squidData[i][squidID], x, y, z);
			if(IsValidDynamicObject(squidData[i][squidID]) && squidData[i][squidOn] == 0) {
				AUTOFARM_SetFacingAnglePostion(playerid, squidData[i][squidPos][0], squidData[i][squidPos][1]);
				AutoFarm_WalkAnimation(playerid);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
					if(SquidTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, SQUIDNAME);
						if(ammo >= 40)
							return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

						AutoFarm_StopWalkAnimation(playerid);
						AUTOFARM_JOB_GRAB(playerid);

						squidData[i][squidOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);

						SquidTake[playerid] = 1;
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
			new i = randomEx(0, sizeof(squidData) - 1), Float:x, Float:y, Float:z;
			GetDynamicObjectPos(squidData[i][squidID], x, y, z);
			if(IsValidDynamicObject(squidData[i][squidID]) && squidData[i][squidOn] == 0) {
				SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", i);
				AUTOFARM_SetFacingAnglePostion(playerid, squidData[i][squidPos][0], squidData[i][squidPos][1]);
				AutoFarm_WalkAnimation(playerid);
			}
		}
	}
	return 1;
}

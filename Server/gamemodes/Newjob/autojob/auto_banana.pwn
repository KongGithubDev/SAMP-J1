#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_BANANA       	9
#define     BANANAOBJECT       	15082
#define     BANANATEXT           "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     BANANANAME           "กล้วย"

static BananaTake[MAX_PLAYERS];

enum BANANA_DATA {
    bananaID,
    bananaObject, 
    Float:bananaPos[3],
    Text3D:banana3D,
    bananaOn
};

new const bananaData[MAX_BANANA][BANANA_DATA] = {
	{ 0, BANANAOBJECT, { -967.856018, -587.841979, 25.319290 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 1, BANANAOBJECT, { -955.485900, -586.561950, 25.017330 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 2, BANANAOBJECT, { -943.176391, -585.255920, 24.834999 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 3, BANANAOBJECT, { -942.463195, -573.431579, 24.875003 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 4, BANANAOBJECT, { -955.415649, -572.998291, 24.727951 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 5, BANANAOBJECT, { -968.494079, -575.677795, 24.644989 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 6, BANANAOBJECT, { -969.099426, -563.605590, 26.251501 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 7, BANANAOBJECT, { -954.674072, -562.878784, 26.555675 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 8, BANANAOBJECT, { -941.605285, -564.598937, 26.192867 }, Text3D: INVALID_3DTEXT_ID,  0 }
};

hook OnGameModeInit() {
	for(new i = 0; i < sizeof(bananaData); i++) {
		bananaData[i][bananaID] = CreateDynamicObject(bananaData[i][bananaObject], bananaData[i][bananaPos][0], bananaData[i][bananaPos][1], bananaData[i][bananaPos][2], 0.0, 0.0, 0.0);
		bananaData[i][banana3D] = CreateDynamic3DTextLabel(BANANATEXT, COLOR_GREEN, bananaData[i][bananaPos][0], bananaData[i][bananaPos][1], bananaData[i][bananaPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid) {
	BananaTake[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
		for(new i = 0; i < sizeof bananaData; i++) {   
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(bananaData[i][bananaID], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
				if(IsValidDynamicObject(bananaData[i][bananaID]) && bananaData[i][bananaOn] == 0) {
					if(BananaTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, BANANANAME);
						if(ammo >= 40)
							return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

						bananaData[i][bananaOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
						BananaTake[playerid] = 1;
						StartProgress(playerid, 50, 0, i);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_SELLBANANA(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "กล้วย");
				new price = ammo*priceBanana;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี กล้วย อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย กล้วย {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "กล้วย" , ammo);
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
	if(BananaTake[playerid] == 1) {
		new number = objectid;
		PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
		BananaTake[playerid] = 0;

		DestroyDynamic3DTextLabel(bananaData[number][banana3D]);
		SetDynamicObjectPos(bananaData[number][bananaID], bananaData[number][bananaPos][0], bananaData[number][bananaPos][1], bananaData[number][bananaPos][2] - 5.0);
		defer CreateBananaObject(number);

		new ammo = Inventory_Count(playerid, BANANANAME);
		if(AUTOFARM_STARTED(playerid) && AUTOFARM_GETJOBID(playerid) == JOB_BANANA) {
			if(ammo >= 40)
				return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

			/*new id = Inventory_Add(playerid, BANANANAME, 1);
			if (id == -1) return AUTOFARM_CANCELWITHREASON(playerid, "ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}กล้วย +1");*/

			new amount = GiveItem(playerid, "กล้วย", 1);
			if (amount == -1) 
				return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");

			new ammoo = Inventory_Count(playerid, BANANANAME);

			new string[128];
			format(string, sizeof string, "{00FF00}[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}กล้วย +%d {ffffff}(%d/50)", amount, ammoo);
			SendClientMessage(playerid, COLOR_GREEN, string);

			AUTOFARM_JOB_Finish(playerid);
		} else {
			if(ammo >= 40)
				return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

			/*new id = Inventory_Add(playerid, BANANANAME, 1);
			
			if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}กล้วย +1");*/

			new amount = GiveItem(playerid, "กล้วย", 1);
			if (amount == -1) 
				return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");

			new ammoo = Inventory_Count(playerid, BANANANAME);

			new string[128];
			format(string, sizeof string, "{00FF00}[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}กล้วย +%d {ffffff}(%d/40)", amount, ammoo);
			SendClientMessage(playerid, COLOR_GREEN, string);
		}
	}
	return 1;
}

timer CreateBananaObject[10000](number) {
	SetDynamicObjectPos(bananaData[number][bananaID], bananaData[number][bananaPos][0], bananaData[number][bananaPos][1], bananaData[number][bananaPos][2]);
	bananaData[number][banana3D] = CreateDynamic3DTextLabel(BANANATEXT, COLOR_GREEN, bananaData[number][bananaPos][0], bananaData[number][bananaPos][1], bananaData[number][bananaPos][2] + 1.5, 5.0);
	bananaData[number][bananaOn] = 0;
}

hook OnAutoFarmWalk(playerid, jobid) {
	if(jobid == JOB_BANANA) {
		if(GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND") != -1) {
			new Float:x, Float:y, Float:z, i = GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND");
			GetDynamicObjectPos(bananaData[i][bananaID], x, y, z);
			if(IsValidDynamicObject(bananaData[i][bananaID]) && bananaData[i][bananaOn] == 0) {
				AUTOFARM_SetFacingAnglePostion(playerid, bananaData[i][bananaPos][0], bananaData[i][bananaPos][1]);
				AutoFarm_WalkAnimation(playerid);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
					if(BananaTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, BANANANAME);
						if(ammo >= 40)
							return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

						AutoFarm_StopWalkAnimation(playerid);
						AUTOFARM_JOB_GRAB(playerid);

						bananaData[i][bananaOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);

						BananaTake[playerid] = 1;
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
			new i = randomEx(0, sizeof(bananaData) - 1), Float:x, Float:y, Float:z;
			GetDynamicObjectPos(bananaData[i][bananaID], x, y, z);
			if(IsValidDynamicObject(bananaData[i][bananaID]) && bananaData[i][bananaOn] == 0) {
				SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", i);
				AUTOFARM_SetFacingAnglePostion(playerid, bananaData[i][bananaPos][0], bananaData[i][bananaPos][1]);
				AutoFarm_WalkAnimation(playerid);
			}
		}
	}
	return 1;
}

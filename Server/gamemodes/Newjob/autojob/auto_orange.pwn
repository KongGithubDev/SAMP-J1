#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define     MAX_ORANGE       	9
#define     ORANGEOBJECT       	15068
#define     ORANGETEXT           "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     ORANGENAME           "ส้ม"

static OrangeTake[MAX_PLAYERS];

enum ORANGE_DATA {
    orangeID,
    orangeObject, 
    Float:orangePos[3],
    Text3D:orange3D,
    orangeOn
};

new const orangeData[MAX_ORANGE][ORANGE_DATA] = {
	{ 0, ORANGEOBJECT, { 1479.291992, -70.037094, 18.977657 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 1, ORANGEOBJECT, { 1447.264770, -72.870033, 18.908229 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 2, ORANGEOBJECT, { 1464.032104, -71.455307, 18.950044 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 3, ORANGEOBJECT, { 1442.441406, -54.012931, 21.263214 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 4, ORANGEOBJECT, { 1463.768798, -52.024955, 20.782144 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 5, ORANGEOBJECT, { 1479.602661, -53.245193, 20.256366 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 6, ORANGEOBJECT, { 1479.022583, -36.595081, 21.725208 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 7, ORANGEOBJECT, { 1462.439331, -37.583892, 22.326099 }, Text3D: INVALID_3DTEXT_ID,  0 },
	{ 8, ORANGEOBJECT, { 1438.397216, -40.509784, 23.085929 }, Text3D: INVALID_3DTEXT_ID,  0 }

};

hook OnGameModeInit() {
	for(new i = 0; i < sizeof(orangeData); i++) {
		orangeData[i][orangeID] = CreateDynamicObject(orangeData[i][orangeObject], orangeData[i][orangePos][0], orangeData[i][orangePos][1], orangeData[i][orangePos][2], 0.0, 0.0, 0.0);
		orangeData[i][orange3D] = CreateDynamic3DTextLabel(ORANGETEXT, COLOR_GREEN, orangeData[i][orangePos][0], orangeData[i][orangePos][1], orangeData[i][orangePos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid) {
	OrangeTake[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)) {
		for(new i = 0; i < sizeof orangeData; i++) {   
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(orangeData[i][orangeID], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
				if(IsValidDynamicObject(orangeData[i][orangeID]) && orangeData[i][orangeOn] == 0) {
					if(OrangeTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, ORANGENAME);
						if(ammo >= 40)
							return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

						orangeData[i][orangeOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 0, 0, 1);
						OrangeTake[playerid] = 1;
						StartProgress(playerid, 50, 0, i);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_SELLORANGE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "ส้ม");
				new price = ammo*priceOrange;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ส้ม อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ส้ม {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ส้ม" , ammo);
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
	if(OrangeTake[playerid] == 1) {
		new number = objectid;
		PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid);
		OrangeTake[playerid] = 0;

		DestroyDynamic3DTextLabel(orangeData[number][orange3D]);
		SetDynamicObjectPos(orangeData[number][orangeID], orangeData[number][orangePos][0], orangeData[number][orangePos][1], orangeData[number][orangePos][2] - 5.0);
		defer CreateOrangeObject(number);

		new ammo = Inventory_Count(playerid, ORANGENAME);
		if(AUTOFARM_STARTED(playerid) && AUTOFARM_GETJOBID(playerid) == JOB_ORANGE) {
			if(ammo >= 40)
				return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

			new id = Inventory_Add(playerid, ORANGENAME, 1);
			if (id == -1) return AUTOFARM_CANCELWITHREASON(playerid, "ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ส้ม +1");
			AUTOFARM_JOB_Finish(playerid);
		} else {
			if(ammo >= 40)
				return SendClientMessageEx(playerid, COLOR_RED, "%d/40 เต็มแล้ว", ammo);

			new id = Inventory_Add(playerid, ORANGENAME, 1);
			
			if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
			GivePlayerExp(playerid, 5);
			SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ส้ม +1");
			
		}
	}
	return 1;
}

timer CreateOrangeObject[10000](number) {
	SetDynamicObjectPos(orangeData[number][orangeID], orangeData[number][orangePos][0], orangeData[number][orangePos][1], orangeData[number][orangePos][2]);
	orangeData[number][orange3D] = CreateDynamic3DTextLabel(ORANGETEXT, COLOR_GREEN, orangeData[number][orangePos][0], orangeData[number][orangePos][1], orangeData[number][orangePos][2] + 1.5, 5.0);
	orangeData[number][orangeOn] = 0;
}

hook OnAutoFarmWalk(playerid, jobid) {
	if(jobid == JOB_ORANGE) {
		if(GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND") != -1) {
			new Float:x, Float:y, Float:z, i = GetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND");
			GetDynamicObjectPos(orangeData[i][orangeID], x, y, z);
			if(IsValidDynamicObject(orangeData[i][orangeID]) && orangeData[i][orangeOn] == 0) {
				AUTOFARM_SetFacingAnglePostion(playerid, orangeData[i][orangePos][0], orangeData[i][orangePos][1]);
				AutoFarm_WalkAnimation(playerid);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) {
					if(OrangeTake[playerid] == 0) {
						new ammo = Inventory_Count(playerid, ORANGENAME);
						if(ammo >= 40)
							return AUTOFARM_CANCELWITHREASON(playerid, sprintf("%d/40 เต็มแล้ว", ammo));

						AutoFarm_StopWalkAnimation(playerid);
						AUTOFARM_JOB_GRAB(playerid);

						orangeData[i][orangeOn] = 1;
						TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 0, 0, 1);

						OrangeTake[playerid] = 1;
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
			new i = randomEx(0, sizeof(orangeData) - 1), Float:x, Float:y, Float:z;
			GetDynamicObjectPos(orangeData[i][orangeID], x, y, z);
			if(IsValidDynamicObject(orangeData[i][orangeID]) && orangeData[i][orangeOn] == 0) {
				SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", i);
				AUTOFARM_SetFacingAnglePostion(playerid, orangeData[i][orangePos][0], orangeData[i][orangePos][1]);
				AutoFarm_WalkAnimation(playerid);
			}
		}
	}
	return 1;
}

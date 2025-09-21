#include <YSI_Coding\y_hooks>

new pairCar[MAX_PLAYERS];
new refillFuel[MAX_PLAYERS];

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if ((newkeys & KEY_CTRL_BACK || newkeys & KEY_CROUCH) && (GetFactionType(playerid) == FACTION_MEC))
    {
        if (!playerData[playerid][pOnDuty])
            return SendClientMessage(playerid, COLOR_RED, "ระบบ : {FFFFFF}คุณต้องเข้าเวรก่อน!");

        if (!IsPlayerInAnyVehicle(playerid))
            return SendClientMessage(playerid, COLOR_RED, "ระบบ : {FFFFFF}คุณต้องอยู่ในรถ!");

        Dialog_Show(playerid, DIALOG_MEC, DIALOG_STYLE_TABLIST, "{FFFF00}เมนูช่าง", "{FFFFFF}+ ซ่อมรถ\n+ เติมน้ำมัน\n+ เปลี่ยนสีรถ", "ตกลง", "ยกเลิก");
    }
    return 1;
}

Dialog:DIALOG_MEC(playerid, response, listitem, inputtext[])
{
    if (response)
    {
        if (!IsPlayerInAnyVehicle(playerid))
            return SendClientMessage(playerid, COLOR_RED, "ระบบ :{FFFFFF}คุณต้องอยู่ในรถ!");

        if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเป็นคนขับถึงจะทำเช่นนี้ได้");

        switch(listitem)
        {
            case 0:
            {
                pairCar[playerid] = 1;
                StartProgress(playerid, 100, 0, 0);
            }
            case 1:
            {
                refillFuel[playerid] = 1;
                StartProgress(playerid, 100, 0, 0);
            }
            case 2:
            {
                Dialog_Show(playerid, DIALOG_COLOR1, DIALOG_STYLE_INPUT, "[เลือกสี]", "{FFFFFF}เลือกสีที่ต้องการ 0-255 (สีที่ 1)", "ตกลง", "กลับ");
            }
        }
    }
    return 1;
}

ProgressRepairFinished(playerid) /****************** ใส่ลบเงินหรืออะไรในนี้ได้เลย *********************/
{
    if (!IsPlayerInAnyVehicle(playerid))
        return SendClientMessage(playerid, COLOR_RED, "ระบบ : {FFFFFF}คุณต้องอยู่ในรถ!");
    new vehicleid = GetPlayerVehicleID(playerid);
    RepairVehicle(vehicleid);
    SendClientMessage(playerid, COLOR_ORANGE, "ระบบ :{FFFFFF}ซ่อมรถสำเร็จ");
    pairCar[playerid] = 0;
    return 1;
}

RefillFuel(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if (vehicleid == INVALID_VEHICLE_ID) return 0;

    new modelid = GetVehicleModel(vehicleid);
    if (modelid < 400 || modelid > 611) return SendClientMessage(playerid, COLOR_RED, "ระบบ : {FFFFFF}ไม่สามารถเติมน้ำมันได้กับรถรุ่นนี้");

    new index = modelid - 400;
    new Float:maxfuel = vehicleData[index][vFuel];

    new Float:fuel = maxfuel - vehicleFuel[vehicleid];

    if (vehicleFuel[vehicleid] >= maxfuel)
        return SendClientMessageEx(playerid, COLOR_RED, "ระบบ : {FFFFFF}ไม่สามารถเติมน้ำมันมากกว่านี้ได้ (%.2f/%.2f)", vehicleFuel[vehicleid], maxfuel);

    vehicleFuel[vehicleid] += fuel;

    SendClientMessageEx(playerid, COLOR_ORANGE, "ระบบ : {FFFFFF}คุณได้เติมน้ำมัน %.1f ลิตร ", fuel);
    refillFuel[playerid] = 0;
    return 1;
}


hook OnProgressFinish(playerid, objectid)
{
	if(pairCar[playerid] == 1)
		ProgressRepairFinished(playerid);
	if(refillFuel[playerid] == 1)
		RefillFuel(playerid);
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(pairCar[playerid] == 1)
	{
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(refillFuel[playerid] == 1)
	{
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

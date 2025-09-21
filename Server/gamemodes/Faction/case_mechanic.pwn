#include <YSI_Coding\y_hooks>

new pairCar[MAX_PLAYERS];
new refillFuel[MAX_PLAYERS];

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if ((newkeys & KEY_CTRL_BACK || newkeys & KEY_CROUCH) && (GetFactionType(playerid) == FACTION_MEC))
    {
        if (!playerData[playerid][pOnDuty])
            return SendClientMessage(playerid, COLOR_RED, "�к� : {FFFFFF}�س��ͧ�����á�͹!");

        if (!IsPlayerInAnyVehicle(playerid))
            return SendClientMessage(playerid, COLOR_RED, "�к� : {FFFFFF}�س��ͧ�����ö!");

        Dialog_Show(playerid, DIALOG_MEC, DIALOG_STYLE_TABLIST, "{FFFF00}���٪�ҧ", "{FFFFFF}+ ����ö\n+ �������ѹ\n+ ����¹��ö", "��ŧ", "¡��ԡ");
    }
    return 1;
}

Dialog:DIALOG_MEC(playerid, response, listitem, inputtext[])
{
    if (response)
    {
        if (!IsPlayerInAnyVehicle(playerid))
            return SendClientMessage(playerid, COLOR_RED, "�к� :{FFFFFF}�س��ͧ�����ö!");

        if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "�س��ͧ�繤��Ѻ�֧�з��蹹����");

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
                Dialog_Show(playerid, DIALOG_COLOR1, DIALOG_STYLE_INPUT, "[���͡��]", "{FFFFFF}���͡�շ���ͧ��� 0-255 (�շ�� 1)", "��ŧ", "��Ѻ");
            }
        }
    }
    return 1;
}

ProgressRepairFinished(playerid) /****************** ���ź�Թ��������㹹������� *********************/
{
    if (!IsPlayerInAnyVehicle(playerid))
        return SendClientMessage(playerid, COLOR_RED, "�к� : {FFFFFF}�س��ͧ�����ö!");
    new vehicleid = GetPlayerVehicleID(playerid);
    RepairVehicle(vehicleid);
    SendClientMessage(playerid, COLOR_ORANGE, "�к� :{FFFFFF}����ö�����");
    pairCar[playerid] = 0;
    return 1;
}

RefillFuel(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if (vehicleid == INVALID_VEHICLE_ID) return 0;

    new modelid = GetVehicleModel(vehicleid);
    if (modelid < 400 || modelid > 611) return SendClientMessage(playerid, COLOR_RED, "�к� : {FFFFFF}�������ö�������ѹ��Ѻö��蹹��");

    new index = modelid - 400;
    new Float:maxfuel = vehicleData[index][vFuel];

    new Float:fuel = maxfuel - vehicleFuel[vehicleid];

    if (vehicleFuel[vehicleid] >= maxfuel)
        return SendClientMessageEx(playerid, COLOR_RED, "�к� : {FFFFFF}�������ö�������ѹ�ҡ���ҹ���� (%.2f/%.2f)", vehicleFuel[vehicleid], maxfuel);

    vehicleFuel[vehicleid] += fuel;

    SendClientMessageEx(playerid, COLOR_ORANGE, "�к� : {FFFFFF}�س���������ѹ %.1f �Ե� ", fuel);
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

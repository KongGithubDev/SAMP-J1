#include	<YSI_Coding\y_hooks>

#define 	MAX_CALLCAR 			(200)
enum CALLCAR_DATA {
	callcarID,
	callcarExists,
	Float:callcarPosX,
	Float:callcarPosY,
	Float:callcarPosZ,
	Text3D:callcarText3D,
	callcarPickup
};
new callcarData[MAX_CALLCAR][CALLCAR_DATA];

forward Callcar_Load();
public Callcar_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_CALLCAR)
	{
	    callcarData[i][callcarExists] = true;

	    cache_get_value_name_int(i, "callcarID", callcarData[i][callcarID]);
	    cache_get_value_name_float(i, "callcarX", callcarData[i][callcarPosX]);
	    cache_get_value_name_float(i, "callcarY", callcarData[i][callcarPosY]);
	    cache_get_value_name_float(i, "callcarZ", callcarData[i][callcarPosZ]);

	    Callcar_Refresh(i);
	}
	printf("[SERVER]: %i Callcar were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnCallcarCreated(callcarid);
public OnCallcarCreated(callcarid)
{
	if (callcarid == -1 || !callcarData[callcarid][callcarExists])
	    return 0;

	callcarData[callcarid][callcarID] = cache_insert_id();
	Callcar_Save(callcarid);

	return 1;
}

Callcar_Nearest(playerid)
{
    for (new i = 0; i != MAX_CALLCAR; i ++) if (callcarData[i][callcarExists] && IsPlayerInRangeOfPoint(playerid, 4.0, callcarData[i][callcarPosX], callcarData[i][callcarPosY], callcarData[i][callcarPosZ]))
	{
		return i;
	}
	return -1;
}

Callcar_Delete(pumpid)
{
	if (pumpid != -1 && callcarData[pumpid][callcarExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(callcarData[pumpid][callcarPickup]))
		    DestroyDynamicPickup(callcarData[pumpid][callcarPickup]);

		if (IsValidDynamic3DTextLabel(callcarData[pumpid][callcarText3D]))
		    DestroyDynamic3DTextLabel(callcarData[pumpid][callcarText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `callcar` WHERE `callcarID` = '%d'", callcarData[pumpid][callcarID]);
		mysql_tquery(g_SQL, string);

		callcarData[pumpid][callcarExists] = false;
		callcarData[pumpid][callcarID] = 0;
	}
	return 1;
}

Callcar_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_CALLCAR; i ++) if (!callcarData[i][callcarExists])
	{
	    callcarData[i][callcarExists] = true;
	    callcarData[i][callcarPosX] = x;
	    callcarData[i][callcarPosY] = y;
	    callcarData[i][callcarPosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `callcar` (`callcarID`) VALUES(0)", "OnCallcarCreated", "d", i);
		Callcar_Refresh(i);
		return i;
	}
	return -1;
}

Callcar_Save(pumpid)
{
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `callcar` SET `callcarX` = '%.4f', `callcarY` = '%.4f', `callcarZ` = '%.4f' WHERE `callcarID` = '%d'",
	    callcarData[pumpid][callcarPosX],
	    callcarData[pumpid][callcarPosY],
	    callcarData[pumpid][callcarPosZ],
	    callcarData[pumpid][callcarID]
	);
	return mysql_tquery(g_SQL, query);
}

Callcar_Refresh(pumpid)
{
	if (pumpid != -1 && callcarData[pumpid][callcarExists])
	{
		if (IsValidDynamicPickup(callcarData[pumpid][callcarPickup]))
		    DestroyDynamicPickup(callcarData[pumpid][callcarPickup]);

		if (IsValidDynamic3DTextLabel(callcarData[pumpid][callcarText3D]))
		    DestroyDynamic3DTextLabel(callcarData[pumpid][callcarText3D]);

		callcarData[pumpid][callcarPickup] = CreateDynamicPickup(19134, 30, callcarData[pumpid][callcarPosX], callcarData[pumpid][callcarPosY], callcarData[pumpid][callcarPosZ] - 1.1);
  		callcarData[pumpid][callcarText3D] = CreateDynamic3DTextLabel("{FC2A0D}[การาจเรียกรถ]\n{FFFFFF}กด 'H' เพื่อเรียกรถ", COLOR_GREEN, callcarData[pumpid][callcarPosX], callcarData[pumpid][callcarPosY], callcarData[pumpid][callcarPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

// --> การาจเรียกรถ
CMD:createcallcar(playerid, params[])
{
	static
	    id = -1,
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

	if (playerData[playerid][pAdmin] < 4)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}สำหรับผู้ดูแลระบบระดับ 4 ขึ้นไปเท่านั้น!");

	if (GetPlayerInterior(playerid) != 0)
	    return 1;

	id = Callcar_Create(x, y, z);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของการาจเรียกรถในฐานข้อมูลเต็มแล้ว ไม่สามารถสร้างได้อีก (ติดต่อผู้พัฒนา)");

	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้สร้างการาจเรีกยรถขึ้นมาใหม่ ไอดี: %d", id);
	return 1;
}

CMD:deletecallcar(playerid, params[])
{
	static
	    id = 0;

	if (playerData[playerid][pAdmin] < 4)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}สำหรับผู้ดูแลระบบระดับ 4 ขึ้นไปเท่านั้น!");

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "การใช้งาน : /deletecallcar [ไอดี]");

	if ((id < 0 || id >= MAX_CALLCAR) || !callcarData[id][callcarExists])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีไอดีการาจเรียกรถนี้อยู่ในฐานข้อมูล");

	Callcar_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ลบปั้มการาจเรียกรถไอดี %d ออกสำเร็จ", id);
	return 1;
}



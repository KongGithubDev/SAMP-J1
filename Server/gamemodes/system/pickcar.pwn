#include	<YSI_Coding\y_hooks>

#define 	MAX_PICKCAR 			(200)
enum Pickcar_DATA {
	PickcarID,
	PickcarExists,
	Float:PickcarPosX,
	Float:PickcarPosY,
	Float:PickcarPosZ,
	Text3D:PickcarText3D,
	PickcarPickup
};
new PickcarData[MAX_PICKCAR][Pickcar_DATA];

forward Pickcar_Load();
public Pickcar_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_PICKCAR)
	{
	    PickcarData[i][PickcarExists] = true;

	    cache_get_value_name_int(i, "PickcarID", PickcarData[i][PickcarID]);
	    cache_get_value_name_float(i, "PickcarX", PickcarData[i][PickcarPosX]);
	    cache_get_value_name_float(i, "PickcarY", PickcarData[i][PickcarPosY]);
	    cache_get_value_name_float(i, "PickcarZ", PickcarData[i][PickcarPosZ]);

	    Pickcar_Refresh(i);
	}
	printf("[SERVER]: %i Pickcar were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnPickcarCreated(Pickcarid);
public OnPickcarCreated(Pickcarid)
{
	if (Pickcarid == -1 || !PickcarData[Pickcarid][PickcarExists])
	    return 0;

	PickcarData[Pickcarid][PickcarID] = cache_insert_id();
	Pickcar_Save(Pickcarid);

	return 1;
}

Pickcar_Nearest(playerid)
{
    for (new i = 0; i != MAX_PICKCAR; i ++) if (PickcarData[i][PickcarExists] && IsPlayerInRangeOfPoint(playerid, 4.0, PickcarData[i][PickcarPosX], PickcarData[i][PickcarPosY], PickcarData[i][PickcarPosZ]))
	{
		return i;
	}
	return -1;
}

CheckPlayerPickcar(playerid)
{
    for (new i = 0; i != MAX_PICKCAR; i ++) if (PickcarData[i][PickcarExists] && IsPlayerInRangeOfPoint(playerid, 1.5, PickcarData[i][PickcarPosX], PickcarData[i][PickcarPosY], PickcarData[i][PickcarPosZ]))
	{
		return i;
	}
	return -1;
}

Pickcar_Delete(pumpid)
{
	if (pumpid != -1 && PickcarData[pumpid][PickcarExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(PickcarData[pumpid][PickcarPickup]))
		    DestroyDynamicPickup(PickcarData[pumpid][PickcarPickup]);

		if (IsValidDynamic3DTextLabel(PickcarData[pumpid][PickcarText3D]))
		    DestroyDynamic3DTextLabel(PickcarData[pumpid][PickcarText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `Pickcar` WHERE `PickcarID` = '%d'", PickcarData[pumpid][PickcarID]);
		mysql_tquery(g_SQL, string);

		PickcarData[pumpid][PickcarExists] = false;
		PickcarData[pumpid][PickcarID] = 0;
	}
	return 1;
}

Pickcar_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_PICKCAR; i ++) if (!PickcarData[i][PickcarExists])
	{
	    PickcarData[i][PickcarExists] = true;
	    PickcarData[i][PickcarPosX] = x;
	    PickcarData[i][PickcarPosY] = y;
	    PickcarData[i][PickcarPosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `Pickcar` (`PickcarID`) VALUES(0)", "OnPickcarCreated", "d", i);
		Pickcar_Refresh(i);
		return i;
	}
	return -1;
}

Pickcar_Save(pumpid)
{
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `Pickcar` SET `PickcarX` = '%.4f', `PickcarY` = '%.4f', `PickcarZ` = '%.4f' WHERE `PickcarID` = '%d'",
	    PickcarData[pumpid][PickcarPosX],
	    PickcarData[pumpid][PickcarPosY],
	    PickcarData[pumpid][PickcarPosZ],
	    PickcarData[pumpid][PickcarID]
	);
	return mysql_tquery(g_SQL, query);
}

Pickcar_Refresh(pumpid)
{
	if (pumpid != -1 && PickcarData[pumpid][PickcarExists])
	{
		if (IsValidDynamicPickup(PickcarData[pumpid][PickcarPickup]))
		    DestroyDynamicPickup(PickcarData[pumpid][PickcarPickup]);

		if (IsValidDynamic3DTextLabel(PickcarData[pumpid][PickcarText3D]))
		    DestroyDynamic3DTextLabel(PickcarData[pumpid][PickcarText3D]);

		PickcarData[pumpid][PickcarPickup] = CreateDynamicPickup(19605, 23, PickcarData[pumpid][PickcarPosX], PickcarData[pumpid][PickcarPosY], PickcarData[pumpid][PickcarPosZ] - 1.1);
  		PickcarData[pumpid][PickcarText3D] = CreateDynamic3DTextLabel("{A1A19F}[การาจเก็บรถ]\n{FFFFFF}( ขับเข้ามาเพื่อเก็บยานพาหนะเข้าการาจ )", COLOR_GREEN, PickcarData[pumpid][PickcarPosX], PickcarData[pumpid][PickcarPosY], PickcarData[pumpid][PickcarPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

// --> การาจเรียกรถ
CMD:createpickcar(playerid, params[])
{
	static
	    id = -1,
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (GetPlayerInterior(playerid) != 0)
	    return 1;

	id = Pickcar_Create(x, y, z);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของการาจเรียกรถในฐานข้อมูลเต็มแล้ว ไม่สามารถสร้างได้อีก (ติดต่อผู้พัฒนา)");

	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้สร้างที่เก็บรถขึ้นมาใหม่ ไอดี: %d", id);
	return 1;
}

CMD:deletepickcar(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "การใช้งาน : /deletepickcar [ไอดี]");

	if ((id < 0 || id >= MAX_PICKCAR) || !PickcarData[id][PickcarExists])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีไอดีที่เก็บรถนี้อยู่ในฐานข้อมูล");

	Pickcar_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ลบที่เก็บรถไอดี %d ออกสำเร็จ", id);
	return 1;
}



#include	<YSI_Coding\y_hooks>

#define 	MAX_POWNCAR 			(200)

enum Powncar_DATA {
	PowncarID,
	PowncarExists,
	Float:PowncarPosX,
	Float:PowncarPosY,
	Float:PowncarPosZ,
	Text3D:PowncarText3D,
	PowncarPickup
};
new PowncarData[MAX_POWNCAR][Powncar_DATA];
new PowncarStart[MAX_PLAYERS];

forward Powncar_Load();
public Powncar_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_POWNCAR)
	{
	    PowncarData[i][PowncarExists] = true;

	    cache_get_value_name_int(i, "PowncarID", PowncarData[i][PowncarID]);
	    cache_get_value_name_float(i, "PowncarX", PowncarData[i][PowncarPosX]);
	    cache_get_value_name_float(i, "PowncarY", PowncarData[i][PowncarPosY]);
	    cache_get_value_name_float(i, "PowncarZ", PowncarData[i][PowncarPosZ]);

	    Powncar_Refresh(i);
	}
	printf("[SERVER]: %i Powncar were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnPowncarCreated(Powncarid);
public OnPowncarCreated(Powncarid)
{
	if (Powncarid == -1 || !PowncarData[Powncarid][PowncarExists])
	    return 0;

	PowncarData[Powncarid][PowncarID] = cache_insert_id();
	Powncar_Save(Powncarid);

	return 1;
}

Powncar_Nearest(playerid)
{
    for (new i = 0; i != MAX_POWNCAR; i ++) if (PowncarData[i][PowncarExists] && IsPlayerInRangeOfPoint(playerid, 4.0, PowncarData[i][PowncarPosX], PowncarData[i][PowncarPosY], PowncarData[i][PowncarPosZ]))
	{
		return i;
	}
	return -1;
}

Powncar_Delete(pumpid)
{
	if (pumpid != -1 && PowncarData[pumpid][PowncarExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(PowncarData[pumpid][PowncarPickup]))
		    DestroyDynamicPickup(PowncarData[pumpid][PowncarPickup]);

		if (IsValidDynamic3DTextLabel(PowncarData[pumpid][PowncarText3D]))
		    DestroyDynamic3DTextLabel(PowncarData[pumpid][PowncarText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `Powncar` WHERE `PowncarID` = '%d'", PowncarData[pumpid][PowncarID]);
		mysql_tquery(g_SQL, string);

		PowncarData[pumpid][PowncarExists] = false;
		PowncarData[pumpid][PowncarID] = 0;
	}
	return 1;
}

Powncar_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_POWNCAR; i ++) if (!PowncarData[i][PowncarExists])
	{
	    PowncarData[i][PowncarExists] = true;
	    PowncarData[i][PowncarPosX] = x;
	    PowncarData[i][PowncarPosY] = y;
	    PowncarData[i][PowncarPosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `Powncar` (`PowncarID`) VALUES(0)", "OnPowncarCreated", "d", i);
		Powncar_Refresh(i);
		return i;
	}
	return -1;
}

Powncar_Save(pumpid)
{ 
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `Powncar` SET `PowncarX` = '%.4f', `PowncarY` = '%.4f', `PowncarZ` = '%.4f' WHERE `PowncarID` = '%d'",
	    PowncarData[pumpid][PowncarPosX],
	    PowncarData[pumpid][PowncarPosY],
	    PowncarData[pumpid][PowncarPosZ],
	    PowncarData[pumpid][PowncarID]
	);
	return mysql_tquery(g_SQL, query);
}

Powncar_Refresh(pumpid)
{
	if (pumpid != -1 && PowncarData[pumpid][PowncarExists])
	{
		if (IsValidDynamicPickup(PowncarData[pumpid][PowncarPickup]))
		    DestroyDynamicPickup(PowncarData[pumpid][PowncarPickup]);

		if (IsValidDynamic3DTextLabel(PowncarData[pumpid][PowncarText3D]))
		    DestroyDynamic3DTextLabel(PowncarData[pumpid][PowncarText3D]);

		PowncarData[pumpid][PowncarPickup] = CreateDynamicPickup(19605, 23, PowncarData[pumpid][PowncarPosX], PowncarData[pumpid][PowncarPosY], PowncarData[pumpid][PowncarPosZ]);
  		PowncarData[pumpid][PowncarText3D] = CreateDynamic3DTextLabel("{FF6600}��ǹ�ö\n{FFFFFF}�� {FFCC99}N {FFFFFF}���;�ǹ�ö", COLOR_GREEN, PowncarData[pumpid][PowncarPosX], PowncarData[pumpid][PowncarPosY], PowncarData[pumpid][PowncarPosZ], 15.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
	PowncarStart[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
		if (Powncar_Nearest(playerid) != -1)
	    {
			new string[MAX_SPAWNED_VEHICLES * 64], count;

			string = "#\t�������";

			if (GetPlayerMoney(playerid) < 3000)
			return SendClientMessage(playerid, -1, "�س���Թ�����§��㹡�þ�ǹ�");

			for(new i = 1; i < MAX_VEHICLES; i ++)
			{
				if(IsValidVehicle(i) && carData[i][carID] > 0 && IsVehicleOwner(playerid, i))
				{
					format(string, sizeof(string), "%s\n%d\t%s", string, count + 1, ReturnVehicleName(i));
					count++;
				}
			}
	
			if(!count)
			{
				SendClientMessage(playerid, -1,"�����ö�ͧ�س�ʹ��������������͹���");
			}

			else
			{
				Dialog_Show(playerid, DIALOG_POWNCAR, DIALOG_STYLE_TABLIST_HEADERS, "[���͡ö�ͧ�س����ͧ��èо�ǹ�]", string, "��ŧ", "�Դ");
			}
		}
	}
	return 1;
}

Dialog:DIALOG_POWNCAR(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new count;
		for(new i = 1; i < MAX_VEHICLES; i ++)
		{
			if((carData[i][carID] > 0 && IsVehicleOwner(playerid, i)) && (count++ == listitem))
  			{
				GivePlayerMoneyEx(playerid, -3000);
				SendClientMessageEx(playerid, 0xFF0000FF,"�س�������Թ�ӹǹ $3,000 �ҡ��þ�ǹ�ö %s", ReturnVehicleName(i));
				SendClientMessage(playerid, 0x00FF00FF,"�س��ӡ�þ�ǹ�ö���� **�ԡ������Ҩ");
				KillTimer(playerData[playerid][pSpeedoTimer]);
				DespawnVehicle(i);
				return 1;
			}
		}
	}
	return 1;
}

CMD:createPowncar(playerid, params[])
{
	static
	    idpc = -1,
		Float:xpc,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, xpc, y, z);

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (GetPlayerInterior(playerid) != 0)
	    return 1;

	idpc = Powncar_Create(xpc, y, z);

	if (idpc == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�����آͧ�ش���ö㹰ҹ������������� �������ö���ҧ���ա (�Դ��ͼ��Ѳ��)");

	SendClientMessageEx(playerid, COLOR_SERVER, "�س�����ҧ�����ö��������� �ʹ�: %d", idpc);
	return 1;
}

CMD:deletePowncar(playerid, params[])
{
	static
	    idpc = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", idpc))
	    return SendClientMessage(playerid, COLOR_WHITE, "�����ҹ : /deletePowncar [�ʹ�]");

	if ((idpc < 0 || idpc >= MAX_POWNCAR) || !PowncarData[idpc][PowncarExists])
	    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}������ʹշ����ö�������㹰ҹ������");

	Powncar_Delete(idpc);
	SendClientMessageEx(playerid, COLOR_SERVER, "�س��ź�����ö�ʹ� %d �͡�����", idpc);
	return 1;
}



#include <YSI_Coding\y_hooks>

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_CTRL_BACK)
    {
        if(GetFactionType(playerid) == FACTION_POLICE && playerData[playerid][pOnDuty] == true)
		{
			return Dialog_Show(playerid, DIALOG_POLICE, DIALOG_STYLE_LIST, "{FFFF00}เมนูตำรวจ", "{FFFFFF}+ ใส่กุญแจมือ\n+ ค้นตัว\n+ ยึดของผิดกฎหมาย\n+ ปลดกุญแจมือ\n+ ลาก\n+ ลากขึ้น/ลงรถ\n+ ปรับเงิน\n+ ปืนช็อตไฟฟ้า", "ตกลง", "ยกเลิก");
		}
    }
    return 1;
}
	
Dialog:DIALOG_POLICE(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
  		{
			case 0:
			{
				new string[1000], var[15], count;
				foreach(new i : Player)
				{
				    if (i == playerid) continue;
					if (IsPlayerNearPlayer(playerid, i, 5.0))
					{
						format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
						format(var, sizeof(var), "PID%d", count);
						SetPVarInt(playerid, var, i);
						count++;
					}
				}
				if (!count)
				{
					SendClientMessage(playerid, COLOR_RED, "ระบบ [!] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_CUFFID, DIALOG_STYLE_TABLIST, "[ใส่กุญแจมือ]", string, "เลือก", "ปิด");
			}
			case 1:
			{
				new string[1000], var[15], count;
				foreach(new i : Player)
				{
				    if (i == playerid) continue;
					if (IsPlayerNearPlayer(playerid, i, 5.0))
					{
						format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
						format(var, sizeof(var), "PID%d", count);
						SetPVarInt(playerid, var, i);
						count++;
					}
				}
				if (!count)
				{
					SendClientMessage(playerid, COLOR_RED, "ระบบ [!] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_FRISKID, DIALOG_STYLE_TABLIST, "[ค้นตัว]", string, "เลือก", "ปิด");
			}
			case 2:
			{
				new string[1000], var[15], count;
				foreach(new i : Player)
				{
				    if (i == playerid) continue;
					if (IsPlayerNearPlayer(playerid, i, 5.0))
					{
						format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
						format(var, sizeof(var), "PID%d", count);
						SetPVarInt(playerid, var, i);
						count++;
					}
				}
				if (!count)
				{
					SendClientMessage(playerid, COLOR_RED, "ระบบ [!] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_TAKEID, DIALOG_STYLE_TABLIST, "[ยึดของผิดกฎหมาย]", string, "เลือก", "ปิด");
			}
			case 3:
			{
				new string[1000], var[15], count;
				foreach(new i : Player)
				{
				    if (i == playerid) continue;
					if (IsPlayerNearPlayer(playerid, i, 5.0))
					{
						format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
						format(var, sizeof(var), "PID%d", count);
						SetPVarInt(playerid, var, i);
						count++;
					}
				}
				if (!count)
				{
					SendClientMessage(playerid, COLOR_RED, "ระบบ [!] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_UNCUFFID, DIALOG_STYLE_TABLIST, "[ปลดกุญแจมือ]", string, "เลือก", "ปิด");
			}
			case 4:
			{
				new string[1000], var[15], count;
				foreach(new i : Player)
				{
				    if (i == playerid) continue;
					if (IsPlayerNearPlayer(playerid, i, 5.0))
					{
						format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
						format(var, sizeof(var), "PID%d", count);
						SetPVarInt(playerid, var, i);
						count++;
					}
				}
				if (!count)
				{
					SendClientMessage(playerid, COLOR_RED, "ระบบ [!] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_DRAGID, DIALOG_STYLE_TABLIST, "[ลาก]", string, "เลือก", "ปิด");
			}
			case 5:
			{
				new string[1000], var[15], count;
				foreach(new i : Player)
				{
				    if (i == playerid) continue;
					if (IsPlayerNearPlayer(playerid, i, 5.0))
					{
						format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
						format(var, sizeof(var), "PID%d", count);
						SetPVarInt(playerid, var, i);
						count++;
					}
				}
				if (!count)
				{
					SendClientMessage(playerid, COLOR_RED, "ระบบ [!] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_DETAINID, DIALOG_STYLE_TABLIST, "[ลากขึ้น/ลงรถ]", string, "เลือก", "ปิด");
			}
			case 6:
			{
                Dialog_Show(playerid, DIALOG_FINEID, DIALOG_STYLE_INPUT, "[ปรับเงิน]", "กรุณาระบุไอดีผู้เล่นที่คุณต้องการจะปรับเงิน :", "เลือก", "ปิด");
			}
			case 7:
			{
			    //callcmd::tazer(playerid, "\1");
				new string[256];
				callcmd::tazer(playerid, string);
			}
		}
	}
	return 1;
}

Dialog:DIALOG_CUFFID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::cuff(playerid, string);
	}
	return 1;
}

Dialog:DIALOG_FRISKID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::frisk(playerid, string);
	}
	return 1;
}

Dialog:DIALOG_TAKEID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::takecannabis(playerid, string);
	}
	return 1;
}

Dialog:DIALOG_UNCUFFID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::uncuff(playerid, string);
	}
	return 1;
}

Dialog:DIALOG_DRAGID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::drag(playerid, string);
	}
	return 1;
}

Dialog:DIALOG_DETAINID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::detain(playerid, string);
	}
	return 1;
}

Dialog:DIALOG_FINEID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new userid = strval(inputtext);

		if (userid == INVALID_PLAYER_ID)
		    return SendClientMessage(playerid, COLOR_RED, "ระบบ [!] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ในเกม");

		if (!IsPlayerNearPlayer(playerid, userid, 5.0))
		    return SendClientMessage(playerid, COLOR_RED, "ระบบ [!]] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ในระยะ");

		if (userid == playerid)
			return SendClientMessage(playerid, COLOR_RED, "ระบบ [!] {FFFFFF}ไม่สามารถให้เงินตัวเองได้");

		fineID[playerid] = userid;
		Dialog_Show(playerid, DIALOG_FINECASH, DIALOG_STYLE_INPUT, "[ปรับเงิน]", "กรุณาระบุจำนวนเงินที่คุณต้องการจะปรับ :", "เลือก", "ปิด");
	}
	return 1;
}

Dialog:DIALOG_FINECASH(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new userid = strval(inputtext);

		if (userid <= 0)
		    return SendClientMessage(playerid, COLOR_GREY, "* คุณต้องระบุจำนวนมากกว่า 0");

		finePrice[playerid] = userid;
		Dialog_Show(playerid, DIALOG_FINETEXT, DIALOG_STYLE_INPUT, "[ปรับเงิน]", "กรุณาระบุสาเหตุที่ผู้เล่นนี้ถูกใบสั่ง :", "เลือก", "ปิด");
	}
	return 1;
}

Dialog:DIALOG_FINETEXT(playerid, response, listitem, inputtext[])
{
	new string[128];
	if (response)
	{
        format(fineText[playerid], 64, inputtext);

		format(string, 128, "%d %d %s", fineID[playerid], finePrice[playerid], inputtext);
		callcmd::fine(playerid, string);
	}
	return 1;
}

alias:fine("ปรับเงิน")
CMD:fine(playerid, params[])
{
	new
		userid,
	    amount,
	    reason[128];

	if (playerData[playerid][pAdmin] < 4 && GetFactionType(playerid) != FACTION_POLICE)
	    return SendClientMessage(playerid, COLOR_RED, "คุณไม่ได้รับอนุญาตให้ใช้คำสั่งนี้");

	if (sscanf(params, "uds[128]", userid, amount, reason))
		return SendClientMessage(playerid, COLOR_GREY, "การใช้งาน : {FFFFFF}/ปรับเงิน [ไอดีผู้เล่น/ชื่อตัวละคร] [จำนวนเงิน] [ข้อหา]");

	if (amount > GetPlayerMoneyEx(userid))
	    return SendClientMessage(playerid, COLOR_RED, "ผู้เล่นนั้นมีเงินไม่เพียงพอ");

	if (userid == INVALID_PLAYER_ID)
	    return SendClientMessage(playerid, COLOR_RED, "ผู้เล่นที่ระบุไม่ถูกต้อง");

	GivePlayerMoneyEx(userid, -amount);
	//GivePlayerMoneyEx(playerid, amount);
	
	new factionid = playerData[playerid][pFaction], query[256];
	factionData[factionid][factionMoney] += amount;

	mysql_format(g_SQL, query, sizeof(query), "UPDATE factions SET factionMoney = %d WHERE factionID = %d", factionData[factionid][factionMoney], factionid);
	mysql_tquery(g_SQL, query);

	SendClientMessageToAllEx(COLOR_LIGHTRED, "[ปรับเงิน] : %s ได้ถูกปรับเงินจำนวน $%s ข้อหา : %s", GetPlayerNameEx(userid), FormatNumber(amount), reason);

	return 1;
}

CMD:tazer(playerid, params[])
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || !IsPlayerSpawnedEx(playerid))
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่สามารถใช้งานได้ ต้องอยู่บนพื้นเท่านั้น");

	if (GetFactionType(playerid) != FACTION_POLICE)
		return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ช่องทางนี้สำหรับรัฐบาลเท่านั้น!");

	if (!playerData[playerid][pTazer])
	{
	    playerData[playerid][pTazer] = 1;
		GivePlayerWeaponEx(playerid, 23, 1);
	    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้หยิบปืนช็อตไฟฟ้าออกมาจากกระเป๋า", GetPlayerNameEx(playerid));
	}
	else
	{
	    playerData[playerid][pTazer] = 0;
	    SetPlayerAmmo(playerid, 23, 0);
	    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้เก็บปืนช็อตไฟฟ้าลงในกระเป๋า", GetPlayerNameEx(playerid));
	}
	return 1;
}
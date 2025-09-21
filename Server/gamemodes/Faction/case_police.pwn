#include <YSI_Coding\y_hooks>

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_CTRL_BACK)
    {
        if(GetFactionType(playerid) == FACTION_POLICE && playerData[playerid][pOnDuty] == true)
		{
			return Dialog_Show(playerid, DIALOG_POLICE, DIALOG_STYLE_LIST, "{FFFF00}���ٵ��Ǩ", "{FFFFFF}+ ���ح����\n+ �鹵��\n+ �ִ�ͧ�Դ������\n+ �Ŵ�ح����\n+ �ҡ\n+ �ҡ���/ŧö\n+ ��Ѻ�Թ\n+ �׹��͵俿��", "��ŧ", "¡��ԡ");
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
					SendClientMessage(playerid, COLOR_RED, "�к� [!] {FFFFFF}������������ͺ � �س���");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_CUFFID, DIALOG_STYLE_TABLIST, "[���ح����]", string, "���͡", "�Դ");
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
					SendClientMessage(playerid, COLOR_RED, "�к� [!] {FFFFFF}������������ͺ � �س���");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_FRISKID, DIALOG_STYLE_TABLIST, "[�鹵��]", string, "���͡", "�Դ");
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
					SendClientMessage(playerid, COLOR_RED, "�к� [!] {FFFFFF}������������ͺ � �س���");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_TAKEID, DIALOG_STYLE_TABLIST, "[�ִ�ͧ�Դ������]", string, "���͡", "�Դ");
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
					SendClientMessage(playerid, COLOR_RED, "�к� [!] {FFFFFF}������������ͺ � �س���");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_UNCUFFID, DIALOG_STYLE_TABLIST, "[�Ŵ�ح����]", string, "���͡", "�Դ");
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
					SendClientMessage(playerid, COLOR_RED, "�к� [!] {FFFFFF}������������ͺ � �س���");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_DRAGID, DIALOG_STYLE_TABLIST, "[�ҡ]", string, "���͡", "�Դ");
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
					SendClientMessage(playerid, COLOR_RED, "�к� [!] {FFFFFF}������������ͺ � �س���");
					return 1;
				}
				Dialog_Show(playerid, DIALOG_DETAINID, DIALOG_STYLE_TABLIST, "[�ҡ���/ŧö]", string, "���͡", "�Դ");
			}
			case 6:
			{
                Dialog_Show(playerid, DIALOG_FINEID, DIALOG_STYLE_INPUT, "[��Ѻ�Թ]", "��س��к��ʹռ����蹷��س��ͧ��èл�Ѻ�Թ :", "���͡", "�Դ");
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
		    return SendClientMessage(playerid, COLOR_RED, "�к� [!] {FFFFFF}�������ʹչ��������������");

		if (!IsPlayerNearPlayer(playerid, userid, 5.0))
		    return SendClientMessage(playerid, COLOR_RED, "�к� [!]] {FFFFFF}�������ʹչ����������������");

		if (userid == playerid)
			return SendClientMessage(playerid, COLOR_RED, "�к� [!] {FFFFFF}�������ö����Թ����ͧ��");

		fineID[playerid] = userid;
		Dialog_Show(playerid, DIALOG_FINECASH, DIALOG_STYLE_INPUT, "[��Ѻ�Թ]", "��س��кبӹǹ�Թ���س��ͧ��èл�Ѻ :", "���͡", "�Դ");
	}
	return 1;
}

Dialog:DIALOG_FINECASH(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new userid = strval(inputtext);

		if (userid <= 0)
		    return SendClientMessage(playerid, COLOR_GREY, "* �س��ͧ�кبӹǹ�ҡ���� 0");

		finePrice[playerid] = userid;
		Dialog_Show(playerid, DIALOG_FINETEXT, DIALOG_STYLE_INPUT, "[��Ѻ�Թ]", "��س��к����˵ط������蹹��١���� :", "���͡", "�Դ");
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

alias:fine("��Ѻ�Թ")
CMD:fine(playerid, params[])
{
	new
		userid,
	    amount,
	    reason[128];

	if (playerData[playerid][pAdmin] < 4 && GetFactionType(playerid) != FACTION_POLICE)
	    return SendClientMessage(playerid, COLOR_RED, "�س������Ѻ͹حҵ��������觹��");

	if (sscanf(params, "uds[128]", userid, amount, reason))
		return SendClientMessage(playerid, COLOR_GREY, "�����ҹ : {FFFFFF}/��Ѻ�Թ [�ʹռ�����/���͵���Ф�] [�ӹǹ�Թ] [�����]");

	if (amount > GetPlayerMoneyEx(userid))
	    return SendClientMessage(playerid, COLOR_RED, "�����蹹�����Թ�����§��");

	if (userid == INVALID_PLAYER_ID)
	    return SendClientMessage(playerid, COLOR_RED, "�����蹷���к����١��ͧ");

	GivePlayerMoneyEx(userid, -amount);
	//GivePlayerMoneyEx(playerid, amount);
	
	new factionid = playerData[playerid][pFaction], query[256];
	factionData[factionid][factionMoney] += amount;

	mysql_format(g_SQL, query, sizeof(query), "UPDATE factions SET factionMoney = %d WHERE factionID = %d", factionData[factionid][factionMoney], factionid);
	mysql_tquery(g_SQL, query);

	SendClientMessageToAllEx(COLOR_LIGHTRED, "[��Ѻ�Թ] : %s ��١��Ѻ�Թ�ӹǹ $%s ����� : %s", GetPlayerNameEx(userid), FormatNumber(amount), reason);

	return 1;
}

CMD:tazer(playerid, params[])
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || !IsPlayerSpawnedEx(playerid))
	    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�������ö��ҹ�� ��ͧ���躹�����ҹ��");

	if (GetFactionType(playerid) != FACTION_POLICE)
		return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}��ͧ�ҧ�������Ѻ�Ѱ�����ҹ��!");

	if (!playerData[playerid][pTazer])
	{
	    playerData[playerid][pTazer] = 1;
		GivePlayerWeaponEx(playerid, 23, 1);
	    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ����Ժ�׹��͵俿���͡�Ҩҡ������", GetPlayerNameEx(playerid));
	}
	else
	{
	    playerData[playerid][pTazer] = 0;
	    SetPlayerAmmo(playerid, 23, 0);
	    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ���纻׹��͵俿��ŧ㹡�����", GetPlayerNameEx(playerid));
	}
	return 1;
}
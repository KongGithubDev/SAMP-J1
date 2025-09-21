//เขียนโดย Emperor Fiw
//ํYouTube: Emperor Fiw
//ห้ามลบเครดิต

#include <YSI_Coding\y_hooks>

alias:fsetting("จัดการแก๊ง")
CMD:fsetting(playerid, params[])
{
	if (playerData[playerid][pFaction] == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณต้องเป็นสมาชิก Faction");

	if (playerData[playerid][pFactionRank] <5) //!= factionData[playerData[playerid][pFaction]][factionRanks])
	    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณต้องมียศอย่างน้อยระดับ 5");

	Dialog_Show(playerid, DIALOG_S_FACTION, DIALOG_STYLE_LIST, "{0BC5EA}.:: จัดการสมาชิกแก๊ง ::.", "{8EEAFC}+ {ffffff}ดูสมาชิกแก๊ง\n{8EEAFC}+ {ffffff}เตะสมาชิกออกจากแก๊ง", "ตกลง", "ยกเลิก");
	return 1;
}

Dialog:DIALOG_S_FACTION(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		switch(listitem)
		{
		    case 0:
		    {
			 	new query[128];
				mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `players` WHERE `playerFaction` = %d", playerData[playerid][pFactionID]);
			 	mysql_tquery(g_SQL, query, "Faction_GangSettings", "ii", playerid, 1);
		    }
		    case 1:
		    {
				new query[512];
				mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `players` WHERE `playerFaction` = %d", playerData[playerid][pFactionID]);
			 	mysql_tquery(g_SQL, query, "Faction_GangSettings", "ii", playerid, 2);
		    }
		}
	}
	return 1;
}

forward Faction_GangSettings(playerid, threadid);
public Faction_GangSettings(playerid, threadid)
{
    new string[1024], string5[1024];
    new name[32];
    new rows = cache_num_rows();

	switch(threadid)
    {
		case 1:
		{
			new str[256], factionid = playerData[playerid][pFaction], rank;
		    format(str, sizeof(str), "{34D8F8}รายชื่อสมาชิกแก๊ง {ffffff}%s", factionData[factionid][factionName]);

		    for(new i = 0; i < rows; i ++)
			{
			    cache_get_value_name(i, "playerName", name, 25);
			    cache_get_value_name_int(i, "playerFactionRank", rank);

				format(string, sizeof(string), "{099DF1}%d\t{FFFFFF}%s\t{A3DDFE}ตำแหน่ง : %s\n", i+1, name, FactionRanks[factionid][rank - 1]);
				strcat(string5, string);
			}

			format(string, sizeof(string), "{FFFFFF}อันดับ\t{FFFFFF}ชื่อตัวละคร\t{FFFFFF}ตำแหน่ง\n%s", string5);
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_TABLIST_HEADERS, str, string, "ปิด","");
		}
		case 2:
		{
			new str[256], factionid = playerData[playerid][pFaction], rank;
		    format(str, sizeof(str), "{34D8F8}รายชื่อสมาชิกแก๊ง {ffffff}%s", factionData[factionid][factionName]);

		    for(new i = 0; i < rows; i ++)
		    {
			    cache_get_value_name(i, "playerName", name, 25);
			    cache_get_value_name_int(i, "playerFactionRank", rank);

				format(string, sizeof(string), "{099DF1}%d\t{FFFFFF}%s\t{A3DDFE}ตำแหน่ง : %s\n", i+1, name, FactionRanks[factionid][rank - 1]);
				strcat(string5, string);
			}

			format(string, sizeof(string), "{FFFFFF}อันดับ\t{FFFFFF}ชื่อตัวละคร\t{FFFFFF}ตำแหน่ง\n%s", string5);
			Dialog_Show(playerid, DIALOG_FACTION_SETTING, DIALOG_STYLE_TABLIST_HEADERS, str, string, "เตะ","ยกเลิก");
		}
	}
	return 1;
}

Dialog:DIALOG_FACTION_SETTING(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new query[128];
		mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM players WHERE playerFaction = %d LIMIT %d, 1", playerData[playerid][pFactionID], listitem);
		mysql_tquery(g_SQL, query, "FactionSettings", "i", playerid);
	}
	return 1;
}

forward FactionSettings(playerid);
public FactionSettings(playerid)
{
	static
	    rows, string[256];

	cache_get_row_count(rows);

	if(!rows)
	{
	    SendClientMessageEx(playerid, COLOR_RED, "เกิดข้อผิดพลาด, กรุณาติดต่อ Admins");
	}
	else
	{
	    new vid, name[25];
	    for(new i = 0; i < rows; i ++)
	    {
			cache_get_value_name_int(0, "playerID", vid);
			cache_get_value_name(0, "playerName", name, 25);
		}
		
		new playerList = -1;
        foreach (new i : Player)
        {
            if (!strcmp(GetPlayerNameEx(i), name, true))
			{
			    playerList = i;
			}
        }
        
        if (playerList == -1)
		{
			mysql_format(g_SQL, string, sizeof(string), "UPDATE `players` SET `playerFaction` = '-1' WHERE `playerID` = '%d'", vid);
			mysql_tquery(g_SQL, string);

			mysql_format(g_SQL, string, sizeof(string), "UPDATE `players` SET `playerFactionRank` = '0' WHERE `playerID` = '%d'", vid);
			mysql_tquery(g_SQL, string);
		}
		else
		{
		    ResetFaction(playerList);
		    SetPlayerColor(playerList, DEFAULT_COLOR);
			SendClientMessageEx(playerList, -1, "{F7431F}แจ้งเตือน : {FBA493}คุณถูกเตะออกจากการเป็นสมาชิกแก๊งโดย {ffffff}'%s'", GetPlayerNameEx(playerid));
		}
		SendClientMessageEx(playerid, -1, "{05D30B}จัดการสมาชิก : {CFFB90}คุณได้ทำการเตะ {ffffff}'%s' {CFFB90}ออกจากการเป็นสมาชิกแก๊งคุณ", name);
		return 1;
	}
	return 1;
}


#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid, reason)
{
    new query[128];
    mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET playerLatsPlay = NOW() WHERE playerID = %d", playerData[playerid][pID]);
    mysql_tquery(g_SQL, query);
    return 1;
}

CMD:cplayeronline(playerid, params[])
{
    if (playerData[playerid][pAdmin] >= 6)
    {
        new userid[256];
        if (sscanf(params, "s[256]", userid))
            return SendClientMessage(playerid, COLOR_WHITE, "/cplayeronline ชื่อผู้เล่น");

        new query[256];
        mysql_format(g_SQL, query, sizeof(query), "SELECT playerName, playerLatsPlay FROM players WHERE playerName = '%e'", userid);
        mysql_tquery(g_SQL, query, "PlayerLatsLogin", "i", playerid);
    }
    return 1;
}

forward PlayerLatsLogin(playerid);
public PlayerLatsLogin(playerid)
{
    new rows;
    cache_get_row_count(rows);

    if (!rows)
    {
        SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีผู้เล่นนี้อยู่ในระบบ..!");
    }
    else
    {
        new string[128];
        new name[24];
        new lastlogin[64];

        cache_get_value_name(0, "playerLatsPlay", lastlogin);
        cache_get_value_name(0, "playerName", name);

        format(string, sizeof(string), "ผู้เล่น %s ล็อคอินล่าสุดเมื่อ %s", name, lastlogin);
        SendClientMessage(playerid, -1, string);
    }
    return 1;
}

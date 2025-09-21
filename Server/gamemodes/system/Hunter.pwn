#include <YSI_Coding\y_hooks>

new Text:HunterTD[4], HunterOn, HunterCash, HunterID, HunterTime;

hook OnGameModeInit()
{
    HunterTD[0] = TextDrawCreate(53.000000+50.0, 181.000000, "_");
    TextDrawFont(HunterTD[0], 1);
    TextDrawLetterSize(HunterTD[0], 0.600000, 10.300003);
    TextDrawTextSize(HunterTD[0], 298.500000, 67.500000);
    TextDrawSetOutline(HunterTD[0], 1);
    TextDrawSetShadow(HunterTD[0], 0);
    TextDrawAlignment(HunterTD[0], 2);
    TextDrawColor(HunterTD[0], -1);
    TextDrawBackgroundColor(HunterTD[0], 255);
    TextDrawBoxColor(HunterTD[0], 303239423);
    TextDrawUseBox(HunterTD[0], 1);
    TextDrawSetProportional(HunterTD[0], 1);
    TextDrawSetSelectable(HunterTD[0], 0);

    HunterTD[1] = TextDrawCreate(4.000000+50.0, 199.000000, "Preview_Model");
    TextDrawFont(HunterTD[1], 5);
    TextDrawLetterSize(HunterTD[1], 0.600000, 2.000000);
    TextDrawTextSize(HunterTD[1], 98.000000, 94.000000);
    TextDrawSetOutline(HunterTD[1], 0);
    TextDrawSetShadow(HunterTD[1], 0);
    TextDrawAlignment(HunterTD[1], 1);
    TextDrawColor(HunterTD[1], -1);
    TextDrawBackgroundColor(HunterTD[1], 0);
    TextDrawBoxColor(HunterTD[1], 255);
    TextDrawUseBox(HunterTD[1], 0);
    TextDrawSetProportional(HunterTD[1], 1);
    TextDrawSetSelectable(HunterTD[1], 0);
    TextDrawSetPreviewModel(HunterTD[1], 3);
    TextDrawSetPreviewRot(HunterTD[1], -20.000000, 0.000000, 0.000000, 0.919999);
    TextDrawSetPreviewVehCol(HunterTD[1], 1, 1);

    HunterTD[2] = TextDrawCreate(16.000000+50.0, 164.000000, "a:wanted");
    TextDrawFont(HunterTD[2], 4);
    TextDrawLetterSize(HunterTD[2], 0.600000, 2.000000);
    TextDrawTextSize(HunterTD[2], 74.500000, 127.000000);
    TextDrawSetOutline(HunterTD[2], 1);
    TextDrawSetShadow(HunterTD[2], 0);
    TextDrawAlignment(HunterTD[2], 1);
    TextDrawColor(HunterTD[2], -1);
    TextDrawBackgroundColor(HunterTD[2], 255);
    TextDrawBoxColor(HunterTD[2], 50);
    TextDrawUseBox(HunterTD[2], 1);
    TextDrawSetProportional(HunterTD[2], 1);
    TextDrawSetSelectable(HunterTD[2], 0);

    HunterTD[3] = TextDrawCreate(55.000000+50.0, 260.500000, "1,234$");
    TextDrawFont(HunterTD[3], 1);
    TextDrawLetterSize(HunterTD[3], 0.275000, 1.250000);
    TextDrawTextSize(HunterTD[3], 400.000000, 17.000000);
    TextDrawSetOutline(HunterTD[3], 0);
    TextDrawSetShadow(HunterTD[3], 0);
    TextDrawAlignment(HunterTD[3], 2);
    TextDrawColor(HunterTD[3], 303239423);
    TextDrawBackgroundColor(HunterTD[3], 255);
    TextDrawBoxColor(HunterTD[3], 50);
    TextDrawUseBox(HunterTD[3], 0);
    TextDrawSetProportional(HunterTD[3], 1);
    TextDrawSetSelectable(HunterTD[3], 0);
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(HunterID == playerid)
	{
		SendClientMessageToAllEx(0x2196F3FF, "[samp-Hunter] : {FFFFFF} %s ผู้เล่นที่ถูกตามล่าได้หลุดออกจากเซิร์ฟเวอร์ ทำให้กิจกรรมสิ้นสุด", GetPlayerNameEx(playerid));

		for (new i = 0; i < 4; i++)
		{
			TextDrawHideForAll(HunterTD[i]);
		}
        foreach (new i : Player)
        {
			DisablePlayerCheckpoint(i);
        }

		HunterCash = 0;
		HunterID = -1;
		HunterOn = 0;
	}
    return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
    if (HunterOn == 1)
    {
        if (killerid != INVALID_PLAYER_ID)
        {
            if(HunterID == playerid)
            {
                SendClientMessageToAllEx(0x2196F3FF, "[samp-Hunter] : {FFFFFF} %s ผู้เล่นที่ถูกตามล่าได้เสียชีวิตลงโดย %s และได้ค่าหัวไปทั้งหมด %s", GetPlayerNameEx(playerid), GetPlayerNameEx(killerid), FormatMoney(HunterCash));

                GivePlayerMoneyEx(killerid, HunterCash);

                for (new i = 0; i < 4; i++)
                {
                    TextDrawHideForAll(HunterTD[i]);
                }
                foreach (new i : Player)
                {
                    DisablePlayerCheckpoint(i);
                }
                HunterCash = 0;
                HunterID = -1;
                HunterOn = 0;
            }
        }
        else
        {
            if(HunterID == playerid)
            {
                SendClientMessageToAllEx(0x2196F3FF, "[samp-Hunter] : {FFFFFF}ผู้เล่นที่ถูกตามล่าได้เสียชีวิตลงโดย ไม่ทราบสาเหตุ กิจกรรมจึงยุติลง !!", GetPlayerNameEx(playerid));

                for (new i = 0; i < 4; i++)
                {
                    TextDrawHideForAll(HunterTD[i]);
                }
                foreach (new i : Player)
                {
                    DisablePlayerCheckpoint(i);
                }

                HunterCash = 0;
                HunterID = -1;
                HunterOn = 0;
            }
        }
    }
    return 1;
}

alias:setbounty("ล่าค่าหัว")
CMD:setbounty(playerid, params[])
{
	new userid;

    if (playerData[playerid][pAdmin] < 6)
	    return 1;

    if (sscanf(params, "u", userid))
	    return SendClientMessage(playerid, COLOR_WHITE, "/ล่าค่าหัว [ไอดี/ชื่อ]");

    HunterOn = 1;
    HunterID = userid;

    TextDrawSetPreviewModel(HunterTD[1], GetPlayerSkin(userid));

    for (new i = 0; i < 4; i++)
    {
        TextDrawShowForAll(HunterTD[i]);
    }
    return 1;
}

task HunterTimer[1000]()
{
    if (HunterOn == 1)
    {
        new str_hunter[32], cash;
        cash = randomEx(10, 20);

        HunterCash += cash;

        format(str_hunter, sizeof(str_hunter), "%s", FormatMoney(HunterCash));
        TextDrawSetString(HunterTD[3], str_hunter);

        new Float:X,Float:Y,Float:Z;
        GetPlayerPos(HunterID, X,Y,Z);

        foreach (new i : Player)
        {
            SetPlayerCheckpoint(i, X,Y,Z, 3.0);
        }

        HunterTime++;

        if (HunterTime >= 600)
        {
 			SendClientMessageToAllEx(0x2196F3FF, "[samp-Hunter] : {FFFFFF}เนื่องจากเวลาล่าค่าหัวครบ 10 นาที ไม่มีผู้ชนะ ผู้เล่น %s จึงได้รับเงินจำนวน %s", GetPlayerNameEx(HunterID), FormatMoney(HunterCash));

			GivePlayerMoneyEx(HunterID, HunterCash);

			for (new i = 0; i < 4; i++)
            {
               TextDrawHideForAll(HunterTD[i]);
            }

            HunterTime = 0;
			HunterCash = 0;
			HunterID = -1;
            HunterOn = 0;
        }
    }
    return 1;
}

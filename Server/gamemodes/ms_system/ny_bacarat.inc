#include	<YSI_Coding\y_hooks>

new BacaraHistory[10];
new BacaraHistoryIndex;
//new RepairNpc;

new BacaraTime;
new BacaraNumber;
new BacaraActive;
new PlayerBA[3], BankerBA[3];
new PlayerPoint, BankerPoint;

new BacaraType[MAX_PLAYERS];
new BacaraMoney[MAX_PLAYERS];
new JoinBacara[MAX_PLAYERS];

enum BACARA_DATA
{
	Name[32],
	Point
};

new const BacaraInfo[][BACARA_DATA] =
{
	{ "ld_card:cd10c", 0 },
	{ "ld_card:cd10d", 0 },
	{ "ld_card:cd10h", 0 },
	{ "ld_card:cd10s", 0 },
	
	{ "ld_card:cd13c", 0 },
	{ "ld_card:cd13d", 0 },
	{ "ld_card:cd13h", 0 },
	{ "ld_card:cd13s", 0 },
	
	{ "ld_card:cd1c", 1 },
	{ "ld_card:cd1d", 1 },
	{ "ld_card:cd1h", 1 },
	{ "ld_card:cd1s", 1 },
	
	{ "ld_card:cd2c", 2 },
	{ "ld_card:cd2d", 2 },
	{ "ld_card:cd2h", 2 },
	{ "ld_card:cd2s", 2 },
	
	{ "ld_card:cd3c", 3 },
	{ "ld_card:cd3d", 3 },
	{ "ld_card:cd3h", 3 },
	{ "ld_card:cd3s", 3 },

	{ "ld_card:cd4c", 4 },
	{ "ld_card:cd4d", 4 },
	{ "ld_card:cd4h", 4 },
	{ "ld_card:cd4s", 4 },

	{ "ld_card:cd5c", 5 },
	{ "ld_card:cd5d", 5 },
	{ "ld_card:cd5h", 5 },
	{ "ld_card:cd5s", 5 },

	{ "ld_card:cd6c", 6 },
	{ "ld_card:cd6d", 6 },
	{ "ld_card:cd6h", 6 },
	{ "ld_card:cd6s", 6 },

	{ "ld_card:cd7c", 7 },
	{ "ld_card:cd7d", 7 },
	{ "ld_card:cd7h", 7 },
	{ "ld_card:cd7s", 7 },

	{ "ld_card:cd8c", 8 },
	{ "ld_card:cd8d", 8 },
	{ "ld_card:cd8h", 8 },
	{ "ld_card:cd8s", 8 },

	{ "ld_card:cd9c", 9 },
	{ "ld_card:cd9d", 9 },
	{ "ld_card:cd9h", 9 },
	{ "ld_card:cd9s", 9 }
};

new Text:BACARATextDraws[11];

hook OnGameModeInit()
{
//	start BacaraTimer();

    BacaraTime = 30;
    BacaraNumber = 0;
    BacaraActive = 0;
    
    PlayerBA[0] = -1;
    PlayerBA[1] = -1;
    PlayerBA[2] = -1;
    
    BankerBA[0] = -1;
    BankerBA[1] = -1;
    BankerBA[2] = -1;
    
    PlayerPoint = -1;
    BankerPoint = -1;
	BACARATextDraws[0] = TextDrawCreate(188.000000, 90.000000, "ld_card:bacarat");
	TextDrawFont(BACARATextDraws[0], 4);
	TextDrawLetterSize(BACARATextDraws[0], 0.600000, 2.000000);
	TextDrawTextSize(BACARATextDraws[0], 262.500000, 286.000000);
	TextDrawSetOutline(BACARATextDraws[0], 1);
	TextDrawSetShadow(BACARATextDraws[0], 0);
	TextDrawAlignment(BACARATextDraws[0], 1);
	TextDrawColor(BACARATextDraws[0], -1);
	TextDrawBackgroundColor(BACARATextDraws[0], 255);
	TextDrawBoxColor(BACARATextDraws[0], 50);
	TextDrawUseBox(BACARATextDraws[0], 1);
	TextDrawSetProportional(BACARATextDraws[0], 1);
	TextDrawSetSelectable(BACARATextDraws[0], 0);

	BACARATextDraws[1] = TextDrawCreate(197.000000, 122.000000, "ld_card:cdback");
	TextDrawFont(BACARATextDraws[1], 4);
	TextDrawLetterSize(BACARATextDraws[1], 0.600000, 2.000000);
	TextDrawTextSize(BACARATextDraws[1], 45.500000, 76.500000);
	TextDrawSetOutline(BACARATextDraws[1], 1);
	TextDrawSetShadow(BACARATextDraws[1], 0);
	TextDrawAlignment(BACARATextDraws[1], 1);
	TextDrawColor(BACARATextDraws[1], -1);
	TextDrawBackgroundColor(BACARATextDraws[1], 255);
	TextDrawBoxColor(BACARATextDraws[1], 50);
	TextDrawUseBox(BACARATextDraws[1], 1);
	TextDrawSetProportional(BACARATextDraws[1], 1);
	TextDrawSetSelectable(BACARATextDraws[1], 0);

	BACARATextDraws[2] = TextDrawCreate(253.000000, 122.000000, "ld_card:cdback");
	TextDrawFont(BACARATextDraws[2], 4);
	TextDrawLetterSize(BACARATextDraws[2], 0.600000, 2.000000);
	TextDrawTextSize(BACARATextDraws[2], 45.500000, 76.500000);
	TextDrawSetOutline(BACARATextDraws[2], 1);
	TextDrawSetShadow(BACARATextDraws[2], 0);
	TextDrawAlignment(BACARATextDraws[2], 1);
	TextDrawColor(BACARATextDraws[2], -1);
	TextDrawBackgroundColor(BACARATextDraws[2], 255);
	TextDrawBoxColor(BACARATextDraws[2], 50);
	TextDrawUseBox(BACARATextDraws[2], 1);
	TextDrawSetProportional(BACARATextDraws[2], 1);
	TextDrawSetSelectable(BACARATextDraws[2], 0);

	BACARATextDraws[3] = TextDrawCreate(143.000000, 172.000000, "ld_card:cdback");
	TextDrawFont(BACARATextDraws[3], 4);
	TextDrawLetterSize(BACARATextDraws[3], 0.600000, 2.000000);
	TextDrawTextSize(BACARATextDraws[3], 45.500000, 76.500000);
	TextDrawSetOutline(BACARATextDraws[3], 1);
	TextDrawSetShadow(BACARATextDraws[3], 0);
	TextDrawAlignment(BACARATextDraws[3], 1);
	TextDrawColor(BACARATextDraws[3], -1);
	TextDrawBackgroundColor(BACARATextDraws[3], 255);
	TextDrawBoxColor(BACARATextDraws[3], 50);
	TextDrawUseBox(BACARATextDraws[3], 1);
	TextDrawSetProportional(BACARATextDraws[3], 1);
	TextDrawSetSelectable(BACARATextDraws[3], 0);

	BACARATextDraws[4] = TextDrawCreate(338.000000, 122.000000, "ld_card:cdback");
	TextDrawFont(BACARATextDraws[4], 4);
	TextDrawLetterSize(BACARATextDraws[4], 0.600000, 2.000000);
	TextDrawTextSize(BACARATextDraws[4], 45.500000, 76.500000);
	TextDrawSetOutline(BACARATextDraws[4], 1);
	TextDrawSetShadow(BACARATextDraws[4], 0);
	TextDrawAlignment(BACARATextDraws[4], 1);
	TextDrawColor(BACARATextDraws[4], -1);
	TextDrawBackgroundColor(BACARATextDraws[4], 255);
	TextDrawBoxColor(BACARATextDraws[4], 50);
	TextDrawUseBox(BACARATextDraws[4], 1);
	TextDrawSetProportional(BACARATextDraws[4], 1);
	TextDrawSetSelectable(BACARATextDraws[4], 0);

	BACARATextDraws[5] = TextDrawCreate(396.000000, 122.000000, "ld_card:cdback");
	TextDrawFont(BACARATextDraws[5], 4);
	TextDrawLetterSize(BACARATextDraws[5], 0.600000, 2.000000);
	TextDrawTextSize(BACARATextDraws[5], 45.500000, 76.500000);
	TextDrawSetOutline(BACARATextDraws[5], 1);
	TextDrawSetShadow(BACARATextDraws[5], 0);
	TextDrawAlignment(BACARATextDraws[5], 1);
	TextDrawColor(BACARATextDraws[5], -1);
	TextDrawBackgroundColor(BACARATextDraws[5], 255);
	TextDrawBoxColor(BACARATextDraws[5], 50);
	TextDrawUseBox(BACARATextDraws[5], 1);
	TextDrawSetProportional(BACARATextDraws[5], 1);
	TextDrawSetSelectable(BACARATextDraws[5], 0);

	BACARATextDraws[6] = TextDrawCreate(447.000000, 172.000000, "ld_card:cdback");
	TextDrawFont(BACARATextDraws[6], 4);
	TextDrawLetterSize(BACARATextDraws[6], 0.600000, 2.000000);
	TextDrawTextSize(BACARATextDraws[6], 45.500000, 76.500000);
	TextDrawSetOutline(BACARATextDraws[6], 1);
	TextDrawSetShadow(BACARATextDraws[6], 0);
	TextDrawAlignment(BACARATextDraws[6], 1);
	TextDrawColor(BACARATextDraws[6], -1);
	TextDrawBackgroundColor(BACARATextDraws[6], 255);
	TextDrawBoxColor(BACARATextDraws[6], 50);
	TextDrawUseBox(BACARATextDraws[6], 1);
	TextDrawSetProportional(BACARATextDraws[6], 1);
	TextDrawSetSelectable(BACARATextDraws[6], 0);

	BACARATextDraws[7] = TextDrawCreate(294.000000, 231.000000, "00:00");
	TextDrawFont(BACARATextDraws[7], 2);
	TextDrawLetterSize(BACARATextDraws[7], 0.404166, 2.000000);
	TextDrawTextSize(BACARATextDraws[7], 400.000000, 17.000000);
	TextDrawSetOutline(BACARATextDraws[7], 0);
	TextDrawSetShadow(BACARATextDraws[7], 0);
	TextDrawAlignment(BACARATextDraws[7], 1);
	TextDrawColor(BACARATextDraws[7], -1);
	TextDrawBackgroundColor(BACARATextDraws[7], 255);
	TextDrawBoxColor(BACARATextDraws[7], 50);
	TextDrawUseBox(BACARATextDraws[7], 0);
	TextDrawSetProportional(BACARATextDraws[7], 1);
	TextDrawSetSelectable(BACARATextDraws[7], 0);

	BACARATextDraws[8] = TextDrawCreate(240.000000, 284.000000, "_");
	TextDrawFont(BACARATextDraws[8], 2);
	TextDrawLetterSize(BACARATextDraws[8], 0.258332, 3.199986);
	TextDrawTextSize(BACARATextDraws[8], 16.500000, 85.000000);
	TextDrawSetOutline(BACARATextDraws[8], 1);
	TextDrawSetShadow(BACARATextDraws[8], 0);
	TextDrawAlignment(BACARATextDraws[8], 2);
	TextDrawColor(BACARATextDraws[8], -1);
	TextDrawBackgroundColor(BACARATextDraws[8], 255);
	TextDrawBoxColor(BACARATextDraws[8], 200);
	TextDrawUseBox(BACARATextDraws[8], 0);
	TextDrawSetProportional(BACARATextDraws[8], 1);
	TextDrawSetSelectable(BACARATextDraws[8], 1);

	BACARATextDraws[9] = TextDrawCreate(396.000000, 283.000000, "_");
	TextDrawFont(BACARATextDraws[9], 2);
	TextDrawLetterSize(BACARATextDraws[9], 0.258332, 3.449998);
	TextDrawTextSize(BACARATextDraws[9], 16.500000, 85.000000);
	TextDrawSetOutline(BACARATextDraws[9], 1);
	TextDrawSetShadow(BACARATextDraws[9], 0);
	TextDrawAlignment(BACARATextDraws[9], 2);
	TextDrawColor(BACARATextDraws[9], -1);
	TextDrawBackgroundColor(BACARATextDraws[9], 255);
	TextDrawBoxColor(BACARATextDraws[9], 200);
	TextDrawUseBox(BACARATextDraws[9], 0);
	TextDrawSetProportional(BACARATextDraws[9], 1);
	TextDrawSetSelectable(BACARATextDraws[9], 1);

	BACARATextDraws[10] = TextDrawCreate(319.000000, 256.000000, "_");
	TextDrawFont(BACARATextDraws[10], 2);
	TextDrawLetterSize(BACARATextDraws[10], 0.258332, 3.449998);
	TextDrawTextSize(BACARATextDraws[10], 16.500000, 60.000000);
	TextDrawSetOutline(BACARATextDraws[10], 1);
	TextDrawSetShadow(BACARATextDraws[10], 0);
	TextDrawAlignment(BACARATextDraws[10], 2);
	TextDrawColor(BACARATextDraws[10], -1);
	TextDrawBackgroundColor(BACARATextDraws[10], 255);
	TextDrawBoxColor(BACARATextDraws[10], 200);
	TextDrawUseBox(BACARATextDraws[10], 0);
	TextDrawSetProportional(BACARATextDraws[10], 1);
	TextDrawSetSelectable(BACARATextDraws[10], 1);

	CreateActor(9,253.5925,-1801.7781,4.8309,269.1129);
    Create3DTextLabel("{00FF7F}BACARA\n{ffffff}กด N เพื่อเล่นบาคาร่า", -1, 253.5925,-1801.7781,4.8309+1.0, 10.0, 0);

	return 1;
}

hook OnPlayerConnect(playerid)
{
	BacaraType[playerid] = 0;
 	BacaraMoney[playerid] = 0;
 	JoinBacara[playerid] = 0;
	return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == BACARATextDraws[8]) // PLAYER
	{
		if (BacaraMoney[playerid] != 0) return SendClientMessage(playerid, COLOR_RED, "[!] คุณอยู่ระหว่างการเดิมพัน!");
		if (BacaraTime <= 0) return SendClientMessage(playerid, COLOR_RED, "[!]");

        Dialog_Show(playerid, DIALOG_PLAYER, DIALOG_STYLE_INPUT, "[การวางเดิมพัน]", "{FFFFFF}คุณต้องการวางเดิมพัน {05AAFD}PLAYER {FFFFFF}เป็นจำนวนเงินเท่าใด", "ตกลง", "ออก");
	}

	if(clickedid == BACARATextDraws[10]) // TIE
	{
		if (BacaraMoney[playerid] != 0) return SendClientMessage(playerid, COLOR_RED, "[!] คุณอยู่ระหว่างการเดิมพัน!");
		if (BacaraTime <= 0) return SendClientMessage(playerid, COLOR_RED, "[!]");

        Dialog_Show(playerid, DIALOG_TIE, DIALOG_STYLE_INPUT, "[การวางเดิมพัน]", "{FFFFFF}คุณต้องการวางเดิมพัน {10FD05}TIE {FFFFFF}เป็นจำนวนเงินเท่าใด", "ตกลง", "ออก");
	}

	if(clickedid == BACARATextDraws[9]) // BANKER
	{
		if (BacaraMoney[playerid] != 0) return SendClientMessage(playerid, COLOR_RED, "[!] คุณอยู่ระหว่างการเดิมพัน!");
		if (BacaraTime <= 0) return SendClientMessage(playerid, COLOR_RED, "[!]");

        Dialog_Show(playerid, DIALOG_BANKER, DIALOG_STYLE_INPUT, "[การวางเดิมพัน]", "{FFFFFF}คุณต้องการวางเดิมพัน {FD2305}BANKER {FFFFFF}เป็นจำนวนเงินเท่าใด", "ตกลง", "ออก");
	}
	if(JoinBacara[playerid] == 1) {
        if(clickedid == Text: INVALID_TEXT_DRAW) {
            JoinBacara[playerid] = 0;
	    	HideBACARA(playerid);
            return Y_HOOKS_BREAK_RETURN_1;
        }
    }
/*
	if(clickedid == BACARATextDraws[2])
	{
		JoinBacara[playerid] = 0;
	    HideBACARA(playerid);
	}*/
    return 1;
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	//บาคาร่า
	if (newkeys & KEY_NO)
	{
	    if (IsPlayerInRangeOfPoint(playerid, 3.0, 253.5925,-1801.7781,4.8309))
        {
            if (JoinBacara[playerid] == 0)
            {
                JoinBacara[playerid] = 1;
                ShowBACARA(playerid);
                //SendClientMessageEx(playerid, COLOR_GREEN, "[!] หากออกจากหน้าต่างไม่ได้ให้ใช้คำสั่ง /บาคาร่า");
                return 1;
            }
        }
	}
	return 1;
}
/*
alias:bacara("บาคาร่า")
CMD:bacara(playerid, params[])
{
	if (!IsPlayerInRangeOfPoint(playerid, 30.0, 273.4330,-1935.0815,7.4198)) return SendClientMessage(playerid, COLOR_RED, "[!] คุณไม่ได้อยู่ที่โต๊ะบาคาร่า");

    if (JoinBacara[playerid] == 0)
	{
	    JoinBacara[playerid] = 1;
		ShowBACARA(playerid);
	}
	else
	{
	    JoinBacara[playerid] = 0;
	    HideBACARA(playerid);
	}
	return 1;
}*/

stock ShowBACARA(playerid)
{
	TextDrawShowForPlayer(playerid, BACARATextDraws[0]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[1]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[2]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[3]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[4]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[5]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[6]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[7]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[8]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[9]);
	TextDrawShowForPlayer(playerid, BACARATextDraws[10]);
	SelectTextDraw(playerid, COLOR_RED);
//	ShowPlayerMarkers(playerid, SHOW_MARKERS_MODE_OFF);
	return 1;
}

stock HideBACARA(playerid)
{
	TextDrawHideForPlayer(playerid, BACARATextDraws[0]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[1]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[2]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[3]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[4]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[5]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[6]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[7]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[8]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[9]);
	TextDrawHideForPlayer(playerid, BACARATextDraws[10]);
//	ShowPlayerMarkers(playerid, SHOW_MARKERS_MODE_GLOBAL);
	CancelSelectTextDraw(playerid);

	return 1;
}


Dialog:DIALOG_PLAYER(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);

	if(!response)
	{
		return 1;
	}
	
	if(response)
	{
        if (BacaraTime <= 0)
            return SendClientMessage(playerid, COLOR_RED, "[!] หมดเวลาในการลงเดิมพันแล้ว");
	
	    if (GetPlayerMoneyEx(playerid) < amount)
	        return SendClientMessage(playerid, COLOR_RED, "[!] คุณมีเงินไม่เพียงพอ");
	
		if (BacaraMoney[playerid] != 0)
		    return SendClientMessage(playerid, COLOR_RED, "[!] คุณอยู่ระหว่างการเดิมพัน!");
	
	    if (amount > 10000)
	        return SendClientMessage(playerid, COLOR_RED, "[!] คุณต้องระบุจำนวนไม่เกิน $10000");
	
	    if (amount < 2000)
	        return SendClientMessage(playerid, COLOR_RED, "[!] คุณต้องระบุจำนวนมากกว่า 2000");
	        
		BacaraType[playerid] = 1;
		BacaraMoney[playerid] = amount;
		GivePlayerMoneyEx(playerid, -amount);
		
		SendClientMessageEx(playerid, COLOR_GREEN, "[!] วางเดิมพัน ผู้เล่น $%s ", FormatNumber(amount));
	}
	return 1;
}

Dialog:DIALOG_TIE(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);

	if(!response)
	{
		return 1;
	}

	if(response)
	{
        if (BacaraTime <= 0)
            return SendClientMessage(playerid, COLOR_RED, "[!] หมดเวลาในการลงเดิมพันแล้ว");

	    if (GetPlayerMoneyEx(playerid) < amount)
	        return SendClientMessage(playerid, COLOR_RED, "[!] คุณมีเงินไม่เพียงพอ");

		if (BacaraMoney[playerid] != 0)
		    return SendClientMessage(playerid, COLOR_RED, "[!] คุณอยู่ระหว่างการเดิมพัน!");

	    if (amount > 5000)
	        return SendClientMessage(playerid, COLOR_RED, "[!] คุณต้องระบุจำนวนไม่เกิน $5000");
	
	    if (amount < 2000)
	        return SendClientMessage(playerid, COLOR_RED, "[!] คุณต้องระบุจำนวนมากกว่า 2000");

		BacaraType[playerid] = 2;
		BacaraMoney[playerid] = amount;
		GivePlayerMoneyEx(playerid, -amount);

		SendClientMessageEx(playerid, COLOR_GREEN, "[!] วางเดิมพัน เสมอ $%s ", FormatNumber(amount));
	}
	return 1;
}

Dialog:DIALOG_BANKER(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);

	if(!response)
	{
		return 1;
	}

	if(response)
	{
        if (BacaraTime <= 0)
            return SendClientMessage(playerid, COLOR_RED, "[!] หมดเวลาในการลงเดิมพันแล้ว");

	    if (GetPlayerMoneyEx(playerid) < amount)
	        return SendClientMessage(playerid, COLOR_RED, "[!] คุณมีเงินไม่เพียงพอ");

		if (BacaraMoney[playerid] != 0)
		    return SendClientMessage(playerid, COLOR_RED, "[!] คุณอยู่ระหว่างการเดิมพัน!");

	    if (amount > 10000)
	        return SendClientMessage(playerid, COLOR_RED, "[!] คุณต้องระบุจำนวนไม่เกิน $10000");
	
	    if (amount < 2000)
	        return SendClientMessage(playerid, COLOR_RED, "[!] คุณต้องระบุจำนวนมากกว่า 2000");

		BacaraType[playerid] = 3;
		BacaraMoney[playerid] = amount;
		GivePlayerMoneyEx(playerid, -amount);

		SendClientMessageEx(playerid, COLOR_GREEN, "[!] เดิมพัน เจ้ามือ $%s", FormatNumber(amount));
	}
	return 1;
}

task BacaraTimer[1000]()
{
    new str_bacara[256], string[256];

    if (BacaraActive == 0)
    {
        if (BacaraTime > 0)
        {
            BacaraTime--;

            if (BacaraTime == 0) BacaraActive = 1;

            static hours, minutes, seconds;
            GetElapsedTime(BacaraTime, hours, minutes, seconds);

            format(str_bacara, sizeof(str_bacara), "00:%02d", seconds);
            TextDrawSetString(BACARATextDraws[7], str_bacara);
			
        }
		
		foreach (new i : Player) {
			if(JoinBacara[i] == 1) {
				if (BacaraTime > 0){
					TextDrawShowForPlayer(i, BACARATextDraws[7]);
				}
				if (BacaraTime == 0){
					TextDrawHideForPlayer(i, BACARATextDraws[7]);
				}
			}
		}

    }
    else
    {
        static bacara1, bacara2, bacara3, bacara4, bacara5, bacara6;

        BacaraNumber++;

        switch (BacaraNumber)
        {
            case 1:
            {
                bacara1 = random(44);
                PlayerBA[0] = BacaraInfo[bacara1][Point];
                format(string, sizeof(string), "%s", BacaraInfo[bacara1][Name]);
                TextDrawSetString(BACARATextDraws[1], string);
				
            }
            case 2:
            {
                bacara2 = random(44);
                PlayerBA[1] = BacaraInfo[bacara2][Point];
                format(string, sizeof(string), "%s", BacaraInfo[bacara2][Name]);
                TextDrawSetString(BACARATextDraws[2], string);
				
            }
            case 3:
            {
                PlayerPoint = (PlayerBA[0] + PlayerBA[1]) % 10;
            }
            case 4:
            {
                bacara4 = random(44);
                BankerBA[0] = BacaraInfo[bacara4][Point];
                format(string, sizeof(string), "%s", BacaraInfo[bacara4][Name]);
                TextDrawSetString(BACARATextDraws[4], string);
            }
            case 5:
            {
                bacara5 = random(44);
                BankerBA[1] = BacaraInfo[bacara5][Point];
                format(string, sizeof(string), "%s", BacaraInfo[bacara5][Name]);
                TextDrawSetString(BACARATextDraws[5], string);
            }
            case 6:
			{
				PlayerPoint = (PlayerBA[0] + PlayerBA[1]) % 10;
				BankerPoint = (BankerBA[0] + BankerBA[1]) % 10;

				if (PlayerPoint >= 8 || BankerPoint >= 8)
				{
					// ป๊อก: ไม่ต้องจั่ว
					PlayerBA[2] = -1;
					BankerBA[2] = -1;
					TextDrawSetString(BACARATextDraws[3], "ld_card:cdback");
					TextDrawSetString(BACARATextDraws[6], "ld_card:cdback");

					BacaraNumber = 8; // ข้ามไปตัดสินผลทันที
				}
			}

            case 7:
            {
                if (PlayerPoint <= 5)
                {
                    bacara3 = random(44);
                    PlayerBA[2] = BacaraInfo[bacara3][Point];
                    PlayerPoint = (PlayerBA[0] + PlayerBA[1] + PlayerBA[2]) % 10;
                    format(string, sizeof(string), "%s", BacaraInfo[bacara3][Name]);
                    TextDrawSetString(BACARATextDraws[3], string);
                }
                else
                {
                    PlayerBA[2] = -1;
                    TextDrawSetString(BACARATextDraws[3], "ld_card:cdback");
                }
            }
            case 8:
            {
                new shouldDraw = 0;
                if (PlayerBA[2] == -1)
                {
                    if (BankerPoint <= 5) shouldDraw = 1;
                }
                else
                {
                    new ThirdCard = PlayerBA[2];
                    switch (BankerPoint)
                    {
                        case 0,1,2: shouldDraw = 1;
                        case 3: if (ThirdCard != 8) shouldDraw = 1;
                        case 4: if (ThirdCard >= 2 && ThirdCard <= 7) shouldDraw = 1;
                        case 5: if (ThirdCard >= 4 && ThirdCard <= 7) shouldDraw = 1;
                        case 6: if (ThirdCard == 6 || ThirdCard == 7) shouldDraw = 1;
                    }
                }

                if (shouldDraw)
                {
                    bacara6 = random(44);
                    BankerBA[2] = BacaraInfo[bacara6][Point];
                    format(string, sizeof(string), "%s", BacaraInfo[bacara6][Name]);
                    TextDrawSetString(BACARATextDraws[6], string);
                }
                else
                {
                    BankerBA[2] = -1;
                    TextDrawSetString(BACARATextDraws[6], "ld_card:cdback");
                }

                BankerPoint = (BankerBA[0] + BankerBA[1] + ((BankerBA[2] != -1) ? BankerBA[2] : 0)) % 10;
            }
            case 9:
			{
				// คำนวณแต้มสุดท้ายอีกครั้ง (รวมใบที่ 3 ถ้ามี)
				PlayerPoint = (PlayerBA[0] + PlayerBA[1] + ((PlayerBA[2] != -1) ? PlayerBA[2] : 0)) % 10;
				BankerPoint = (BankerBA[0] + BankerBA[1] + ((BankerBA[2] != -1) ? BankerBA[2] : 0)) % 10;

				// ตัดสินผล
				if (PlayerPoint > BankerPoint)
				{
					SendBacaraMessage(COLOR_BLUE, "[PLAYER] {FFFFFF}เป็นฝ่ายชนะ !");
					foreach (new i : Player)
					{
						if (BacaraType[i] == 1)
						{
							GivePlayerMoneyEx(i, BacaraMoney[i] * 2);
							
							//SendClientMessage(i, COLOR_GREEN, "[คาสิโน] คุณชนะการเดิมพันครั้งนี้");
						}
						else if (BacaraType[i] != 0)
						{
							//SendClientMessage(i, COLOR_RED, "[คาสิโน] คุณแพ้การเดิมพันในครั้งนี้");
						}
					}
				}
				else if (BankerPoint > PlayerPoint)
				{
					SendBacaraMessage(COLOR_RED, "[BANKER] {FFFFFF}เป็นฝ่ายชนะ !");
					foreach (new i : Player)
					{
						if (BacaraType[i] == 3)
						{
							
							GivePlayerMoneyEx(i, BacaraMoney[i] * 2);
							
						}
					
						else if (BacaraType[i] != 0)
						{
							
						}
					}
				}
				else
				{
					SendBacaraMessage(COLOR_GREEN, "[เสมอ] {FFFFFF}ไม่มีฝ่ายชนะ!");
					foreach (new i : Player)
					{
						if (BacaraType[i] == 2) // แทงเสมอ แล้วถูก
						{
							
							GivePlayerMoneyEx(i, BacaraMoney[i] * 9); 
							
						}
						else if (BacaraType[i] == 1 || BacaraType[i] == 3) // แทงผู้เล่นหรือเจ้ามือ แต่ผลออกเสมอ
						{
							
							GivePlayerMoneyEx(i, BacaraMoney[i] / 2); // คืนแค่ครึ่ง
            				SendClientMessage(i, COLOR_YELLOW, "[คาสิโน] ผลออกเสมอ คุณได้รับเงินคืนครึ่งหนึ่งของเดิมพัน");
							//GivePlayerMoneyEx(i, BacaraMoney[i]); // คืนเงิน
							//SendClientMessage(i, COLOR_YELLOW, "[คาสิโน] ผลออกเสมอ ระบบคืนเงินเดิมพันให้คุณ");
						}
						else if (BacaraType[i] != 0)
						{
							
						}
					}
				}
				new winner = -1;
				if (PlayerPoint > BankerPoint) winner = 0;
				else if (BankerPoint > PlayerPoint) winner = 2;
				else winner = 1;

				BacaraHistory[BacaraHistoryIndex] = winner;
				BacaraHistoryIndex = (BacaraHistoryIndex + 1) % 10;
			}
			case 10:
            {
               
            }
			case 11:
            {
               
            }
			case 12:
            {
               
            }
			case 13:
            {
				ShowBacaraHistory();
				foreach (new i : Player)
				{
					
					BacaraType[i] = 0;
					BacaraMoney[i] = 0;
				}

				BacaraNumber = 0;
				BacaraActive = 0;
				BacaraTime = 15;
				PlayerPoint = -1;
				BankerPoint = -1;

				for (new i = 1; i <= 6; i++)
				{
					TextDrawSetString(BACARATextDraws[i], "ld_card:cdback");
				}
            }
        }
    }
    return 1;
}
ShowBacaraHistory()
{
    //SendClientMessage(playerid, 0x00C0FFFF, "[สถิติ] ผลชนะ 10 เกมล่าสุด:");
    
    new text[128];
    for (new i = 0; i < 10; i++)
    {
        new index = (BacaraHistoryIndex + i) % 10;
        switch (BacaraHistory[index])
        {
            case 0: strcat(text, "{00C0FF}P "); // Player
            case 1: strcat(text, "{00FF00}T "); // Tie
            case 2: strcat(text, "{FF0000}B "); // Banker
            default: strcat(text, "- ");        // ยังไม่มีข้อมูล
        }
    }
	SendBacaraMessage(COLOR_GREEN,text);
    //SendClientMessage(playerid, -1, text);
}

SendBacaraMessage(color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 8)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 8); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 144
		#emit PUSH.C string

		#emit LOAD.S.pri 8
		#emit ADD.C 4
		#emit PUSH.pri

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

        foreach (new i : Player)
		{
			if (JoinBacara[i] == 1)
			{
  				SendClientMessage(i, color, string);
			}
		}
		return 1;
	}
	foreach (new i : Player)
	{
		if (JoinBacara[i] == 1)
		{
			SendClientMessage(i, color, str);
		}
	}
	return 1;
}

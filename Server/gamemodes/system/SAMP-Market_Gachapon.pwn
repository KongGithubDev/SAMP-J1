#include <YSI_Coding\y_hooks>

#define SECONDS_TO_GACHAPON 		150

new PlayerBar:UI_GACHAPON_PROGRESS[MAX_PLAYERS][1];
new PlayerText:UI_GACHAPON_TEXTDRAW[MAX_PLAYERS][11];
new PlayerText:SLOT_GACHAPON_1[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_2[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_3[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_4[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_5[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_6[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_7[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_8[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_9[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_10[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_11[MAX_PLAYERS][2];
new PlayerText:SLOT_GACHAPON_12[MAX_PLAYERS][2];
new GACHAPON_TIMELAST[MAX_PLAYERS];
new GACHAPON_START[MAX_PLAYERS];
new GACHAPON_PLAYER[MAX_PLAYERS];
new GACHAPON_COUNT[MAX_PLAYERS];

enum GACHAPON_DATA
{
    GACHAPON_ID,
    GACHAPON_NAME[64],
    GACHAPON_TXD[64],
    GACHAPON_MIN,
    GACHAPON_MAX
}
new GACHAPON_MAIN[][GACHAPON_DATA] =
{
    { 0, "แร่เขียว", "GACHAPON:GACHA_19", 10, 20 },
    { 1, "แร่ฟ้า", "GACHAPON:GACHA_12", 10, 30 },
    { 2, "เครื่องมือซ่อมรถ", "GACHAPON:GACHA_13", 1, 2 },
    { 3, "พิซซ่า", "GACHAPON:GACHA_15", 1, 3 },
    { 4, "แร่เหลือง", "GACHAPON:GACHA_18", 10, 30 },
    { 5, "น้ำเปล่า", "GACHAPON:GACHA_20", 1, 1 },
    { 6, "เป๋าปอมปอม", "GACHAPON:GACHA_17", 1, 1 },
    { 7, "ปอมปอมปูริน", "GACHAPON:GACHA_14", 1, 1 },
    { 8, "แร่เหลือง", "GACHAPON:GACHA_18", 1, 1 },  
    { 9, "เครื่องมือซ่อมรถ", "GACHAPON:GACHA_13", 1, 1 }, 
    { 10, "เครื่องมือซ่อมรถ", "GACHAPON:GACHA_13", 1, 2 },
    { 11, "เครื่องมือซ่อมรถ", "GACHAPON:GACHA_13", 1, 2 },
    { 12, "แร่เขียว", "GACHAPON:GACHA_19", 10, 20 },
    { 13, "แร่เขียว", "GACHAPON:GACHA_19", 10, 20 }
};

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(GACHAPON_PLAYER[playerid] == 1)
	{
        if(clickedid == Text: INVALID_TEXT_DRAW)
		{
            GACHAPON_INTERFACE(playerid, false); 
            return 1;
        }
    }
    return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
    if(GACHAPON_PLAYER[playerid] == 1)
	{
		if(playertextid == UI_GACHAPON_TEXTDRAW[playerid][6])
		{
            if(GACHAPON_START[playerid] == 0)
			{
                if(Inventory_Count(playerid, "กาชาปอง") >= GACHAPON_COUNT[playerid])
                {
                    GACHAPON_START[playerid] = SetTimerEx("GACHAPON_UPDATE", SECONDS_TO_GACHAPON, true, "i", playerid);
                    GACHAPON_CHECK(playerid);
                }
                else {
                    SendClientMessageEx(playerid, -1, "คุณมีกาชาปองไม่เพียงพอนะครับตามกำหนด !");
                }
			}
			else {
                SendClientMessageEx(playerid, -1, "คุณอยู่ระหว่างการสุ่มกาชาปองอยู่นะครับ !");
			}
		}
        if(playertextid == UI_GACHAPON_TEXTDRAW[playerid][7])
        {
            GACHAPON_COUNT[playerid] ++;
            if(GACHAPON_COUNT[playerid] > 12) GACHAPON_COUNT[playerid] = 1;
            GACHAPON_CHECK(playerid);
        }

        if(playertextid == UI_GACHAPON_TEXTDRAW[playerid][8])
        {
            GACHAPON_COUNT[playerid] --;
            if(GACHAPON_COUNT[playerid] < 1) GACHAPON_COUNT[playerid] = 12;
            GACHAPON_CHECK(playerid);
        }
    }
    return 1;
}

forward GACHAPON_UPDATE(playerid);
public GACHAPON_UPDATE(playerid)
{
    new slot_1 = random(12);
    new random_1 = randomEx(GACHAPON_MAIN[slot_1][GACHAPON_MIN], GACHAPON_MAIN[slot_1][GACHAPON_MAX]);

    new slot_2 = random(12);
    new random_2 = randomEx(GACHAPON_MAIN[slot_2][GACHAPON_MIN], GACHAPON_MAIN[slot_2][GACHAPON_MAX]);

    new slot_3 = random(12);
    new random_3 = randomEx(GACHAPON_MAIN[slot_3][GACHAPON_MIN], GACHAPON_MAIN[slot_3][GACHAPON_MAX]);

    new slot_4 = random(12);
    new random_4 = randomEx(GACHAPON_MAIN[slot_4][GACHAPON_MIN], GACHAPON_MAIN[slot_4][GACHAPON_MAX]);

    new slot_5 = random(12);
    new random_5 = randomEx(GACHAPON_MAIN[slot_5][GACHAPON_MIN], GACHAPON_MAIN[slot_5][GACHAPON_MAX]);

    new slot_6 = random(12);
    new random_6 = randomEx(GACHAPON_MAIN[slot_6][GACHAPON_MIN], GACHAPON_MAIN[slot_6][GACHAPON_MAX]);

    new slot_7 = random(12);
    new random_7 = randomEx(GACHAPON_MAIN[slot_7][GACHAPON_MIN], GACHAPON_MAIN[slot_7][GACHAPON_MAX]);

    new slot_8 = random(12);
    new random_8 = randomEx(GACHAPON_MAIN[slot_8][GACHAPON_MIN], GACHAPON_MAIN[slot_8][GACHAPON_MAX]);

    new slot_9 = random(12);
    new random_9 = randomEx(GACHAPON_MAIN[slot_9][GACHAPON_MIN], GACHAPON_MAIN[slot_9][GACHAPON_MAX]);

    new slot_10 = random(12);
    new random_10 = randomEx(GACHAPON_MAIN[slot_10][GACHAPON_MIN], GACHAPON_MAIN[slot_10][GACHAPON_MAX]);

    new slot_11 = random(12);
    new random_11 = randomEx(GACHAPON_MAIN[slot_11][GACHAPON_MIN], GACHAPON_MAIN[slot_11][GACHAPON_MAX]);

    new slot_12 = random(12);
    new random_12 = randomEx(GACHAPON_MAIN[slot_12][GACHAPON_MIN], GACHAPON_MAIN[slot_12][GACHAPON_MAX]);
    
    new string[256];
    GACHAPON_RESET(playerid);
	GACHAPON_TIMELAST[playerid] ++;
    PlayerPlaySound(playerid, 4203, 0.0, 0.0, 0.0);
    
	if(GACHAPON_TIMELAST[playerid] == 12)
	{
        PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
        if(GACHAPON_COUNT[playerid] > 0)
        {
            if(Inventory_Count(playerid, "แต้มกาชาปอง") >= 990)
            {
                Inventory_Set(playerid, "แต้มกาชาปอง", 0);
            }
            else {
                if(slot_1 == 6)
                {
                    GivePlayerMoneyEx(playerid, random_1);
                }
                else if(slot_1 == 11)
                {
                    GivePlayerRedMoney(playerid, random_1);
                }
                else {
                    Inventory_Add(playerid, GACHAPON_MAIN[slot_1][GACHAPON_NAME], random_1);
                }   
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_1][GACHAPON_NAME], FormatNumber(random_1));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_1[playerid][0], GACHAPON_MAIN[slot_1][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_1[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_1));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_1[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_1[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 1)
        {
            if(slot_2 == 6)
            {
                GivePlayerMoneyEx(playerid, random_2);
            }
            else if(slot_2 == 11)
            {
                GivePlayerRedMoney(playerid, random_2);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_2][GACHAPON_NAME], random_2);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_2][GACHAPON_NAME], FormatNumber(random_2));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_2[playerid][0], GACHAPON_MAIN[slot_2][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_2[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_2));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_2[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_2[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 2)
        {
            if(slot_3 == 6)
            {
                GivePlayerMoneyEx(playerid, random_3);
            }
            else if(slot_3 == 11)
            {
                GivePlayerRedMoney(playerid, random_3);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_3][GACHAPON_NAME], random_3);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_3][GACHAPON_NAME], FormatNumber(random_3));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_3[playerid][0], GACHAPON_MAIN[slot_3][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_3[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_3));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_3[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_3[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 3)
        {
            if(slot_4 == 6)
            {
                GivePlayerMoneyEx(playerid, random_4);
            }
            else if(slot_4 == 11)
            {
                GivePlayerRedMoney(playerid, random_4);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_4][GACHAPON_NAME], random_4);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_4][GACHAPON_NAME], FormatNumber(random_4));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_4[playerid][0], GACHAPON_MAIN[slot_4][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_4[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_4));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_4[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_4[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 4)
        {
            if(slot_5 == 6)
            {
                GivePlayerMoneyEx(playerid, random_5);
            }
            else if(slot_5 == 11)
            {
                GivePlayerRedMoney(playerid, random_5);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_5][GACHAPON_NAME], random_5);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_5][GACHAPON_NAME], FormatNumber(random_5));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_5[playerid][0], GACHAPON_MAIN[slot_5][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_5[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_5));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_5[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_5[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 5)
        {
            if(slot_6 == 6)
            {
                GivePlayerMoneyEx(playerid, random_6);
            }
            else if(slot_6 == 11)
            {
                GivePlayerRedMoney(playerid, random_6);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_6][GACHAPON_NAME], random_6);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_6][GACHAPON_NAME], FormatNumber(random_6));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_6[playerid][0], GACHAPON_MAIN[slot_6][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_6[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_6));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_6[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_6[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 6)
        {
            if(slot_7 == 6)
            {
                GivePlayerMoneyEx(playerid, random_7);
            }
            else if(slot_7 == 11)
            {
                GivePlayerRedMoney(playerid, random_7);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_7][GACHAPON_NAME], random_7);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_7][GACHAPON_NAME], FormatNumber(random_7));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_7[playerid][0], GACHAPON_MAIN[slot_7][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_7[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_7));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_7[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_7[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 7)
        {
            if(slot_8 == 6)
            {
                GivePlayerMoneyEx(playerid, random_8);
            }
            else if(slot_8 == 11)
            {
                GivePlayerRedMoney(playerid, random_8);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_8][GACHAPON_NAME], random_8);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_8][GACHAPON_NAME], FormatNumber(random_8));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_8[playerid][0], GACHAPON_MAIN[slot_8][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_8[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_8));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_8[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_8[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 8)
        {
            if(slot_9 == 6)
            {
                GivePlayerMoneyEx(playerid, random_9);
            }
            else if(slot_9 == 11)
            {
                GivePlayerRedMoney(playerid, random_9);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_9][GACHAPON_NAME], random_9);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_9][GACHAPON_NAME], FormatNumber(random_9));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_9[playerid][0], GACHAPON_MAIN[slot_9][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_9[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_9));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_9[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_9[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 9)
        {
            if(slot_10 == 6)
            {
                GivePlayerMoneyEx(playerid, random_10);
            }
            else if(slot_10 == 11)
            {
                GivePlayerRedMoney(playerid, random_10);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_10][GACHAPON_NAME], random_10);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_10][GACHAPON_NAME], FormatNumber(random_10));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_10[playerid][0], GACHAPON_MAIN[slot_10][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_10[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_10));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_10[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_10[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 10)
        {
            if(slot_11 == 6)
            {
                GivePlayerMoneyEx(playerid, random_11);
            }
            else if(slot_11 == 11)
            {
                GivePlayerRedMoney(playerid, random_11);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_11][GACHAPON_NAME], random_11);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_11][GACHAPON_NAME], FormatNumber(random_11));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_11[playerid][0], GACHAPON_MAIN[slot_11][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_11[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_11));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_11[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_11[playerid][1]);
        }
        if(GACHAPON_COUNT[playerid] > 11)
        {
            if(slot_12 == 6)
            {
                GivePlayerMoneyEx(playerid, random_12);
            }
            else if(slot_12 == 11)
            {
                GivePlayerRedMoney(playerid, random_12);
            }
            else {
                Inventory_Add(playerid, GACHAPON_MAIN[slot_12][GACHAPON_NAME], random_12);
            }
            SendClientMessageEx(playerid, -1, "คุณได้รับ %s จำนวน %s", GACHAPON_MAIN[slot_12][GACHAPON_NAME], FormatNumber(random_12));

            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_12[playerid][0], GACHAPON_MAIN[slot_12][GACHAPON_TXD]);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_12[playerid][0]);
            format(string, sizeof(string), "%s", FormatNumber(random_12));
            PlayerTextDrawSetString(playerid, SLOT_GACHAPON_12[playerid][1], string);
            PlayerTextDrawShow(playerid, SLOT_GACHAPON_12[playerid][1]);
        }
        Inventory_Remove(playerid, "กาชาปอง", GACHAPON_COUNT[playerid]);
        if(Inventory_Count(playerid, "แต้มกาชาปอง") != 1000)
        {
            Inventory_Add(playerid, "แต้มกาชาปอง", 10);
        }
        KillTimer(GACHAPON_START[playerid]);
        GACHAPON_TIMELAST[playerid] = 0;
        GACHAPON_START[playerid] = 0;
		return 1;
	}
	return 1;
}

forward GACHAPON_RESET(playerid);
public GACHAPON_RESET(playerid)
{
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_1[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_1[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_1[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_2[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_2[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_2[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_3[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_3[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_3[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_4[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_4[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_4[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_5[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_5[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_5[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_6[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_6[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_6[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_7[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_7[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_7[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_8[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_8[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_8[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_9[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_9[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_9[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_10[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_10[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_10[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_11[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_11[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_11[playerid][1], "");
	
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_12[playerid][0], "GACHAPON:GACHA_9");
	PlayerTextDrawShow(playerid, SLOT_GACHAPON_12[playerid][0]);
	PlayerTextDrawSetString(playerid, SLOT_GACHAPON_12[playerid][1], "");	
	return 1;
}

forward GACHAPON_CREATE(playerid);
public GACHAPON_CREATE(playerid)
{
    UI_GACHAPON_PROGRESS[playerid][0] = CreatePlayerProgressBar(playerid, 204.500000, 340.000000, 115.250000, 8.500000, 8373503, 100.000000, 0);
    SetPlayerProgressBarValue(playerid, UI_GACHAPON_PROGRESS[playerid][0], 50);
    SetPlayerProgressBarBackColour(playerid, UI_GACHAPON_PROGRESS[playerid][0], 0x00000000);
    SetPlayerProgressBarBgColour(playerid, UI_GACHAPON_PROGRESS[playerid][0], 0x303030FF, true);

    UI_GACHAPON_TEXTDRAW[playerid][0] = CreatePlayerTextDraw(playerid, 166.000000, 119.500000, "GACHAPON:GACHA_1");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 320.000000, 240.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 1);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][0], 0);

    UI_GACHAPON_TEXTDRAW[playerid][1] = CreatePlayerTextDraw(playerid, 233.500000, 129.500000, "GACHAPON:GACHA_2");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 90.000000, 16.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 1);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][1], 0);

    UI_GACHAPON_TEXTDRAW[playerid][2] = CreatePlayerTextDraw(playerid, 326.500000, 129.500000, "GACHAPON:GACHA_3");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 4);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 48.000000, 16.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 1);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][2], 0);

    UI_GACHAPON_TEXTDRAW[playerid][3] = CreatePlayerTextDraw(playerid, 354.000000, 133.500000, "100");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 1);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 0.180000, 1.000000);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 0);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 2);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], -572662273);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 0);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], 0);

    UI_GACHAPON_TEXTDRAW[playerid][4] = CreatePlayerTextDraw(playerid, 377.250000, 129.500000, "GACHAPON:GACHA_4");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 4);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 48.000000, 16.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 1);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][4], 0);

    UI_GACHAPON_TEXTDRAW[playerid][5] = CreatePlayerTextDraw(playerid, 428.000000, 129.500000, "GACHAPON:GACHA_5");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 4);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 48.000000, 16.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 1);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][5], 0);

    UI_GACHAPON_TEXTDRAW[playerid][6] = CreatePlayerTextDraw(playerid, 433.000000, 324.500000, "GACHAPON:GACHA_6");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 4);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 38.000000, 15.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 1);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][6], 1);

    UI_GACHAPON_TEXTDRAW[playerid][7] = CreatePlayerTextDraw(playerid, 409.500000, 331.500000, "GACHAPON:GACHA_7");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 4);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 11.000000, 13.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 1);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][7], 1);

    UI_GACHAPON_TEXTDRAW[playerid][8] = CreatePlayerTextDraw(playerid, 341.500000, 331.500000, "GACHAPON:GACHA_8");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 4);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 11.000000, 13.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 1);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], -1);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][8], 1);

    UI_GACHAPON_TEXTDRAW[playerid][9] = CreatePlayerTextDraw(playerid, 381.000000, 335.000000, "");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 1);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 0);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 2);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], -572662273);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 0);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], 0);

    UI_GACHAPON_TEXTDRAW[playerid][10] = CreatePlayerTextDraw(playerid, 260.000000, 341.500000, "");
    PlayerTextDrawFont(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 1);
    PlayerTextDrawLetterSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 0.140000, 0.649999);
    PlayerTextDrawTextSize(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 0);
    PlayerTextDrawSetShadow(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 0);
    PlayerTextDrawAlignment(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 2);
    PlayerTextDrawColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], -572662273);
    PlayerTextDrawBackgroundColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 255);
    PlayerTextDrawBoxColor(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 50);
    PlayerTextDrawUseBox(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 0);
    PlayerTextDrawSetProportional(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], 0);

    SLOT_GACHAPON_1[playerid][0] = CreatePlayerTextDraw(playerid, 183.000000, 164.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_1[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_1[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_1[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_1[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_1[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_1[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_1[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_1[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_1[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_1[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_1[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_1[playerid][0], 0);

    SLOT_GACHAPON_1[playerid][1] = CreatePlayerTextDraw(playerid, 204.750000, 216.250000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_1[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_1[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_1[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_1[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_1[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_1[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_1[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_1[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_1[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_1[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_1[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_1[playerid][1], 0);

    SLOT_GACHAPON_2[playerid][0] = CreatePlayerTextDraw(playerid, 231.000000, 164.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_2[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_2[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_2[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_2[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_2[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_2[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_2[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_2[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_2[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_2[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_2[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_2[playerid][0], 0);

    SLOT_GACHAPON_2[playerid][1] = CreatePlayerTextDraw(playerid, 252.750000, 216.250000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_2[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_2[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_2[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_2[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_2[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_2[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_2[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_2[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_2[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_2[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_2[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_2[playerid][1], 0);

    SLOT_GACHAPON_3[playerid][0] = CreatePlayerTextDraw(playerid, 279.000000, 164.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_3[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_3[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_3[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_3[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_3[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_3[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_3[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_3[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_3[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_3[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_3[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_3[playerid][0], 0);

    SLOT_GACHAPON_3[playerid][1] = CreatePlayerTextDraw(playerid, 301.000000, 216.250000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_3[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_3[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_3[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_3[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_3[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_3[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_3[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_3[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_3[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_3[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_3[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_3[playerid][1], 0);

    SLOT_GACHAPON_4[playerid][0] = CreatePlayerTextDraw(playerid, 327.250000, 164.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_4[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_4[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_4[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_4[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_4[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_4[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_4[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_4[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_4[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_4[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_4[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_4[playerid][0], 0);

    SLOT_GACHAPON_4[playerid][1] = CreatePlayerTextDraw(playerid, 349.250000, 216.250000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_4[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_4[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_4[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_4[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_4[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_4[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_4[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_4[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_4[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_4[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_4[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_4[playerid][1], 0);

    SLOT_GACHAPON_5[playerid][0] = CreatePlayerTextDraw(playerid, 375.500000, 164.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_5[playerid][0], 4); 
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_5[playerid][0], 0.600000, 2.000000); 
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_5[playerid][0], 44.000000, 64.000000); 
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_5[playerid][0], 1); 
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_5[playerid][0], 0); 
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_5[playerid][0], 1); 
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_5[playerid][0], -1); 
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_5[playerid][0], 255); 
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_5[playerid][0], 50); 
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_5[playerid][0], 1); 
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_5[playerid][0], 1); 
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_5[playerid][0], 0);

    SLOT_GACHAPON_5[playerid][1] = CreatePlayerTextDraw(playerid, 397.500000, 216.250000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_5[playerid][1], 1); 
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_5[playerid][1], 0.150000, 0.749997); 
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_5[playerid][1], 400.000000, 17.000000); 
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_5[playerid][1], 0); 
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_5[playerid][1], 0); 
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_5[playerid][1], 2); 
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_5[playerid][1], -572662273); 
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_5[playerid][1], 255); 
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_5[playerid][1], 50); 
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_5[playerid][1], 0); 
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_5[playerid][1], 1); 
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_5[playerid][1], 0);

    SLOT_GACHAPON_6[playerid][0] = CreatePlayerTextDraw(playerid, 423.750000, 164.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_6[playerid][0], 4); 
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_6[playerid][0], 0.600000, 2.000000); 
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_6[playerid][0], 44.000000, 64.000000); 
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_6[playerid][0], 1); 
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_6[playerid][0], 0); 
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_6[playerid][0], 1); 
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_6[playerid][0], -1); 
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_6[playerid][0], 255); 
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_6[playerid][0], 50); 
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_6[playerid][0], 1); 
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_6[playerid][0], 1); 
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_6[playerid][0], 0);

    SLOT_GACHAPON_6[playerid][1] = CreatePlayerTextDraw(playerid, 445.500000, 216.250000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_6[playerid][1], 1); 
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_6[playerid][1], 0.150000, 0.749997); 
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_6[playerid][1], 400.000000, 17.000000); 
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_6[playerid][1], 0); 
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_6[playerid][1], 0); 
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_6[playerid][1], 2); 
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_6[playerid][1], -572662273); 
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_6[playerid][1], 255); 
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_6[playerid][1], 50); 
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_6[playerid][1], 0); 
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_6[playerid][1], 1); 
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_6[playerid][1], 0);

    SLOT_GACHAPON_7[playerid][0] = CreatePlayerTextDraw(playerid, 183.000000, 232.500000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_7[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_7[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_7[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_7[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_7[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_7[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_7[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_7[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_7[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_7[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_7[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_7[playerid][0], 0);

    SLOT_GACHAPON_7[playerid][1] = CreatePlayerTextDraw(playerid, 204.750000, 285.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_7[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_7[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_7[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_7[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_7[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_7[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_7[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_7[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_7[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_7[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_7[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_7[playerid][1], 0);

    SLOT_GACHAPON_8[playerid][0] = CreatePlayerTextDraw(playerid, 231.000000, 232.500000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_8[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_8[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_8[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_8[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_8[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_8[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_8[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_8[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_8[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_8[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_8[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_8[playerid][0], 0);

    SLOT_GACHAPON_8[playerid][1] = CreatePlayerTextDraw(playerid, 252.750000, 285.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_8[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_8[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_8[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_8[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_8[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_8[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_8[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_8[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_8[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_8[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_8[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_8[playerid][1], 0);

    SLOT_GACHAPON_9[playerid][0] = CreatePlayerTextDraw(playerid, 279.000000, 232.500000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_9[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_9[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_9[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_9[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_9[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_9[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_9[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_9[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_9[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_9[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_9[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_9[playerid][0], 0);

    SLOT_GACHAPON_9[playerid][1] = CreatePlayerTextDraw(playerid, 301.000000, 285.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_9[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_9[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_9[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_9[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_9[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_9[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_9[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_9[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_9[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_9[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_9[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_9[playerid][1], 0);

    SLOT_GACHAPON_10[playerid][0] = CreatePlayerTextDraw(playerid, 327.250000, 232.500000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_10[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_10[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_10[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_10[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_10[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_10[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_10[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_10[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_10[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_10[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_10[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_10[playerid][0], 0);

    SLOT_GACHAPON_10[playerid][1] = CreatePlayerTextDraw(playerid, 349.250000, 285.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_10[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_10[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_10[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_10[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_10[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_10[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_10[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_10[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_10[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_10[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_10[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_10[playerid][1], 0);

    SLOT_GACHAPON_11[playerid][0] = CreatePlayerTextDraw(playerid, 375.500000, 232.500000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_11[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_11[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_11[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_11[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_11[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_11[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_11[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_11[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_11[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_11[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_11[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_11[playerid][0], 0);

    SLOT_GACHAPON_11[playerid][1] = CreatePlayerTextDraw(playerid, 397.500000, 285.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_11[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_11[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_11[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_11[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_11[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_11[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_11[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_11[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_11[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_11[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_11[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_11[playerid][1], 0);

    SLOT_GACHAPON_12[playerid][0] = CreatePlayerTextDraw(playerid, 423.750000, 232.500000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_12[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_12[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_12[playerid][0], 44.000000, 64.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_12[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_12[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_12[playerid][0], 1);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_12[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_12[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_12[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_12[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_12[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_12[playerid][0], 0);

    SLOT_GACHAPON_12[playerid][1] = CreatePlayerTextDraw(playerid, 445.500000, 285.000000, "");
    PlayerTextDrawFont(playerid, SLOT_GACHAPON_12[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, SLOT_GACHAPON_12[playerid][1], 0.150000, 0.749997);
    PlayerTextDrawTextSize(playerid, SLOT_GACHAPON_12[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, SLOT_GACHAPON_12[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, SLOT_GACHAPON_12[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, SLOT_GACHAPON_12[playerid][1], 2);
    PlayerTextDrawColor(playerid, SLOT_GACHAPON_12[playerid][1], -572662273);
    PlayerTextDrawBackgroundColor(playerid, SLOT_GACHAPON_12[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, SLOT_GACHAPON_12[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, SLOT_GACHAPON_12[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, SLOT_GACHAPON_12[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, SLOT_GACHAPON_12[playerid][1], 0);
    return 1;
}

forward GACHAPON_CHECK(playerid);
public GACHAPON_CHECK(playerid)
{
    new string[256];
    
    SetPlayerProgressBarMaxValue(playerid, UI_GACHAPON_PROGRESS[playerid][0], 1000);
    SetPlayerProgressBarValue(playerid, UI_GACHAPON_PROGRESS[playerid][0], Inventory_Count(playerid, "แต้มกาชาปอง"));

    format(string, sizeof(string), "%d", Inventory_Count(playerid, "กาชาปอง"));
    PlayerTextDrawSetString(playerid, UI_GACHAPON_TEXTDRAW[playerid][3], string);

    format(string, sizeof(string), "%d", GACHAPON_COUNT[playerid]);
    PlayerTextDrawSetString(playerid, UI_GACHAPON_TEXTDRAW[playerid][9], string);
 
    format(string, sizeof(string), "%d/1000", Inventory_Count(playerid, "แต้มกาชาปอง"));
    PlayerTextDrawSetString(playerid, UI_GACHAPON_TEXTDRAW[playerid][10], string);
    return 1;
}

stock GACHAPON_INTERFACE(playerid, bool:enable)
{
	if(enable == true)
	{
        GACHAPON_PLAYER[playerid] = 1;
        GACHAPON_COUNT[playerid] = 1;
        GACHAPON_CREATE(playerid);
        GACHAPON_CHECK(playerid);
        ShowPlayerProgressBar(playerid, UI_GACHAPON_PROGRESS[playerid][0]);
        for (new i = 0; i < 11; i ++)
        {
            PlayerTextDrawShow(playerid, UI_GACHAPON_TEXTDRAW[playerid][i]);
        }
        SelectTextDraw(playerid, -1);
    }
    else {
        GACHAPON_PLAYER[playerid] = 0;
        DestroyPlayerProgressBar(playerid, UI_GACHAPON_PROGRESS[playerid][0]);
        for (new i = 0; i < 11; i ++)
        {
            PlayerTextDrawDestroy(playerid, UI_GACHAPON_TEXTDRAW[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_1[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_2[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_3[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_4[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_5[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_6[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_7[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_8[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_9[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_10[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_11[playerid][i]);
        }
        for (new i = 0; i < 2; i ++)
        {
            PlayerTextDrawDestroy(playerid, SLOT_GACHAPON_12[playerid][i]);
        }
        CancelSelectTextDraw(playerid);
    }
    return 1;
}

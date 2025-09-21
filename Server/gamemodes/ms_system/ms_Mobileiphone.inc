#include 	<YSI_Coding\y_hooks>

new PlayerText:ms_iphoneTD[MAX_PLAYERS][9];

hook OnPlayerConnect(playerid)
{
	ms_iphoneTD[playerid][0] = CreatePlayerTextDraw(playerid, 398.000000, 131.000000, "ms_hudserver:ms_mbiphone");
	PlayerTextDrawFont(playerid, ms_iphoneTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, ms_iphoneTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_iphoneTD[playerid][0], 110.500000, 246.500000);
	PlayerTextDrawSetOutline(playerid, ms_iphoneTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, ms_iphoneTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, ms_iphoneTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, ms_iphoneTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_iphoneTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, ms_iphoneTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, ms_iphoneTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ms_iphoneTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, ms_iphoneTD[playerid][0], 0);

	ms_iphoneTD[playerid][1] = CreatePlayerTextDraw(playerid, 410.000000, 344.000000, "ms_hudserver:ms_mbiphone1");
	PlayerTextDrawFont(playerid, ms_iphoneTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, ms_iphoneTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_iphoneTD[playerid][1], 15.500000, 16.500000);
	PlayerTextDrawSetOutline(playerid, ms_iphoneTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, ms_iphoneTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, ms_iphoneTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, ms_iphoneTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_iphoneTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, ms_iphoneTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, ms_iphoneTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, ms_iphoneTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ms_iphoneTD[playerid][1], 1);

	ms_iphoneTD[playerid][2] = CreatePlayerTextDraw(playerid, 434.000000, 344.000000, "ms_hudserver:ms_mbiphone1");
	PlayerTextDrawFont(playerid, ms_iphoneTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, ms_iphoneTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_iphoneTD[playerid][2], 15.500000, 16.500000);
	PlayerTextDrawSetOutline(playerid, ms_iphoneTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, ms_iphoneTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, ms_iphoneTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, ms_iphoneTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_iphoneTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, ms_iphoneTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, ms_iphoneTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, ms_iphoneTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, ms_iphoneTD[playerid][2], 1);

	ms_iphoneTD[playerid][3] = CreatePlayerTextDraw(playerid, 458.000000, 344.000000, "ms_hudserver:ms_mbiphone1");
	PlayerTextDrawFont(playerid, ms_iphoneTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, ms_iphoneTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_iphoneTD[playerid][3], 15.500000, 16.500000);
	PlayerTextDrawSetOutline(playerid, ms_iphoneTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, ms_iphoneTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, ms_iphoneTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, ms_iphoneTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_iphoneTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, ms_iphoneTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, ms_iphoneTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, ms_iphoneTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, ms_iphoneTD[playerid][3], 1);

	ms_iphoneTD[playerid][4] = CreatePlayerTextDraw(playerid, 410.000000, 156.000000, "ms_hudserver:ms_mbiphone1");
	PlayerTextDrawFont(playerid, ms_iphoneTD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, ms_iphoneTD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_iphoneTD[playerid][4], 15.500000, 16.500000);
	PlayerTextDrawSetOutline(playerid, ms_iphoneTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, ms_iphoneTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, ms_iphoneTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, ms_iphoneTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_iphoneTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, ms_iphoneTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, ms_iphoneTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, ms_iphoneTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, ms_iphoneTD[playerid][4], 1);

	ms_iphoneTD[playerid][5] = CreatePlayerTextDraw(playerid, 434.000000, 156.000000, "ms_hudserver:ms_mbiphone1");
	PlayerTextDrawFont(playerid, ms_iphoneTD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, ms_iphoneTD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_iphoneTD[playerid][5], 15.500000, 16.500000);
	PlayerTextDrawSetOutline(playerid, ms_iphoneTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, ms_iphoneTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, ms_iphoneTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, ms_iphoneTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_iphoneTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, ms_iphoneTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, ms_iphoneTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, ms_iphoneTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, ms_iphoneTD[playerid][5], 1);

	ms_iphoneTD[playerid][6] = CreatePlayerTextDraw(playerid, 457.000000, 156.000000, "ms_hudserver:ms_mbiphone1");
	PlayerTextDrawFont(playerid, ms_iphoneTD[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, ms_iphoneTD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_iphoneTD[playerid][6], 15.500000, 16.500000);
	PlayerTextDrawSetOutline(playerid, ms_iphoneTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, ms_iphoneTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, ms_iphoneTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, ms_iphoneTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_iphoneTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, ms_iphoneTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, ms_iphoneTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, ms_iphoneTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, ms_iphoneTD[playerid][6], 1);

	ms_iphoneTD[playerid][7] = CreatePlayerTextDraw(playerid, 480.000000, 156.000000, "ms_hudserver:ms_mbiphone1");
	PlayerTextDrawFont(playerid, ms_iphoneTD[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, ms_iphoneTD[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_iphoneTD[playerid][7], 15.500000, 16.500000);
	PlayerTextDrawSetOutline(playerid, ms_iphoneTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, ms_iphoneTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, ms_iphoneTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, ms_iphoneTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_iphoneTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, ms_iphoneTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, ms_iphoneTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, ms_iphoneTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, ms_iphoneTD[playerid][7], 1);

	ms_iphoneTD[playerid][8] = CreatePlayerTextDraw(playerid, 432.000000, 367.000000, "ms_hudserver:ms_mbiphone1");
	PlayerTextDrawFont(playerid, ms_iphoneTD[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, ms_iphoneTD[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ms_iphoneTD[playerid][8], 44.000000, 6.000000);
	PlayerTextDrawSetOutline(playerid, ms_iphoneTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, ms_iphoneTD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, ms_iphoneTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, ms_iphoneTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, ms_iphoneTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, ms_iphoneTD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, ms_iphoneTD[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, ms_iphoneTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, ms_iphoneTD[playerid][8], 1);

	return 1;
}

ShowPlayerms_iPhone(playerid, bool:enable){
	if(enable == true)
	{
		for(new i = 0; i < 9; i ++)
		{
			PlayerTextDrawShow(playerid, ms_iphoneTD[playerid][i]);
		}
        SelectTextDraw(playerid, -1);
	}
	else
	{
		for(new i = 0; i < 9; i ++)
		{
			PlayerTextDrawHide(playerid, ms_iphoneTD[playerid][i]);
		}
        CancelSelectTextDraw(playerid);
	}
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) 
{
    if(clickedid == Text:INVALID_TEXT_DRAW) 
	{
        for(new i=0; i<9; i++) 
		{
            PlayerTextDrawHide(playerid, ms_iphoneTD[playerid][i]);
        }
    }
    return true;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
    if(playertextid == ms_iphoneTD[playerid][1])
	{
		Dialog_Show(playerid, DIALOG_DIALNUMBER, DIALOG_STYLE_INPUT, "[หมายเลขที่ต้องการโทร]", "{FFFFFF}ใส่หมายเลขที่ต้องการจะติดต่อ", "โทร", "กลับ");
        PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
	}
	if(playertextid == ms_iphoneTD[playerid][2])
	{
       Dialog_Show(playerid, DIALOG_SENDTEXT, DIALOG_STYLE_INPUT, "[ส่งข้อความ]", "{FFFFFF}ใส่หมายเลขที่ต้องการจะส่งข้อความ", "ส่ง", "กลับ");
       PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
	}
	if(playertextid == ms_iphoneTD[playerid][3])
	{
        ShowContacts(playerid);
        PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
	}
	if(playertextid == ms_iphoneTD[playerid][4])
	{
		Dialog_Show(playerid, DIALOG_TW, DIALOG_STYLE_LIST, "{0698DA}Twitter", "{FFFFFF}โพสต์ข้อความ\nโพสต์ในนามแก๊ง หรือ หน่วยงาน", "เลือก", "ยกเลิก");
        PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
	}
	if(playertextid == ms_iphoneTD[playerid][5])
	{
        callcmd::gps(playerid, "\1");
        PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
	}
	if(playertextid == ms_iphoneTD[playerid][6])
	{
		new string100[10000];
		new string2[10000];

		format(string100, sizeof(string100), "{FFFFFF}ชื่อสินค้า\t{FFFFFF}ราคา\n");
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}รังผึ่ง\t{00FF00}$%d\n", priceHoney );
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}ส้ม\t{00FF00}$%d\n", priceOrange);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}ข้าว\t{00FF00}$%d\n", priceRice);
		strcat(string2,string100);	

		format(string100, sizeof(string100), "{FFFFFF}ปลาหมึก\t{00FF00}$%d\n", priceSquid);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}แร่เหลือง\t{00FF00}$%d\n", priceMining1);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}แร่เขียว\t{00FF00}$%d\n", priceMining2);
		strcat(string2,string100);			

		format(string100, sizeof(string100), "{FFFFFF}แร่ฟ้า\t{00FF00}$%d\n", priceMining3);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}แร่แดง\t{00FF00}$%d\n", priceMining4);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}กล้วย\t{00FF00}$%d\n", priceBanana);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}ล็อบสเตอร์\t{00FF00}$%d\n", priceLobster);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}ทุเรียน\t{00FF00}$%d\n", priceDurian);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}กระบองเพชร\t{00FF00}$%d\n", priceCactus);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}ผักกาด\t{00FF00}$%d\n", priceLettuce);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}ปลาทู\t{00FF00}$%d\n", pricefish1);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}ปลาแซลม่อน\t{00FF00}$%d\n", pricefish2);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}ปลานิล\t{00FF00}$%d\n", pricefish3);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}ปู\t{00FF00}$%d\n", pricefish4);
		strcat(string2,string100);

		format(string100, sizeof(string100), "{FFFFFF}กุ้ง\t{00FF00}$%d\n", pricefish5);
		strcat(string2,string100);

		Dialog_Show(playerid, DIALOG_SHOPSELL, DIALOG_STYLE_TABLIST_HEADERS,"[ ราคาสินค้า ]", string2, "ตกลง","ยกเลิก");
        PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
	}
	if(playertextid == ms_iphoneTD[playerid][7])
	{
		Dialog_Show(playerid, DIALOG_TRANSFER, DIALOG_STYLE_INPUT, "[โอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่ไอดีหรือชื่อผู้รับเงิน", "โอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));
        PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
	}

    if(playertextid == ms_iphoneTD[playerid][8])
	{
		ShowPlayerms_iPhone(playerid, false);
        PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
	}
	return 1;
}	
Dialog:DIALOG_TWOOC(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		if (isnull(inputtext))
			return Dialog_Show(playerid, DIALOG_TWOOC, DIALOG_STYLE_INPUT, "{0698DA}Twitter", "{FFFFFF}เขียนข้อความที่ต้องการโพสต์", "ตกลง", "ยกเลิก");

		SendClientMessageToAllEx(COLOR_LIGHTBLUE, "[Twitter] {ffffff}(ID:%d) %s: %s", playerid, GetPlayerNameEx(playerid), inputtext);
		playerData[playerid][pOOCSpam] = 10;
        PlayerPlaySoundEx(playerid, 21001);
		Dialog_Show(playerid, DIALOG_TW, DIALOG_STYLE_LIST, "{0698DA}Twitter", "{FFFFFF}โพสต์ข้อความ\nโพสต์ในนามแก๊ง หรือ หน่วยงาน", "เลือก", "ยกเลิก");
	}
	return 1;
}	
Dialog:DIALOG_TW(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		switch(listitem)
		{
			case 0:
			{
        	    if (playerData[playerid][pOOCSpam] > 0)
		        return SendClientMessageEx(playerid, COLOR_RED, "[SYSTEM] {FFFFFF}คูลดาวน์ข้อความ {0698DA}Twitter{FFFFFF} เหลือเวลาอีก %d วินาที", playerData[playerid][pOOCSpam]);

                Dialog_Show(playerid, DIALOG_TWOOC, DIALOG_STYLE_INPUT, "{0698DA}Twitter", "{FFFFFF}เขียนข้อความที่ต้องการโพสต์", "ตกลง", "ยกเลิก");
			}
			case 1:
			{
                new factionid = playerData[playerid][pFaction];

        	    if (playerData[playerid][pOOCSpam] > 0)
		        return SendClientMessageEx(playerid, COLOR_RED, "[SYSTEM] {FFFFFF}คูลดาวน์ข้อความ {0698DA}Twitter{FFFFFF} เหลือเวลาอีก %d วินาที", playerData[playerid][pOOCSpam]);

                if (factionid == -1)
                    return SendClientMessage(playerid, COLOR_GREY, "   คุณต้องเป็นสมาชิกของฝ่ายหรือกลุ่ม");

                if (playerData[playerid][pFactionRank] < factionData[playerData[playerid][pFaction]][factionRanks])
                    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่สามารถโพสต์ในนามแกีงหรือหน่วยงานได้ (Rank ขั้นต่ำ : %d)", factionData[playerData[playerid][pFaction]][factionRanks]);

                Dialog_Show(playerid, DIALOG_TWOOCGANG, DIALOG_STYLE_INPUT, "{0698DA}Twitter", "{FFFFFF}เขียนข้อความที่ต้องการโพสต์ในนามแก๊ง", "ตกลง", "ยกเลิก");
			}
		}
	}
	return 1;
}

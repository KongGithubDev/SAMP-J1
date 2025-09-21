#include 	<YSI_Coding\y_hooks>

new PlayerText:Ms_MenuHelpTD[MAX_PLAYERS][8];

hook OnPlayerConnect(playerid)
{
	Ms_MenuHelpTD[playerid][0] = CreatePlayerTextDraw(playerid, 195.000000, 120.000000, "ms_hudserver:ms_menus");
	PlayerTextDrawFont(playerid, Ms_MenuHelpTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Ms_MenuHelpTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Ms_MenuHelpTD[playerid][0], 274.500000, 214.000000);
	PlayerTextDrawSetOutline(playerid, Ms_MenuHelpTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Ms_MenuHelpTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Ms_MenuHelpTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, Ms_MenuHelpTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_MenuHelpTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Ms_MenuHelpTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Ms_MenuHelpTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Ms_MenuHelpTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_MenuHelpTD[playerid][0], 0);

	Ms_MenuHelpTD[playerid][1] = CreatePlayerTextDraw(playerid, 219.000000, 159.000000, "ms_hudserver:ms_menuc01");
	PlayerTextDrawFont(playerid, Ms_MenuHelpTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, Ms_MenuHelpTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Ms_MenuHelpTD[playerid][1], 98.000000, 121.500000);
	PlayerTextDrawSetOutline(playerid, Ms_MenuHelpTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Ms_MenuHelpTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Ms_MenuHelpTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, Ms_MenuHelpTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_MenuHelpTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Ms_MenuHelpTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Ms_MenuHelpTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Ms_MenuHelpTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_MenuHelpTD[playerid][1], 1);

	Ms_MenuHelpTD[playerid][2] = CreatePlayerTextDraw(playerid, 219.000000, 286.000000, "ms_hudserver:ms_menuc01");
	PlayerTextDrawFont(playerid, Ms_MenuHelpTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, Ms_MenuHelpTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Ms_MenuHelpTD[playerid][2], 98.000000, 32.500000);
	PlayerTextDrawSetOutline(playerid, Ms_MenuHelpTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Ms_MenuHelpTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Ms_MenuHelpTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, Ms_MenuHelpTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_MenuHelpTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Ms_MenuHelpTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Ms_MenuHelpTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Ms_MenuHelpTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_MenuHelpTD[playerid][2], 1);

	Ms_MenuHelpTD[playerid][3] = CreatePlayerTextDraw(playerid, 322.000000, 160.000000, "ms_hudserver:ms_menuc01");
	PlayerTextDrawFont(playerid, Ms_MenuHelpTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, Ms_MenuHelpTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Ms_MenuHelpTD[playerid][3], 39.500000, 56.000000);
	PlayerTextDrawSetOutline(playerid, Ms_MenuHelpTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Ms_MenuHelpTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Ms_MenuHelpTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, Ms_MenuHelpTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_MenuHelpTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Ms_MenuHelpTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, Ms_MenuHelpTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Ms_MenuHelpTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_MenuHelpTD[playerid][3], 1);

	Ms_MenuHelpTD[playerid][4] = CreatePlayerTextDraw(playerid, 406.000000, 186.000000, "ms_hudserver:ms_menuc01");
	PlayerTextDrawFont(playerid, Ms_MenuHelpTD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, Ms_MenuHelpTD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Ms_MenuHelpTD[playerid][4], 39.500000, 58.000000);
	PlayerTextDrawSetOutline(playerid, Ms_MenuHelpTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Ms_MenuHelpTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Ms_MenuHelpTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, Ms_MenuHelpTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_MenuHelpTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Ms_MenuHelpTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, Ms_MenuHelpTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Ms_MenuHelpTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_MenuHelpTD[playerid][4], 1);

	Ms_MenuHelpTD[playerid][5] = CreatePlayerTextDraw(playerid, 322.000000, 248.000000, "ms_hudserver:ms_menuc01");
	PlayerTextDrawFont(playerid, Ms_MenuHelpTD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, Ms_MenuHelpTD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Ms_MenuHelpTD[playerid][5], 59.000000, 72.500000);
	PlayerTextDrawSetOutline(playerid, Ms_MenuHelpTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Ms_MenuHelpTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Ms_MenuHelpTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, Ms_MenuHelpTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_MenuHelpTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Ms_MenuHelpTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, Ms_MenuHelpTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Ms_MenuHelpTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_MenuHelpTD[playerid][5], 1);

	Ms_MenuHelpTD[playerid][6] = CreatePlayerTextDraw(playerid, 386.000000, 248.000000, "ms_hudserver:ms_menuc01");
	PlayerTextDrawFont(playerid, Ms_MenuHelpTD[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, Ms_MenuHelpTD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Ms_MenuHelpTD[playerid][6], 59.000000, 72.500000);
	PlayerTextDrawSetOutline(playerid, Ms_MenuHelpTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Ms_MenuHelpTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Ms_MenuHelpTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, Ms_MenuHelpTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_MenuHelpTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Ms_MenuHelpTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, Ms_MenuHelpTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, Ms_MenuHelpTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_MenuHelpTD[playerid][6], 1);

	Ms_MenuHelpTD[playerid][7] = CreatePlayerTextDraw(playerid, 451.000000, 298.000000, "ms_hudserver:ms_esc");
	PlayerTextDrawFont(playerid, Ms_MenuHelpTD[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, Ms_MenuHelpTD[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Ms_MenuHelpTD[playerid][7], 28.500000, 29.000000);
	PlayerTextDrawSetOutline(playerid, Ms_MenuHelpTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, Ms_MenuHelpTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Ms_MenuHelpTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, Ms_MenuHelpTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, Ms_MenuHelpTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, Ms_MenuHelpTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, Ms_MenuHelpTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, Ms_MenuHelpTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Ms_MenuHelpTD[playerid][7], 1);

	return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if (clickedid == Text:INVALID_TEXT_DRAW) {
        for (new i = 0; i < 8; i++) {
            PlayerTextDrawHide(playerid, Ms_MenuHelpTD[playerid][i]);
        }
    }
    return true;
}

hook OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, Ms_MenuHelpTD[playerid][0]);
	PlayerTextDrawDestroy(playerid, Ms_MenuHelpTD[playerid][1]);
	PlayerTextDrawDestroy(playerid, Ms_MenuHelpTD[playerid][2]);
	PlayerTextDrawDestroy(playerid, Ms_MenuHelpTD[playerid][3]);
	PlayerTextDrawDestroy(playerid, Ms_MenuHelpTD[playerid][4]);
	PlayerTextDrawDestroy(playerid, Ms_MenuHelpTD[playerid][5]);
	PlayerTextDrawDestroy(playerid, Ms_MenuHelpTD[playerid][6]);
	PlayerTextDrawDestroy(playerid, Ms_MenuHelpTD[playerid][7]);
	return 1;
}

ShowMenuHelp(playerid)
{
	PlayerTextDrawShow(playerid, Ms_MenuHelpTD[playerid][0]);
	PlayerTextDrawShow(playerid, Ms_MenuHelpTD[playerid][1]);
	PlayerTextDrawShow(playerid, Ms_MenuHelpTD[playerid][2]);
	PlayerTextDrawShow(playerid, Ms_MenuHelpTD[playerid][3]);
	PlayerTextDrawShow(playerid, Ms_MenuHelpTD[playerid][4]);
	PlayerTextDrawShow(playerid, Ms_MenuHelpTD[playerid][5]);
	PlayerTextDrawShow(playerid, Ms_MenuHelpTD[playerid][6]);
	PlayerTextDrawShow(playerid, Ms_MenuHelpTD[playerid][7]);
	SelectTextDraw(playerid, -1);
	return 1;
}
HideMenuHelp(playerid)
{
	PlayerTextDrawHide(playerid, Ms_MenuHelpTD[playerid][0]);
	PlayerTextDrawHide(playerid, Ms_MenuHelpTD[playerid][1]);
	PlayerTextDrawHide(playerid, Ms_MenuHelpTD[playerid][2]);
	PlayerTextDrawHide(playerid, Ms_MenuHelpTD[playerid][3]);
	PlayerTextDrawHide(playerid, Ms_MenuHelpTD[playerid][4]);
	PlayerTextDrawHide(playerid, Ms_MenuHelpTD[playerid][5]);
	PlayerTextDrawHide(playerid, Ms_MenuHelpTD[playerid][6]);
	PlayerTextDrawHide(playerid, Ms_MenuHelpTD[playerid][7]);
	CancelSelectTextDraw(playerid);
	return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
    if(playertextid == Ms_MenuHelpTD[playerid][1])
	{
		Dialog_Show(playerid, DIALOG_MENU_PLAYER, DIALOG_STYLE_LIST, "{FF33CC}MENU ","\
		{FF33CC}[+] {FFFFFF}กระเป๋า MOD\n\
		{FF33CC}[+] {FFFFFF}กระเป๋า DIALOG\n", "ตกลง", "ยกเลิก");
        HideMenuHelp(playerid);
    }
	if(playertextid == Ms_MenuHelpTD[playerid][2])
	{
		new string100[4096];
		new string2[4096];

		format(string100, sizeof(string100), "{FFFFFF}จัดการ / UI\n");
		strcat(string2,string100);

        format(string100, sizeof(string100), "{FFFFFF}เปิด UI\n");
		strcat(string2,string100);

        format(string100, sizeof(string100), "{FFFFFF}ปิด UI\n");
		strcat(string2,string100);

		Dialog_Show(playerid,DIALOG_OFFUI,DIALOG_STYLE_TABLIST_HEADERS,"{FF33CC}การตั้งค่า / UI",string2,"ตกลง","ยกเลิก");
		PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
		HideMenuHelp(playerid);
    }	
	if(playertextid == Ms_MenuHelpTD[playerid][3])
	{
		//ของโดเนท ไม่รู้มีอะไรบ้าง ต้องทำเพิ่ม
		SendClientMessageEx(playerid, COLOR_LIGHTRED, "รออัพเดท");
		HideMenuHelp(playerid);
    }
	if(playertextid == Ms_MenuHelpTD[playerid][4])
	{	
		Dialog_Show(playerid, D_Animlist, DIALOG_STYLE_TABLIST, "{FF33CC} ท่าทาง", "{FFFFFF}ยกเลิกท่าทาง\n>> ยกมือ\n>> เอามือกุมหัว\n>> บาดเจ็บ\n>> เยี่ยว\n>> นอนหงายหน้า\n>> นอนคว้ำหน้า\n>> กอดอก\n>> ตบตูด\n>> นั่งเก้าอี้\n>> โบกรถ(ซ้าย)\n>> โบกรถ(ขวา)\n>> ดูดบุหรี่\n>> พิงกำแพง\n>> ท้าทาย", "เลือก", "ออก");
		PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
        HideMenuHelp(playerid);
	}
	if(playertextid == Ms_MenuHelpTD[playerid][5])
	{
		static const aGender[3][10] = {"แก้ไข", "ชาย", "หญิง"};

		SendClientMessageEx(playerid, COLOR_GREEN, "|========== {FFFFFF}(%d)%s %s{00FF00} ==========|", playerid, GetPlayerNameEx(playerid), ReturnDateEx());
		SendClientMessageEx(playerid, COLOR_WHITE, "เพศ: {FFFF00}[%s] {FFFFFF}เงินในตัว: {FFFF00}[%s]  {FFFFFF}วันเดือนปีเกิด: {FFFF00}[%s]", aGender[playerData[playerid][pGender]], FormatMoney(GetPlayerMoneyEx(playerid)), playerData[playerid][pBirthday]);
		SendClientMessageEx(playerid, COLOR_WHITE, "ฆ่า: {FFFF00}[%s] {FFFFFF}ตาย: {FFFF00}[%s] {FFFFFF}น้ำ: {FFFF00}[%.3f] {FFFFFF}อาหาร: {FFFF00}[%.3f]", FormatNumber(playerData[playerid][pKills]), FormatNumber(playerData[playerid][pDeaths]), playerData[playerid][pThirsty], playerData[playerid][pHungry]);
		SendClientMessageEx(playerid, COLOR_WHITE, "เลเวล: {FFFF00}[%d] {FFFFFF}ค่าประสบการณ์: {FFFF00}[%d/%d] {FFFFFF}ชั่วโมงที่เล่น: {FFFF00}[%d] {FFFFFF}ครบชั่วโมง: {FFFF00}[%d/60]", GetPlayerLevel(playerid), GetPlayerExp(playerid), GetPlayerRequiredExp(playerid), playerData[playerid][pHours], playerData[playerid][pMinutes]);
		SendClientMessageEx(playerid, COLOR_WHITE, "วันที่ลงทะเบียน: {FFFF00}[%s]", playerData[playerid][pRegisterDate]);
		SendClientMessageEx(playerid, COLOR_LIGHTRED, "จำนวน Coin : [%d Coin]", playerData[playerid][pCoin]);
        HideMenuHelp(playerid);
    }
	if(playertextid == Ms_MenuHelpTD[playerid][6])
	{
		Dialog_Show(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "{FF33CC} GPS", "{FF33CC}[+] สถานที่ทั่วไป\n{FF33CC}[+] งานถูกกฎหมาย\n{FF33CC}[+] งานผิดกฎหมาย", "เลือก", "ปิด");
		PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
		HideMenuHelp(playerid);
    }	
	if(playertextid == Ms_MenuHelpTD[playerid][7])
	{
		//ของโดเนท ไม่รู้มีอะไรบ้าง ต้องทำเพิ่ม
		SendClientMessageEx(playerid, COLOR_LIGHTRED, "ปิดกระเป๋า");
		HideMenuHelp(playerid);
    }
	return 1;
}		



/*==============================================================*-

				Create By Bx Shop (Ball Zx)
			
     ����ź�ôԵ���索Ҵ ���͵Դ�����ʵ���ҹ���ѹ��

-*==============================================================*/

#include	<YSI_Coding\y_hooks>
DEFINE_HOOK_REPLACEMENT_(OnPlayerConnect, OP);

new PlayerText:Bxshop_Bank[MAX_PLAYERS][8];

forward ShowPlayerBank_BxShop(playerid, bool:enable);

hook OnPlayerConnect(playerid){
    Bxshop_Bank[playerid][0] = CreatePlayerTextDraw(playerid, 187.000000, 67.000000, "Bank_Bxshop:Bank_ByBxshop");
	PlayerTextDrawFont(playerid, Bxshop_Bank[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Bxshop_Bank[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Bxshop_Bank[playerid][0], 261.500000, 318.000000);
	PlayerTextDrawSetOutline(playerid, Bxshop_Bank[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Bxshop_Bank[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Bxshop_Bank[playerid][0], 1);
	PlayerTextDrawColor(playerid, Bxshop_Bank[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, Bxshop_Bank[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Bxshop_Bank[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Bxshop_Bank[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Bxshop_Bank[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Bxshop_Bank[playerid][0], 0);

	Bxshop_Bank[playerid][1] = CreatePlayerTextDraw(playerid, 297.000000, 186.000000, "Loading...");
	PlayerTextDrawFont(playerid, Bxshop_Bank[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, Bxshop_Bank[playerid][1], 0.250000, 1.299998);
	PlayerTextDrawTextSize(playerid, Bxshop_Bank[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Bxshop_Bank[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, Bxshop_Bank[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Bxshop_Bank[playerid][1], 1);
	PlayerTextDrawColor(playerid, Bxshop_Bank[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Bxshop_Bank[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Bxshop_Bank[playerid][1], 16711730);
	PlayerTextDrawUseBox(playerid, Bxshop_Bank[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, Bxshop_Bank[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Bxshop_Bank[playerid][1], 0);

	Bxshop_Bank[playerid][2] = CreatePlayerTextDraw(playerid, 299.000000, 215.000000, "Loading...");
	PlayerTextDrawFont(playerid, Bxshop_Bank[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, Bxshop_Bank[playerid][2], 0.229166, 1.299998);
	PlayerTextDrawTextSize(playerid, Bxshop_Bank[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Bxshop_Bank[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, Bxshop_Bank[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Bxshop_Bank[playerid][2], 1);
	PlayerTextDrawColor(playerid, Bxshop_Bank[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Bxshop_Bank[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Bxshop_Bank[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Bxshop_Bank[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, Bxshop_Bank[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Bxshop_Bank[playerid][2], 0);

	Bxshop_Bank[playerid][3] = CreatePlayerTextDraw(playerid, 240.000000, 253.000000, "_");
	PlayerTextDrawFont(playerid, Bxshop_Bank[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, Bxshop_Bank[playerid][3], 0.516665, 5.499998);
	PlayerTextDrawTextSize(playerid, Bxshop_Bank[playerid][3], 298.500000, 38.500000);
	PlayerTextDrawSetOutline(playerid, Bxshop_Bank[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Bxshop_Bank[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Bxshop_Bank[playerid][3], 2);
	PlayerTextDrawColor(playerid, Bxshop_Bank[playerid][3], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Bxshop_Bank[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Bxshop_Bank[playerid][3], 0);
	PlayerTextDrawUseBox(playerid, Bxshop_Bank[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Bxshop_Bank[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Bxshop_Bank[playerid][3], 1);

	Bxshop_Bank[playerid][4] = CreatePlayerTextDraw(playerid, 318.000000, 253.000000, "_");
	PlayerTextDrawFont(playerid, Bxshop_Bank[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, Bxshop_Bank[playerid][4], 0.516665, 5.499998);
	PlayerTextDrawTextSize(playerid, Bxshop_Bank[playerid][4], 298.500000, 38.500000);
	PlayerTextDrawSetOutline(playerid, Bxshop_Bank[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Bxshop_Bank[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Bxshop_Bank[playerid][4], 2);
	PlayerTextDrawColor(playerid, Bxshop_Bank[playerid][4], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Bxshop_Bank[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Bxshop_Bank[playerid][4], 0);
	PlayerTextDrawUseBox(playerid, Bxshop_Bank[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Bxshop_Bank[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Bxshop_Bank[playerid][4], 1);

	Bxshop_Bank[playerid][5] = CreatePlayerTextDraw(playerid, 395.000000, 253.000000, "_");
	PlayerTextDrawFont(playerid, Bxshop_Bank[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, Bxshop_Bank[playerid][5], 0.516665, 5.499998);
	PlayerTextDrawTextSize(playerid, Bxshop_Bank[playerid][5], 298.500000, 38.500000);
	PlayerTextDrawSetOutline(playerid, Bxshop_Bank[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Bxshop_Bank[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Bxshop_Bank[playerid][5], 2);
	PlayerTextDrawColor(playerid, Bxshop_Bank[playerid][5], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Bxshop_Bank[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Bxshop_Bank[playerid][5], 0);
	PlayerTextDrawUseBox(playerid, Bxshop_Bank[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Bxshop_Bank[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Bxshop_Bank[playerid][5], 1);

	Bxshop_Bank[playerid][6] = CreatePlayerTextDraw(playerid, 417.000000, 144.000000, "_");
	PlayerTextDrawFont(playerid, Bxshop_Bank[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, Bxshop_Bank[playerid][6], 0.100000, 1.849998);
	PlayerTextDrawTextSize(playerid, Bxshop_Bank[playerid][6], 297.000000, 12.500000);
	PlayerTextDrawSetOutline(playerid, Bxshop_Bank[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Bxshop_Bank[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Bxshop_Bank[playerid][6], 2);
	PlayerTextDrawColor(playerid, Bxshop_Bank[playerid][6], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Bxshop_Bank[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Bxshop_Bank[playerid][6], 55);
	PlayerTextDrawUseBox(playerid, Bxshop_Bank[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, Bxshop_Bank[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Bxshop_Bank[playerid][6], 1);

	Bxshop_Bank[playerid][7] = CreatePlayerTextDraw(playerid, 235.000000, 219.000000, "10");
	PlayerTextDrawFont(playerid, Bxshop_Bank[playerid][7], 3);
	PlayerTextDrawLetterSize(playerid, Bxshop_Bank[playerid][7], 0.216665, 1.249999);
	PlayerTextDrawTextSize(playerid, Bxshop_Bank[playerid][7], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Bxshop_Bank[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, Bxshop_Bank[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Bxshop_Bank[playerid][7], 1);
	PlayerTextDrawColor(playerid, Bxshop_Bank[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, Bxshop_Bank[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, Bxshop_Bank[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, Bxshop_Bank[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, Bxshop_Bank[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Bxshop_Bank[playerid][7], 0);
	return 1;
}

ShowPlayerBank_BxShop(playerid, bool:enable){
	if(enable == true)
	{
		for(new i = 0; i < 8; i ++)
		{
			PlayerTextDrawShow(playerid, Bxshop_Bank[playerid][i]);
		}
        SelectTextDraw(playerid, -1);
	}
	else
	{
		for(new i = 0; i < 8; i ++)
		{
			PlayerTextDrawHide(playerid, Bxshop_Bank[playerid][i]);
		}
        CancelSelectTextDraw(playerid);
	}
}

TimerBank_BxShop(playerid)
{
    new str[512];
    format(str, sizeof(str), "%s", GetPlayerNameEx(playerid));
    PlayerTextDrawSetString(playerid, Bxshop_Bank[playerid][1], str);

    format(str, sizeof(str), "%s", FormatMoney(playerData[playerid][pBankMoney]));
    PlayerTextDrawSetString(playerid, Bxshop_Bank[playerid][2], str);

    format(str, sizeof(str), "%d", playerid);
    PlayerTextDrawSetString(playerid, Bxshop_Bank[playerid][7], str);
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid){
    if(playertextid == Bxshop_Bank[playerid][3])
    {
        Dialog_Show(playerid, DIALOG_DEPOSITBX, DIALOG_STYLE_INPUT, "[�ҡ�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س����ӹǹ�Թ���س��ͧ��èнҡ", "�ҡ", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));
    }
    if(playertextid == Bxshop_Bank[playerid][4])
    {
        Dialog_Show(playerid, DIALOG_WITHDRAWBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س����ӹǹ�Թ���س��ͧ��èж͹", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));
    }
    if(playertextid == Bxshop_Bank[playerid][5])
    {
        Dialog_Show(playerid, DIALOG_TRANSFERBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س�����ʹ����ͪ��ͼ���Ѻ�Թ", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));
    }
    if(playertextid == Bxshop_Bank[playerid][6])
    {
        ShowPlayerBank_BxShop(playerid, false);
    }
    return 1;
}

Dialog:DIALOG_TRANSFERBX(playerid, response, listitem, inputtext[]){
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response){
	    new
	        userid;

		if (sscanf(inputtext, "u", userid))
		    return Dialog_Show(playerid, DIALOG_TRANSFERBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س�����ʹ����ͪ��ͼ���Ѻ�Թ", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));

		if (userid == INVALID_PLAYER_ID)
		    return Dialog_Show(playerid, DIALOG_TRANSFERBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س�����ʹ����ͪ��ͼ���Ѻ�Թ\n\n{FF0000}*** �������ʹչ��������������", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));

		if (userid == playerid)
		    return Dialog_Show(playerid, DIALOG_TRANSFERBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س�����ʹ����ͪ��ͼ���Ѻ�Թ\n\n{FF0000}*** �͹�Թ��Һѭ�յ���ͧ�����", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));

		playerData[playerid][pTransfer] = userid;
		Dialog_Show(playerid, DIALOG_TRANSFERCASHBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س����ӹǹ�Թ���س��ͧ��è��͹���Ѻ %s", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]), GetPlayerNameEx(userid));
	}
	return 1;
}

Dialog:DIALOG_TRANSFERCASHBX(playerid, response, listitem, inputtext[]){
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response){
	    new amount = strval(inputtext);

	    if (isnull(inputtext))
	        return Dialog_Show(playerid, DIALOG_TRANSFERCASHBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س����ӹǹ�Թ���س��ͧ��è��͹���Ѻ %s", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]), GetPlayerNameEx(playerData[playerid][pTransfer]));

		if (amount < 1 || amount > playerData[playerid][pBankMoney])
			return Dialog_Show(playerid, DIALOG_TRANSFERCASHBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س����ӹǹ�Թ���س��ͧ��è��͹���Ѻ %s\n\n{FF0000}*** �Թ㹺ѭ�բͧ�س���ͷ����͹", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]), GetPlayerNameEx(playerData[playerid][pTransfer]));

		playerData[playerid][pBankMoney] -= amount;
		playerData[playerData[playerid][pTransfer]][pBankMoney] += amount;

	    SendClientMessageEx(playerid, COLOR_YELLOW, "[��Ҥ��] {FFFFFF}�س���͹�Թ�ӹǹ %s ���Ѻ %s �����", FormatMoney(amount), GetPlayerNameEx(playerData[playerid][pTransfer]));
	    SendClientMessageEx(playerData[playerid][pTransfer], COLOR_YELLOW, "[��Ҥ��] {FFFFFF}������ %s ���͹�Թ���س�ӹǹ %s �����", GetPlayerNameEx(playerid), FormatMoney(amount));
		URLogAtmTRANSFER(playerid,amount);
	}
	return 1;
}

Dialog:DIALOG_WITHDRAWBX(playerid, response, listitem, inputtext[]){
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response){
	    new amount = strval(inputtext);

	    if (isnull(inputtext))
	        return Dialog_Show(playerid, DIALOG_WITHDRAWBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س����ӹǹ�Թ���س��ͧ��èж͹", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));

		if (amount < 1 || amount > playerData[playerid][pBankMoney])
			return Dialog_Show(playerid, DIALOG_WITHDRAWBX, DIALOG_STYLE_INPUT, "[�͹�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س����ӹǹ�Թ���س��ͧ��èж͹\n\n{FF0000}*** �ʹ�Թ���س��ͧ��èж͹�����§��", "�͹", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));

		playerData[playerid][pBankMoney] -= amount;
	    GivePlayerMoneyEx(playerid, amount);

	    SendClientMessageEx(playerid, COLOR_YELLOW, "[��Ҥ��] {FFFFFF}�س��͹�Թ�ӹǹ %s �͡�ҡ�ѭ�������", FormatMoney(amount));
		URLogAtmWITHDRAW(playerid,amount);
	}
	return 1;
}

Dialog:DIALOG_DEPOSITBX(playerid, response, listitem, inputtext[]){
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response){
	    new amount = strval(inputtext);

	    if (isnull(inputtext))
	        return Dialog_Show(playerid, DIALOG_DEPOSITBX, DIALOG_STYLE_INPUT, "[�ҡ�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س����ӹǹ�Թ���س��ͧ��èнҡ", "�ҡ", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));

		if (amount < 1 || amount > GetPlayerMoneyEx(playerid))
			return Dialog_Show(playerid, DIALOG_DEPOSITBX, DIALOG_STYLE_INPUT, "[�ҡ�Թ]", "{FFFFFF}�ʹ�Թ㹺ѭ��: %s\n��س����ӹǹ�Թ���س��ͧ��èнҡ\n\n{FF0000}*** �ʹ�Թ���س��ͧ��èнҡ�����§��", "�ҡ", "��Ѻ", FormatMoney(playerData[playerid][pBankMoney]));

		playerData[playerid][pBankMoney] += amount;
	    GivePlayerMoneyEx(playerid, -amount);

	    SendClientMessageEx(playerid, COLOR_YELLOW, "[��Ҥ��] {FFFFFF}�س��ҡ�Թ�ӹǹ %s ��Ҹ�Ҥ�������", FormatMoney(amount));
		URLogAtmDEPOSIT(playerid,amount);
	}
	return 1;
}


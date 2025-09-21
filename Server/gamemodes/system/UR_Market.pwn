#include <YSI_Coding\y_hooks>

new PlayerText:UR_MarketTD[MAX_PLAYERS][18];
new bool:Shopplayer[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    Shopplayer[playerid] = false;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:textid)
{
    if (Shopplayer[playerid])
    {
        if (textid == UR_MarketTD[playerid][1]) //�Դ X

        {
            ShowShopShowShopUR(playerid, false);
            CancelSelectTextDraw(playerid);
        }
        else if (textid == UR_MarketTD[playerid][2]) //������ҧ   �ԫ���

        {
            Dialog_Show(playerid, DIALOG_BUYPIZZA, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ��� {F1FF33}'�ԫ���'", "��ŧ", "�Դ");
        }
        else if (textid == UR_MarketTD[playerid][3]) //�������

        {
            Dialog_Show(playerid, DIALOG_BUYWATER, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ��� {F1FF33}'�������'", "��ŧ", "�Դ");
        }
        else if (textid == UR_MarketTD[playerid][4])
        {
            Dialog_Show(playerid, DIALOG_BUYFISHINGROD, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ��� {F1FF33}'�紵����'", "��ŧ", "�Դ");
        }
        else if (textid == UR_MarketTD[playerid][5])
        {
            Dialog_Show(playerid, DIALOG_BUYHOOKBAIT, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ��� {F1FF33}'������'", "��ŧ", "�Դ");
        }
        else if (textid == UR_MarketTD[playerid][6])
        {
            Dialog_Show(playerid, DIALOG_BUYTOOL, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ��� {F1FF33}'����ͧ��ͫ���ö'", "��ŧ", "�Դ");
        }
        else if (textid == UR_MarketTD[playerid][7])
        {
            Dialog_Show(playerid, DIALOG_BUYBANDAGE, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ��� {F1FF33}'��Ҿѹ��'", "��ŧ", "�Դ");
        }
    }
    return 1;
}

Dialog:DIALOG_BUYPIZZA(playerid, response, listitem, inputtext[]) //�ԫ��� 

{
    if (response)
    {
        new
        amount,
        price = 500
            ;
        static const item_name[] =
            "�ԫ���"
            ;
        if (sscanf(inputtext, "d", amount))
        {
            return Dialog_Show(playerid, DIALOG_BUYPIZZA, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���", "��ŧ", "�Դ");
        }
        if (amount < 1 || amount > 100)
        {
            return Dialog_Show(playerid, DIALOG_BUYPIZZA, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�ӹǹ��ͧ����ӡ��� 1 ", "��ŧ", "�Դ");
        }
        new
        total_price = amount * price
            ;
        if (GetPlayerMoneyEx(playerid) < total_price)
        {
            return Dialog_Show(playerid, DIALOG_BUYPIZZA, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�Ҥ���������� %s ���Թ�س������", "��ŧ", "�Դ", FormatMoney(total_price));
        }

        GivePlayerMoneyEx(playerid, -total_price);
        Inventory_Add(playerid, "�ԫ���", amount);
        PlayerPlaySound(playerid, 1058,  0.0, 0.0, 0.0);
        SendClientMessageEx(playerid, COLOR_YELLOW, "[SHOP] {FFFFFF}�س����� {F1FF33}%s{FFFFFF} ����� ��Ҥ� {F1FF33}%s", item_name, FormatMoney(total_price));
    }
    return 1;
}

Dialog:DIALOG_BUYWATER(playerid, response, listitem, inputtext[]) //�������

{
    if (response)
    {
        new
        amount,
        price = 200
            ;
        static const item_name[] =
            "�������"
            ;
        if (sscanf(inputtext, "d", amount))
        {
            return Dialog_Show(playerid, DIALOG_BUYWATER, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���", "��ŧ", "�Դ");
        }
        if (amount < 1 || amount > 100)
        {
            return Dialog_Show(playerid, DIALOG_BUYWATER, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�ӹǹ��ͧ����ӡ��� 1 ", "��ŧ", "�Դ");
        }
        new
        total_price = amount * price
            ;
        if (GetPlayerMoneyEx(playerid) < total_price)
        {
            return Dialog_Show(playerid, DIALOG_BUYWATER, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�Ҥ���������� %s ���Թ�س������", "��ŧ", "�Դ", FormatMoney(total_price));
        }

        GivePlayerMoneyEx(playerid, -total_price);
        Inventory_Add(playerid, "�������", amount);
        PlayerPlaySound(playerid, 1058,  0.0, 0.0, 0.0);
        SendClientMessageEx(playerid, COLOR_YELLOW, "[SHOP] {FFFFFF}�س����� {F1FF33}%s{FFFFFF} ����� ��Ҥ� {F1FF33}%s", item_name, FormatMoney(total_price));
    }
    return 1;
}

Dialog:DIALOG_BUYFISHINGROD(playerid, response, listitem, inputtext[]) //�紵����

{
    if (response)
    {
        new
        amount,
        price = 1000
            ;
        static const item_name[] =
            "�紵����"
            ;
        if (sscanf(inputtext, "d", amount))
        {
            return Dialog_Show(playerid, DIALOG_BUYFISHINGROD, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���", "��ŧ", "�Դ");
        }
        if (amount < 1 || amount > 100)
        {
            return Dialog_Show(playerid, DIALOG_BUYFISHINGROD, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�ӹǹ��ͧ����ӡ��� 1 ", "��ŧ", "�Դ");
        }
        new
        total_price = amount * price
            ;
        if (GetPlayerMoneyEx(playerid) < total_price)
        {
            return Dialog_Show(playerid, DIALOG_BUYFISHINGROD, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�Ҥ���������� %s ���Թ�س������", "��ŧ", "�Դ", FormatMoney(total_price));
        }

        GivePlayerMoneyEx(playerid, -total_price);
        Inventory_Add(playerid, "�紵����", amount);
        PlayerPlaySound(playerid, 1058,  0.0, 0.0, 0.0);
        SendClientMessageEx(playerid, COLOR_YELLOW, "[SHOP] {FFFFFF}�س����� {F1FF33}%s{FFFFFF} ����� ��Ҥ� {F1FF33}%s", item_name, FormatMoney(total_price));
    }
    return 1;
}

/*Dialog:DIALOG_BUYHOOKBAIT(playerid, response, listitem, inputtext[]) //������
{
	if (response)
	{
		new 
			amount,
			price = 5
		;
		static const item_name[] = 
			"������"
		;
		if (sscanf(inputtext, "d", amount))
		{
			return Dialog_Show(playerid, DIALOG_BUYHOOKBAIT , DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���", "��ŧ", "�Դ");
		}
		if (amount < 1 || amount > 100)
		{
			return Dialog_Show(playerid, DIALOG_BUYHOOKBAIT, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�ӹǹ��ͧ����ӡ��� 1 ", "��ŧ", "�Դ");
		}
		new 
			total_price = amount * price
		;
		if (GetPlayerMoneyEx(playerid) < total_price)
		{
			return Dialog_Show(playerid, DIALOG_BUYHOOKBAIT, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�Ҥ���������� %s ���Թ�س������", "��ŧ", "�Դ", FormatMoney(total_price));
		}

		GivePlayerMoneyEx(playerid, -total_price);
		Inventory_Add(playerid, "������", amount);
		PlayerPlaySound(playerid, 1058,  0.0, 0.0, 0.0);
		SendClientMessageEx(playerid, COLOR_YELLOW, "[SHOP] {FFFFFF}�س����� {F1FF33}%s{FFFFFF} ����� ��Ҥ� {F1FF33}%s", item_name, FormatMoney(total_price));
	}
	return 1;
}*/

Dialog:DIALOG_BUYHOOKBAIT(playerid, response, listitem, inputtext[]) //������

{
    if (response)
    {
        new
        amount,
        price = 5;
        static const item_name[] = "������";

        if (sscanf(inputtext, "d", amount))
        {
            return Dialog_Show(playerid, DIALOG_BUYHOOKBAIT, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���", "��ŧ", "�Դ");
        }

        if (amount < 1)
        {
            return Dialog_Show(playerid, DIALOG_BUYHOOKBAIT, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�ӹǹ��ͧ����ӡ��� 1", "��ŧ", "�Դ");
        }

        new current_amount = Inventory_Count(playerid, "������");

        if (current_amount + amount > 200)
        {
            new msg[128];
            format(msg, sizeof msg, "�س������������ %d ��� �����������ա�٧�ش %d ��� (�ӡѴ 200)", current_amount, 200 - current_amount);
            return Dialog_Show(playerid, DIALOG_BUYHOOKBAIT, DIALOG_STYLE_MSGBOX, "���������", msg, "��ŧ", "");
        }

        new total_price = amount * price;
        if (GetPlayerMoneyEx(playerid) < total_price)
        {
            return Dialog_Show(playerid, DIALOG_BUYHOOKBAIT, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�Ҥ���������� %s ���Թ�س������", "��ŧ", "�Դ", FormatMoney(total_price));
        }

        GivePlayerMoneyEx(playerid, -total_price);
        Inventory_Add(playerid, "������", amount);

        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
        SendClientMessageEx(playerid, COLOR_YELLOW, "[SHOP] {FFFFFF}�س����� {F1FF33}%s x%d{FFFFFF} ����� ��Ҥ� {F1FF33}%s", item_name, amount, FormatMoney(total_price));
    }
    return 1;
}

Dialog:DIALOG_BUYTOOL(playerid, response, listitem, inputtext[]) //����ͧ��ͫ���ö

{
    if (response)
    {
        new
        amount,
        price = 2000
            ;
        static const item_name[] =
            "����ͧ��ͫ���ö"
            ;
        if (sscanf(inputtext, "d", amount))
        {
            return Dialog_Show(playerid, DIALOG_BUYTOOL, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���", "��ŧ", "�Դ");
        }
        if (amount < 1 || amount > 100)
        {
            return Dialog_Show(playerid, DIALOG_BUYTOOL, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�ӹǹ��ͧ����ӡ��� 1 ", "��ŧ", "�Դ");
        }
        new
        total_price = amount * price
            ;
        if (GetPlayerMoneyEx(playerid) < total_price)
        {
            return Dialog_Show(playerid, DIALOG_BUYTOOL, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�Ҥ���������� %s ���Թ�س������", "��ŧ", "�Դ", FormatMoney(total_price));
        }

        GivePlayerMoneyEx(playerid, -total_price);
        Inventory_Add(playerid, "����ͧ��ͫ���ö", amount);
        PlayerPlaySound(playerid, 1058,  0.0, 0.0, 0.0);
        SendClientMessageEx(playerid, COLOR_YELLOW, "[SHOP] {FFFFFF}�س����� {F1FF33}%s{FFFFFF} ����� ��Ҥ� {F1FF33}%s", item_name, FormatMoney(total_price));
    }
    return 1;
}

Dialog:DIALOG_BUYBANDAGE(playerid, response, listitem, inputtext[]) //��Ҿѹ��

{
    if (response)
    {
        new
        amount,
        price = 1000
            ;
        static const item_name[] =
            "��Ҿѹ��"
            ;
        if (sscanf(inputtext, "d", amount))
        {
            return Dialog_Show(playerid, DIALOG_BUYBANDAGE, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���", "��ŧ", "�Դ");
        }
        if (amount < 1 || amount > 100)
        {
            return Dialog_Show(playerid, DIALOG_BUYBANDAGE, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�ӹǹ��ͧ����ӡ��� 1 ", "��ŧ", "�Դ");
        }
        new
        total_price = amount * price
            ;
        if (GetPlayerMoneyEx(playerid) < total_price)
        {
            return Dialog_Show(playerid, DIALOG_BUYBANDAGE, DIALOG_STYLE_INPUT, "�ӹǹ", "���ӹǹ����ͧ��èЫ���\n�Ҥ���������� %s ���Թ�س������", "��ŧ", "�Դ", FormatMoney(total_price));
        }

        GivePlayerMoneyEx(playerid, -total_price);
        Inventory_Add(playerid, "��Ҿѹ��", amount);
        PlayerPlaySound(playerid, 1058,  0.0, 0.0, 0.0);
        SendClientMessageEx(playerid, COLOR_YELLOW, "[SHOP] {FFFFFF}�س����� {F1FF33}%s{FFFFFF} ����� ��Ҥ� {F1FF33}%s", item_name, FormatMoney(total_price));
    }
    return 1;
}


//����DIALOG ��������


ShowShopShowShopUR(playerid, bool:p)
{
    if (p == true)
    {
        CreateUiURMarket(playerid);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][0]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][1]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][2]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][3]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][4]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][5]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][6]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][7]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][8]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][9]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][10]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][11]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][12]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][13]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][14]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][15]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][16]);
        PlayerTextDrawShow(playerid, UR_MarketTD[playerid][17]);
        SelectTextDraw(playerid, -1);
        Shopplayer[playerid] = true;
    }
    else
    {
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][0]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][1]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][2]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][3]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][4]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][5]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][6]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][7]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][8]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][9]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][10]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][11]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][12]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][13]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][14]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][15]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][16]);
        PlayerTextDrawHide(playerid, UR_MarketTD[playerid][17]);
        CancelSelectTextDraw(playerid);
        Shopplayer[playerid] = false;
    }
}

// �ѧ��ѹ�Դ��ҹ UR Market

stock HideURMarketUI(playerid)
{
    for (new i = 0; i < 18; i++)
    {
        if (UR_MarketTD[playerid][i])
            PlayerTextDrawHide(playerid, UR_MarketTD[playerid][i]);
    }
    CancelSelectTextDraw(playerid);
    Shopplayer[playerid] = false;
    return 1;
}

// hook ��Ǩ�Ѻ�� ESC ���ͤ�ԡ�͡ TD

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if (clickedid == Text:INVALID_TEXT_DRAW)
    {
        if (Shopplayer[playerid])
        {
            HideURMarketUI(playerid);
        }
    }
    return 1;
}

CreateUiURMarket(playerid)
{
    UR_MarketTD[playerid][0] = CreatePlayerTextDraw(playerid, 145.000000, 105.000000, "UR_Market:market1");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][0], 357.500000, 274.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][0], 0);

    UR_MarketTD[playerid][1] = CreatePlayerTextDraw(playerid, 449.000000, 144.000000, "_");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][1], 0.600000, 1.550000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][1], 12.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][1], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][1], 1);

    UR_MarketTD[playerid][2] = CreatePlayerTextDraw(playerid, 227.000000, 195.000000, "_");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][2], 0.600000, 4.950001);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][2], 38.500000, 26.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][2], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][2], 1);

    UR_MarketTD[playerid][3] = CreatePlayerTextDraw(playerid, 270.000000, 195.000000, "_");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][3], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][3], 0.600000, 4.950001);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][3], 38.500000, 26.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][3], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][3], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][3], 1);

    UR_MarketTD[playerid][4] = CreatePlayerTextDraw(playerid, 314.000000, 195.000000, "_");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][4], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][4], 0.600000, 4.950001);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][4], 38.500000, 26.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][4], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][4], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][4], 1);

    UR_MarketTD[playerid][5] = CreatePlayerTextDraw(playerid, 357.000000, 195.000000, "_");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][5], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][5], 0.600000, 4.950001);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][5], 38.500000, 26.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][5], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][5], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][5], 1);

    UR_MarketTD[playerid][6] = CreatePlayerTextDraw(playerid, 227.000000, 260.000000, "_");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][6], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][6], 0.600000, 4.950001);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][6], 38.500000, 26.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][6], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][6], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][6], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][6], 1);

    UR_MarketTD[playerid][7] = CreatePlayerTextDraw(playerid, 270.000000, 260.000000, "_");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][7], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][7], 0.600000, 4.950001);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][7], 38.500000, 26.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][7], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][7], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][7], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][7], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][7], 1);

    UR_MarketTD[playerid][8] = CreatePlayerTextDraw(playerid, 314.000000, 260.000000, "_");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][8], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][8], 0.600000, 4.950001);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][8], 38.500000, 26.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][8], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][8], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][8], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][8], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][8], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][8], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][8], 1);

    UR_MarketTD[playerid][9] = CreatePlayerTextDraw(playerid, 357.000000, 260.000000, "_");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][9], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][9], 0.600000, 4.950001);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][9], 38.500000, 26.000000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][9], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][9], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][9], -1);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][9], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][9], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][9], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][9], 1);


    //�Ҥһ�Ѻ������

    UR_MarketTD[playerid][10] = CreatePlayerTextDraw(playerid, 227.000000, 195.000000, "$500");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][10], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][10], 0.133333, 0.700000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][10], 400.000000, 27.500000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][10], 0);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][10], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][10], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][10], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][10], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][10], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][10], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][10], 0);

    UR_MarketTD[playerid][11] = CreatePlayerTextDraw(playerid, 271.000000, 195.000000, "$200");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][11], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][11], 0.133333, 0.700000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][11], 400.000000, 27.500000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][11], 0);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][11], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][11], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][11], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][11], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][11], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][11], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][11], 0);

    UR_MarketTD[playerid][12] = CreatePlayerTextDraw(playerid, 314.000000, 195.000000, "$1000");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][12], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][12], 0.133333, 0.700000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][12], 400.000000, 27.500000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][12], 0);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][12], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][12], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][12], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][12], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][12], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][12], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][12], 0);

    UR_MarketTD[playerid][13] = CreatePlayerTextDraw(playerid, 357.000000, 195.000000, "$5");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][13], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][13], 0.133333, 0.700000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][13], 400.000000, 27.500000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][13], 0);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][13], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][13], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][13], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][13], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][13], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][13], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][13], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][13], 0);

    UR_MarketTD[playerid][14] = CreatePlayerTextDraw(playerid, 227.000000, 260.000000, "$2000");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][14], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][14], 0.133333, 0.700000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][14], 400.000000, 27.500000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][14], 0);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][14], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][14], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][14], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][14], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][14], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][14], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][14], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][14], 0);

    UR_MarketTD[playerid][15] = CreatePlayerTextDraw(playerid, 270.000000, 260.000000, "$1000");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][15], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][15], 0.133333, 0.700000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][15], 400.000000, 27.500000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][15], 0);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][15], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][15], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][15], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][15], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][15], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][15], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][15], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][15], 0);

    UR_MarketTD[playerid][16] = CreatePlayerTextDraw(playerid, 313.000000, 260.000000, "$");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][16], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][16], 0.133333, 0.700000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][16], 400.000000, 27.500000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][16], 0);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][16], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][16], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][16], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][16], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][16], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][16], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][16], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][16], 0);

    UR_MarketTD[playerid][17] = CreatePlayerTextDraw(playerid, 357.000000, 260.000000, "$");
    PlayerTextDrawFont(playerid, UR_MarketTD[playerid][17], 1);
    PlayerTextDrawLetterSize(playerid, UR_MarketTD[playerid][17], 0.133333, 0.700000);
    PlayerTextDrawTextSize(playerid, UR_MarketTD[playerid][17], 400.000000, 27.500000);
    PlayerTextDrawSetOutline(playerid, UR_MarketTD[playerid][17], 0);
    PlayerTextDrawSetShadow(playerid, UR_MarketTD[playerid][17], 0);
    PlayerTextDrawAlignment(playerid, UR_MarketTD[playerid][17], 2);
    PlayerTextDrawColor(playerid, UR_MarketTD[playerid][17], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, UR_MarketTD[playerid][17], 255);
    PlayerTextDrawBoxColor(playerid, UR_MarketTD[playerid][17], 50);
    PlayerTextDrawUseBox(playerid, UR_MarketTD[playerid][17], 0);
    PlayerTextDrawSetProportional(playerid, UR_MarketTD[playerid][17], 1);
    PlayerTextDrawSetSelectable(playerid, UR_MarketTD[playerid][17], 0);

    return 1;
}

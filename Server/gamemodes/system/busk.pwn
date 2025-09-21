/*

    / ------------------------- /
	/ �к� : �Դ��ǡẺ Morgan /
	�Ѵ�͡�� : Richard
	/ ------------------------- /

*/

#include	<YSI_Coding\y_hooks>

new busketHat[MAX_PLAYERS], Float:busketX[MAX_PLAYERS], Float:busketY[MAX_PLAYERS], Float:busketZ[MAX_PLAYERS], bool:busketStats[MAX_PLAYERS];
new Text3D:busket3DText[MAX_PLAYERS], busketMoney[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
	busketHat[playerid] = INVALID_OBJECT_ID;
    busketX[playerid] = 0.0;
    busketY[playerid] = 0.0;
    busketZ[playerid] = 0.0;
    busketMoney[playerid] = 0;
    busketStats[playerid] = false;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if (busketStats[playerid])
    {
		if (IsValidDynamic3DTextLabel(busket3DText[playerid]))
			DestroyDynamic3DTextLabel(busket3DText[playerid]);

		if (IsValidDynamicObject(busketHat[playerid]))
			DestroyDynamicObject(busketHat[playerid]);

		busketX[playerid] = 0.0;
		busketY[playerid] = 0.0;
		busketZ[playerid] = 0.0;
		busketMoney[playerid] = 0;
		busketStats[playerid] = false;
    }
}

CMD:busk(playerid, params[])
{
	if (!busketStats[playerid])
	{
	    new str[128];

		busketStats[playerid] = true;

		GetPlayerPos(playerid, busketX[playerid], busketY[playerid], busketZ[playerid]);

	    busketHat[playerid] = CreateDynamicObject(18962, busketX[playerid], busketY[playerid], busketZ[playerid]-0.9, 3.66000, 90.70010, 88.98000);

        format(str, sizeof(str), "{32d9e7}%s �Դ��ǡ\n{1BF909}${ffffff}0\n{ffffff}�� N ��������Թ", GetPlayerNameEx(playerid));
		busket3DText[playerid] = CreateDynamic3DTextLabel(str, COLOR_YELLOW, busketX[playerid], busketY[playerid], busketZ[playerid], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 10.0);
	}
	else return SendClientMessage(playerid, COLOR_LIGHTRED, "�Դ��Ҵ : {ffffff}�س���ҧ��ǡ����!");
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
    {
        new playerList = CheckPlayerOwnerBusket(playerid);
    
        if (playerList != -1)
        {
	        if (playerList == playerid)
	        {
		        if (IsPlayerInRangeOfPoint(playerid, 2.0, busketX[playerid], busketY[playerid], busketZ[playerid]))
		        {
					Dialog_Show(playerid, DIALOG_BUSKET_MAIN, DIALOG_STYLE_TABLIST, "��ǡ�ͧ�ѹ", "\
						{ffffff}�Թ���ǡ\t{1BF909}%s\n\
						{32d9e7}> {ffffff}���Թ\n\
		    			{F96B09}> {ffffff}����ǡ", "��ŧ", "�͡", FormatMoney(busketMoney[playerid]));
		        }
			}
			else
			{
		        if (IsPlayerInRangeOfPoint(playerid, 2.0, busketX[playerList], busketY[playerList], busketZ[playerList]))
		        {
		        	Dialog_Show(playerid, DIALOG_MONEY_BUSKET, DIALOG_STYLE_INPUT, "�Դ��ǡ", "{ffffff}��سҡ�͡�ӹǹ�Թ����ͧ������Ѻ���Ѵ�ʴ�\n����Թ������ {1BF909}$1,000\n�Թʴ�ͧ�س : %s", "��ŧ", "�͡", FormatMoney(GetPlayerMoneyEx(playerid)));
		        }
			}
		}
    }
    return 1;
}

Dialog:DIALOG_BUSKET_MAIN(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
  		{
  		    case 0: return 1;
			case 1:
			{
			    if (busketMoney[playerid] == 0)
			    {
			        Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Aleart", "{1BF909}[!] {ffffff}��ǡ�ѧ������Թ���..", "��ŧ", "");
			    }
			    else
			    {
			        new string[128];
			    
			        GivePlayerMoneyEx(playerid, busketMoney[playerid]);
			        Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Aleart", "{1BF909}[!] {ffffff}�س�����Թ�ҡ��ǡ�ͧ�س�ӹǹ�Թ : {1BF909}%s", "��ŧ", "", FormatMoney(busketMoney[playerid]));
                    busketMoney[playerid] = 0;

					format(string, sizeof(string), "{32d9e7}%s �Դ��ǡ\n{1BF909}${ffffff}%s\n{ffffff}�� N ��������Թ", GetPlayerNameEx(playerid), FormatNumber(busketMoney[playerid]));
					UpdateDynamic3DTextLabelText(busket3DText[playerid], 0xFFFFFFFF, string);
				}
			}
			case 2:
			{
				if (IsValidDynamic3DTextLabel(busket3DText[playerid]))
			 		DestroyDynamic3DTextLabel(busket3DText[playerid]);

				if (IsValidDynamicObject(busketHat[playerid]))
			 		DestroyDynamicObject(busketHat[playerid]);

			    busketX[playerid] = 0.0;
			    busketY[playerid] = 0.0;
			    busketZ[playerid] = 0.0;
			    busketMoney[playerid] = 0;
                busketStats[playerid] = false;
			}
		}
	}
	return 1;
}

Dialog:DIALOG_MONEY_BUSKET(playerid, response, listitem, inputtext[])
{
	new money = strval(inputtext), playerList = CheckPlayerOwnerBusket(playerid), string[128];
	if(response)
	{
	    if (money <= 0)
 			return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Aleart", "{1BF909}[!] {ffffff}�س��ͧ�кبӹǹ�Թ�ҡ���� $0", "��ŧ", "");

	    if (money > GetPlayerMoneyEx(playerid))
 			return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Aleart", "{1BF909}[!] {ffffff}�س�ըӹǹ�Թ�����§��!", "��ŧ", "");

	    if (playerList == -1)
 			return Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Aleart", "{1BF909}[!] {ffffff}�س������������Ѻ��ǡ�ͧ������� �!", "��ŧ", "");

		GivePlayerMoneyEx(playerid, -money);
        busketMoney[playerList] += money;
 		Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Aleart", "{1BF909}[!] {ffffff}�������Թ�������!", "��ŧ", "");

		format(string, sizeof(string), "{32d9e7}%s �Դ��ǡ\n{1BF909}${ffffff}%s\n{ffffff}�� N ��������Թ", GetPlayerNameEx(playerList), FormatNumber(busketMoney[playerList]));
		UpdateDynamic3DTextLabelText(busket3DText[playerList], 0xFFFFFFFF, string);
	}
	return 1;
}

CheckPlayerOwnerBusket(playerid)
{
	new ownerbusk = -1;
    foreach (new i : Player)
    {
        if (IsPlayerInRangeOfPoint(playerid, 2.0, busketX[i], busketY[i], busketZ[i]))
        {
            return i;
        }
    }
    return ownerbusk;
}

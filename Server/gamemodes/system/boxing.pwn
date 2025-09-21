#include	<YSI_Coding\y_hooks>

new inBoxingZone[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    inBoxingZone[playerid] = 0;
}

hook OnGameModeInit()
{
	// ⫹�֡���ظ
	CreateDynamicPickup(1314, 23, 266.3651,-1816.9652,4.9168);
	CreateDynamic3DTextLabel("{FF00FF} ⫹�֡���ظ \n{FFFFFF}������ N", COLOR_YELLOW, 229.1385,-1934.5159,7.4234, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 25.0);

	CreateDynamicPickup(1314, 23, 478.2189,-2094.6321,626.6250);
	CreateDynamic3DTextLabel("{FF00FF} �͡�ҡ⫹�֡���ظ \n{FFFFFF}������ N\n{FDC8B7}(( ���ظ�ء���ҧ�������ѧ�ҡ�͡⫹�֡���ظ ))", COLOR_YELLOW, 478.2189,-2094.6321,626.6250, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 25.0);

	CreateDynamicPickup(2061, 23, 485.4781,-2110.9434,626.6250);
	CreateDynamic3DTextLabel("{FF00FF} �ԡ���ظ����Ѻ��ë��� \n{FFFFFF}������ N\n{F1F502}(( ���ظ�ء���ҧ�������ѧ�ҡ�͡⫹�֡���ظ ))", COLOR_YELLOW, 485.4781,-2110.9434,626.6250, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 25.0);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
	    // ��� ⫹�֡���ظ
	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 266.3651,-1816.9652,4.9168))
	    {
	        if (GetPlayerMoneyEx(playerid) < 500)
	            return SendClientMessage(playerid, COLOR_RED, "�س���Թʴ�����§��! ($500)");

			ResetPlayerWeaponsEx(playerid);
			SetPlayerPosExten(playerid, 478.2189,-2094.6321,626.6250);
			SetPlayerFacingAngle(playerid, 353.4302);
			SetPlayerInterior(playerid, 15);
			SetPlayerVirtualWorld(playerid, 0);
			inBoxingZone[playerid] = 1;
			GivePlayerMoneyEx(playerid, -500);

			SendClientMessage(playerid, COLOR_YELLOW, "[�к�]: ��س��� LoadObject ��� Map ���� 5 �Թҷ�");
			FreeTimer(playerid, 5000);

			SendClientMessage(playerid, -1, "{F53F04}����͹ :: {FBC3B1}�س�����������⫹�֡���ظ����!");
			SendClientMessage(playerid, COLOR_LIGHTRED, "������ʹ������⫹ : {ffffff}$500");
	    }
	    // �͡ ⫹�֡���ظ
	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 478.2189,-2094.6321,626.6250))
	    {
	        ResetPlayerWeaponsEx(playerid);
			SetPlayerPosExten(playerid, 266.3651,-1816.9652,4.9168);
			SetPlayerFacingAngle(playerid, 86.554344);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			inBoxingZone[playerid] = 0;
			
			SendClientMessage(playerid, COLOR_YELLOW, "[�к�]: ��س��� LoadObject ��� Map ���� 5 �Թҷ�");
			FreeTimer(playerid, 5000);

			SendClientMessage(playerid, -1, "{F53F04}����͹ :: {FBC3B1}�س���͡�ҡ⫹�֡���ظ����!");
	    }

		// �ԡ���ظ����Ѻ��ë���
	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 485.4781,-2110.9434,626.6250))
		{
			Dialog_Show(playerid, DIALOG_FREE_WEAPONS, DIALOG_STYLE_TABLIST, "{F5A002}[ {F5F102}�ԡ���ظ����Ѻ��ë��� {F5A002}]", "\
			{ffffff}ʹѺ���\t{FC9B79}���!\n\
			{ffffff}������\t{FC9B79}���!\n\
			{ffffff}�մ���\t{FC9B79}���!\n\
			{ffffff}����ʺ��\t{FC9B79}���!\n\
			{ffffff}���ʹ��\t{FC9B79}���!\n\
			{ffffff}�ҵҹ�\t{FC9B79}���!\n\
			", "��Ժ���ظ", "�͡");
		    TogglePlayerControllable(playerid, 0);
		}
	}
	return 1;
}

Dialog:DIALOG_FREE_WEAPONS(playerid, response, listitem, inputtext[])
{

	TogglePlayerControllable(playerid, 1); // �Ŵ��͡�Թ��ѧ���͡�����͡
	if(response)
	{
		switch(listitem)
  		{
			case 0:
			{
				GivePlayerWeaponEx(playerid, 1, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "�س��ӡ����Ժ���ظ 'ʹѺ���' �͡������Ѻ��ë����⫹�֡���ظ����");
			}
			case 1:
			{
				GivePlayerWeaponEx(playerid, 2, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "�س��ӡ����Ժ���ظ '������' �͡������Ѻ��ë����⫹�֡���ظ����");
			}
			case 2:
			{
				GivePlayerWeaponEx(playerid, 4, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "�س��ӡ����Ժ���ظ '�մ���' �͡������Ѻ��ë����⫹�֡���ظ����");
			}
			case 3:
			{
				GivePlayerWeaponEx(playerid, 5, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "�س��ӡ����Ժ���ظ '����ʺ��' �͡������Ѻ��ë����⫹�֡���ظ����");
			}
			case 4:
			{
				GivePlayerWeaponEx(playerid, 7, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "�س��ӡ����Ժ���ظ '���ʹ��' �͡������Ѻ��ë����⫹�֡���ظ����");
			}
			case 5:
			{
				GivePlayerWeaponEx(playerid, 8, 1);
				SendClientMessage(playerid, COLOR_YELLOW, "�س��ӡ����Ժ���ظ '�ҵҹ�' �͡������Ѻ��ë����⫹�֡���ظ����");
			}
		}
	}
	return 1;
}

CMD:warpboxing(playerid)
{
	if (playerData[playerid][pAdmin] == 0)
	    return SendClientMessage(playerid, COLOR_RED, "����Ѻ�������к���ҹ��!");

	SetPlayerPosExten(playerid, 410.62589,-2125.44873,630.00000);
	SetPlayerFacingAngle(playerid, 169.9462);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	inBoxingZone[playerid] = 0;
	
	return SendClientMessage(playerid, COLOR_YELLOW, "�س��������ʹ�� '����' ����");
}

CMD:av(playerid, params[])
{
	new Float:hp;
	GetPlayerHealth(playerid, hp);

	if (GetPlayerInterior(playerid) != 15)
	    return SendClientMessage(playerid, COLOR_RED, "�س��ͧ�����ʹ�� Boxing ��ҹ��!");

	if (hp > 10)
	    return SendClientMessage(playerid, COLOR_RED, "�س��ͧ��������ʹ���¡��� 10.0 HP �֧������ö�������ʹ��!");
	    
	SetPlayerHealth(playerid, 100.0);
	SendClientMessage(playerid, COLOR_YELLOW, "�س��ӡ���������ʹ��Ѻ�� 100.0 HP ���º��������!");
	return 1;
}

CMD:vv(playerid, params[])
{
	new userid;

	if (inBoxingZone[playerid] == 0)
	    return SendClientMessage(playerid, COLOR_RED, "�س��ͧ�����ʹ�� Boxing ��ҹ��!");

    if (sscanf(params, "u", userid))
	    return SendClientMessage(playerid, COLOR_WHITE, "/vv [�ʹ�/����]");

	if (userid == INVALID_PLAYER_ID)
	    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�������ʹչ��������������");

	if (!playerData[userid][pInjured])
	    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�������ʹչ������������ʶҹкҴ��");

	if (inBoxingZone[userid] == 0)
	    return SendClientMessage(playerid, COLOR_RED, "�����蹹�鹵�ͧ�����ʹ�� Boxing ��ҹ��!");

	SetPlayerHealth(userid, 100);
	SetPlayerWeather(userid, globalWeather);
    playerData[userid][pInjured] = 0;
    playerData[userid][pInjuredTime] = 0;
    ClearAnimations(userid);
    PlayerTextDrawHide(userid, PlayerDeathTD[userid]);
    ShowPlayerStats(userid, true);

    Injured_Remove(userid);

    SendClientMessageEx(playerid, COLOR_WHITE, "�س���ѡ���ҡ�úҴ����� {33CCFF}%s{FFFFFF}", GetPlayerNameEx(userid));
    SendClientMessageEx(userid, COLOR_LIGHTBLUE, "%s {FFFFFF}���ѡ���ҡ�úҴ�����س", GetPlayerNameEx(playerid));
    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ���ѡ���ҡ�úҴ����� %s", GetPlayerNameEx(playerid), GetPlayerNameEx(userid));
	return 1;
}

#include	<YSI_Coding\y_hooks>

#define     COCAINEOBJECT       	1580
#define     COCAINETEXT           	"Objective: {FF0000}�ह\n{FFFFFF}������ {FFFF00}N {FFFFFF}���͡����!"
#define     COCAINENAME            "�ह"
#define     COCAINETIMER           15 // �ҷ��Դ

new COCAINETake[MAX_PLAYERS];

new cocainType[MAX_PLAYERS];

new PoonCash, CableCash, CapsuleCash, NPCPoon, CocainCash, BuCash;

enum COCAINE_DATA
{
    COCAINEID,
    COCAINEObject,
    Float: COCAINEPosX,
	Float: COCAINEPosY,
	Float: COCAINEPosZ,
    Text3D: COCAINE3D,
    COCAINE3DMSG[80],
    COCAINEOn
};
new const COCAINEData[][COCAINE_DATA] =
{
	{ INVALID_STREAMER_ID, COCAINEOBJECT, 2846.60034, 983.47882, 9.74154, Text3D: INVALID_3DTEXT_ID, COCAINETEXT, 0 },
	{ INVALID_STREAMER_ID, COCAINEOBJECT, 2327.35400, 2784.76563, 9.79700, Text3D: INVALID_3DTEXT_ID, COCAINETEXT, 0 },
	{ INVALID_STREAMER_ID, COCAINEOBJECT, 1640.08728, 2326.47266, 9.81001, Text3D: INVALID_3DTEXT_ID, COCAINETEXT, 0 },
	{ INVALID_STREAMER_ID, COCAINEOBJECT, 1068.99194, 2129.14478, 9.81578, Text3D: INVALID_3DTEXT_ID, COCAINETEXT, 0 }
};

hook OnPlayerConnect(playerid)
{
	COCAINETake[playerid] = 0;
	cocainType[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (COCAINETake[playerid] != 0)
	{
		if (COCAINEData[ProgressObject[playerid]][COCAINEOn] == 1)
		{
			COCAINEData[ProgressObject[playerid]][COCAINEOn] = 0;
			StopProgress(playerid);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(COCAINEData); i++)
	{
		COCAINEData[i][COCAINEID] = CreateDynamicObject(COCAINEData[i][COCAINEObject], COCAINEData[i][COCAINEPosX], COCAINEData[i][COCAINEPosY], COCAINEData[i][COCAINEPosZ], 0.0, 0.0, 0.0);
		COCAINEData[i][COCAINE3D] = CreateDynamic3DTextLabel(COCAINEData[i][COCAINE3DMSG], COLOR_GREEN, COCAINEData[i][COCAINEPosX], COCAINEData[i][COCAINEPosY], COCAINEData[i][COCAINEPosZ] + 1.5, 5.0);
	}
	
	// ��觴Թ�׹
	CreateDynamic3DTextLabel("��觼Դ������:{FFFFFF} ������ {FFFF00}N{FFFFFF}\n㹡�â�¢ͧ", COLOR_GREEN, -2085.4189,-2423.1775,30.6250+1.0, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	//NPCPoon = CreateActor(240, -2085.4189,-2423.1775,30.6250,322.6918);
	ApplyActorAnimation(NPCPoon, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, -1);
	
    CocainCash = randomEx(50,100), PoonCash = randomEx(50,100), CableCash = randomEx(50,100), CapsuleCash = randomEx(50,100), BuCash = randomEx(50,100);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof COCAINEData; i++)
        {
            GetDynamicObjectPos(COCAINEData[i][COCAINEID], COCAINEData[i][COCAINEPosX], COCAINEData[i][COCAINEPosY], COCAINEData[i][COCAINEPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, COCAINEData[i][COCAINEPosX], COCAINEData[i][COCAINEPosY], COCAINEData[i][COCAINEPosZ]))
            {
                if(IsValidDynamicObject(COCAINEData[i][COCAINEID]) && COCAINEData[i][COCAINEOn] == 0)
                {
                    if (CopOnline() < 2)
                        return SendClientMessage(playerid, COLOR_LIGHTRED, "* ��ͧ�����˹�ҷ����Ǩ�͹�Ź��ҡ���� 2 ��");

                    if (playerData[playerid][pLevel] < 0)
                        return SendClientMessage(playerid, COLOR_LIGHTRED, "* ��ͧ Level 2 ����");

					if (GetFactionType(playerid) == FACTION_POLICE && GetFactionType(playerid) == FACTION_MEDIC && GetFactionType(playerid) == FACTION_GOV)
					    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س���Ѱ���! �������ö�ӧҹ�Դ��������");
					    
					if (Inventory_Count(playerid, "�ह") >= 10)
                        return SendClientMessage(playerid, COLOR_LIGHTRED, "+ �س���ह�ӹǹ�٧�ش����к����! (10 ���)");

                    //new ammo = Inventory_Count(playerid, COCAINENAME)+1;


                    COCAINEData[i][COCAINEOn] = 1;
	                ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
	                StartProgress(playerid, 100, 0, i);
					COCAINETake[playerid] = 1;
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, -2085.4189,-2423.1775,30.6250))
        {
            Dialog_Show(playerid, DIALOG_COCAINE, DIALOG_STYLE_TABLIST_HEADERS, "[��¡���Ѻ����]", "\
				������¡��\t���Ẻ�кبӹǹ\t���Ẻ������\n\
				�ह\t{FF0000}$70\t{FF0000}$%s\n\
				�ٹ\t{FF0000}$70\t{FF0000}$%s\n\
				����\t{FF0000}$70\t{FF0000}$%s\n\
				᤻���\t{FF0000}$70\t{FF0000}$%s\n\
				�������\t{FF0000}$70\t{FF0000}$%s", "���", "�͡", FormatNumber(CocainCash), FormatNumber(PoonCash), FormatNumber(CableCash), FormatNumber(CapsuleCash), FormatNumber(BuCash));
        }
	}
	return 1;
}

Dialog:DIALOG_COCAIN_AMOUNT(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(cocainType[playerid])
	    {
	        case 0:
	        {
				new cashvip;
				switch(playerData[playerid][pVip])
    			{
					case 0: cashvip = 0;
					case 1: cashvip = 20;
					case 2: cashvip = 40;
					case 3: cashvip = 60;
				}


			    new ammo = strval(inputtext);
			    new price = ammo*70;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س������ह����㹵�����");

				if (ammo > Inventory_Count(playerid, "�ह"))
				    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�ӹǹ�ͧ㹵�Ǥس�������§��!");

		       // playerData[playerid][pRedMoney] += price+cashvip;
			   	GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��ҹ���] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â���ह {00FF00}%d {FFFFFF}��", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "�ह", ammo);
				cocainType[playerid] = -1;

				new strd[256];
				new DCC_Embed:embed = DCC_CreateEmbed();
				DCC_SetEmbedTitle(embed, "Log ��¢ͧ�ҹ�� ����кبӹǹ");
				format(strd, sizeof(strd), " %s ���Ѻ�Թᴧ�ӹǹ %s �ҡ��â���ह %d  ��\n `�ѹ/���� %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
				DCC_SetEmbedDescription(embed, strd);
				DCC_SetEmbedColor(embed, 0xFFFF00);
				DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
				DCC_SendChannelEmbedMessage(DCC_FindChannelById("1414658622570369055"), embed);

		    }
	        case 1:
	        {
				new cashvip;
				switch(playerData[playerid][pVip])
    			{
					case 0: cashvip = 0;
					case 1: cashvip = 20;
					case 2: cashvip = 40;
					case 3: cashvip = 60;
				}

			    new ammo = strval(inputtext);
			    new price = ammo*70;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س����ջٹ����㹵�����");

				if (ammo > Inventory_Count(playerid, "�ٹ"))
				    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�ӹǹ�ͧ㹵�Ǥس�������§��!");

		       // playerData[playerid][pRedMoney] += price+cashvip;
			   	GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��ҹ���] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�»ٹ {00FF00}%d {FFFFFF}��", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "�ٹ", ammo);
				cocainType[playerid] = -1;

				new strd[256];
				new DCC_Embed:embed = DCC_CreateEmbed();
				DCC_SetEmbedTitle(embed, "Log ��¢ͧ�ҹ�� ����кبӹǹ");
				format(strd, sizeof(strd), " %s ���Ѻ�Թᴧ�ӹǹ %s �ҡ��â�»ٹ %d  ��\n `�ѹ/���� %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
				DCC_SetEmbedDescription(embed, strd);
				DCC_SetEmbedColor(embed, 0xFFFF00);
				DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
				DCC_SendChannelEmbedMessage(DCC_FindChannelById("1414658523673006231"), embed);
		    }
	        case 2:
	        {
				new cashvip;
				switch(playerData[playerid][pVip])
    			{
					case 0: cashvip = 0;
					case 1: cashvip = 20;
					case 2: cashvip = 40;
					case 3: cashvip = 60;
				}

			    new ammo = strval(inputtext);
			    new price = ammo*70;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�������������㹵�����");

				if (ammo > Inventory_Count(playerid, "����"))
				    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�ӹǹ�ͧ㹵�Ǥس�������§��!");

		        //playerData[playerid][pRedMoney] += price+cashvip;
				GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��ҹ���] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â������ {00FF00}%d {FFFFFF}���", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "����", ammo);
				cocainType[playerid] = -1;

				new strd[256];
				new DCC_Embed:embed = DCC_CreateEmbed();
				DCC_SetEmbedTitle(embed, "Log ��¢ͧ�ҹ�� ����кبӹǹ");
				format(strd, sizeof(strd), " %s ���Ѻ�Թᴧ�ӹǹ %s �ҡ��â������ %d ��� \n `�ѹ/���� %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
				DCC_SetEmbedDescription(embed, strd);
				DCC_SetEmbedColor(embed, 0xFFFF00);
				DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
				DCC_SendChannelEmbedMessage(DCC_FindChannelById("1414658568392540343"), embed);
		    }
	        case 3:
	        {
				new cashvip;
				switch(playerData[playerid][pVip])
    			{
					case 0: cashvip = 0;
					case 1: cashvip = 20;
					case 2: cashvip = 40;
					case 3: cashvip = 60;
				}

			    new ammo = strval(inputtext);
			    new price = ammo*70;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�����᤻�������㹵�����");

				if (ammo > Inventory_Count(playerid, "᤻���"))
				    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�ӹǹ�ͧ㹵�Ǥس�������§��!");

		       // playerData[playerid][pRedMoney] += price+cashvip;
			   	GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��ҹ���] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â��᤻��� {00FF00}%d {FFFFFF}���", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "᤻���", ammo);
				cocainType[playerid] = -1;
		    }
	        case 4:
	        {
				new cashvip;
				switch(playerData[playerid][pVip])
    			{
					case 0: cashvip = 0;
					case 1: cashvip = 20;
					case 2: cashvip = 40;
					case 3: cashvip = 60;
				}

			    new ammo = strval(inputtext);
			    new price = ammo*70;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س����պ����������㹵�����");

				if (ammo > Inventory_Count(playerid, "�������"))
				    return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�ӹǹ�ͧ㹵�Ǥس�������§��!");

		       // playerData[playerid][pRedMoney] += price+cashvip;
			   	GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��ҹ���] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â�º������ {00FF00}%d {FFFFFF}��", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "�������", ammo);
				cocainType[playerid] = -1;
		    }

		}
	}
	return 1;
}

Dialog:DIALOG_COCAIN_TYPE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
	            Dialog_Show(playerid, DIALOG_COCAIN_AMOUNT, DIALOG_STYLE_INPUT, "[��¡���Ѻ����]", "��س��кبӹǹ���س��ͧ��èТ��", "��ŧ", "¡��ԡ");
			}
			case 1:
			{
			    switch(cocainType[playerid])
			    {
			        case 0:
			        {
						new cashvip;
						switch(playerData[playerid][pVip])
		    			{
							case 0: cashvip = 0;
							case 1: cashvip = 20;
							case 2: cashvip = 40;
							case 3: cashvip = 60;
						}

					    new ammo = Inventory_Count(playerid, COCAINENAME);
					    new price = ammo*CocainCash;

					    if (ammo <= 0)
					        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�����"#COCAINENAME"����㹵�����");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â��"#COCAINENAME" {00FF00}%d {FFFFFF}��", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, COCAINENAME, ammo);
						cocainType[playerid] = -1;

						new strd[256];
						new DCC_Embed:embed = DCC_CreateEmbed();
						DCC_SetEmbedTitle(embed, "Log ��¢ͧ�ҹ�� ��·�����");
						format(strd, sizeof(strd), " %s ���Ѻ�Թᴧ�ӹǹ %s �ҡ��â���ह %d �� \n `�ѹ/���� %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
						DCC_SetEmbedDescription(embed, strd);
						DCC_SetEmbedColor(embed, 0xFFFF00);
						DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
						DCC_SendChannelEmbedMessage(DCC_FindChannelById("1414668884778156083"), embed);	
				    }
				    
			        case 1:
			        {
						new cashvip;
						switch(playerData[playerid][pVip])
		    			{
							case 0: cashvip = 0;
							case 1: cashvip = 20;
							case 2: cashvip = 40;
							case 3: cashvip = 60;
						}

					    new ammo = Inventory_Count(playerid, "�ٹ");
					    new price = ammo*PoonCash;

					    if (ammo <= 0)
					        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س����ջٹ ����㹵�����");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â�»ٹ {00FF00}%d {FFFFFF}���", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, "�ٹ", ammo);
						cocainType[playerid] = -1;

						new strd[256];
						new DCC_Embed:embed = DCC_CreateEmbed();
						DCC_SetEmbedTitle(embed, "Log ��¢ͧ�ҹ�� ��·�����");
						format(strd, sizeof(strd), " %s ���Ѻ�Թᴧ�ӹǹ %s �ҡ��â�»ٹ %d ��� \n `�ѹ/���� %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
						DCC_SetEmbedDescription(embed, strd);
						DCC_SetEmbedColor(embed, 0xFFFF00);
						DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
						DCC_SendChannelEmbedMessage(DCC_FindChannelById("1414668796425277712"), embed);
				    }

			        case 2:
			        {
    					new cashvip;
						switch(playerData[playerid][pVip])
		    			{
							case 0: cashvip = 0;
							case 1: cashvip = 20;
							case 2: cashvip = 40;
							case 3: cashvip = 60;
						}

					    new ammo = Inventory_Count(playerid, "����");
					    new price = ammo*CableCash;

					    if (ammo <= 0)
					        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س��������� ����㹵�����");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â������ {00FF00}%d {FFFFFF}���", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, "����", ammo);
						cocainType[playerid] = -1;

						new strd[256];
						new DCC_Embed:embed = DCC_CreateEmbed();
						DCC_SetEmbedTitle(embed, "Log ��¢ͧ�ҹ�� ��·�����");
						format(strd, sizeof(strd), " %s ���Ѻ�Թᴧ�ӹǹ %s �ҡ��â������ %d ���\n `�ѹ/���� %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
						DCC_SetEmbedDescription(embed, strd);
						DCC_SetEmbedColor(embed, 0xFFFF00);
						DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
						DCC_SendChannelEmbedMessage(DCC_FindChannelById("1414668833553125386"), embed);
				    }

			        case 3:
			        {
						new cashvip;
						switch(playerData[playerid][pVip])
		    			{
							case 0: cashvip = 0;
							case 1: cashvip = 20;
							case 2: cashvip = 40;
							case 3: cashvip = 60;
						}

					    new ammo = Inventory_Count(playerid, "᤻���");
					    new price = ammo*CapsuleCash;

					    if (ammo <= 0)
					        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�����᤻��� ����㹵�����");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â��᤻��� {00FF00}%d {FFFFFF}���", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, "᤻���", ammo);
						cocainType[playerid] = -1;
				    }

			        case 4:
			        {
						new cashvip;
						switch(playerData[playerid][pVip])
		    			{
							case 0: cashvip = 0;
							case 1: cashvip = 20;
							case 2: cashvip = 40;
							case 3: cashvip = 60;
						}

					    new ammo = Inventory_Count(playerid, "�������");
					    new price = ammo*BuCash;

					    if (ammo <= 0)
					        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س����պ������ ����㹵�����");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â�º������ {00FF00}%d {FFFFFF}���", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, "�������", ammo);
						cocainType[playerid] = -1;
				    }
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_COCAINE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
	            cocainType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "�ٻẺ㹡�â�� > �ͧ�Դ������", "+ ���Ẻ�кبӹǹ\n+ ���Ẻ���������㹵��", "��ŧ", "¡��ԡ");

			    /*new ammo = Inventory_Count(playerid, COCAINENAME);
			    new price = ammo*750;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�����"#COCAINENAME"����㹵�����");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â��"#COCAINENAME" {00FF00}%d {FFFFFF}��", FormatMoney(price), ammo);
				Inventory_Remove(playerid, COCAINENAME, ammo);*/
		    }

	        case 1:
	        {
	            cocainType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "�ٻẺ㹡�â�� > �ͧ�Դ������", "+ ���Ẻ�кبӹǹ\n+ ���Ẻ���������㹵��", "��ŧ", "¡��ԡ");

			    /*new ammo = Inventory_Count(playerid, "�ٹ");
			    new price = ammo*PoonCash;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س����ջٹ ����㹵�����");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â�»ٹ {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "�ٹ", ammo);*/
		    }

	        case 2:
	        {
	            cocainType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "�ٻẺ㹡�â�� > �ͧ�Դ������", "+ ���Ẻ�кبӹǹ\n+ ���Ẻ���������㹵��", "��ŧ", "¡��ԡ");

			    /*new ammo = Inventory_Count(playerid, "����");
			    new price = ammo*CableCash;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س��������� ����㹵�����");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â������ {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "����", ammo);*/
		    }

	        case 3:
	        {
	            cocainType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "�ٻẺ㹡�â�� > �ͧ�Դ������", "+ ���Ẻ�кبӹǹ\n+ ���Ẻ���������㹵��", "��ŧ", "¡��ԡ");

			    /*new ammo = Inventory_Count(playerid, "᤻���");
			    new price = ammo*CapsuleCash;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�����᤻��� ����㹵�����");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â��᤻��� {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "᤻���", ammo);*/
		    }

	        case 4:
	        {
	            cocainType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "�ٻẺ㹡�â�� > �ͧ�Դ������", "+ ���Ẻ�кبӹǹ\n+ ���Ẻ���������㹵��", "��ŧ", "¡��ԡ");

			    /*new ammo = Inventory_Count(playerid, "�������");
			    new price = ammo*2000;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س����պ������ ����㹵�����");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[��觼Դ������] {FFFFFF}�س���Ѻ�Թᴧ�ӹǹ {FF0000}%s {FFFFFF}�ҡ��â�º������ {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "�������", ammo);*/
		    }
		}
	}
	return 1;
}

PlayerCOCAINEUnfreeze(playerid, number)
{
	/*new wanted = randomEx(1, 2);
	switch(wanted)
	{
	    case 2:
		{
			GivePlayerWanted(playerid, 1);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[��դ���] {FFFFFF}�س�Դ������Фس��"#COCAINENAME"");
		}
	}*/
	ClearAnimations(playerid);
	
	COCAINETake[playerid] = 0;
	COCAINEData[number][COCAINEOn] = 0;

	new id = Inventory_Add(playerid, COCAINENAME, 1);

	if (id == -1)
	    return SendClientMessageEx(playerid, COLOR_RED, "[�к�] {FFFFFF}�����آͧ�����������§�� (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

	GivePlayerExp(playerid, 10);
	SendClientMessage(playerid, COLOR_WHITE, "�س���Ѻ {FF0000}"#COCAINENAME" +1");

	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	SendFactionMessageEx(FACTION_POLICE, -1, "{FB3403}HQ :: {ffffff}%s {FDBFB0}���ѧ���ह����繧ҹ�Դ����������!", GetPlayerNameEx(playerid));
	SetFactionMarkerEx(playerid, FACTION_POLICE, x, y, z);

	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	if(COCAINETake[playerid] == 1)
		PlayerCOCAINEUnfreeze(playerid, objectid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(COCAINETake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

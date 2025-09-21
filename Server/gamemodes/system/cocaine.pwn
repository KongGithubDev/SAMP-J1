#include	<YSI_Coding\y_hooks>

#define     COCAINEOBJECT       	1580
#define     COCAINETEXT           	"Objective: {FF0000}โคเคน\n{FFFFFF}กดปุ่ม {FFFF00}N {FFFFFF}เพื่อก้มเก็บ!"
#define     COCAINENAME            "โคเคน"
#define     COCAINETIMER           15 // นาทีเกิด

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
	
	// วิ่งดินปืน
	CreateDynamic3DTextLabel("สิ่งผิดกฎหมาย:{FFFFFF} กดปุ่ม {FFFF00}N{FFFFFF}\nในการขายของ", COLOR_GREEN, -2085.4189,-2423.1775,30.6250+1.0, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
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
                        return SendClientMessage(playerid, COLOR_LIGHTRED, "* ต้องมีเจ้าหน้าที่ตำรวจออนไลน์มากกว่า 2 คน");

                    if (playerData[playerid][pLevel] < 0)
                        return SendClientMessage(playerid, COLOR_LIGHTRED, "* ต้อง Level 2 ขึ้นไป");

					if (GetFactionType(playerid) == FACTION_POLICE && GetFactionType(playerid) == FACTION_MEDIC && GetFactionType(playerid) == FACTION_GOV)
					    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณเป็นรัฐบาล! ไม่สามารถทำงานผิดกฎหมายได้");
					    
					if (Inventory_Count(playerid, "โคเคน") >= 10)
                        return SendClientMessage(playerid, COLOR_LIGHTRED, "+ คุณมีโคเคนจำนวนสูงสุดที่ระบุไว้! (10 ชิ้น)");

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
            Dialog_Show(playerid, DIALOG_COCAINE, DIALOG_STYLE_TABLIST_HEADERS, "[รายการรับซื้อ]", "\
				ชื่อรายการ\tขายแบบระบุจำนวน\tขายแบบทีเดียว\n\
				โคเคน\t{FF0000}$70\t{FF0000}$%s\n\
				ปูน\t{FF0000}$70\t{FF0000}$%s\n\
				สายไฟ\t{FF0000}$70\t{FF0000}$%s\n\
				แคปซูล\t{FF0000}$70\t{FF0000}$%s\n\
				บูลไซย่า\t{FF0000}$70\t{FF0000}$%s", "ขาย", "ออก", FormatNumber(CocainCash), FormatNumber(PoonCash), FormatNumber(CableCash), FormatNumber(CapsuleCash), FormatNumber(BuCash));
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
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีโคเคนอยู่ในตัวเลย");

				if (ammo > Inventory_Count(playerid, "โคเคน"))
				    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}จำนวนของในตัวคุณมีไม่เพียงพอ!");

		       // playerData[playerid][pRedMoney] += price+cashvip;
			   	GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินแดงจำนวน {00FF00}%s {FFFFFF}จากการขายโคเคน {00FF00}%d {FFFFFF}โล", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "โคเคน", ammo);
				cocainType[playerid] = -1;

				new strd[256];
				new DCC_Embed:embed = DCC_CreateEmbed();
				DCC_SetEmbedTitle(embed, "Log ขายของงานดำ ขายระบุจำนวน");
				format(strd, sizeof(strd), " %s ได้รับเงินแดงจำนวน %s จากการขายโคเคน %d  โล\n `วัน/เวลา %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
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
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีปูนอยู่ในตัวเลย");

				if (ammo > Inventory_Count(playerid, "ปูน"))
				    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}จำนวนของในตัวคุณมีไม่เพียงพอ!");

		       // playerData[playerid][pRedMoney] += price+cashvip;
			   	GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินแดงจำนวน {00FF00}%s {FFFFFF}จากการขายปูน {00FF00}%d {FFFFFF}แท่ง", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "ปูน", ammo);
				cocainType[playerid] = -1;

				new strd[256];
				new DCC_Embed:embed = DCC_CreateEmbed();
				DCC_SetEmbedTitle(embed, "Log ขายของงานดำ ขายระบุจำนวน");
				format(strd, sizeof(strd), " %s ได้รับเงินแดงจำนวน %s จากการขายปูน %d  แท่ง\n `วัน/เวลา %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
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
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีสายไฟอยู่ในตัวเลย");

				if (ammo > Inventory_Count(playerid, "สายไฟ"))
				    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}จำนวนของในตัวคุณมีไม่เพียงพอ!");

		        //playerData[playerid][pRedMoney] += price+cashvip;
				GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายสายไฟ {00FF00}%d {FFFFFF}เส้น", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "สายไฟ", ammo);
				cocainType[playerid] = -1;

				new strd[256];
				new DCC_Embed:embed = DCC_CreateEmbed();
				DCC_SetEmbedTitle(embed, "Log ขายของงานดำ ขายระบุจำนวน");
				format(strd, sizeof(strd), " %s ได้รับเงินแดงจำนวน %s จากการขายสายไฟ %d เส้น \n `วัน/เวลา %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
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
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีแคปซูลอยู่ในตัวเลย");

				if (ammo > Inventory_Count(playerid, "แคปซูล"))
				    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}จำนวนของในตัวคุณมีไม่เพียงพอ!");

		       // playerData[playerid][pRedMoney] += price+cashvip;
			   	GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายแคปซูล {00FF00}%d {FFFFFF}เม็ด", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "แคปซูล", ammo);
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
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีบูลไซย่าอยู่ในตัวเลย");

				if (ammo > Inventory_Count(playerid, "บูลไซย่า"))
				    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}จำนวนของในตัวคุณมีไม่เพียงพอ!");

		       // playerData[playerid][pRedMoney] += price+cashvip;
			   	GivePlayerRedMoney(playerid, price+cashvip);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายบูลไซย่า {00FF00}%d {FFFFFF}โล", FormatMoney(price+cashvip), ammo);
				Inventory_Remove(playerid, "บูลไซย่า", ammo);
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
	            Dialog_Show(playerid, DIALOG_COCAIN_AMOUNT, DIALOG_STYLE_INPUT, "[รายการรับซื้อ]", "กรุณาระบุจำนวนที่คุณต้องการจะขาย", "ตกลง", "ยกเลิก");
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
					        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มี"#COCAINENAME"อยู่ในตัวเลย");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขาย"#COCAINENAME" {00FF00}%d {FFFFFF}ต้น", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, COCAINENAME, ammo);
						cocainType[playerid] = -1;

						new strd[256];
						new DCC_Embed:embed = DCC_CreateEmbed();
						DCC_SetEmbedTitle(embed, "Log ขายของงานดำ ขายทั้งหมด");
						format(strd, sizeof(strd), " %s ได้รับเงินแดงจำนวน %s จากการขายโคเคน %d ต้น \n `วัน/เวลา %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
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

					    new ammo = Inventory_Count(playerid, "ปูน");
					    new price = ammo*PoonCash;

					    if (ammo <= 0)
					        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีปูน อยู่ในตัวเลย");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายปูน {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, "ปูน", ammo);
						cocainType[playerid] = -1;

						new strd[256];
						new DCC_Embed:embed = DCC_CreateEmbed();
						DCC_SetEmbedTitle(embed, "Log ขายของงานดำ ขายทั้งหมด");
						format(strd, sizeof(strd), " %s ได้รับเงินแดงจำนวน %s จากการขายปูน %d ชิ้น \n `วัน/เวลา %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
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

					    new ammo = Inventory_Count(playerid, "สายไฟ");
					    new price = ammo*CableCash;

					    if (ammo <= 0)
					        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีสายไฟ อยู่ในตัวเลย");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายสายไฟ {00FF00}%d {FFFFFF}เส้น", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, "สายไฟ", ammo);
						cocainType[playerid] = -1;

						new strd[256];
						new DCC_Embed:embed = DCC_CreateEmbed();
						DCC_SetEmbedTitle(embed, "Log ขายของงานดำ ขายทั้งหมด");
						format(strd, sizeof(strd), " %s ได้รับเงินแดงจำนวน %s จากการขายสายไฟ %d เส้น\n `วัน/เวลา %s`", GetPlayerNameEx(playerid), FormatMoney(price+cashvip), ammo, ReturnDate());
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

					    new ammo = Inventory_Count(playerid, "แคปซูล");
					    new price = ammo*CapsuleCash;

					    if (ammo <= 0)
					        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีแคปซูล อยู่ในตัวเลย");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายแคปซูล {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, "แคปซูล", ammo);
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

					    new ammo = Inventory_Count(playerid, "บูลไซย่า");
					    new price = ammo*BuCash;

					    if (ammo <= 0)
					        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีบูลไซย่า อยู่ในตัวเลย");

				        GivePlayerRedMoney(playerid, price+cashvip);
						PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายบูลไซย่า {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price+cashvip), ammo);
						Inventory_Remove(playerid, "บูลไซย่า", ammo);
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
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "รูปแบบในการขาย > ของผิดกฎหมาย", "+ ขายแบบระบุจำนวน\n+ ขายแบบทั้งหมดภายในตัว", "ตกลง", "ยกเลิก");

			    /*new ammo = Inventory_Count(playerid, COCAINENAME);
			    new price = ammo*750;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มี"#COCAINENAME"อยู่ในตัวเลย");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขาย"#COCAINENAME" {00FF00}%d {FFFFFF}ต้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, COCAINENAME, ammo);*/
		    }

	        case 1:
	        {
	            cocainType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "รูปแบบในการขาย > ของผิดกฎหมาย", "+ ขายแบบระบุจำนวน\n+ ขายแบบทั้งหมดภายในตัว", "ตกลง", "ยกเลิก");

			    /*new ammo = Inventory_Count(playerid, "ปูน");
			    new price = ammo*PoonCash;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีปูน อยู่ในตัวเลย");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายปูน {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ปูน", ammo);*/
		    }

	        case 2:
	        {
	            cocainType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "รูปแบบในการขาย > ของผิดกฎหมาย", "+ ขายแบบระบุจำนวน\n+ ขายแบบทั้งหมดภายในตัว", "ตกลง", "ยกเลิก");

			    /*new ammo = Inventory_Count(playerid, "สายไฟ");
			    new price = ammo*CableCash;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีสายไฟ อยู่ในตัวเลย");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายสายไฟ {00FF00}%d {FFFFFF}เส้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "สายไฟ", ammo);*/
		    }

	        case 3:
	        {
	            cocainType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "รูปแบบในการขาย > ของผิดกฎหมาย", "+ ขายแบบระบุจำนวน\n+ ขายแบบทั้งหมดภายในตัว", "ตกลง", "ยกเลิก");

			    /*new ammo = Inventory_Count(playerid, "แคปซูล");
			    new price = ammo*CapsuleCash;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีแคปซูล อยู่ในตัวเลย");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายแคปซูล {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "แคปซูล", ammo);*/
		    }

	        case 4:
	        {
	            cocainType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_COCAIN_TYPE, DIALOG_STYLE_LIST, "รูปแบบในการขาย > ของผิดกฎหมาย", "+ ขายแบบระบุจำนวน\n+ ขายแบบทั้งหมดภายในตัว", "ตกลง", "ยกเลิก");

			    /*new ammo = Inventory_Count(playerid, "บูลไซย่า");
			    new price = ammo*2000;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีบูลไซย่า อยู่ในตัวเลย");

		        GivePlayerRedMoney(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[สิ่งผิดกฎหมาย] {FFFFFF}คุณได้รับเงินแดงจำนวน {FF0000}%s {FFFFFF}จากการขายบูลไซย่า {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "บูลไซย่า", ammo);*/
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
			SendClientMessage(playerid, COLOR_LIGHTRED, "[คดีความ] {FFFFFF}คุณติดดาวเพราะคุณมี"#COCAINENAME"");
		}
	}*/
	ClearAnimations(playerid);
	
	COCAINETake[playerid] = 0;
	COCAINEData[number][COCAINEOn] = 0;

	new id = Inventory_Add(playerid, COCAINENAME, 1);

	if (id == -1)
	    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

	GivePlayerExp(playerid, 10);
	SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {FF0000}"#COCAINENAME" +1");

	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	SendFactionMessageEx(FACTION_POLICE, -1, "{FB3403}HQ :: {ffffff}%s {FDBFB0}กำลังขนโคเคนซึ่งเป็นงานผิดกฎหมายอยู่!", GetPlayerNameEx(playerid));
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

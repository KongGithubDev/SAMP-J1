//-----�к����Ѵ�Ӣ���� SekaiDev.-----//

//****�ô��ҹ ��سҷӵ����Ի����鹨кѤ****//
/*
	��駤�Ի --> https://mega.nz/file/G65SAY4C#xQjiPjWHvueRRw91jMUtS4Z_hhS_jrrJXM30Qlzv6qg

	if(skinshopuse[playerid] == 0)
	{
		playerData[playerid][pSkin] = GetPlayerSkin(playerid);
	}
*/

#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

DEFINE_HOOK_REPLACEMENT(OnPlayer, OP_);

new PlayerText:SkinshopTD[MAX_PLAYERS][6];

new skinshop[MAX_PLAYERS];
new skinshopuse[MAX_PLAYERS];

new skincount = 1;//��Ѻ���ç�Ѻ�ӹǹʡԹ���ҹ 	*��.�ѹ�����ҹ�
new skincount2 = 4;//��Ѻ���ç�Ѻ�ӹǹʡԹ���ҹ 	*��.�ѹ�����ҹ����

enum Skindata {
	SkinID,
	Skinprice[5]
};

new const Skinx[][Skindata] =
{
//  idʡԹ, �Ҥ�(����)
	{2, 9999}
};

new const Skinz[][Skindata] =
{
//  idʡԹ, �Ҥ�(�Թ����)
	{192, 1000},
	{299, 1000},
	{170, 1000},
	{29, 1000},
	{298, 1000}		
};

hook OnGameModeInit()
{

	
	CreateDynamic3DTextLabel("�� N �������͡��ʡԹ", COLOR_GREEN, 1299.9185,-1871.5343,13.5728, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	//��ҹʡԹ
	if (newkeys & KEY_NO)
	{

	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1299.8876,-1871.5824,13.5728))//�ش�����͡
	    {
			Dialog_Show(playerid, DIALOG_SKINSHOP, DIALOG_STYLE_LIST, "[��ҹ���ʡԹ]", "-ʡԹ������\n-ʡԹ�๷", "���͡", "�Դ");
	    }
	}
    return 1;
}

hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(skinshopuse[playerid] == 2)
	{
		if (playertextid == SkinshopTD[playerid][3]) // <<
		{
		    new item[1024];
		    new skinq[1024];

			skinshop[playerid] -= 1;

	        if(skinshop[playerid] == -1)
	        {
	            skinshop[playerid] = skincount2;
	            SetPlayerSkin(playerid, Skinz[skinshop[playerid]][SkinID]);
	            if (Inventory_HasItem(playerid, item))
	            {
	                PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "USE");
	            }
	        }

			format(item, sizeof(item), "Skin%d", Skinz[skinshop[playerid]][SkinID]);
			format(skinq, sizeof(skinq), "%d:%d$", Skinz[skinshop[playerid]][SkinID], Skinz[skinshop[playerid]][Skinprice]);

	        if (!Inventory_HasItem(playerid, item))
	        {
	            PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "BUY");
	        }
	        if (Inventory_HasItem(playerid, item))
	        {
	            PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "USE");
	        }
	        PlayerTextDrawSetString(playerid, SkinshopTD[playerid][1], skinq);

			SetPlayerSkin(playerid, Skinz[skinshop[playerid]][SkinID]);
		}

		if (playertextid == SkinshopTD[playerid][4]) // >>
		{
		    new item[1024];
		    new skinq[1024];

	        skinshop[playerid] += 1;

	        if(skinshop[playerid] == skincount2)
	        {
	            skinshop[playerid] = 0;
	            SetPlayerSkin(playerid, Skinz[skinshop[playerid]][SkinID]);
	            if (Inventory_HasItem(playerid, item))
	            {
	                PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "USE");
	            }
	        }

			format(item, sizeof(item), "Skin%d", Skinz[skinshop[playerid]][SkinID]);
			format(skinq, sizeof(skinq), "%d:%d$", Skinz[skinshop[playerid]][SkinID], Skinz[skinshop[playerid]][Skinprice]);

	        if (!Inventory_HasItem(playerid, item))
	        {
	            PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "BUY");
	        }
	        if (Inventory_HasItem(playerid, item))
	        {
	            PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "USE");
	        }
	        PlayerTextDrawSetString(playerid, SkinshopTD[playerid][1], skinq);

			SetPlayerSkin(playerid, Skinz[skinshop[playerid]][SkinID]);
		}

		if (playertextid == SkinshopTD[playerid][2]) // Buy
		{
			new item[1024];

			format(item, sizeof(item), "Skin%d", Skinz[skinshop[playerid]][SkinID]);

	        if (Inventory_HasItem(playerid, item))
		    {
		        PlayerTextDrawHide(playerid, SkinshopTD[playerid][5]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][1]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][2]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][3]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][4]);
				CancelSelectTextDraw(playerid);
				playerData[playerid][pSkin] = Skinz[skinshop[playerid]][SkinID];
				skinshopuse[playerid] = 0;
				SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				SetCameraBehindPlayer(playerid);
				SetPlayerVirtualWorld(playerid, 0);
				TogglePlayerControllable(playerid, 1);
			}
			else if (GetPlayerMoneyEx(playerid) < Skinz[skinshop[playerid]][Skinprice])
			{
			    SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س���Թʴ�����§��㹡�ë��� ʡԹ���");
	            SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][5]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][1]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][2]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][3]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][4]);
				CancelSelectTextDraw(playerid);
				skinshopuse[playerid] = 0;
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
			}
			else if(!Inventory_HasItem(playerid, item))
			{
			    SendClientMessageEx(playerid, COLOR_YELLOW, "[��ҹ���ʡԹ] {FFFFFF}�س�����ʡԹ�����Ҥ� %s ���º��������!!", FormatMoney(Skinz[skinshop[playerid]][Skinprice]));

				PlayerTextDrawHide(playerid, SkinshopTD[playerid][5]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][1]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][2]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][3]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][4]);
				CancelSelectTextDraw(playerid);
				GivePlayerMoneyEx(playerid, -Skinz[skinshop[playerid]][Skinprice]);
				playerData[playerid][pSkin] = Skinz[skinshop[playerid]][SkinID];
				Inventory_Add(playerid, item, 1);
				skinshopuse[playerid] = 0;
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
			}
		}

		if (playertextid == SkinshopTD[playerid][5]) // Close
		{
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][5]);
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][1]);
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][2]);
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][3]);
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][4]);
			CancelSelectTextDraw(playerid);
			skinshopuse[playerid] = 0;
			SetPlayerVirtualWorld(playerid, 0);

			SetPlayerSkin(playerid, playerData[playerid][pSkin]);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
		}
	}
	if(skinshopuse[playerid] == 1)
	{
		if (playertextid == SkinshopTD[playerid][3]) // <<
		{
		    new item[1024];
		    new skinq[1024];

			skinshop[playerid] -= 1;

	        if(skinshop[playerid] == -1)
	        {
	            skinshop[playerid] = skincount;
	            SetPlayerSkin(playerid, Skinx[skinshop[playerid]][SkinID]);
	            if (Inventory_HasItem(playerid, item))
	            {
	                PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "USE");
	            }
	        }

			format(item, sizeof(item), "Skin%d", Skinx[skinshop[playerid]][SkinID]);
			format(skinq, sizeof(skinq), "%d:%dC", Skinx[skinshop[playerid]][SkinID], Skinx[skinshop[playerid]][Skinprice]);

	        if (!Inventory_HasItem(playerid, item))
	        {
	            PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "BUY");
	        }
	        if (Inventory_HasItem(playerid, item))
	        {
	            PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "USE");
	        }
	        PlayerTextDrawSetString(playerid, SkinshopTD[playerid][1], skinq);

			SetPlayerSkin(playerid, Skinx[skinshop[playerid]][SkinID]);
		}

		if (playertextid == SkinshopTD[playerid][4]) // >>
		{
		    new item[1024];
		    new skinq[1024];

	        skinshop[playerid] += 1;

	        if(skinshop[playerid] == skincount)
	        {
	            skinshop[playerid] = 0;
	            SetPlayerSkin(playerid, Skinx[skinshop[playerid]][SkinID]);
	            if (Inventory_HasItem(playerid, item))
	            {
	                PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "USE");
	            }
	        }

			format(item, sizeof(item), "Skin%d", Skinx[skinshop[playerid]][SkinID]);
			format(skinq, sizeof(skinq), "%d:%dC", Skinx[skinshop[playerid]][SkinID], Skinx[skinshop[playerid]][Skinprice]);

	        if (!Inventory_HasItem(playerid, item))
	        {
	            PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "BUY");
	        }
	        if (Inventory_HasItem(playerid, item))
	        {
	            PlayerTextDrawSetString(playerid, SkinshopTD[playerid][2], "USE");
	        }
	        PlayerTextDrawSetString(playerid, SkinshopTD[playerid][1], skinq);

			SetPlayerSkin(playerid, Skinx[skinshop[playerid]][SkinID]);
		}

		if (playertextid == SkinshopTD[playerid][2]) // Buy
		{
			new item[1024];

			format(item, sizeof(item), "Skin%d", Skinx[skinshop[playerid]][SkinID]);

	        if (Inventory_HasItem(playerid, item))
		    {
		        PlayerTextDrawHide(playerid, SkinshopTD[playerid][5]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][1]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][2]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][3]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][4]);
				CancelSelectTextDraw(playerid);
				playerData[playerid][pSkin] = Skinx[skinshop[playerid]][SkinID];
				skinshopuse[playerid] = 0;
				SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
			}
			else if (playerData[playerid][pCoin] < Skinx[skinshop[playerid]][Skinprice])
			{
			    SendClientMessage(playerid, COLOR_RED, "[�к�] {FFFFFF}�س�� Coin �����§��㹡�ë��� ʡԹ���");
	            SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][5]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][1]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][2]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][3]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][4]);
				CancelSelectTextDraw(playerid);
				skinshopuse[playerid] = 0;
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
			}
			else if(!Inventory_HasItem(playerid, item))
			{
			    SendClientMessageEx(playerid, COLOR_YELLOW, "[��ҹ���ʡԹ] {FFFFFF}�س�����ʡԹ�����Ҥ� %d Coin!! ", Skinx[skinshop[playerid]][Skinprice]);

				PlayerTextDrawHide(playerid, SkinshopTD[playerid][5]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][1]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][2]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][3]);
				PlayerTextDrawHide(playerid, SkinshopTD[playerid][4]);
				CancelSelectTextDraw(playerid);
				playerData[playerid][pCoin] -= Skinx[skinshop[playerid]][Skinprice];
				playerData[playerid][pSkin] = Skinx[skinshop[playerid]][SkinID];
				Inventory_Add(playerid, item, 1);
				skinshopuse[playerid] = 0;
				SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
			}
		}

		if (playertextid == SkinshopTD[playerid][5]) // Close
		{
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][5]);
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][1]);
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][2]);
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][3]);
			PlayerTextDrawHide(playerid, SkinshopTD[playerid][4]);
			CancelSelectTextDraw(playerid);
			skinshopuse[playerid] = 0;

			SetPlayerSkin(playerid, playerData[playerid][pSkin]);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
		}
	}
}

// �ѧ��ѹ�Դ UI ��ҹʡԹ
stock HideSkinShopUI(playerid)
{
    for (new i = 0; i <= 5; i++)
    {
        PlayerTextDrawHide(playerid, SkinshopTD[playerid][i]);
    }
    CancelSelectTextDraw(playerid);

    skinshopuse[playerid] = 0;
    SetPlayerVirtualWorld(playerid, 0);

    SetCameraBehindPlayer(playerid);
    TogglePlayerControllable(playerid, 1);
    SetPlayerSkin(playerid, playerData[playerid][pSkin]);
    return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if (clickedid == Text:INVALID_TEXT_DRAW)
    {
        if (skinshopuse[playerid] != 0)
        {
            HideSkinShopUI(playerid);
        }
    }
    return 1;
}

hook OnPlayerConnect(playerid)
{
	SkinshopTD[playerid][0] = CreatePlayerTextDraw(playerid, 317.000000, 367.000000, "_");
	PlayerTextDrawFont(playerid, SkinshopTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, SkinshopTD[playerid][0], 0.600000, 8.250003);
	PlayerTextDrawTextSize(playerid, SkinshopTD[playerid][0], 298.500000, 130.500000);
	PlayerTextDrawSetOutline(playerid, SkinshopTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, SkinshopTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, SkinshopTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, SkinshopTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, SkinshopTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, SkinshopTD[playerid][0], 135);
	PlayerTextDrawUseBox(playerid, SkinshopTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, SkinshopTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, SkinshopTD[playerid][0], 0);

	SkinshopTD[playerid][1] = CreatePlayerTextDraw(playerid, 277.000000, 367.000000, "$999999");
	PlayerTextDrawFont(playerid, SkinshopTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, SkinshopTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, SkinshopTD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, SkinshopTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, SkinshopTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, SkinshopTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, SkinshopTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, SkinshopTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, SkinshopTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, SkinshopTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, SkinshopTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, SkinshopTD[playerid][1], 0);

	SkinshopTD[playerid][2] = CreatePlayerTextDraw(playerid, 317.000000, 394.000000, "BUY SKIN");
	PlayerTextDrawFont(playerid, SkinshopTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, SkinshopTD[playerid][2], 0.258332, 2.049999);
	PlayerTextDrawTextSize(playerid, SkinshopTD[playerid][2], 16.500000, 48.500000);
	PlayerTextDrawSetOutline(playerid, SkinshopTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, SkinshopTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, SkinshopTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, SkinshopTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, SkinshopTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, SkinshopTD[playerid][2], 1097458120);
	PlayerTextDrawUseBox(playerid, SkinshopTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, SkinshopTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, SkinshopTD[playerid][2], 1);

	SkinshopTD[playerid][3] = CreatePlayerTextDraw(playerid, 273.000000, 394.000000, "<<");
	PlayerTextDrawFont(playerid, SkinshopTD[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, SkinshopTD[playerid][3], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, SkinshopTD[playerid][3], 16.500000, 25.000000);
	PlayerTextDrawSetOutline(playerid, SkinshopTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, SkinshopTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, SkinshopTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, SkinshopTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, SkinshopTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, SkinshopTD[playerid][3], 1097458120);
	PlayerTextDrawUseBox(playerid, SkinshopTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, SkinshopTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, SkinshopTD[playerid][3], 1);

	SkinshopTD[playerid][4] = CreatePlayerTextDraw(playerid, 362.000000, 394.000000, ">>");
	PlayerTextDrawFont(playerid, SkinshopTD[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, SkinshopTD[playerid][4], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, SkinshopTD[playerid][4], 16.500000, 25.000000);
	PlayerTextDrawSetOutline(playerid, SkinshopTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, SkinshopTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, SkinshopTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, SkinshopTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, SkinshopTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, SkinshopTD[playerid][4], 1097458120);
	PlayerTextDrawUseBox(playerid, SkinshopTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, SkinshopTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, SkinshopTD[playerid][4], 1);

	SkinshopTD[playerid][5] = CreatePlayerTextDraw(playerid, 317.000000, 422.000000, "CLOSE");
	PlayerTextDrawFont(playerid, SkinshopTD[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, SkinshopTD[playerid][5], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, SkinshopTD[playerid][5], 16.500000, 48.500000);
	PlayerTextDrawSetOutline(playerid, SkinshopTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, SkinshopTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, SkinshopTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, SkinshopTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, SkinshopTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, SkinshopTD[playerid][5], 1097458120);
	PlayerTextDrawUseBox(playerid, SkinshopTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, SkinshopTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, SkinshopTD[playerid][5], 1);
}

Dialog:DIALOG_SKINSHOP(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch (listitem)
	    {
	        case 0:
	        {
  				SetPlayerPos(playerid, 1299.8876,-1871.5824,13.5728);
			    SetPlayerCameraLookAt(playerid, 1299.8876,-1871.5824,13.5728, CAMERA_MOVE);
			    SetPlayerCameraPos(playerid, 1300.1793,-1868.4147,13.5728);
				SetPlayerFacingAngle(playerid, 0.000000);

				skinshopuse[playerid] = 2;
				skinshop[playerid] = 0;

				PlayerTextDrawShow(playerid, SkinshopTD[playerid][1]);
				PlayerTextDrawShow(playerid, SkinshopTD[playerid][2]);
				PlayerTextDrawShow(playerid, SkinshopTD[playerid][3]);
				PlayerTextDrawShow(playerid, SkinshopTD[playerid][4]);
				PlayerTextDrawShow(playerid, SkinshopTD[playerid][5]);
				SelectTextDraw(playerid, 0xFF0000FF);

	            TogglePlayerControllable(playerid, 0);
				SetPlayerVirtualWorld(playerid, playerid);
	            SetPlayerSkin(playerid, Skinz[skinshop[playerid]][SkinID]);
			}
	        case 1:
	        {
				SetPlayerPos(playerid, 1299.8876,-1871.5824,13.5728);
			    SetPlayerCameraLookAt(playerid, 1299.8876,-1871.5824,13.5728, CAMERA_MOVE);
			    SetPlayerCameraPos(playerid, 1300.1793,-1868.4147,13.5728);
				SetPlayerFacingAngle(playerid, 0.000000);

				skinshopuse[playerid] = 1;
				skinshop[playerid] = 0;

				PlayerTextDrawShow(playerid, SkinshopTD[playerid][5]);
				PlayerTextDrawShow(playerid, SkinshopTD[playerid][1]);
				PlayerTextDrawShow(playerid, SkinshopTD[playerid][2]);
				PlayerTextDrawShow(playerid, SkinshopTD[playerid][3]);
				PlayerTextDrawShow(playerid, SkinshopTD[playerid][4]);
				SelectTextDraw(playerid, 0xFF0000FF);

	            TogglePlayerControllable(playerid, 0);
	            SetPlayerVirtualWorld(playerid, playerid);
	            SetPlayerSkin(playerid, Skinx[skinshop[playerid]][SkinID]);
			}
		}
	}
	return 1;
}


#include	<YSI_Coding\y_hooks>

new PlayerText:UR_SKINSHOPTD[MAX_PLAYERS][6];

new skinshop[MAX_PLAYERS];
new skinshopuse[MAX_PLAYERS];
new oldSkin[MAX_PLAYERS];

enum Skindata {
	SkinID,
	Skinprice
};

new const Skinx[][Skindata] =
{
	{192, 3000},
	{299, 3000},
	{170, 3000},
	{29, 3000},
	{298, 3000}			
};

hook OnGameModeInit()
{
	CreateDynamicPickup(1275, 23, 1295.1915,-1871.2225,13.5728);
	CreateDynamic3DTextLabel("{FFFFFF}กด {FFFF00}' N '{FFFFFF} เพื่อเลือกดูสกิน ", COLOR_GREEN, 1295.1915,-1871.2225,13.5728, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO)
    {
        if (IsPlayerInRangeOfPoint(playerid, 2.0, 1295.1915,-1871.2225,13.5728))
        {
            oldSkin[playerid] = GetPlayerSkin(playerid);
			SetPlayerPos(playerid, 1299.8876,-1871.5824,13.5728);
			SetPlayerCameraLookAt(playerid, 1299.8876,-1871.5824,13.5728, CAMERA_MOVE);
			SetPlayerCameraPos(playerid, 1300.1793,-1868.4147,13.5728);
			SetPlayerFacingAngle(playerid, 0.000000);

            skinshopuse[playerid] = 2;
            skinshop[playerid] = 0;

            PlayerTextDrawShow(playerid, UR_SKINSHOPTD[playerid][0]);
            PlayerTextDrawShow(playerid, UR_SKINSHOPTD[playerid][1]);
            PlayerTextDrawShow(playerid, UR_SKINSHOPTD[playerid][2]);
            PlayerTextDrawShow(playerid, UR_SKINSHOPTD[playerid][3]);
            PlayerTextDrawShow(playerid, UR_SKINSHOPTD[playerid][4]);
            PlayerTextDrawShow(playerid, UR_SKINSHOPTD[playerid][5]);
            SelectTextDraw(playerid, -1);

            SetPlayerVirtualWorld(playerid, playerid);

            new skinq[32], skinid[32];
            format(skinq, sizeof(skinq), "$%d", Skinx[skinshop[playerid]][Skinprice]);
            PlayerTextDrawSetString(playerid, UR_SKINSHOPTD[playerid][2], skinq);

            format(skinid, sizeof(skinid), "SkinID: %d", Skinx[skinshop[playerid]][SkinID]);
            PlayerTextDrawSetString(playerid, UR_SKINSHOPTD[playerid][1], skinid);

            SetPlayerSkin(playerid, Skinx[skinshop[playerid]][SkinID]);
        }
    }
    return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
    if(skinshopuse[playerid] == 2)
	{
		if (playertextid == UR_SKINSHOPTD[playerid][3]) // <<
		{
		    new skinq[256];
            new skinid[32];

            if (skinshop[playerid] == 0)
	            return ErrorMsg(playerid, "กด '>>' เพื่อดูสกินถัดไป");

			skinshop[playerid] -- ;

			format(skinq, sizeof(skinq), "$%d", Skinx[skinshop[playerid]][Skinprice]);
			PlayerTextDrawSetString(playerid, UR_SKINSHOPTD[playerid][2], skinq);
            format(skinid, sizeof(skinid), "SkinID: %d", Skinx[skinshop[playerid]][SkinID]);
            PlayerTextDrawSetString(playerid, UR_SKINSHOPTD[playerid][1], skinid);
			SetPlayerSkin(playerid, Skinx[skinshop[playerid]][SkinID]);
		}

		if (playertextid == UR_SKINSHOPTD[playerid][4]) // >>
		{
		    new skinq[256];
            new skinid[32];

            if (skinshop[playerid] >= sizeof(Skinx) - 1)
    			return ErrorMsg(playerid, "กด '<<' เพื่อดูสกินก่อนหน้า");

	        skinshop[playerid] ++;
            
			format(skinq, sizeof(skinq), "$%d", Skinx[skinshop[playerid]][Skinprice]);
			PlayerTextDrawSetString(playerid, UR_SKINSHOPTD[playerid][2], skinq);
            format(skinid, sizeof(skinid), "SkinID: %d", Skinx[skinshop[playerid]][SkinID]);
            PlayerTextDrawSetString(playerid, UR_SKINSHOPTD[playerid][1], skinid);
			SetPlayerSkin(playerid, Skinx[skinshop[playerid]][SkinID]);
		}

		if (playertextid == UR_SKINSHOPTD[playerid][5]) // Buy
		{
	        if (GetPlayerSkin(playerid) == Skinx[skinshop[playerid]][SkinID])
		    {
		        PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][0]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][1]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][2]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][3]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][4]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][5]);
                CancelSelectTextDraw(playerid);
				playerData[playerid][pSkin] = Skinx[skinshop[playerid]][SkinID];
				skinshopuse[playerid] = 0;
				SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				SetCameraBehindPlayer(playerid);
				SetPlayerVirtualWorld(playerid, 0);
			    GivePlayerMoneyEx(playerid, -Skinx[skinshop[playerid]][Skinprice]);
				return 1;
			}
			else if (GetPlayerMoneyEx(playerid) < Skinx[skinshop[playerid]][Skinprice])
			{
			    SendClientMessage(playerid, COLOR_RED, "[Skinshop] {FFFFFF}คุณมีเงินสดไม่เพียงพอในการซื้อ สกินนี้");
	            SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][0]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][1]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][2]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][3]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][4]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][5]);
                CancelSelectTextDraw(playerid);
				skinshopuse[playerid] = 0; 
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				return 1;
			}
			else if(GetPlayerSkin(playerid) != Skinx[skinshop[playerid]][SkinID])
			{
			    SendClientMessageEx(playerid, COLOR_YELLOW, "[Skinshop] {FFFFFF}คุณได้ซื้อสกินนี้ในราคา %s เรียบร้อยแล้ว", FormatMoney(Skinx[skinshop[playerid]][Skinprice]));

				SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][0]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][1]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][2]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][3]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][4]);
				PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][5]);
                CancelSelectTextDraw(playerid);
				GivePlayerMoneyEx(playerid, -Skinx[skinshop[playerid]][Skinprice]);
				playerData[playerid][pSkin] = Skinx[skinshop[playerid]][SkinID];
				skinshopuse[playerid] = 0;
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerSkin(playerid, playerData[playerid][pSkin]);
				SetCameraBehindPlayer(playerid);
				return 1;
			}
		}
	}
    return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if (clickedid == Text:INVALID_TEXT_DRAW && skinshopuse[playerid] == 2)
    {
        SetPlayerSkin(playerid, oldSkin[playerid]);
        SetCameraBehindPlayer(playerid);
        SetPlayerVirtualWorld(playerid, 0);
        skinshopuse[playerid] = 0;

        for (new i = 0; i < 6; i++)
            PlayerTextDrawHide(playerid, UR_SKINSHOPTD[playerid][i]);

        CancelSelectTextDraw(playerid);
    }
    return 1;
}

hook OnPlayerConnect(playerid)
{
	UR_SKINSHOPTD[playerid][0] = CreatePlayerTextDraw(playerid, 470.000000, 148.000000, "UR_SKINSHOP:UR_SKINSHOP");
	PlayerTextDrawFont(playerid, UR_SKINSHOPTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, UR_SKINSHOPTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, UR_SKINSHOPTD[playerid][0], 120.000000, 207.500000);
	PlayerTextDrawSetOutline(playerid, UR_SKINSHOPTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, UR_SKINSHOPTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, UR_SKINSHOPTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, UR_SKINSHOPTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_SKINSHOPTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, UR_SKINSHOPTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, UR_SKINSHOPTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, UR_SKINSHOPTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, UR_SKINSHOPTD[playerid][0], 0);

	UR_SKINSHOPTD[playerid][1] = CreatePlayerTextDraw(playerid, 503.000000, 208.000000, "");
	PlayerTextDrawFont(playerid, UR_SKINSHOPTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, UR_SKINSHOPTD[playerid][1], 0.229167, 1.350000);
	PlayerTextDrawTextSize(playerid, UR_SKINSHOPTD[playerid][1], 571.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, UR_SKINSHOPTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, UR_SKINSHOPTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, UR_SKINSHOPTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, UR_SKINSHOPTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_SKINSHOPTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, UR_SKINSHOPTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, UR_SKINSHOPTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, UR_SKINSHOPTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, UR_SKINSHOPTD[playerid][1], 0);

	UR_SKINSHOPTD[playerid][2] = CreatePlayerTextDraw(playerid, 503.000000, 242.000000, "");
	PlayerTextDrawFont(playerid, UR_SKINSHOPTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, UR_SKINSHOPTD[playerid][2], 0.229167, 1.350000);
	PlayerTextDrawTextSize(playerid, UR_SKINSHOPTD[playerid][2], 571.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, UR_SKINSHOPTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, UR_SKINSHOPTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, UR_SKINSHOPTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, UR_SKINSHOPTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_SKINSHOPTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, UR_SKINSHOPTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, UR_SKINSHOPTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, UR_SKINSHOPTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, UR_SKINSHOPTD[playerid][2], 0);

	UR_SKINSHOPTD[playerid][3] = CreatePlayerTextDraw(playerid, 510.000000, 292.000000, "_");
	PlayerTextDrawFont(playerid, UR_SKINSHOPTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, UR_SKINSHOPTD[playerid][3], 0.229167, 1.350000);
	PlayerTextDrawTextSize(playerid, UR_SKINSHOPTD[playerid][3], 17.500000, 16.000000);
	PlayerTextDrawSetOutline(playerid, UR_SKINSHOPTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, UR_SKINSHOPTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, UR_SKINSHOPTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, UR_SKINSHOPTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_SKINSHOPTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, UR_SKINSHOPTD[playerid][3], -16777166);
	PlayerTextDrawUseBox(playerid, UR_SKINSHOPTD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, UR_SKINSHOPTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, UR_SKINSHOPTD[playerid][3], 1);

	UR_SKINSHOPTD[playerid][4] = CreatePlayerTextDraw(playerid, 550.000000, 292.000000, "_");
	PlayerTextDrawFont(playerid, UR_SKINSHOPTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, UR_SKINSHOPTD[playerid][4], 0.229167, 1.350000);
	PlayerTextDrawTextSize(playerid, UR_SKINSHOPTD[playerid][4], 17.500000, 16.000000);
	PlayerTextDrawSetOutline(playerid, UR_SKINSHOPTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, UR_SKINSHOPTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, UR_SKINSHOPTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, UR_SKINSHOPTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_SKINSHOPTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, UR_SKINSHOPTD[playerid][4], -16777166);
	PlayerTextDrawUseBox(playerid, UR_SKINSHOPTD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, UR_SKINSHOPTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, UR_SKINSHOPTD[playerid][4], 1);

	UR_SKINSHOPTD[playerid][5] = CreatePlayerTextDraw(playerid, 529.000000, 334.000000, "_");
	PlayerTextDrawFont(playerid, UR_SKINSHOPTD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, UR_SKINSHOPTD[playerid][5], 0.229167, 1.350000);
	PlayerTextDrawTextSize(playerid, UR_SKINSHOPTD[playerid][5], 18.500000, 29.000000);
	PlayerTextDrawSetOutline(playerid, UR_SKINSHOPTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, UR_SKINSHOPTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, UR_SKINSHOPTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, UR_SKINSHOPTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, UR_SKINSHOPTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, UR_SKINSHOPTD[playerid][5], -16777166);
	PlayerTextDrawUseBox(playerid, UR_SKINSHOPTD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, UR_SKINSHOPTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, UR_SKINSHOPTD[playerid][5], 1);
	return 1;
}

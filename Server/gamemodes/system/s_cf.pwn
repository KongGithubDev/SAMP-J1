#include <YSI_Coding\y_hooks>
#define SPEEDCF 20 // ��������㹡�ä�ҿ

new PlayerText:CFTD[MAX_PLAYERS][21];
new bool:openuicfv1[MAX_PLAYERS];
new bool:openuicfv2[MAX_PLAYERS];
new openuicfslot[MAX_PLAYERS];
new openuicfSelect[MAX_PLAYERS];
new openuicfProga[MAX_PLAYERS];
new bool:openuicf[MAX_PLAYERS];

hook OnGameModeInit(){
	// ��ҿ�����
	CreateDynamic3DTextLabel("[ ��Ф�ҿ���ظ ]\n{FFFFFF}�� N �������͡���ظ", COLOR_YELLOW, -1.1566,1563.2699,17.9241, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);
	return 1;
}

hook OnPlayerConnect(playerid){
	openuicfv1[playerid] = false;
	openuicfv2[playerid] = false;
	openuicfslot[playerid] = 0;
	openuicfSelect[playerid] = 0;
	openuicfProga[playerid] = 0;
	openuicf[playerid] = false;
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
    if(newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
    {
		// ��ҿ�����
		if (IsPlayerInRangeOfPoint(playerid, 3.0, -1.1566,1563.2699,17.9241))
		{
			if(ProgressState[playerid] == 1)
				return ErrorMsg(playerid,"�س�Դʶҹ���ʡ����!!");

			CreateTDCF(playerid);
			PlayerTextDrawSetString(playerid, CFTD[playerid][0], "uicf:UICF");
			PlayerTextDrawShow(playerid, CFTD[playerid][0]);
			for (new i = 14; i < 21; i++) 
			{
				PlayerTextDrawShow(playerid, CFTD[playerid][i]);
			}
			SelectTextDraw(playerid, -1);
			openuicfv1[playerid] = true;
			openuicf[playerid] = true;
		}
	}	
	return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if (openuicf[playerid]){
		if (clickedid == INVALID_TEXT_DRAW)
		{
			if (openuicfv1[playerid] == true)
			{
				CancelSelectTextDrawCF(playerid);
			}
			if (openuicfv2[playerid] == true)
			{
				CancelSelectTextDrawCF(playerid);
			}
		}
	}
	return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
    if (playerData[playerid][IsLoggedIn])
    {
        if (playertextid == CFTD[playerid][20])
        {
            CancelSelectTextDrawCF(playerid);
        }

        if (playertextid == CFTD[playerid][19])
        {
            if (openuicfSelect[playerid] == 0)
            {
                return ErrorMsg(playerid,"�س�ѧ��������͡���ظ!");
            }

            //craftCF(playerid);

            openuicf[playerid] = false;
            for (new i = 0; i < 21; i++) 
            {
                PlayerTextDrawDestroy(playerid, CFTD[playerid][i]);
            }
            CancelSelectTextDraw(playerid);

            TogglePlayerControllable(playerid, 0);
            StartProgress(playerid, SPEEDCF, 0, 0);
            openuicfProga[playerid] = 1;
        }

        if (playertextid == CFTD[playerid][18])
        {
            if (openuicfSelect[playerid] == 0)
            {
                return ErrorMsg(playerid,"�س�ѧ��������͡���ظ!!");
            }

            InfoItemCF(playerid);
        }

        // ============ ���͡ Item �ͧ Slot ============

        if (playertextid == CFTD[playerid][1])
        {
            if (openuicfv1[playerid])
            {
                if (openuicfslot[playerid] == 1)
                {
                    PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item1");
                    PlayerTextDrawShow(playerid, CFTD[playerid][13]);
                    openuicfSelect[playerid] = 1;
                }
                if (openuicfslot[playerid] == 2)
                {
                    PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item4");
                    PlayerTextDrawShow(playerid, CFTD[playerid][13]);
                    openuicfSelect[playerid] = 1;
                }
            }
        }

        if (playertextid == CFTD[playerid][2])
        {
            if (openuicfv1[playerid])
            {
                if (openuicfslot[playerid] == 1)
                {
                    PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item2");
                    PlayerTextDrawShow(playerid, CFTD[playerid][13]);
                    openuicfSelect[playerid] = 2;
                }
                if (openuicfslot[playerid] == 2)
                {
                    PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item90");
                    PlayerTextDrawShow(playerid, CFTD[playerid][13]);
                    openuicfSelect[playerid] = 2;
                }
            }
            if (openuicfv2[playerid])
            {
                if (openuicfslot[playerid] == 1)
                {
                    PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item8");
                    PlayerTextDrawShow(playerid, CFTD[playerid][13]);
                    openuicfSelect[playerid] = 2;
                }
            }
        }

        if (playertextid == CFTD[playerid][3] && openuicfv1[playerid] && openuicfslot[playerid] == 1)
        {
            PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item3");
            PlayerTextDrawShow(playerid, CFTD[playerid][13]);
            openuicfSelect[playerid] = 3;
        }

        if (playertextid == CFTD[playerid][4] && openuicfv1[playerid] && openuicfslot[playerid] == 1)
        {
            PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item30");
            PlayerTextDrawShow(playerid, CFTD[playerid][13]);
            openuicfSelect[playerid] = 4;
        }

        if (playertextid == CFTD[playerid][5] && openuicfv1[playerid] && openuicfslot[playerid] == 1)
        {
            PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item40");
            PlayerTextDrawShow(playerid, CFTD[playerid][13]);
            openuicfSelect[playerid] = 5;
        }

        if (playertextid == CFTD[playerid][6] && openuicfv1[playerid] && openuicfslot[playerid] == 1)
        {
            PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item50");
            PlayerTextDrawShow(playerid, CFTD[playerid][13]);
            openuicfSelect[playerid] = 6;
        }

        if (playertextid == CFTD[playerid][7] && openuicfv1[playerid] && openuicfslot[playerid] == 1)
        {
            PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item60");
            PlayerTextDrawShow(playerid, CFTD[playerid][13]);
            openuicfSelect[playerid] = 7;
        }

        if (playertextid == CFTD[playerid][8] && openuicfv1[playerid] && openuicfslot[playerid] == 1)
        {
            PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item70");
            PlayerTextDrawShow(playerid, CFTD[playerid][13]);
            openuicfSelect[playerid] = 8;
        }

        if (playertextid == CFTD[playerid][9] && openuicfv1[playerid] && openuicfslot[playerid] == 1)
        {
            PlayerTextDrawSetString(playerid, CFTD[playerid][13], "uicf:item80");
            PlayerTextDrawShow(playerid, CFTD[playerid][13]);
            openuicfSelect[playerid] = 9;
        }

        // ============ ��Ѻ˹�� Slot ============

        if (playertextid == CFTD[playerid][14]) // � Slot 1
        {
            if (openuicfv1[playerid])
            {
                if (openuicfslot[playerid] == 1) return 1;

                openuicfslot[playerid] = 1;
                openuicfSelect[playerid] = 0;

                // ��͹��������͹
                for (new i = 1; i <= 9; i++)
                    PlayerTextDrawHide(playerid, CFTD[playerid][i]);

                // ��Ŵ�������
                PlayerTextDrawSetString(playerid, CFTD[playerid][1], "uicf:item1");
                PlayerTextDrawSetString(playerid, CFTD[playerid][2], "uicf:item2");
                PlayerTextDrawSetString(playerid, CFTD[playerid][3], "uicf:item3");
                PlayerTextDrawSetString(playerid, CFTD[playerid][4], "uicf:item30");
                PlayerTextDrawSetString(playerid, CFTD[playerid][5], "uicf:item40");
                PlayerTextDrawSetString(playerid, CFTD[playerid][6], "uicf:item50");
                PlayerTextDrawSetString(playerid, CFTD[playerid][7], "uicf:item60");
                PlayerTextDrawSetString(playerid, CFTD[playerid][8], "uicf:item70");
                PlayerTextDrawSetString(playerid, CFTD[playerid][9], "uicf:item80");

                for (new i = 1; i <= 9; i++)
                    PlayerTextDrawShow(playerid, CFTD[playerid][i]);
            }
        }

        if (playertextid == CFTD[playerid][15]) // � Slot 2
        {
            if (openuicfv1[playerid])
            {
                if (openuicfslot[playerid] == 2) return 1;

                openuicfslot[playerid] = 2;
                openuicfSelect[playerid] = 0;

                // ��͹ slot1 ��������͹
                for (new i = 1; i <= 9; i++)
                    PlayerTextDrawHide(playerid, CFTD[playerid][i]);

                // ��Ŵ��� slot2
                PlayerTextDrawSetString(playerid, CFTD[playerid][1], "uicf:item4");
                PlayerTextDrawSetString(playerid, CFTD[playerid][2], "uicf:item90");

                for (new i = 1; i <= 2; i++)
                    PlayerTextDrawShow(playerid, CFTD[playerid][i]);
            }
        }
    }
    return 1;
}



CreateTDCF(playerid){
	CFTD[playerid][0] = CreatePlayerTextDraw(playerid, 138.000000, 128.000000, "uicf:UICF");
	PlayerTextDrawFont(playerid, CFTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][0], 431.000000, 266.000000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][0], 0);

	CFTD[playerid][1] = CreatePlayerTextDraw(playerid, 151.000000, 181.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][1], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][1], 1);

	CFTD[playerid][2] = CreatePlayerTextDraw(playerid, 211.000000, 181.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][2], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][2], 1);

	CFTD[playerid][3] = CreatePlayerTextDraw(playerid, 271.000000, 181.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][3], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][3], 1);

	CFTD[playerid][4] = CreatePlayerTextDraw(playerid, 331.000000, 181.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][4], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][4], 1);

	CFTD[playerid][5] = CreatePlayerTextDraw(playerid, 151.000000, 246.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][5], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][5], 1);

	CFTD[playerid][6] = CreatePlayerTextDraw(playerid, 211.000000, 246.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][6], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][6], 1);

	CFTD[playerid][7] = CreatePlayerTextDraw(playerid, 271.000000, 246.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][7], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][7], 1);

	CFTD[playerid][8] = CreatePlayerTextDraw(playerid, 331.000000, 246.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][8], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][8], 1);

	CFTD[playerid][9] = CreatePlayerTextDraw(playerid, 151.000000, 312.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][9], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][9], 1);

	CFTD[playerid][10] = CreatePlayerTextDraw(playerid, 211.000000, 312.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][10], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][10], 1);

	CFTD[playerid][11] = CreatePlayerTextDraw(playerid, 271.000000, 312.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][11], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][11], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][11], 1);

	CFTD[playerid][12] = CreatePlayerTextDraw(playerid, 331.000000, 312.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][12], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][12], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][12], 54.000000, 56.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][12], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][12], 1);

	CFTD[playerid][13] = CreatePlayerTextDraw(playerid, 429.000000, 175.000000, "uicf:item1");
	PlayerTextDrawFont(playerid, CFTD[playerid][13], 4);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][13], 96.500000, 105.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][13], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][13], 0);

	CFTD[playerid][14] = CreatePlayerTextDraw(playerid, 147.000000, 151.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, CFTD[playerid][14], 5);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][14], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][14], 47.000000, 20.000000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][14], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][14], 0);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][14], 0);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][14], 1);
	PlayerTextDrawSetPreviewModel(playerid, CFTD[playerid][14], 0);
	PlayerTextDrawSetPreviewRot(playerid, CFTD[playerid][14], -10.000000, 0.000000, -20.000000, 15.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, CFTD[playerid][14], 1, 1);

	CFTD[playerid][15] = CreatePlayerTextDraw(playerid, 203.000000, 151.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, CFTD[playerid][15], 5);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][15], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][15], 32.500000, 20.000000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][15], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][15], 0);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][15], 255);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][15], 1);
	PlayerTextDrawSetPreviewModel(playerid, CFTD[playerid][15], 0);
	PlayerTextDrawSetPreviewRot(playerid, CFTD[playerid][15], -10.000000, 0.000000, -20.000000, 15.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, CFTD[playerid][15], 1, 1);

	CFTD[playerid][16] = CreatePlayerTextDraw(playerid, 244.000000, 151.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, CFTD[playerid][16], 5);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][16], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][16], 32.500000, 20.000000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][16], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][16], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][16], 0);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][16], 255);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][16], 1);
	PlayerTextDrawSetPreviewModel(playerid, CFTD[playerid][16], 0);
	PlayerTextDrawSetPreviewRot(playerid, CFTD[playerid][16], -10.000000, 0.000000, -20.000000, 15.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, CFTD[playerid][16], 1, 1);

	CFTD[playerid][17] = CreatePlayerTextDraw(playerid, 286.000000, 151.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, CFTD[playerid][17], 5);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][17], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][17], 32.500000, 20.000000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][17], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][17], 0);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][17], 255);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][17], 0);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][17], 1);
	PlayerTextDrawSetPreviewModel(playerid, CFTD[playerid][17], 0);
	PlayerTextDrawSetPreviewRot(playerid, CFTD[playerid][17], -10.000000, 0.000000, -20.000000, 15.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, CFTD[playerid][17], 1, 1);

	CFTD[playerid][18] = CreatePlayerTextDraw(playerid, 446.000000, 141.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, CFTD[playerid][18], 5);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][18], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][18], 65.000000, 20.000000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][18], 0);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][18], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][18], 0);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][18], 255);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][18], 0);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][18], 1);
	PlayerTextDrawSetPreviewModel(playerid, CFTD[playerid][18], 0);
	PlayerTextDrawSetPreviewRot(playerid, CFTD[playerid][18], -10.000000, 0.000000, -20.000000, 15.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, CFTD[playerid][18], 1, 1);

	CFTD[playerid][19] = CreatePlayerTextDraw(playerid, 452.000000, 370.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, CFTD[playerid][19], 5);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][19], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][19], 49.500000, 20.000000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][19], 0);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][19], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][19], 0);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][19], 255);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][19], 0);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][19], 1);
	PlayerTextDrawSetPreviewModel(playerid, CFTD[playerid][19], 0);
	PlayerTextDrawSetPreviewRot(playerid, CFTD[playerid][19], -10.000000, 0.000000, -20.000000, 15.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, CFTD[playerid][19], 1, 1);

	CFTD[playerid][20] = CreatePlayerTextDraw(playerid, 539.000000, 132.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, CFTD[playerid][20], 5);
	PlayerTextDrawLetterSize(playerid, CFTD[playerid][20], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CFTD[playerid][20], 25.000000, 31.500000);
	PlayerTextDrawSetOutline(playerid, CFTD[playerid][20], 0);
	PlayerTextDrawSetShadow(playerid, CFTD[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, CFTD[playerid][20], 1);
	PlayerTextDrawColor(playerid, CFTD[playerid][20], -1);
	PlayerTextDrawBackgroundColor(playerid, CFTD[playerid][20], 0);
	PlayerTextDrawBoxColor(playerid, CFTD[playerid][20], 255);
	PlayerTextDrawUseBox(playerid, CFTD[playerid][20], 0);
	PlayerTextDrawSetProportional(playerid, CFTD[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, CFTD[playerid][20], 1);
	PlayerTextDrawSetPreviewModel(playerid, CFTD[playerid][20], 0);
	PlayerTextDrawSetPreviewRot(playerid, CFTD[playerid][20], -10.000000, 0.000000, -20.000000, 15.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, CFTD[playerid][20], 1, 1);	
    return 1;
}

CancelSelectTextDrawCF(playerid){	
	for (new i = 0; i < 21; i++) 
	{
		PlayerTextDrawDestroy(playerid, CFTD[playerid][i]);
	}
	openuicfv1[playerid] = false;
	openuicfv2[playerid] = false;
	openuicfslot[playerid] = 0;
	openuicfSelect[playerid] = 0;	
	CancelSelectTextDraw(playerid);	
	return 1;
}

InfoItemCF(playerid){
	// �Ф�ҿ ������
	if (openuicfv1[playerid]){
		if (openuicfslot[playerid] == 1){
		if (openuicfSelect[playerid] == 1){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"�حᨵ��૿\n�ͧ�����㹡�ä�ҿ\n- ��ٻ��鹡حᨵ�� 1 ���\n- ���� 20 ���\n- �ٹ 20 ���\n- ���ᴧ 30 ���\n- ����� 30 ���\n- �������ͧ 30 ���\n- ������� 30 ���\n- ������ 20 ���\n- �Թᴧ 500 �ҷ\n# �͡�ʵյԴ 100%", 
				"�Դ", "");
		}

		if (openuicfSelect[playerid] == 2){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"ʹѺ���\n�ͧ�����㹡�ä�ҿ\n- �ٹ 10 ���\n- ���� 10 ���\n- ���ᴧ 10 ���\n- ������� 10 ���\n- ����� 10 ���\n- �������ͧ 10 ���\n- ������ 2 ���\n- �Թᴧ 500 �ҷ\n# �͡�ʵյԴ 70%", 
				"�Դ", "");
		}

		if (openuicfSelect[playerid] == 3){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"���ʹ��\n�ͧ�����㹡�ä�ҿ\n- �ٹ 25 ���\n- ���� 25 ���\n- ���ᴧ 30 ���\n- ������� 30 ���\n- �������ͧ 30 ���\n- ����� 30 ���\n- ����� 25 ���\n- �Թᴧ 1,500 �ҷ\n# �͡�ʵյԴ 70%", 
				"�Դ", "");
		}

		if (openuicfSelect[playerid] == 4){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"����ʺ��\n�ͧ�����㹡�ä�ҿ\n- �ٹ 25 ���\n- ���� 25 ���\n- ���ᴧ 30 ���\n- ������� 30 ���\n- �������ͧ 30 ���\n- ����� 30 ���\n- ������ 25 ���\n- �Թᴧ 1,500 �ҷ\n# �͡�ʵյԴ 70%", 
				"�Դ", "");
		}

		if (openuicfSelect[playerid] == 5){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"������\n�ͧ�����㹡�ä�ҿ\n- ������ 25 ���\n- ����� 25 ���\n- �ٹ 40 ���\n- ���� 40 ���\n- ���ᴧ 50 ���\n- ������� 50 ���\n- �������ͧ 50 ���\n- ����� 50 ���\n- �Թᴧ 2,000 �ҷ\n# �͡�ʵյԴ 70%", "�Դ", "");
		}

		if (openuicfSelect[playerid] == 6){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"�͵��\n�ͧ�����㹡�ä�ҿ\n- �ٹ 30 ���\n- ���� 30 ���\n- ���ᴧ 30 ���\n- ������� 30 ���\n- �������ͧ 30 ���\n- ����� 30 ���\n- �Թᴧ 1,500 �ҷ\n# �͡�ʵյԴ 60%", 
				"�Դ", "");
		}

		if (openuicfSelect[playerid] == 7) {
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"��ٻ��鹡حᨵ��\n�ͧ�����㹡�ä�ҿ\n- ���� 20 ���\n- �ٹ 20 ���\n- ���ᴧ 30 ���\n- ����� 30 ���\n- �������ͧ 30 ���\n- ������� 30 ���\n- ������ 10 ���\n- �Թᴧ 500 �ҷ\n# �͡�ʵյԴ 100%",
				"�Դ", "");
		}

		if (openuicfSelect[playerid] == 8) {
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"������\n�ͧ�����㹡�ä�ҿ\n- ������� 10 ���\n- ����͹ 10 ���\n- �Թ���� 1,000 �ҷ\n# �͡�ʵյԴ 70%", 
				"�Դ", "");
		}

		if (openuicfSelect[playerid] == 9) {
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"�����\n�ͧ�����㹡�ä�ҿ\n- ������ 20 ���\n- �Թ���� 2,000 �ҷ\n# �͡�ʵյԴ 100%", 
				"�Դ", "");
		}

    //���Ὺ��
		}
		if (openuicfslot[playerid] == 2){
			if (openuicfSelect[playerid] == 1){
				Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"- ����­AFK 20 ���\n- �Թ���� 500 �ҷ\n# �͡�ʵԴ 80%", "�Դ", "");
			}

			if (openuicfSelect[playerid] == 2){
				Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"��Ҿѹ���˭�\n�ͧ�����㹡�ä�ҿ\n- ����­AFK 15 ���\n- �Թ���� 2,000 �ҷ\n# �͡�ʵյԴ 70%", 
				"�Դ", "");
			}
		}
	}
	return 1;
}

craftCF(playerid)
{
    TogglePlayerControllable(playerid, 1);

	// ================== �حᨵ�� ==================
	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 1)
	{
		// ��Ǩ�ͺ�����
		if (Inventory_Count(playerid, "�ٹ") < 20) return ErrorMsg(playerid, "�س�� �ٹ ����");
		if (Inventory_Count(playerid, "����") < 20) return ErrorMsg(playerid, "�س�� ���� ����");
		if (Inventory_Count(playerid, "���ᴧ") < 30) return ErrorMsg(playerid, "�س�� ���ᴧ ����");
		if (Inventory_Count(playerid, "�����") < 30) return ErrorMsg(playerid, "�س�� ����� ����");
		if (Inventory_Count(playerid, "�������ͧ") < 30) return ErrorMsg(playerid, "�س�� �������ͧ ����");
		if (Inventory_Count(playerid, "�������") < 30) return ErrorMsg(playerid, "�س�� ������� ����");
		if (Inventory_Count(playerid, "������") < 20) return ErrorMsg(playerid, "�س�� ������ ����");
		if (Inventory_Count(playerid, "�Թᴧ") < 500) return ErrorMsg(playerid, "�س�� �Թᴧ ����");
		if (Inventory_Count(playerid, "��ٻ��鹡حᨵ��") < 1) return ErrorMsg(playerid, "�س�� ��ٻ��鹡حᨵ�� ����");

		// �Ѵ�ͧ�͡
		Inventory_Remove(playerid, "�ٹ", 20);
		Inventory_Remove(playerid, "����", 20);
		Inventory_Remove(playerid, "���ᴧ", 30);
		Inventory_Remove(playerid, "�����", 30);
		Inventory_Remove(playerid, "�������ͧ", 30);
		Inventory_Remove(playerid, "�������", 30);
		Inventory_Remove(playerid, "������", 20);
		Inventory_Remove(playerid, "�Թᴧ", 500);
		Inventory_Remove(playerid, "��ٻ��鹡حᨵ��", 1);

		// ���ͧ��͹ 100%
		Inventory_Add(playerid, "�حᨵ��૿", 1);
		SendClientMessage(playerid, 0xFFFFFFAA, "�Թ�մ��¤س��ҿ�����: [ �حᨵ��૿ ]");
	}


     
	// ================== ʹѺ��� ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 2)
	{
		if (Inventory_Count(playerid, "�ٹ") < 10) return ErrorMsg(playerid, "�س�� �ٹ ����");
		if (Inventory_Count(playerid, "����") < 10) return ErrorMsg(playerid, "�س�� ���� ����");
		if (Inventory_Count(playerid, "���ᴧ") < 10) return ErrorMsg(playerid, "�س�� ���ᴧ ����");
		if (Inventory_Count(playerid, "�����") < 10) return ErrorMsg(playerid, "�س�� ����� ����");
		if (Inventory_Count(playerid, "�������ͧ") < 10) return ErrorMsg(playerid, "�س�� �������ͧ ����");
		if (Inventory_Count(playerid, "�������") < 10) return ErrorMsg(playerid, "�س�� ������� ����");
		if (Inventory_Count(playerid, "������") < 2) return ErrorMsg(playerid, "�س�� ������ ����");
		if (Inventory_Count(playerid, "�Թᴧ") < 500) return ErrorMsg(playerid, "�س�� �Թᴧ ����");

		Inventory_Remove(playerid, "�ٹ", 10);
		Inventory_Remove(playerid, "����", 10);
		Inventory_Remove(playerid, "���ᴧ", 10);
		Inventory_Remove(playerid, "�����", 10);
		Inventory_Remove(playerid, "�������ͧ", 10);
		Inventory_Remove(playerid, "�������", 30);
		Inventory_Remove(playerid, "������", 2);
		Inventory_Remove(playerid, "�Թᴧ", 500);

		switch(random(100))
		{
			case 0..69: // 70% �����
			{
				Inventory_Add(playerid, "ʹѺ���", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} �Թ�մ��¤س��ҿ���ظ [ ʹѺ��� ] �����");
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} ʹѺ��� {00FFFF} + 1");
				UrLogknucklesucceed(playerid);
			}
			case 70..99: // 30% �������
			{
				SendClientMessage(playerid, COLOR_RED, "[����͹] {FFFFFF} ����㨴��� �س�������㹡�ä�ҿ");
				UrLogknucklefail(playerid);
			}
		}
	}

	// ================== ���ʹ�� ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 3)
	{
		if (Inventory_Count(playerid, "�ٹ") < 25) return ErrorMsg(playerid, "�س�� �ٹ ����");
		if (Inventory_Count(playerid, "����") < 25) return ErrorMsg(playerid, "�س�� ���� ����");
		if (Inventory_Count(playerid, "���ᴧ") < 30) return ErrorMsg(playerid, "�س�� ��� ����");
		if (Inventory_Count(playerid, "�����") < 30) return ErrorMsg(playerid, "�س�� ��� ����");
		if (Inventory_Count(playerid, "�������ͧ") < 30) return ErrorMsg(playerid, "�س�� ��� ����");
		if (Inventory_Count(playerid, "�������") < 30) return ErrorMsg(playerid, "�س�� ��� ����");
		if (Inventory_Count(playerid, "�����") < 25) return ErrorMsg(playerid, "�س�� ����� ����");
		if (Inventory_Count(playerid, "�Թᴧ") < 1500) return ErrorMsg(playerid, "�س�� �Թᴧ ����");

		Inventory_Remove(playerid, "�ٹ", 25);
		Inventory_Remove(playerid, "����", 25);
		Inventory_Remove(playerid, "���ᴧ", 30);
		Inventory_Remove(playerid, "�����", 30);
		Inventory_Remove(playerid, "�������ͧ", 30);
		Inventory_Remove(playerid, "�������", 30);
		Inventory_Remove(playerid, "�����", 25);
		Inventory_Remove(playerid, "�Թᴧ", 1500);

		switch(random(100))
		{
			case 0..69: // 70% �����
			{
				Inventory_Add(playerid, "���ʹ��", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} �Թ�մ��¤س��ҿ���ظ [ ���ʹ�� ] �����");
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} ���ʹ�� {00FFFF} + 1");
				UrLogpoolsucceed(playerid);
			}
			case 70..99: // 30% �������
			{
				SendClientMessage(playerid, COLOR_RED, "[����͹] {FFFFFF} ����㨴��� �س�������㹡�ä�ҿ");
				UrLogpoolfail(playerid);
			}
		}
	}

	// ================== ����ʺ�� ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 4)
	{
		if (Inventory_Count(playerid, "�ٹ") < 25) return ErrorMsg(playerid, "�س�� �ٹ ����");
		if (Inventory_Count(playerid, "����") < 25) return ErrorMsg(playerid, "�س�� ���� ����");
		if (Inventory_Count(playerid, "���ᴧ") < 30) return ErrorMsg(playerid, "�س�� ���ᴧ ����");
		if (Inventory_Count(playerid, "�����") < 30) return ErrorMsg(playerid, "�س�� ����� ����");
		if (Inventory_Count(playerid, "�������ͧ") < 30) return ErrorMsg(playerid, "�س�� �������ͧ ����");
		if (Inventory_Count(playerid, "�������") < 30) return ErrorMsg(playerid, "�س�� ������� ����");
		if (Inventory_Count(playerid, "������") < 25) return ErrorMsg(playerid, "�س�� ������ ����");
		if (Inventory_Count(playerid, "�Թᴧ") < 1500) return ErrorMsg(playerid, "�س�� �Թᴧ ����");

		Inventory_Remove(playerid, "�ٹ", 25);
		Inventory_Remove(playerid, "����", 25);
		Inventory_Remove(playerid, "���ᴧ", 30);
		Inventory_Remove(playerid, "�����", 30);
		Inventory_Remove(playerid, "�������ͧ", 30);
		Inventory_Remove(playerid, "�������", 30);
		Inventory_Remove(playerid, "������", 25);
		Inventory_Remove(playerid, "�Թᴧ", 1500);

		switch(random(100))
		{
			case 0..69: // 70% �����
			{
				Inventory_Add(playerid, "����ʺ��", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} �Թ�մ��¤س��ҿ���ظ [ ����ʺ�� ] �����");
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} ����ʺ�� {00FFFF} + 1");
				UrLogbaseballsucceed(playerid);
			}
			case 70..99: // 30% �������
			{
				SendClientMessage(playerid, COLOR_RED, "[����͹] {FFFFFF} ����㨴��� �س�������㹡�ä�ҿ");
				UrLogbaseballfail(playerid);
			}
		}
	}


	
	
	// ================== ������ ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 5) // slot/select ����Ѻ������
	{
		if (Inventory_Count(playerid, "������") < 25) return ErrorMsg(playerid, "�س�� ������ ����");
		if (Inventory_Count(playerid, "�����") < 25) return ErrorMsg(playerid, "�س�� ����� ����");
		if (Inventory_Count(playerid, "�ٹ") < 40) return ErrorMsg(playerid, "�س�� �ٹ ����");
		if (Inventory_Count(playerid, "����") < 40) return ErrorMsg(playerid, "�س�� ���� ����");
		if (Inventory_Count(playerid, "���ᴧ") < 50) return ErrorMsg(playerid, "�س�� ���ᴧ ����");
		if (Inventory_Count(playerid, "�������") < 50) return ErrorMsg(playerid, "�س�� ������� ����");
		if (Inventory_Count(playerid, "�������ͧ") < 50) return ErrorMsg(playerid, "�س�� �������ͧ ����");
		if (Inventory_Count(playerid, "�����") < 50) return ErrorMsg(playerid, "�س�� ����� ����");
		if (Inventory_Count(playerid, "�Թᴧ") < 2000) return ErrorMsg(playerid, "�س�� �Թᴧ ����");

		Inventory_Remove(playerid, "������", 25);
		Inventory_Remove(playerid, "�����", 25);
		Inventory_Remove(playerid, "�ٹ", 40);
		Inventory_Remove(playerid, "����", 40);
		Inventory_Remove(playerid, "���ᴧ", 50);
		Inventory_Remove(playerid, "�������", 50);
		Inventory_Remove(playerid, "�������ͧ", 50);
		Inventory_Remove(playerid, "�����", 50);
		Inventory_Remove(playerid, "�Թᴧ", 2000);

		switch(random(100))
		{
			case 0..69: // 70% �����
			{
				Inventory_Add(playerid, "������", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} �Թ�մ��¤س��ҿ���ظ [ ������ ] �����");
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} ������ {00FFFF} + 1");
				UrLoggolfclubsucceed(playerid);
			}
			case 70..99: // 30% �������
			{
				SendClientMessage(playerid, COLOR_RED, "[����͹] {FFFFFF} ����㨴��� �س�������㹡�ä�ҿ");
				UrLoggolfclubfail(playerid);
			}
		}
	}


	// ================== �͵�� ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 6) // slot/select ����Ѻ�͵��
	{
		if (Inventory_Count(playerid, "�ٹ") < 30) return ErrorMsg(playerid, "�س�� �ٹ ����");
		if (Inventory_Count(playerid, "����") < 30) return ErrorMsg(playerid, "�س�� ���� ����");
		if (Inventory_Count(playerid, "���ᴧ") < 30) return ErrorMsg(playerid, "�س�� ���ᴧ ����");
		if (Inventory_Count(playerid, "�������") < 30) return ErrorMsg(playerid, "�س�� ������� ����");
		if (Inventory_Count(playerid, "�������ͧ") < 30) return ErrorMsg(playerid, "�س�� �������ͧ ����");
		if (Inventory_Count(playerid, "�����") < 30) return ErrorMsg(playerid, "�س�� ����� ����");
		if (Inventory_Count(playerid, "�Թᴧ") < 1500) return ErrorMsg(playerid, "�س�� �Թᴧ ����");

		Inventory_Remove(playerid, "�ٹ", 30);
		Inventory_Remove(playerid, "����", 30);
		Inventory_Remove(playerid, "���ᴧ", 30);
		Inventory_Remove(playerid, "�������", 30);
		Inventory_Remove(playerid, "�������ͧ", 30);
		Inventory_Remove(playerid, "�����", 30);
		Inventory_Remove(playerid, "�Թᴧ", 1500);

		switch(random(100))
		{
			case 0..49: // 50% �����
			{
				Inventory_Add(playerid, "�͵��", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} �Թ�մ��¤س��ҿ�����: [ �͵�� ]");
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} �͵�� {00FFFF} + 1");
				UrLogKatanasucceed(playerid); // Log �����
			}
			case 50..99: // 50% �������
			{
				SendClientMessage(playerid, COLOR_RED, "[����͹] {FFFFFF} ����㨴��� �س�������㹡�ä�ҿ �͵��");
				UrLogKatanafail(playerid); // Log �������
			}
		}
	}




	// ��ٻ��鹡حᨵ��
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 7) // slot/select ����Ѻ��ٻ��鹡حᨵ��
	{
		if (Inventory_Count(playerid, "�ٹ") < 20) return ErrorMsg(playerid, "�س�� �ٹ ����");
		if (Inventory_Count(playerid, "����") < 20) return ErrorMsg(playerid, "�س�� ���� ����");
		if (Inventory_Count(playerid, "���ᴧ") < 30) return ErrorMsg(playerid, "�س�� ���ᴧ ����");
		if (Inventory_Count(playerid, "�������") < 30) return ErrorMsg(playerid, "�س�� ������� ����");
		if (Inventory_Count(playerid, "�����") < 30) return ErrorMsg(playerid, "�س�� ����� ����");
		if (Inventory_Count(playerid, "�������ͧ") < 30) return ErrorMsg(playerid, "�س�� �������ͧ ����");
		if (Inventory_Count(playerid, "������") < 10) return ErrorMsg(playerid, "�س�� �������ͧ ����");
		if (Inventory_Count(playerid, "�Թᴧ") < 500) return ErrorMsg(playerid, "�س�� �Թᴧ ����");

		// �Ѵ�ͧ�͡��͹
		Inventory_Remove(playerid, "�ٹ", 20);
		Inventory_Remove(playerid, "����", 20);
		Inventory_Remove(playerid, "���ᴧ", 30);
		Inventory_Remove(playerid, "�������", 30);
		Inventory_Remove(playerid, "�����", 30);
		Inventory_Remove(playerid, "�������ͧ", 30);
		Inventory_Remove(playerid, "������", 10);
		Inventory_Remove(playerid, "�Թᴧ", 500);

		// ��ҿ�Դ 100%
		Inventory_Add(playerid, "��ٻ��鹡حᨵ��", 1);
		SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} �س��ҿ�����: [ ��ٻ��鹡حᨵ�� ]");
		SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} ��ٻ��鹡حᨵ�� {00FFFF} + 1");
	}


		// ��ҿ������
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 8)
	{
		if (Inventory_Count(playerid, "�������") < 10) return ErrorMsg(playerid, "�س�� ������� ����");
		if (Inventory_Count(playerid, "����͹") < 10) return ErrorMsg(playerid, "�س�� ����͹ ����");
		if (GetPlayerMoneyEx(playerid) < 1000) return ErrorMsg(playerid, "�س�� �Թ���� ����");

		// �Ѵ�ͧ�͡��͹
		Inventory_Remove(playerid, "�������", 10);
		Inventory_Remove(playerid, "����͹", 10);
		GivePlayerMoneyEx(playerid, -1000);

		// 70% �����
		switch(random(100))
		{
			case 0..69:
			{
				Inventory_Add(playerid, "������", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} �س��ҿ�����: [ ������ ]");
			}
			case 70..99:
			{
				SendClientMessage(playerid, COLOR_RED, "[����͹] {FFFFFF} �������㹡�ä�ҿ ������");
			}
		}
	}

	// ��ҿ�����
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 9)
	{
		if (Inventory_Count(playerid, "������") < 20) return ErrorMsg(playerid, "�س�� ������ ����");
		if (GetPlayerMoneyEx(playerid) < 2000) return ErrorMsg(playerid, "�س�� �Թ���� ����");

		// �Ѵ�ͧ�͡��͹
		Inventory_Remove(playerid, "������", 20);
		GivePlayerMoneyEx(playerid, -2000);

		// 100% �����
		Inventory_Add(playerid, "�����", 1);
		SendClientMessage(playerid, COLOR_GREEN, "[����͹] {FFFFFF} �س��ҿ�����: [ ����� ]");
	}



	

	// -----------------------------------------------------------------
	// ���������Թ (��ͧ 2, ���͡ 1)
	// -----------------------------------------------------------------
	if (openuicfslot[playerid] == 2 && openuicfSelect[playerid] == 1)
	{
		// ��Ǩ�ͺ��͹�����§��
		if (Inventory_Count(playerid, "����­AFK") < 20) 
			return SendClientMessage(playerid, 0xFF0000FF, "�س�� ����­AFK �����§��");
		if (GetPlayerMoneyEx(playerid) < 500) 
			return SendClientMessage(playerid, 0xFF0000FF, "�س�� �Թ���� �����§��");

		// �ѡ�ͧ��͹��ҿ
		Inventory_Remove(playerid, "����­AFK", 20);
		GivePlayerMoneyEx(playerid, -500);

		// �������Ѿ��
		if (random(100) < 70) // 70% �����
		{
			Inventory_Add(playerid, "���������Թ", 1);
			SendClientMessage(playerid, 0xFFFFFFAA, "�Թ�մ��¤س��ҿ�����: [ ���������Թ ]");
		}
		else // 30% �������
		{
			Inventory_Add(playerid, "����­�ǧ���", 1);
			SendClientMessage(playerid, 0xFF0000FF, "����㨴��¤س��ҿ������� ���Ѻ [ ����­�ǧ��� x1 ]");
		}
	}

	// -----------------------------------------------------------------
	// ��Ҿѹ���˭� (��ͧ 2, ���͡ 2)
	// -----------------------------------------------------------------
	if (openuicfslot[playerid] == 2 && openuicfSelect[playerid] == 2)
	{
		// ��Ǩ�ͺ�����
		if (Inventory_Count(playerid, "����­AFK") < 15) 
			return ErrorMsg(playerid, "�س�� ����­AFK ����");
		if (GetPlayerMoneyEx(playerid) < 2000) 
			return ErrorMsg(playerid, "�س�� �Թ���� ����");

		// �Ѵ�ͧ�͡��͹
		Inventory_Remove(playerid, "����­AFK", 15);
		GivePlayerMoneyEx(playerid, -2000);

		// �����͡�� 70%
		if (random(100) < 70) 
		{
			Inventory_Add(playerid, "��Ҿѹ���˭�", 1);
			SendClientMessage(playerid, 0xFFFFFFAA, "�Թ�մ��¤س��ҿ�����: [ ��Ҿѹ���˭� ]");
		}
		else
		{
			Inventory_Add(playerid, "����­AFK", 3);
			SendClientMessage(playerid, 0xFF0000AA, "��ä�ҿ�������: �س���Ѻ [ ����­AFK x3 ] �׹");
		}
	}


    // ���絤�� UI
    openuicf[playerid] = false;
    openuicfv1[playerid] = false;
    openuicfv2[playerid] = false;
    openuicfslot[playerid] = 0;
    openuicfSelect[playerid] = 0;
    openuicfProga[playerid] = 0;
    return 1;
}

hook OnProgressFinish(playerid, objectid)
{
    if (openuicfProga[playerid] == 1)
        craftCF(playerid);

    return Y_HOOKS_CONTINUE_RETURN_0;
}

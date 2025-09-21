#include <YSI_Coding\y_hooks>
#define SPEEDCF 20 // ความเร็วในการคราฟ

new PlayerText:CFTD[MAX_PLAYERS][21];
new bool:openuicfv1[MAX_PLAYERS];
new bool:openuicfv2[MAX_PLAYERS];
new openuicfslot[MAX_PLAYERS];
new openuicfSelect[MAX_PLAYERS];
new openuicfProga[MAX_PLAYERS];
new bool:openuicf[MAX_PLAYERS];

hook OnGameModeInit(){
	// คราฟทั่วไป
	CreateDynamic3DTextLabel("[ โต๊ะคราฟอาวุธ ]\n{FFFFFF}กด N เพื่อเลือกอาวุธ", COLOR_YELLOW, -1.1566,1563.2699,17.9241, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);
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
		// คราฟทั่วไป
		if (IsPlayerInRangeOfPoint(playerid, 3.0, -1.1566,1563.2699,17.9241))
		{
			if(ProgressState[playerid] == 1)
				return ErrorMsg(playerid,"คุณติดสถานะโพเสกอยู่!!");

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
                return ErrorMsg(playerid,"คุณยังไม่ได้เลือกอาวุธ!");
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
                return ErrorMsg(playerid,"คุณยังไม่ได้เลือกอาวุธ!!");
            }

            InfoItemCF(playerid);
        }

        // ============ เลือก Item ของ Slot ============

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

        // ============ สลับหน้า Slot ============

        if (playertextid == CFTD[playerid][14]) // ไป Slot 1
        {
            if (openuicfv1[playerid])
            {
                if (openuicfslot[playerid] == 1) return 1;

                openuicfslot[playerid] = 1;
                openuicfSelect[playerid] = 0;

                // ซ่อนทั้งหมดก่อน
                for (new i = 1; i <= 9; i++)
                    PlayerTextDrawHide(playerid, CFTD[playerid][i]);

                // โหลดค่าใหม่
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

        if (playertextid == CFTD[playerid][15]) // ไป Slot 2
        {
            if (openuicfv1[playerid])
            {
                if (openuicfslot[playerid] == 2) return 1;

                openuicfslot[playerid] = 2;
                openuicfSelect[playerid] = 0;

                // ซ่อน slot1 ทั้งหมดก่อน
                for (new i = 1; i <= 9; i++)
                    PlayerTextDrawHide(playerid, CFTD[playerid][i]);

                // โหลดค่า slot2
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
	// โตะคราฟ ธรรมดา
	if (openuicfv1[playerid]){
		if (openuicfslot[playerid] == 1){
		if (openuicfSelect[playerid] == 1){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"กุญแจตู้เซฟ\nของที่ใช้ในการคราฟ\n- บลูปริ้นกุญแจตู้ 1 ชิ้น\n- สายไฟ 20 ชิ้น\n- ปูน 20 ชิ้น\n- แร่แดง 30 ชิ้น\n- แร่ฟ้า 30 ชิ้น\n- แร่เหลือง 30 ชิ้น\n- แร่เขียว 30 ชิ้น\n- แท่งเหล็ก 20 ชิ้น\n- เงินแดง 500 บาท\n# โอกาสตีติด 100%", 
				"ปิด", "");
		}

		if (openuicfSelect[playerid] == 2){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"สนับมือ\nของที่ใช้ในการคราฟ\n- ปูน 10 ชิ้น\n- สายไฟ 10 ชิ้น\n- แร่แดง 10 ชิ้น\n- แร่เขียว 10 ชิ้น\n- แร่ฟ้า 10 ชิ้น\n- แร่เหลือง 10 ชิ้น\n- แท่งเหล็ก 2 ชิ้น\n- เงินแดง 500 บาท\n# โอกาสตีติด 70%", 
				"ปิด", "");
		}

		if (openuicfSelect[playerid] == 3){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"ไม้สนุ๊ก\nของที่ใช้ในการคราฟ\n- ปูน 25 ชิ้น\n- สายไฟ 25 ชิ้น\n- แร่แดง 30 ชิ้น\n- แร่เขียว 30 ชิ้น\n- แร่เหลือง 30 ชิ้น\n- แร่ฟ้า 30 ชิ้น\n- แท่งไม้ 25 ชิ้น\n- เงินแดง 1,500 บาท\n# โอกาสตีติด 70%", 
				"ปิด", "");
		}

		if (openuicfSelect[playerid] == 4){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"ไม้เบสบอล\nของที่ใช้ในการคราฟ\n- ปูน 25 ชิ้น\n- สายไฟ 25 ชิ้น\n- แร่แดง 30 ชิ้น\n- แร่เขียว 30 ชิ้น\n- แร่เหลือง 30 ชิ้น\n- แร่ฟ้า 30 ชิ้น\n- แท่งเหล็ก 25 ชิ้น\n- เงินแดง 1,500 บาท\n# โอกาสตีติด 70%", 
				"ปิด", "");
		}

		if (openuicfSelect[playerid] == 5){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"ไม้กอล์ฟ\nของที่ใช้ในการคราฟ\n- แท่งเหล็ก 25 ชิ้น\n- แท่งไม้ 25 ชิ้น\n- ปูน 40 ชิ้น\n- สายไฟ 40 ชิ้น\n- แร่แดง 50 ชิ้น\n- แร่เขียว 50 ชิ้น\n- แร่เหลือง 50 ชิ้น\n- แร่ฟ้า 50 ชิ้น\n- เงินแดง 2,000 บาท\n# โอกาสตีติด 70%", "ปิด", "");
		}

		if (openuicfSelect[playerid] == 6){
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"ไอติม\nของที่ใช้ในการคราฟ\n- ปูน 30 ชิ้น\n- สายไฟ 30 ชิ้น\n- แร่แดง 30 ชิ้น\n- แร่เขียว 30 ชิ้น\n- แร่เหลือง 30 ชิ้น\n- แร่ฟ้า 30 ชิ้น\n- เงินแดง 1,500 บาท\n# โอกาสตีติด 60%", 
				"ปิด", "");
		}

		if (openuicfSelect[playerid] == 7) {
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"บลูปริ้นกุญแจตู้\nของที่ใช้ในการคราฟ\n- สายไฟ 20 ชิ้น\n- ปูน 20 ชิ้น\n- แร่แดง 30 ชิ้น\n- แร่ฟ้า 30 ชิ้น\n- แร่เหลือง 30 ชิ้น\n- แร่เขียว 30 ชิ้น\n- แท่งเหล็ก 10 ชิ้น\n- เงินแดง 500 บาท\n# โอกาสตีติด 100%",
				"ปิด", "");
		}

		if (openuicfSelect[playerid] == 8) {
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"แท่งเหล็ก\nของที่ใช้ในการคราฟ\n- เศษเหล็ก 10 ชิ้น\n- คาร์บอน 10 ชิ้น\n- เงินเขียว 1,000 บาท\n# โอกาสตีติด 70%", 
				"ปิด", "");
		}

		if (openuicfSelect[playerid] == 9) {
			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"แท่งไม้\nของที่ใช้ในการคราฟ\n- เศษไม้ 20 ชิ้น\n- เงินเขียว 2,000 บาท\n# โอกาสตีติด 100%", 
				"ปิด", "");
		}

    //โต๊ะแฟชั่น
		}
		if (openuicfslot[playerid] == 2){
			if (openuicfSelect[playerid] == 1){
				Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"- เหรียญAFK 20 ชิ้น\n- เงินเขียว 500 บาท\n# โอกาสติด 80%", "ปิด", "");
			}

			if (openuicfSelect[playerid] == 2){
				Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )",
				"ผ้าพันแผลใหญ่\nของที่ใช้ในการคราฟ\n- เหรียญAFK 15 ชิ้น\n- เงินเขียว 2,000 บาท\n# โอกาสตีติด 70%", 
				"ปิด", "");
			}
		}
	}
	return 1;
}

craftCF(playerid)
{
    TogglePlayerControllable(playerid, 1);

	// ================== กุญแจตู้ ==================
	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 1)
	{
		// ตรวจสอบไอเท็ม
		if (Inventory_Count(playerid, "ปูน") < 20) return ErrorMsg(playerid, "คุณมี ปูน ไม่พอ");
		if (Inventory_Count(playerid, "สายไฟ") < 20) return ErrorMsg(playerid, "คุณมี สายไฟ ไม่พอ");
		if (Inventory_Count(playerid, "แร่แดง") < 30) return ErrorMsg(playerid, "คุณมี แร่แดง ไม่พอ");
		if (Inventory_Count(playerid, "แร่ฟ้า") < 30) return ErrorMsg(playerid, "คุณมี แร่ฟ้า ไม่พอ");
		if (Inventory_Count(playerid, "แร่เหลือง") < 30) return ErrorMsg(playerid, "คุณมี แร่เหลือง ไม่พอ");
		if (Inventory_Count(playerid, "แร่เขียว") < 30) return ErrorMsg(playerid, "คุณมี แร่เขียว ไม่พอ");
		if (Inventory_Count(playerid, "แท่งเหล็ก") < 20) return ErrorMsg(playerid, "คุณมี แท่งเหล็ก ไม่พอ");
		if (Inventory_Count(playerid, "เงินแดง") < 500) return ErrorMsg(playerid, "คุณมี เงินแดง ไม่พอ");
		if (Inventory_Count(playerid, "บลูปริ้นกุญแจตู้") < 1) return ErrorMsg(playerid, "คุณมี บลูปริ้นกุญแจตู้ ไม่พอ");

		// ตัดของออก
		Inventory_Remove(playerid, "ปูน", 20);
		Inventory_Remove(playerid, "สายไฟ", 20);
		Inventory_Remove(playerid, "แร่แดง", 30);
		Inventory_Remove(playerid, "แร่ฟ้า", 30);
		Inventory_Remove(playerid, "แร่เหลือง", 30);
		Inventory_Remove(playerid, "แร่เขียว", 30);
		Inventory_Remove(playerid, "แท่งเหล็ก", 20);
		Inventory_Remove(playerid, "เงินแดง", 500);
		Inventory_Remove(playerid, "บลูปริ้นกุญแจตู้", 1);

		// ให้ของแน่นอน 100%
		Inventory_Add(playerid, "กุญแจตู้เซฟ", 1);
		SendClientMessage(playerid, 0xFFFFFFAA, "ยินดีด้วยคุณคราฟสำเร็จ: [ กุญแจตู้เซฟ ]");
	}


     
	// ================== สนับมือ ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 2)
	{
		if (Inventory_Count(playerid, "ปูน") < 10) return ErrorMsg(playerid, "คุณมี ปูน ไม่พอ");
		if (Inventory_Count(playerid, "สายไฟ") < 10) return ErrorMsg(playerid, "คุณมี สายไฟ ไม่พอ");
		if (Inventory_Count(playerid, "แร่แดง") < 10) return ErrorMsg(playerid, "คุณมี แร่แดง ไม่พอ");
		if (Inventory_Count(playerid, "แร่ฟ้า") < 10) return ErrorMsg(playerid, "คุณมี แร่ฟ้า ไม่พอ");
		if (Inventory_Count(playerid, "แร่เหลือง") < 10) return ErrorMsg(playerid, "คุณมี แร่เหลือง ไม่พอ");
		if (Inventory_Count(playerid, "แร่เขียว") < 10) return ErrorMsg(playerid, "คุณมี แร่เขียว ไม่พอ");
		if (Inventory_Count(playerid, "แท่งเหล็ก") < 2) return ErrorMsg(playerid, "คุณมี แท่งเหล็ก ไม่พอ");
		if (Inventory_Count(playerid, "เงินแดง") < 500) return ErrorMsg(playerid, "คุณมี เงินแดง ไม่พอ");

		Inventory_Remove(playerid, "ปูน", 10);
		Inventory_Remove(playerid, "สายไฟ", 10);
		Inventory_Remove(playerid, "แร่แดง", 10);
		Inventory_Remove(playerid, "แร่ฟ้า", 10);
		Inventory_Remove(playerid, "แร่เหลือง", 10);
		Inventory_Remove(playerid, "แร่เขียว", 30);
		Inventory_Remove(playerid, "แท่งเหล็ก", 2);
		Inventory_Remove(playerid, "เงินแดง", 500);

		switch(random(100))
		{
			case 0..69: // 70% สำเร็จ
			{
				Inventory_Add(playerid, "สนับมือ", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ [ สนับมือ ] สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} สนับมือ {00FFFF} + 1");
				UrLogknucklesucceed(playerid);
			}
			case 70..99: // 30% ล้มเหลว
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน] {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
				UrLogknucklefail(playerid);
			}
		}
	}

	// ================== ไม้สนุ๊ก ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 3)
	{
		if (Inventory_Count(playerid, "ปูน") < 25) return ErrorMsg(playerid, "คุณมี ปูน ไม่พอ");
		if (Inventory_Count(playerid, "สายไฟ") < 25) return ErrorMsg(playerid, "คุณมี สายไฟ ไม่พอ");
		if (Inventory_Count(playerid, "แร่แดง") < 30) return ErrorMsg(playerid, "คุณมี แร่ ไม่พอ");
		if (Inventory_Count(playerid, "แร่ฟ้า") < 30) return ErrorMsg(playerid, "คุณมี แร่ ไม่พอ");
		if (Inventory_Count(playerid, "แร่เหลือง") < 30) return ErrorMsg(playerid, "คุณมี แร่ ไม่พอ");
		if (Inventory_Count(playerid, "แร่เขียว") < 30) return ErrorMsg(playerid, "คุณมี แร่ ไม่พอ");
		if (Inventory_Count(playerid, "แท่งไม้") < 25) return ErrorMsg(playerid, "คุณมี แท่งไม้ ไม่พอ");
		if (Inventory_Count(playerid, "เงินแดง") < 1500) return ErrorMsg(playerid, "คุณมี เงินแดง ไม่พอ");

		Inventory_Remove(playerid, "ปูน", 25);
		Inventory_Remove(playerid, "สายไฟ", 25);
		Inventory_Remove(playerid, "แร่แดง", 30);
		Inventory_Remove(playerid, "แร่ฟ้า", 30);
		Inventory_Remove(playerid, "แร่เหลือง", 30);
		Inventory_Remove(playerid, "แร่เขียว", 30);
		Inventory_Remove(playerid, "แท่งไม้", 25);
		Inventory_Remove(playerid, "เงินแดง", 1500);

		switch(random(100))
		{
			case 0..69: // 70% สำเร็จ
			{
				Inventory_Add(playerid, "ไม้สนุ๊ก", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ [ ไม้สนุ๊ก ] สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} ไม้สนุ๊ก {00FFFF} + 1");
				UrLogpoolsucceed(playerid);
			}
			case 70..99: // 30% ล้มเหลว
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน] {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
				UrLogpoolfail(playerid);
			}
		}
	}

	// ================== ไม้เบสบอล ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 4)
	{
		if (Inventory_Count(playerid, "ปูน") < 25) return ErrorMsg(playerid, "คุณมี ปูน ไม่พอ");
		if (Inventory_Count(playerid, "สายไฟ") < 25) return ErrorMsg(playerid, "คุณมี สายไฟ ไม่พอ");
		if (Inventory_Count(playerid, "แร่แดง") < 30) return ErrorMsg(playerid, "คุณมี แร่แดง ไม่พอ");
		if (Inventory_Count(playerid, "แร่ฟ้า") < 30) return ErrorMsg(playerid, "คุณมี แร่ฟ้า ไม่พอ");
		if (Inventory_Count(playerid, "แร่เหลือง") < 30) return ErrorMsg(playerid, "คุณมี แร่เหลือง ไม่พอ");
		if (Inventory_Count(playerid, "แร่เขียว") < 30) return ErrorMsg(playerid, "คุณมี แร่เขียว ไม่พอ");
		if (Inventory_Count(playerid, "แท่งเหล็ก") < 25) return ErrorMsg(playerid, "คุณมี แท่งเหล็ก ไม่พอ");
		if (Inventory_Count(playerid, "เงินแดง") < 1500) return ErrorMsg(playerid, "คุณมี เงินแดง ไม่พอ");

		Inventory_Remove(playerid, "ปูน", 25);
		Inventory_Remove(playerid, "สายไฟ", 25);
		Inventory_Remove(playerid, "แร่แดง", 30);
		Inventory_Remove(playerid, "แร่ฟ้า", 30);
		Inventory_Remove(playerid, "แร่เหลือง", 30);
		Inventory_Remove(playerid, "แร่เขียว", 30);
		Inventory_Remove(playerid, "แท่งเหล็ก", 25);
		Inventory_Remove(playerid, "เงินแดง", 1500);

		switch(random(100))
		{
			case 0..69: // 70% สำเร็จ
			{
				Inventory_Add(playerid, "ไม้เบสบอล", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ [ ไม้เบสบอล ] สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} ไม้เบสบอล {00FFFF} + 1");
				UrLogbaseballsucceed(playerid);
			}
			case 70..99: // 30% ล้มเหลว
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน] {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
				UrLogbaseballfail(playerid);
			}
		}
	}


	
	
	// ================== ไม้กอล์ฟ ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 5) // slot/select สำหรับไม้กอล์ฟ
	{
		if (Inventory_Count(playerid, "แท่งเหล็ก") < 25) return ErrorMsg(playerid, "คุณมี แท่งเหล็ก ไม่พอ");
		if (Inventory_Count(playerid, "แท่งไม้") < 25) return ErrorMsg(playerid, "คุณมี แท่งไม้ ไม่พอ");
		if (Inventory_Count(playerid, "ปูน") < 40) return ErrorMsg(playerid, "คุณมี ปูน ไม่พอ");
		if (Inventory_Count(playerid, "สายไฟ") < 40) return ErrorMsg(playerid, "คุณมี สายไฟ ไม่พอ");
		if (Inventory_Count(playerid, "แร่แดง") < 50) return ErrorMsg(playerid, "คุณมี แร่แดง ไม่พอ");
		if (Inventory_Count(playerid, "แร่เขียว") < 50) return ErrorMsg(playerid, "คุณมี แร่เขียว ไม่พอ");
		if (Inventory_Count(playerid, "แร่เหลือง") < 50) return ErrorMsg(playerid, "คุณมี แร่เหลือง ไม่พอ");
		if (Inventory_Count(playerid, "แร่ฟ้า") < 50) return ErrorMsg(playerid, "คุณมี แร่ฟ้า ไม่พอ");
		if (Inventory_Count(playerid, "เงินแดง") < 2000) return ErrorMsg(playerid, "คุณมี เงินแดง ไม่พอ");

		Inventory_Remove(playerid, "แท่งเหล็ก", 25);
		Inventory_Remove(playerid, "แท่งไม้", 25);
		Inventory_Remove(playerid, "ปูน", 40);
		Inventory_Remove(playerid, "สายไฟ", 40);
		Inventory_Remove(playerid, "แร่แดง", 50);
		Inventory_Remove(playerid, "แร่เขียว", 50);
		Inventory_Remove(playerid, "แร่เหลือง", 50);
		Inventory_Remove(playerid, "แร่ฟ้า", 50);
		Inventory_Remove(playerid, "เงินแดง", 2000);

		switch(random(100))
		{
			case 0..69: // 70% สำเร็จ
			{
				Inventory_Add(playerid, "ไม้กอล์ฟ", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ [ ไม้กอล์ฟ ] สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} ไม้กอล์ฟ {00FFFF} + 1");
				UrLoggolfclubsucceed(playerid);
			}
			case 70..99: // 30% ล้มเหลว
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน] {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
				UrLoggolfclubfail(playerid);
			}
		}
	}


	// ================== ไอติม ==================
	TogglePlayerControllable(playerid, 1);

	if (!openuicfv1[playerid]) return 0;
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 6) // slot/select สำหรับไอติม
	{
		if (Inventory_Count(playerid, "ปูน") < 30) return ErrorMsg(playerid, "คุณมี ปูน ไม่พอ");
		if (Inventory_Count(playerid, "สายไฟ") < 30) return ErrorMsg(playerid, "คุณมี สายไฟ ไม่พอ");
		if (Inventory_Count(playerid, "แร่แดง") < 30) return ErrorMsg(playerid, "คุณมี แร่แดง ไม่พอ");
		if (Inventory_Count(playerid, "แร่เขียว") < 30) return ErrorMsg(playerid, "คุณมี แร่เขียว ไม่พอ");
		if (Inventory_Count(playerid, "แร่เหลือง") < 30) return ErrorMsg(playerid, "คุณมี แร่เหลือง ไม่พอ");
		if (Inventory_Count(playerid, "แร่ฟ้า") < 30) return ErrorMsg(playerid, "คุณมี แร่ฟ้า ไม่พอ");
		if (Inventory_Count(playerid, "เงินแดง") < 1500) return ErrorMsg(playerid, "คุณมี เงินแดง ไม่พอ");

		Inventory_Remove(playerid, "ปูน", 30);
		Inventory_Remove(playerid, "สายไฟ", 30);
		Inventory_Remove(playerid, "แร่แดง", 30);
		Inventory_Remove(playerid, "แร่เขียว", 30);
		Inventory_Remove(playerid, "แร่เหลือง", 30);
		Inventory_Remove(playerid, "แร่ฟ้า", 30);
		Inventory_Remove(playerid, "เงินแดง", 1500);

		switch(random(100))
		{
			case 0..49: // 50% สำเร็จ
			{
				Inventory_Add(playerid, "ไอติม", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} ยินดีด้วยคุณคราฟสำเร็จ: [ ไอติม ]");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} ไอติม {00FFFF} + 1");
				UrLogKatanasucceed(playerid); // Log สำเร็จ
			}
			case 50..99: // 50% ล้มเหลว
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน] {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ ไอติม");
				UrLogKatanafail(playerid); // Log ล้มเหลว
			}
		}
	}




	// บลูปริ้นกุญแจตู้
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 7) // slot/select สำหรับบลูปริ้นกุญแจตู้
	{
		if (Inventory_Count(playerid, "ปูน") < 20) return ErrorMsg(playerid, "คุณมี ปูน ไม่พอ");
		if (Inventory_Count(playerid, "สายไฟ") < 20) return ErrorMsg(playerid, "คุณมี สายไฟ ไม่พอ");
		if (Inventory_Count(playerid, "แร่แดง") < 30) return ErrorMsg(playerid, "คุณมี แร่แดง ไม่พอ");
		if (Inventory_Count(playerid, "แร่เขียว") < 30) return ErrorMsg(playerid, "คุณมี แร่เขียว ไม่พอ");
		if (Inventory_Count(playerid, "แร่ฟ้า") < 30) return ErrorMsg(playerid, "คุณมี แร่ฟ้า ไม่พอ");
		if (Inventory_Count(playerid, "แร่เหลือง") < 30) return ErrorMsg(playerid, "คุณมี แร่เหลือง ไม่พอ");
		if (Inventory_Count(playerid, "แท่งเหล็ก") < 10) return ErrorMsg(playerid, "คุณมี แร่เหลือง ไม่พอ");
		if (Inventory_Count(playerid, "เงินแดง") < 500) return ErrorMsg(playerid, "คุณมี เงินแดง ไม่พอ");

		// ตัดของออกก่อน
		Inventory_Remove(playerid, "ปูน", 20);
		Inventory_Remove(playerid, "สายไฟ", 20);
		Inventory_Remove(playerid, "แร่แดง", 30);
		Inventory_Remove(playerid, "แร่เขียว", 30);
		Inventory_Remove(playerid, "แร่ฟ้า", 30);
		Inventory_Remove(playerid, "แร่เหลือง", 30);
		Inventory_Remove(playerid, "แท่งเหล็ก", 10);
		Inventory_Remove(playerid, "เงินแดง", 500);

		// คราฟติด 100%
		Inventory_Add(playerid, "บลูปริ้นกุญแจตู้", 1);
		SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} คุณคราฟสำเร็จ: [ บลูปริ้นกุญแจตู้ ]");
		SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} บลูปริ้นกุญแจตู้ {00FFFF} + 1");
	}


		// คราฟแท่งเหล็ก
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 8)
	{
		if (Inventory_Count(playerid, "เศษเหล็ก") < 10) return ErrorMsg(playerid, "คุณมี เศษเหล็ก ไม่พอ");
		if (Inventory_Count(playerid, "คาร์บอน") < 10) return ErrorMsg(playerid, "คุณมี คาร์บอน ไม่พอ");
		if (GetPlayerMoneyEx(playerid) < 1000) return ErrorMsg(playerid, "คุณมี เงินเขียว ไม่พอ");

		// ตัดของออกก่อน
		Inventory_Remove(playerid, "เศษเหล็ก", 10);
		Inventory_Remove(playerid, "คาร์บอน", 10);
		GivePlayerMoneyEx(playerid, -1000);

		// 70% สำเร็จ
		switch(random(100))
		{
			case 0..69:
			{
				Inventory_Add(playerid, "แท่งเหล็ก", 1);
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} คุณคราฟสำเร็จ: [ แท่งเหล็ก ]");
			}
			case 70..99:
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน] {FFFFFF} ล้มเหลวในการคราฟ แท่งเหล็ก");
			}
		}
	}

	// คราฟแท่งไม้
	if (openuicfslot[playerid] == 1 && openuicfSelect[playerid] == 9)
	{
		if (Inventory_Count(playerid, "เศษไม้") < 20) return ErrorMsg(playerid, "คุณมี เศษไม้ ไม่พอ");
		if (GetPlayerMoneyEx(playerid) < 2000) return ErrorMsg(playerid, "คุณมี เงินเขียว ไม่พอ");

		// ตัดของออกก่อน
		Inventory_Remove(playerid, "เศษไม้", 20);
		GivePlayerMoneyEx(playerid, -2000);

		// 100% สำเร็จ
		Inventory_Add(playerid, "แท่งไม้", 1);
		SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน] {FFFFFF} คุณคราฟสำเร็จ: [ แท่งไม้ ]");
	}



	

	// -----------------------------------------------------------------
	// ปอมปอมปูริน (ช่อง 2, เลือก 1)
	// -----------------------------------------------------------------
	if (openuicfslot[playerid] == 2 && openuicfSelect[playerid] == 1)
	{
		// ตรวจสอบก่อนว่าเพียงพอ
		if (Inventory_Count(playerid, "เหรียญAFK") < 20) 
			return SendClientMessage(playerid, 0xFF0000FF, "คุณมี เหรียญAFK ไม่เพียงพอ");
		if (GetPlayerMoneyEx(playerid) < 500) 
			return SendClientMessage(playerid, 0xFF0000FF, "คุณมี เงินเขียว ไม่เพียงพอ");

		// หักของก่อนคราฟ
		Inventory_Remove(playerid, "เหรียญAFK", 20);
		GivePlayerMoneyEx(playerid, -500);

		// สุ่มผลลัพธ์
		if (random(100) < 70) // 70% สำเร็จ
		{
			Inventory_Add(playerid, "ปอมปอมปูริน", 1);
			SendClientMessage(playerid, 0xFFFFFFAA, "ยินดีด้วยคุณคราฟสำเร็จ: [ ปอมปอมปูริน ]");
		}
		else // 30% ล้มเหลว
		{
			Inventory_Add(playerid, "เหรียญดวงซวย", 1);
			SendClientMessage(playerid, 0xFF0000FF, "เสียใจด้วยคุณคราฟล้มเหลว ได้รับ [ เหรียญดวงซวย x1 ]");
		}
	}

	// -----------------------------------------------------------------
	// ผ้าพันแผลใหญ่ (ช่อง 2, เลือก 2)
	// -----------------------------------------------------------------
	if (openuicfslot[playerid] == 2 && openuicfSelect[playerid] == 2)
	{
		// ตรวจสอบไอเท็ม
		if (Inventory_Count(playerid, "เหรียญAFK") < 15) 
			return ErrorMsg(playerid, "คุณมี เหรียญAFK ไม่พอ");
		if (GetPlayerMoneyEx(playerid) < 2000) 
			return ErrorMsg(playerid, "คุณมี เงินเขียว ไม่พอ");

		// ตัดของออกก่อน
		Inventory_Remove(playerid, "เหรียญAFK", 15);
		GivePlayerMoneyEx(playerid, -2000);

		// สุ่มโอกาส 70%
		if (random(100) < 70) 
		{
			Inventory_Add(playerid, "ผ้าพันแผลใหญ่", 1);
			SendClientMessage(playerid, 0xFFFFFFAA, "ยินดีด้วยคุณคราฟสำเร็จ: [ ผ้าพันแผลใหญ่ ]");
		}
		else
		{
			Inventory_Add(playerid, "เหรียญAFK", 3);
			SendClientMessage(playerid, 0xFF0000AA, "การคราฟล้มเหลว: คุณได้รับ [ เหรียญAFK x3 ] คืน");
		}
	}


    // รีเซ็ตค่า UI
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

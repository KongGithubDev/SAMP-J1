#include <YSI_Coding\y_hooks>

new PlayerText:TDJOB[MAX_PLAYERS][9];

hook OnGameModeInit()
{
    // ตลาดกลาง
    CreateDynamic3DTextLabel("{ff80e7}พ่อค้า\n{FFFFFF}กด 'N' เพื่อขายของ", COLOR_YELLOW,1129.0385,-1469.5271,15.7475, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 25.0);
   	CreateActor(2, 1129.0385,-1469.5271,15.7475,355.9472);
}

hook OnPlayerConnect(playerid)
{
	TDJOB[playerid][0] = CreatePlayerTextDraw(playerid, 155.000000, 50.000000, "asabiasabi:interface_mkjob");
	PlayerTextDrawFont(playerid, TDJOB[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, TDJOB[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDJOB[playerid][0], 340.000000, 400.000000);
	PlayerTextDrawSetOutline(playerid, TDJOB[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TDJOB[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, TDJOB[playerid][0], 1);
	PlayerTextDrawColor(playerid, TDJOB[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, TDJOB[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, TDJOB[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, TDJOB[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TDJOB[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, TDJOB[playerid][0], 0);

	TDJOB[playerid][1] = CreatePlayerTextDraw(playerid, 175.000000, 135.000000, "asabuasabi:MK_JOB1");
	PlayerTextDrawFont(playerid, TDJOB[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, TDJOB[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDJOB[playerid][1], 50.000000, 60.000000);
	PlayerTextDrawSetOutline(playerid, TDJOB[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TDJOB[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, TDJOB[playerid][1], 1);
	PlayerTextDrawColor(playerid, TDJOB[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, TDJOB[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, TDJOB[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, TDJOB[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, TDJOB[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, TDJOB[playerid][1], 1);

	TDJOB[playerid][2] = CreatePlayerTextDraw(playerid, 238.000000, 135.000000, "asabuasabi:MK_JOB2");
	PlayerTextDrawFont(playerid, TDJOB[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, TDJOB[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDJOB[playerid][2], 50.000000, 60.000000);
	PlayerTextDrawSetOutline(playerid, TDJOB[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, TDJOB[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, TDJOB[playerid][2], 1);
	PlayerTextDrawColor(playerid, TDJOB[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, TDJOB[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, TDJOB[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, TDJOB[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, TDJOB[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, TDJOB[playerid][2], 1);

	TDJOB[playerid][3] = CreatePlayerTextDraw(playerid, 302.000000, 135.000000, "asabuasabi:MK_JOB3");
	PlayerTextDrawFont(playerid, TDJOB[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, TDJOB[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDJOB[playerid][3], 50.000000, 60.000000);
	PlayerTextDrawSetOutline(playerid, TDJOB[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, TDJOB[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, TDJOB[playerid][3], 1);
	PlayerTextDrawColor(playerid, TDJOB[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, TDJOB[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, TDJOB[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, TDJOB[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, TDJOB[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, TDJOB[playerid][3], 1);

	TDJOB[playerid][4] = CreatePlayerTextDraw(playerid, 365.000000, 135.000000, "asabuasabi:MK_JOB4");
	PlayerTextDrawFont(playerid, TDJOB[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, TDJOB[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDJOB[playerid][4], 50.000000, 60.000000);
	PlayerTextDrawSetOutline(playerid, TDJOB[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, TDJOB[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, TDJOB[playerid][4], 1);
	PlayerTextDrawColor(playerid, TDJOB[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, TDJOB[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, TDJOB[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, TDJOB[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, TDJOB[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, TDJOB[playerid][4], 1);

	TDJOB[playerid][5] = CreatePlayerTextDraw(playerid, 425.000000, 135.000000, "asabuasabi:MK_JOB5");
	PlayerTextDrawFont(playerid, TDJOB[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, TDJOB[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDJOB[playerid][5], 50.000000, 60.000000);
	PlayerTextDrawSetOutline(playerid, TDJOB[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, TDJOB[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, TDJOB[playerid][5], 1);
	PlayerTextDrawColor(playerid, TDJOB[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, TDJOB[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, TDJOB[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, TDJOB[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, TDJOB[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, TDJOB[playerid][5], 1);

	TDJOB[playerid][6] = CreatePlayerTextDraw(playerid, 175.000000, 200.000000, "asabuasabi:MK_JOB6");
	PlayerTextDrawFont(playerid, TDJOB[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, TDJOB[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDJOB[playerid][6], 50.000000, 60.000000);
	PlayerTextDrawSetOutline(playerid, TDJOB[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, TDJOB[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, TDJOB[playerid][6], 1);
	PlayerTextDrawColor(playerid, TDJOB[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, TDJOB[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, TDJOB[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, TDJOB[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, TDJOB[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, TDJOB[playerid][6], 1);

	TDJOB[playerid][7] = CreatePlayerTextDraw(playerid, 238.000000, 200.000000, "asabuasabi:MK_JOB7");
	PlayerTextDrawFont(playerid, TDJOB[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, TDJOB[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDJOB[playerid][7], 50.000000, 60.000000);
	PlayerTextDrawSetOutline(playerid, TDJOB[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, TDJOB[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, TDJOB[playerid][7], 1);
	PlayerTextDrawColor(playerid, TDJOB[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, TDJOB[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, TDJOB[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, TDJOB[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, TDJOB[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, TDJOB[playerid][7], 1);

	TDJOB[playerid][8] = CreatePlayerTextDraw(playerid, 458.000000, 101.000000, "asabuasabi:MK_JOBC");
	PlayerTextDrawFont(playerid, TDJOB[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, TDJOB[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDJOB[playerid][8], 19.000000, 24.000000);
	PlayerTextDrawSetOutline(playerid, TDJOB[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, TDJOB[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, TDJOB[playerid][8], 1);
	PlayerTextDrawColor(playerid, TDJOB[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, TDJOB[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, TDJOB[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, TDJOB[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, TDJOB[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, TDJOB[playerid][8], 1);

	return 1;
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO)
    {
		if (IsPlayerInRangeOfPoint(playerid, 2.0, 1129.0385,-1469.5271,15.7475))
		{
		PlayerTextDrawShow(playerid, TDJOB[playerid][0]);
		PlayerTextDrawShow(playerid, TDJOB[playerid][1]);
		PlayerTextDrawShow(playerid, TDJOB[playerid][2]);
		PlayerTextDrawShow(playerid, TDJOB[playerid][3]);
		PlayerTextDrawShow(playerid, TDJOB[playerid][4]);
		PlayerTextDrawShow(playerid, TDJOB[playerid][5]);
		PlayerTextDrawShow(playerid, TDJOB[playerid][6]);
		PlayerTextDrawShow(playerid, TDJOB[playerid][7]);
		PlayerTextDrawShow(playerid, TDJOB[playerid][8]);
		SelectTextDraw(playerid, 0xFF0000FF);
    }
    return 1;
}
// อื่นๆเติมเองขี้เกียจเขียน
hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == TDJOB[playerid][1])
	{
		Dialog_Show(playerid,DIALOG_SELLMINING,DIALOG_STYLE_TABLIST_HEADERS,"{10C604}ตลาดกลาง",string2,"ตกลง","ออก");
    }
    return 1;
}

Dialog:DIALOG_SELLMINING(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
	            miningType[playerid] = listitem;
	            Dialog_Show(playerid, DIALOG_MINING_AMOUNT, DIALOG_STYLE_INPUT, "[รายการรับซื้อ]", "กรุณาระบุจำนวนที่คุณต้องการจะขาย", "ตกลง", "ยกเลิก");
		    }
		}
	}
	return 1;
}

Dialog:DIALOG_MINING_AMOUNT(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(miningType[playerid])
	    {
	        case 0:
	        {
	            new ammo = strval(inputtext);
			    new price = ammo*MarketPrice[0];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่มีปลาเผาอยู่ในตัวเลย");

				if (ammo > Inventory_Count(playerid, "ปลาเผา"))
				    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}จำนวนของในตัวคุณมีไม่เพียงพอ!");

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านค้า] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขายเหล็ก {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ปลาเผา", ammo);
				miningType[playerid] = -1;
            }
		}
	}
	return 1;
}

/* 
# ผู้จัดทำ : Esso_Lee (Lead Codehub Studio)
# จัดจำหน่ายโดย : Codehub Studio
# กรณี ระบบ แยกมีบัค ติดต่อ SUP ได้ที่ FB: CodeHub Studio แก้บัคฟรี ! (กรณ๊มีบัค)
# ติดต่อ สั่งทำระบบ เพิ่มเติม หรือ ลงระบบ เขียนสคริป ใหม่ แก้บัค ติดต่อได้ที่ FB: CodeHub Studio
# เว็บไซต์ ทางการ : www.codehubstudio.shop
# youtube : Esso_Lee

วิธีเรียกใช้ฟังด์ชั่น
ShowPoliceCodeHub(playerid); <--- นำโค้ดนี้ไปวางไว้ที่เรียกใช้ เช่น กด H -> เปิดเมนูตำรวจ
HidePoliceCodeHub(playerid); <--- นำโค้ดนี้ไปวางไว้ที่เรียกใช้ เช่น กด H -> ปิดเมนูตำรวจ
*/
#include	<YSI_Coding\y_hooks>

new PlayerText:CodeHubPoliceTD[MAX_PLAYERS][11];

hook OnPlayerConnect(playerid)
{
    CodeHubPoliceTD[playerid][0] = CreatePlayerTextDraw(playerid, 170.000000, 70.000000, "codehubpolice:police");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][0], 349.500000, 331.000000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][0], 0);

	CodeHubPoliceTD[playerid][1] = CreatePlayerTextDraw(playerid, 207.000000, 142.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][1], 52.500000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][1], 1);

	CodeHubPoliceTD[playerid][2] = CreatePlayerTextDraw(playerid, 308.000000, 142.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][2], 52.500000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][2], 1);

	CodeHubPoliceTD[playerid][3] = CreatePlayerTextDraw(playerid, 411.000000, 142.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][3], 52.500000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][3], 1);

	CodeHubPoliceTD[playerid][4] = CreatePlayerTextDraw(playerid, 205.000000, 223.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][4], 52.500000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][4], 1);

	CodeHubPoliceTD[playerid][5] = CreatePlayerTextDraw(playerid, 308.000000, 223.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][5], 52.500000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][5], 1);

	CodeHubPoliceTD[playerid][6] = CreatePlayerTextDraw(playerid, 415.000000, 223.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][6], 52.500000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][6], 1);

	CodeHubPoliceTD[playerid][7] = CreatePlayerTextDraw(playerid, 205.000000, 307.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][7], 52.500000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][7], 1);

	CodeHubPoliceTD[playerid][8] = CreatePlayerTextDraw(playerid, 310.000000, 307.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][8], 52.500000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][8], 1);

	CodeHubPoliceTD[playerid][9] = CreatePlayerTextDraw(playerid, 413.000000, 307.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][9], 52.500000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][9], 1);

	CodeHubPoliceTD[playerid][10] = CreatePlayerTextDraw(playerid, 479.000000, 84.000000, "codehubpolice:caseclick");
	PlayerTextDrawFont(playerid, CodeHubPoliceTD[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, CodeHubPoliceTD[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CodeHubPoliceTD[playerid][10], 28.500000, 19.500000);
	PlayerTextDrawSetOutline(playerid, CodeHubPoliceTD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, CodeHubPoliceTD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, CodeHubPoliceTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, CodeHubPoliceTD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, CodeHubPoliceTD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, CodeHubPoliceTD[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, CodeHubPoliceTD[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, CodeHubPoliceTD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, CodeHubPoliceTD[playerid][10], 1);
    return 1;
}
hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
    if(playertextid == CodeHubPoliceTD[playerid][1])
	{
        foreach(new x: Player)
        {
            if(IsPlayerConnected(x) && playerData[x][pWanted])
            {
                SendClientMessageEx(playerid, COLOR_WHITE, "รายชื่อ : ผู้กระทำความผิด %s",GetPlayerNameEx(playerid));
            }
        }
    }    
    if(playertextid == CodeHubPoliceTD[playerid][2])
    {
        new string[1000], var[15], count;
        foreach(new i : Player)
        {
            if (i == playerid) continue;
            if (IsPlayerNearPlayer(playerid, i, 5.0))
            {
                format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
                format(var, sizeof(var), "PID%d", count);
                SetPVarInt(playerid, var, i);
                count++;
            }
        }
        if (!count)
        {
            SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
            return 1;
        }
        Dialog_Show(playerid, DIALOG_CUFFID, DIALOG_STYLE_TABLIST, "[ใส่กุญแจมือ]", string, "เลือก", "ปิด");
    }
    if(playertextid == CodeHubPoliceTD[playerid][3])
    {
        new string[1000], var[15], count;
        foreach(new i : Player)
        {
            if (i == playerid) continue;
            if (IsPlayerNearPlayer(playerid, i, 5.0))
            {
                format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
                format(var, sizeof(var), "PID%d", count);
                SetPVarInt(playerid, var, i);
                count++;
            }
        }
        if (!count)
        {
            SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
            return 1;
        }
        Dialog_Show(playerid, DIALOG_FRISKID, DIALOG_STYLE_TABLIST, "[ค้นตัว]", string, "เลือก", "ปิด");
    }  
    if(playertextid == CodeHubPoliceTD[playerid][10])
    {
        HidePoliceCodeHub(playerid);
    }
    if(playertextid == CodeHubPoliceTD[playerid][4])
    {
        new string[1000], var[15], count;
        foreach(new i : Player)
        {
            if (i == playerid) continue;
            if (IsPlayerNearPlayer(playerid, i, 5.0))
            {
                format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
                format(var, sizeof(var), "PID%d", count);
                SetPVarInt(playerid, var, i);
                count++;
            }
        }
        if (!count)
        {
            SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
            return 1;
        }
        Dialog_Show(playerid, DIALOG_TAKEID, DIALOG_STYLE_TABLIST, "[ยึดของผิดกฎหมาย]", string, "เลือก", "ปิด");
    }  
    if(playertextid == CodeHubPoliceTD[playerid][5])
    {
        if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || !IsPlayerSpawnedEx(playerid))
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่สามารถใช้งานได้ ต้องอยู่บนพื้นเท่านั้น");

        if (GetFactionType(playerid) != FACTION_POLICE)
            return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ช่องทางนี้สำหรับรัฐบาลเท่านั้น!");

        if (!playerData[playerid][pTazer])
        {
            playerData[playerid][pTazer] = 1;
            GivePlayerWeaponEx(playerid, 23, 20000);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้หยิบปืนช็อตไฟฟ้าออกมาจากกระเป๋า", GetPlayerNameEx(playerid));
        }
        else
        {
            playerData[playerid][pTazer] = 0;
            SetPlayerAmmo(playerid, 23, 0);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้เก็บปืนช็อตไฟฟ้าลงในกระเป๋า", GetPlayerNameEx(playerid));
        }
    }
    if(playertextid == CodeHubPoliceTD[playerid][6])
    {
        new string[1000], var[15], count;
        foreach(new i : Player)
        {
            if (i == playerid) continue;
            if (IsPlayerNearPlayer(playerid, i, 5.0))
            {
                format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
                format(var, sizeof(var), "PID%d", count);
                SetPVarInt(playerid, var, i);
                count++;
            }
        }
        if (!count)
        {
            SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
            return 1;
        }
        Dialog_Show(playerid, DIALOG_DRAGID, DIALOG_STYLE_TABLIST, "[ลาก]", string, "เลือก", "ปิด");
    }
    if(playertextid == CodeHubPoliceTD[playerid][7])
    {
        new string[1000], var[15], count;
        foreach(new i : Player)
        {
            if (i == playerid) continue;
            if (IsPlayerNearPlayer(playerid, i, 5.0))
            {
                format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
                format(var, sizeof(var), "PID%d", count);
                SetPVarInt(playerid, var, i);
                count++;
            }
        }
        if (!count)
        {
            SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
            return 1;
        }
        Dialog_Show(playerid, DIALOG_ADDWANTED, DIALOG_STYLE_TABLIST, "[้เพิ่มคดี]", string, "เลือก", "ปิด");
    }
    if(playertextid == CodeHubPoliceTD[playerid][8])
    {
        new string[1000], var[15], count;
        foreach(new i : Player)
        {
            if (i == playerid) continue;
            if (IsPlayerNearPlayer(playerid, i, 5.0))
            {
                format(string, sizeof(string), "[ID: %d]\t%s\n", i, GetPlayerNameEx(i));
                format(var, sizeof(var), "PID%d", count);
                SetPVarInt(playerid, var, i);
                count++;
            }
        }
        if (!count)
        {
            SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีใครอยู่รอบ ๆ คุณเลย");
            return 1;
        }
        Dialog_Show(playerid, DIALOG_DETAINID, DIALOG_STYLE_TABLIST, "[ลากขึ้น/ลงรถ]", string, "เลือก", "ปิด");
    }
    if(playertextid == CodeHubPoliceTD[playerid][9])
    {
        //เว้นว่างไว้ ให้หาฟังด์ชั่นด์พิมมาใส่ แต่ละสคริป คำสังไม่เหมือนกัน
    }
    return 1;
}    
Dialog:DIALOG_DETAINID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::detain(playerid, string);
	}
	return 1;
}
Dialog:DIALOG_ADDWANTED(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new  var[15];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

        GivePlayerWanted(userid, 1);
        SendClientMessageEx(playerid, COLOR_YELLOW, "[ระบบ] {FFFFFF}ดำเนินการยัดดาว 1 ดาว แก่ผู้เล่น : %s",GetPlayerNameEx(userid));
        SendClientMessageEx(userid, COLOR_YELLOW, "[ระบบ] {FFFFFF}ดำเนินการยัดดาว 1 ดาว ผู้ยัดดาว : %s",GetPlayerNameEx(playerid));
	}
	return 1;
}

Dialog:DIALOG_DRAGID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::drag(playerid, string);
	}
	return 1;
}
Dialog:DIALOG_TAKEID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::frisk(playerid, string);
	}
	return 1;
}
Dialog:DIALOG_FRISKID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
	    //new itemid = playerData[playerid][pItemSelect];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::frisk(playerid, string);
	}
	return 1;
}
Dialog:DIALOG_CUFFID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new string[256], var[15];
		format(var, sizeof(var), "PID%d", listitem);
		new userid = GetPVarInt(playerid, var);

		format(string, 16, "%d", userid);
		callcmd::cuff(playerid, string);
	}
	return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][0]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][1]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][2]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][3]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][4]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][5]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][6]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][7]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][8]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][9]);
	PlayerTextDrawDestroy(playerid, CodeHubPoliceTD[playerid][10]);
	return 1;
}
HidePoliceCodeHub(playerid)
{
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][0]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][1]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][2]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][3]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][4]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][5]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][6]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][7]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][8]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][9]);
	PlayerTextDrawHide(playerid, CodeHubPoliceTD[playerid][10]);    
    CancelSelectTextDraw(playerid);
    return 1;
}
ShowPoliceCodeHub(playerid)
{
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][0]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][1]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][2]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][3]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][4]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][5]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][6]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][7]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][8]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][9]);
	PlayerTextDrawShow(playerid, CodeHubPoliceTD[playerid][10]);    
    SelectTextDraw(playerid, 0xFF0000FF);
    return 1;
}
CMD:menu(playerid)
{
    ShowPoliceCodeHub(playerid);
    return 1;
}
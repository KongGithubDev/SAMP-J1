#include <YSI_Coding\y_hooks>
#include <sampvoice>

new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... }, 
    PlayerText: Microphone[MAX_PLAYERS][4], playerMicrophone[MAX_PLAYERS];

hook OnPlayerConnect(playerid) {
	if(!SvGetVersion(playerid))
	{
		SendClientMessage(playerid, -1, "Connect {FF0000}SAMPVOICE ล้มเหลว{FFFFFF} กรุณาอัพเดทเวอร์ชั่น");
	}
	else if(!SvHasMicro(playerid))
	{
		SendClientMessage(playerid, -1, "Connect {FF0000}SAMPVOICE ล้มเหลว{FFFFFF} คุณยังไม่ได้ลงตัวเสริมไมค์");
	}
	else if((lstream[playerid] = SvCreateDLStreamAtPlayer(9.0, SV_INFINITY, playerid, 0x9ACD32AA, "Normal")))
	{ 
		SendClientMessage(playerid, -1, "Connect {00FF00}SAMPVOICE เรียบร้อยแล้ว {FFFFFF}(Version 3.0 Alpha)");
		SvAddKey(playerid, 0x42);
	}
    Microphone[playerid][0] = CreatePlayerTextDraw(playerid, 541.000, 399.000, "Normal");
    PlayerTextDrawLetterSize(playerid, Microphone[playerid][0], 0.290, 1.500);
    PlayerTextDrawAlignment(playerid, Microphone[playerid][0], 1);
    PlayerTextDrawColor(playerid, Microphone[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, Microphone[playerid][0], 1);
    PlayerTextDrawSetOutline(playerid, Microphone[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, Microphone[playerid][0], 150);
    PlayerTextDrawFont(playerid, Microphone[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, Microphone[playerid][0], 1);

    Microphone[playerid][1] = CreatePlayerTextDraw(playerid, 536.000, 397.000, "I");
    PlayerTextDrawLetterSize(playerid, Microphone[playerid][1], 0.300, 2.000);
    PlayerTextDrawAlignment(playerid, Microphone[playerid][1], 1);
    PlayerTextDrawColor(playerid, Microphone[playerid][1], -5963521);
    PlayerTextDrawSetShadow(playerid, Microphone[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, Microphone[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, Microphone[playerid][1], -1);
    PlayerTextDrawFont(playerid, Microphone[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, Microphone[playerid][1], 1);

    Microphone[playerid][2] = CreatePlayerTextDraw(playerid, 532.000, 395.000, "I");
    PlayerTextDrawLetterSize(playerid, Microphone[playerid][2], 0.300, 2.399);
    PlayerTextDrawAlignment(playerid, Microphone[playerid][2], 1);
    PlayerTextDrawColor(playerid, Microphone[playerid][2], -5963521);
    PlayerTextDrawSetShadow(playerid, Microphone[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, Microphone[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, Microphone[playerid][2], -1);
    PlayerTextDrawFont(playerid, Microphone[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, Microphone[playerid][2], 1);

    Microphone[playerid][3] = CreatePlayerTextDraw(playerid, 528.000, 392.000, "I");
    PlayerTextDrawLetterSize(playerid, Microphone[playerid][3], 0.300, 2.999);
    PlayerTextDrawAlignment(playerid, Microphone[playerid][3], 1);
    PlayerTextDrawColor(playerid, Microphone[playerid][3], -5963521);
    PlayerTextDrawSetShadow(playerid, Microphone[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, Microphone[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, Microphone[playerid][3], -1);
    PlayerTextDrawFont(playerid, Microphone[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, Microphone[playerid][3], 1);
	return 1;
}

forward OnPlayerSettingsVoice(playerid, bool: status);
public OnPlayerSettingsVoice(playerid, bool: status)
{
	switch(status)
	{
		case 0:
		{
			lstream[playerid] = SvCreateDLStreamAtPlayer(2.5, SV_INFINITY, playerid, 0x9ACD32AA, "Whisper");
			SendClientMessage(playerid, -1, "{00FF00}SAMPVOICE{FFFFFF}: คุณได้ทำการปรับวงไมค์ {FFC9BA}กระชิบ");
            PlayerPlaySound(playerid, 1149, 0.0, 0.0, 0.0);
		}
		case 1:
		{
			lstream[playerid] = SvCreateDLStreamAtPlayer(9.0, SV_INFINITY, playerid, 0x9ACD32AA, "Normal");
			SendClientMessage(playerid, -1, "{00FF00}SAMPVOICE{FFFFFF}: คุณได้ทำการปรับวงไมค์ {FFC9BA}ปกติ");
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
		case 2:
		{
			lstream[playerid] = SvCreateDLStreamAtPlayer(17.0, SV_INFINITY, playerid, 0x9ACD32AA, "Shout");
			SendClientMessage(playerid, -1, "{00FF00}SAMPVOICE{FFFFFF}: คุณได้ทำการปรับวงไมค์ {FFC9BA}ตะโกน");
            PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		}
	}
    return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
	if(lstream[playerid])
	{
		SvDeleteStream(lstream[playerid]);
		lstream[playerid] = SV_NULL;
	}
	return 1;
	
}

hook OnPlayerSpawn(playerid)
{
    ShowPlayerMic(playerid, true);
}

ShowPlayerMic(playerid, bool:enable)
{
    new micstring[256];
	if(enable == true)
	{
        if(!playerMicrophone[playerid])
        {
            playerMicrophone[playerid] = 1;
            PlayerTextDrawColor(playerid, Microphone[playerid][1], 0x00FF00FF);
            PlayerTextDrawColor(playerid, Microphone[playerid][2], 0x00FF00FF);
            PlayerTextDrawShow(playerid, Microphone[playerid][0]);
            PlayerTextDrawShow(playerid, Microphone[playerid][1]);
            PlayerTextDrawShow(playerid, Microphone[playerid][2]);
            PlayerTextDrawHide(playerid, Microphone[playerid][3]);
            format(micstring, sizeof(micstring), "Normal");
	        PlayerTextDrawSetString(playerid, Microphone[playerid][0], micstring);
        }
        else if (playerMicrophone[playerid] == 1)
        {
            playerMicrophone[playerid] = 2;
            PlayerTextDrawColor(playerid, Microphone[playerid][1], 0xFF0000FF);
            PlayerTextDrawColor(playerid, Microphone[playerid][2], 0xFF0000FF);
            PlayerTextDrawColor(playerid, Microphone[playerid][3], 0xFF0000FF);
            PlayerTextDrawShow(playerid, Microphone[playerid][0]);
            PlayerTextDrawShow(playerid, Microphone[playerid][1]);
            PlayerTextDrawShow(playerid, Microphone[playerid][2]);
            PlayerTextDrawShow(playerid, Microphone[playerid][3]);
            format(micstring, sizeof(micstring), "Shout");
	        PlayerTextDrawSetString(playerid, Microphone[playerid][0], micstring);
        }
        else if (playerMicrophone[playerid] == 2)
        {
            playerMicrophone[playerid] = 0;
            PlayerTextDrawColor(playerid, Microphone[playerid][1], 0xD18D2DFF);
            PlayerTextDrawShow(playerid, Microphone[playerid][0]);
            PlayerTextDrawShow(playerid, Microphone[playerid][1]);
            PlayerTextDrawHide(playerid, Microphone[playerid][2]);
            PlayerTextDrawHide(playerid, Microphone[playerid][3]);
            format(micstring, sizeof(micstring), "Whisper");
	        PlayerTextDrawSetString(playerid, Microphone[playerid][0], micstring);
        }
	}
	else
	{
        PlayerTextDrawHide(playerid, Microphone[playerid][0]);
        PlayerTextDrawHide(playerid, Microphone[playerid][1]);
        PlayerTextDrawHide(playerid, Microphone[playerid][2]);
        PlayerTextDrawHide(playerid, Microphone[playerid][3]);
	}
	return 1;
}

forward CloseCircle(playerid);
public CloseCircle(playerid)
{
    DisablePlayerCheckpoint(playerid);
}

alias:setmic("ปรับไมค์")
CMD:setmic(playerid, params[])
{
	{
        new micstring[256];
        if(!playerMicrophone[playerid])
        {
            playerMicrophone[playerid] = 1;
            PlayerTextDrawColor(playerid, Microphone[playerid][1], 0x00FF00FF);
            PlayerTextDrawColor(playerid, Microphone[playerid][2], 0x00FF00FF);
            PlayerTextDrawShow(playerid, Microphone[playerid][0]);
            PlayerTextDrawShow(playerid, Microphone[playerid][1]);
            PlayerTextDrawShow(playerid, Microphone[playerid][2]);
            PlayerTextDrawHide(playerid, Microphone[playerid][3]);
            format(micstring, sizeof(micstring), "Normal");
	        PlayerTextDrawSetString(playerid, Microphone[playerid][0], micstring);
            CallRemoteFunction("OnPlayerSettingsVoice", "ib", playerid, 1); // โหมดปกติ
            SetPlayerCheckpoint(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z], 7.0);
            SetTimerEx("CloseCircle", 1000, false, "d", playerid);
        }
        else if (playerMicrophone[playerid] == 1)
        {
            playerMicrophone[playerid] = 2;
            PlayerTextDrawColor(playerid, Microphone[playerid][1], 0xFF0000FF);
            PlayerTextDrawColor(playerid, Microphone[playerid][2], 0xFF0000FF);
            PlayerTextDrawColor(playerid, Microphone[playerid][3], 0xFF0000FF);
            PlayerTextDrawShow(playerid, Microphone[playerid][0]);
            PlayerTextDrawShow(playerid, Microphone[playerid][1]);
            PlayerTextDrawShow(playerid, Microphone[playerid][2]);
            PlayerTextDrawShow(playerid, Microphone[playerid][3]);
            format(micstring, sizeof(micstring), "Shout");
	        PlayerTextDrawSetString(playerid, Microphone[playerid][0], micstring);
            CallRemoteFunction("OnPlayerSettingsVoice", "ib", playerid, 2); // โหมดกระโกน
            SetPlayerCheckpoint(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z], 15.0);
            SetTimerEx("CloseCircle", 1000, false, "d", playerid);
        }
        else if (playerMicrophone[playerid] == 2)
        {
            playerMicrophone[playerid] = 0;
            PlayerTextDrawColor(playerid, Microphone[playerid][1], 0xD18D2DFF);
            PlayerTextDrawShow(playerid, Microphone[playerid][0]);
            PlayerTextDrawShow(playerid, Microphone[playerid][1]);
            PlayerTextDrawHide(playerid, Microphone[playerid][2]);
            PlayerTextDrawHide(playerid, Microphone[playerid][3]);
            format(micstring, sizeof(micstring), "Whisper");
	        PlayerTextDrawSetString(playerid, Microphone[playerid][0], micstring);
            CallRemoteFunction("OnPlayerSettingsVoice", "ib", playerid, 0); // โหมดกระชิบ
            SetPlayerCheckpoint(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z], 3.0);
            SetTimerEx("CloseCircle", 1000, false, "d", playerid);
        }
    }
}
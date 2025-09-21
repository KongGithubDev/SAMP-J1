#include <YSI_Coding\y_hooks>

new ACWarning[MAX_PLAYERS],
    ACWarningCode2[MAX_PLAYERS],
	StopACWarning[MAX_PLAYERS];

new const CHEAT_NAME[][] =
{
	{"AirBreak (onfoot)"},
	{"AirBreak (in vehicle)"},
	{"teleport hack (onfoot)"},
	{"teleport hack (in vehicle)"},
	{"teleport hack (into/between vehicles)"},
	{"teleport hack (vehicle to player)"},
	{"teleport hack (pickups)"},
	{"FlyHack (onfoot)"},
	{"FlyHack (in vehicle)"},
	{"SpeedHack (onfoot)"},
	{"SpeedHack (in vehicle)"},
	{"Health hack (in vehicle)"},
	{"Health hack (onfoot)"},
	{"Armour hack"},
	{"Money hack"},
	{"Weapon hack"},
	{"Ammo hack (add)"},
	{"Ammo hack (infinite)"},
	{"Special actions hack"},
	{"GodMode from bullets (onfoot)"},
	{"GodMode from bullets (in vehicle)"},
	{"Invisible hack"},
	{"lagcomp-spoof"},
	{"Tuning hack"},
	{"Parkour mod"},
	{"Quick turn"},
	{"Rapid fire"},
	{"FakeSpawn"},
	{"FakeKill"},
	{"Pro Aim"},
	{"CJ run"},
	{"CarShot"},
	{"CarJack"},
	{"UnFreeze"},
	{"AFK Ghost"},
	{"Full Aiming"},
	{"Fake NPC"},
	{"Reconnect"},
	{"High ping"},
	{"Dialog hack"},
	{"Protection from the sandbox"},
	{"Protection against an invalid version"},
	{"Rcon hack"},
	{"Tuning crasher"},
	{"Invalid seat crasher"},
	{"Dialog crasher"},
	{"Attached object crasher"},
	{"Weapon Crasher"},
	{"Flood protection connects to one slot"},
	{"callback functions"},
	{"change seat"},
	{"Ddos"},
	{"NOP's}"}
};



hook OnPlayerConnect(playerid) {
	ACWarning[playerid] = 0;
	ACWarningCode2[playerid] = 0;
//    toggleACChat{playerid} = true;
    return 1;
}

ptask WarningRemove[30000](playerid) {
	if (ACWarning[playerid]) {
		ACWarning[playerid]--;
	}	

	if (ACWarningCode2[playerid]) {
		ACWarningCode2[playerid]--;
	}
}

forward OnCheatDetected(playerid, const ip_address[], type, code); 
public OnCheatDetected(playerid, const ip_address[], type, code) 
{	
	if(playerData[playerid][IsLoggedIn] == true) {

		if(type) {
			if(playerData[playerid][pAdmin] == 0 && isPlayerAndroid(playerid) != 0) {
				SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: IP %s ถูกสงสัยว่าใช้โปรแกรมโกงรหัส %s (#%d)", ip_address, CHEAT_NAME[code], code);
				// BlockIpAddress(ip_address, 0);
			}
		}
		else 
		{ 
			switch(code) 
			{
				case 5, 6, 11, 22, 26, 27: return 1; 
				case 12: {
					new Float:hp;
					AntiCheatGetHealth(playerid, hp);
					SetPlayerHealth(playerid, hp);
					return 1; 
				}
				case 13: {
					new Float:hp;
					AntiCheatGetArmour(playerid, hp);
					SetPlayerArmour(playerid, hp);
					return 1; 
				}
				case 14: 
				{ 
					// new a = AntiCheatGetMoney(playerid); 
					ResetPlayerMoney(playerid); 
					GivePlayerMoney(playerid, playerData[playerid][pMoney]); 
					return 1; 
				}
			}

			if(playerData[playerid][pAdmin] == 0) 
			{
				if (code == 44 || code == 21 || code == 24 || code == 33 || code == 36 || code == 39)  {
				
					return 1;
				}
				
				if (code == 15 || code == 16 || code == 2)
				{
					if(StopACWarning[playerid] == 0)
					{
						SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: [%d]%s ถูกเตะเนื่องจากถุกเตือนด่วยโค๊ตรุนแรง %s (#%d)", playerid, GetPlayerNameEx(playerid),CHEAT_NAME[code], code);
						SendClientMessageEx(playerid, -1, "คุณโดน ANTI-CHEAT เตะออกจากเซิฟเวอร์สาเหตุ %s (#%d)",CHEAT_NAME[code], code); 
						Kick(playerid);
						return 1;
					}
					else return 1;
				}

				if (isPlayerAndroid(playerid) != 0 && (code == 4 || code == 32 || code == 39 || code == 52 || code == 47 || code == 21)) {
					return 1;
				}

				if (isPlayerAndroid(playerid) == 0) SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: [%d]%s ถูกสงสัยว่าใช้โปรแกรมโกงรหัส %s (#%d) (%d)", playerid, GetPlayerNameEx(playerid), CHEAT_NAME[code], code, ACWarning[playerid]);
				else SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: [%d]%s ถูกสงสัยว่าใช้โปรแกรมโกงรหัส %s (#%d) (%d) [เล่นบน Android]", playerid, GetPlayerNameEx(playerid), CHEAT_NAME[code], code, ACWarning[playerid]);
				
				ACWarning[playerid]++;

				if (ACWarning[playerid] >= 3) {
					SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: [%d]%s ถูกเตะเนื่องจากถูกเตือนมากกว่า 3 ครั้งจาก Nex-AC", playerid, GetPlayerNameEx(playerid));
					SendClientMessageEx(playerid, -1, "คุณโดน ANTI-CHEAT เตะออกจากเซิฟเวอร์สาเหตุ %s (#%d)",CHEAT_NAME[code], code); 
					Kick(playerid);
					return 1;
				}
			}
		}
	}
    return 1; 
}

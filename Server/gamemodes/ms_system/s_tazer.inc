#include	<YSI_Coding\y_hooks>

static TazerCooldown[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    TazerCooldown[playerid] = 0;
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    //printf("DEBUG: %d ยิงปืน %d", playerid, weaponid);
	if(weaponid == 23 && playerData[playerid][pTazer])
	{
		if(!TazerCooldown[playerid]) 
		{
			TazerCooldown[playerid] = 4;
			RemovePlayerWeapon(playerid, 23);
			defer Tazerexc[1000](playerid);
			defer TazerNotUsed[200](playerid);
		}
	}
    return 1;
}

timer Tazerexc[1000](playerid)
{
	if (TazerCooldown[playerid] > 0)
    {
		TazerCooldown[playerid]--;
		if(TazerCooldown[playerid] != 0)
        {
            if (TazerCooldown[playerid] == 3)
            {
                SendClientMessageEx(playerid, -1, "{FF0000}[Tazer] {ffffff}จะพร้อมใช้ในอีก %d วินาที", TazerCooldown[playerid]);
            }
            if (TazerCooldown[playerid] == 2)
            {
                SendClientMessageEx(playerid, -1, "{FF0000}[Tazer] {ffffff}จะพร้อมใช้ในอีก %d วินาที", TazerCooldown[playerid]);
            }
            if (TazerCooldown[playerid] == 1)
            {
                SendClientMessageEx(playerid, -1, "{FF0000}[Tazer] {ffffff}จะพร้อมใช้ในอีก %d วินาที", TazerCooldown[playerid]);
            }
			defer Tazerexc[1000](playerid);
		}
		else {
			playerData[playerid][pTazer] = true;
			TazerCooldown[playerid] = 0;		
			GivePlayerWeaponEx(playerid, 23, 1);
			SetPlayerArmedWeapon(playerid, 23);
			ApplyAnimation(playerid, "COLT45", "colt45_reload", 4.0, 0, 0, 0, 0, 0);
		}
	}
	return 1;
}

timer TazerNotUsed[200](playerid) {
	if (TazerCooldown[playerid] > 0) {
        if (GetPlayerWeapon(playerid) == 23) {
            SetPlayerArmedWeapon(playerid, 0);
        }	
    } 
 	return 1;
}

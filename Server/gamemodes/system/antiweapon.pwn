//ระบบกันโปรเสกอาวุธ By : Connecting_Z | Peachxy_.
#include	<YSI_Coding\y_hooks>

ptask Antiweapon[1000](playerid) //1000 = 1 วินาที
{
	if(playerData[playerid][pAdmin] >= 1) return 1;
	if(GetFactionType(playerid) != FACTION_POLICE && GetFactionType(playerid) != FACTION_GOV && GetFactionType(playerid) != FACTION_MEDIC)

	if(GetPlayerWeapon(playerid)== 16
	||GetPlayerWeapon(playerid)== 25
	||GetPlayerWeapon(playerid)== 24
	||GetPlayerWeapon(playerid)== 12
	||GetPlayerWeapon(playerid)== 11
	||GetPlayerWeapon(playerid)== 10
	||GetPlayerWeapon(playerid)== 9
	||GetPlayerWeapon(playerid)== 32
	||GetPlayerWeapon(playerid)== 31
	||GetPlayerWeapon(playerid)== 27 
	||GetPlayerWeapon(playerid)== 26
	||GetPlayerWeapon(playerid)== 17
	||GetPlayerWeapon(playerid)== 30
	||GetPlayerWeapon(playerid)== 34
	||GetPlayerWeapon(playerid)== 28
	||GetPlayerWeapon(playerid)== 29
	||GetPlayerWeapon(playerid)== 35
	||GetPlayerWeapon(playerid)== 36
	||GetPlayerWeapon(playerid)== 37
	||GetPlayerWeapon(playerid)== 38
	||GetPlayerWeapon(playerid)== 41 
	||GetPlayerWeapon(playerid)== 44
	||GetPlayerWeapon(playerid)== 45
	||GetPlayerWeapon(playerid)== 22
	||GetPlayerWeapon(playerid)== 39
	||GetPlayerWeapon(playerid)== 18
	||GetPlayerWeapon(playerid)== 42 
	||GetPlayerWeapon(playerid)== 40)
	{
		SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Melody - AC] {FFFFFF}: คุณ %s ใช้โปรแกรมช่วยเล่น : {FF6347}เสกอาวุธ", GetPlayerNameEx(playerid));
		DelayedKick(playerid); 
	}
	return 1;
}

// credit Make by Katze\dev

#include <YSI_Coding\y_hooks>

#define SET_DMG 100.00 // ตั้งค่าดาเมจที่ต้องการเช็ค

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
    new string[128], victim[MAX_PLAYER_NAME], attacker[MAX_PLAYER_NAME];
    new weaponname[24];
    new PlayerIP[17], query[150];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
    GetPlayerName(playerid, attacker, sizeof (attacker));
    GetPlayerName(damagedid, victim, sizeof (victim));
    GetWeaponName(weaponid, weaponname, sizeof (weaponname));

    if ( amount > SET_DMG || !bodypart ){

        format(string, sizeof(string), "[KATZE-DEV] %s (%.0f Dmg) ต้องสงสัยว่าโปร, ฆ่า %s ด้วย %s[%s]", attacker, amount, victim, weaponname, bodypart);

        // ส่งข้อความหาแอดมิน [ โปร | จำนวนดาเมจ | คนโดนฆ่า | อาวุธ | ตำแหน่งที่โดน ]
        SendAdminMessage(COLOR_RED, string);

        print(string); // print debug

        // แบนเข้าฐานข้อมูล SQL
        mysql_format(g_SQL, query, sizeof(query), "INSERT INTO `bans` (`Username`, `BannedBy`, `BanReason`, `IpAddress`, `Date`) VALUES ('%e', 'SYSTEM', 'FakeKill', '%e', '%e')", GetPlayerNameEx(playerid), PlayerIP, ReturnDate());
        mysql_tquery(g_SQL, query, "", "");

        // เตะออกจากเซิฟเวอร์
        DelayedKick(playerid);
    }
    return 1;
}
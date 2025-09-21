/*
	Coded by Emperor F.
*/

#include <YSI_Coding\y_hooks>

#define MAX_ITEMS 7
#define MAX_WEAPONS 5

// ของที่ใช้ซ่อมตรงกับ weaponBrokeData
new const RepairItems[MAX_WEAPONS][MAX_ITEMS][32] = {
    {"ปูน", "สายไฟ", "แร่เหลือง", "แร่เขียว", "แร่ฟ้า", "แร่แดง", "เงินเขียว"}, // สนับ
    {"ปูน", "สายไฟ", "แร่เหลือง", "แร่เขียว", "แร่ฟ้า", "แร่แดง", "เงินเขียว"}, // ไม้กอล์ฟ
    {"ปูน", "สายไฟ", "แร่เหลือง", "แร่เขียว", "แร่ฟ้า", "แร่แดง", "เงินเขียว"}, // ไม้เบสบอล
    {"ปูน", "สายไฟ", "แร่เหลือง", "แร่เขียว", "แร่ฟ้า", "แร่แดง", "เงินเขียว"}, // ไม้สนุ๊ก
    {"ปูน", "สายไฟ", "แร่เหลือง", "แร่เขียว", "แร่ฟ้า", "แร่แดง", "เงินเขียว"}  // คาตานะ (ไอติม)
};

new const RepairAmount[MAX_WEAPONS][MAX_ITEMS] = {
    {10, 10, 10, 10, 10, 10, 10000}, // สนับ
    {10, 10, 10, 10, 10, 10, 10000}, // ไม้กอล์ฟ
    {10, 10, 10, 10, 10, 10, 10000}, // ไม้เบสบอล
    {10, 10, 10, 10, 10, 10, 10000}, // ไม้สนุ๊ก
    {10, 10, 10, 10, 10, 10, 10000}  // คาตานะ (ไอติม)
};


//1557.2289,-1364.3022,329.4535
//พิกัด x y z
static Float:x = 1557.2289, Float:y = -1364.3022, Float:z = 329.4535;

static weaponCountState[MAX_PLAYERS];
static weaponInvIdx[MAX_PLAYERS];
static weaponRepairName[MAX_PLAYERS][];
static repairWeaponIndex[MAX_PLAYERS]; 

enum e_WEAPON_BROKE_DATA {
	weaponName[64],
	weaponId
};

//**************ชื่อต้องตรงเหมือนกันกับใน item data  ************ */
new weaponBrokeData[][e_WEAPON_BROKE_DATA] = {
	{"สนับมือ", 1}, 
	{"ไม้กอล์ฟ", 2},
	{"ไม้เบสบอล", 5},
	{"ไม้สนุ๊ก", 7},
	{"ไอติม", 8} // คาตานะ
};

hook OnGameModeInit()
{
	CreateDynamic3DTextLabel("{FFFF00}[ซ่อมอาวุธ]\n{FFFFFF}กด N", COLOR_GREEN, x, y, z, 20);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO)
    {
        if (IsPlayerInRangeOfPoint(playerid, 1.0, x, y, z))
        {
            new query[512];
            mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `inventory` WHERE `invOwner` = '%d' ORDER BY FIELD(invItem, '%s','%s','%s','%s','%s')", playerData[playerid][pID], weaponBrokeData[0][weaponName], weaponBrokeData[1][weaponName]
            , weaponBrokeData[2][weaponName], weaponBrokeData[3][weaponName], weaponBrokeData[4][weaponName]);
            mysql_tquery(g_SQL, query, "LoadWeaponBroke", "d", playerid);
        }
    }
}

forward LoadWeaponBroke(playerid);
public LoadWeaponBroke(playerid)
{
    new str[512];
    new weaponList[512], count, name[64], Float:brokeVal;
	static
	    rows;

	cache_get_row_count(rows);

    format(str, sizeof(str), "{FCFC11}ไอเท็ม\t{FFFFFF}ความทนทาน\n");
    strcat(weaponList,str);

	for (new i = 0; i < rows && i < MAX_INVENTORY; i ++)
	{
		cache_get_value_name(i, "invItem", name, 32);
		cache_get_value_name_float(i, "invBroke", brokeVal);

        if (brokeVal == 0.0)
        {
            format(str, sizeof(str), "{FCFC11}%s\t{FFFFFF}%.2f\n", name, brokeVal);
            strcat(weaponList,str);
            count ++;
        }
	}
    if (!count) return SendClientMessage(playerid, COLOR_RED, "คุณไม่มีอาวุธที่ต้องซ่อม!");
    Dialog_Show(playerid, REPAIRE_WEAPON, DIALOG_STYLE_TABLIST_HEADERS, "เลือกอาวุธที่คุณต้องการจะซ่อม", weaponList, "เลือก", "ยกเลิก");
	return 1;
}

forward RepairWeapon(playerid, inventoryRow);
public RepairWeapon(playerid, inventoryRow)
{
    new rows;
    cache_get_row_count(rows);

    if (inventoryRow < 0 || inventoryRow >= rows)
    {
        SendClientMessage(playerid, COLOR_RED, "Inventory row ไม่ถูกต้อง ติดต่อผู้พฒนา!");
        return 0;
    }

    new name[64];
    cache_get_value_name(inventoryRow, "invItem", name, sizeof(name));

    new weaponIndex = -1;
    for (new w = 0; w < sizeof(weaponBrokeData); w++)
    {
        if (!strcmp(name, weaponBrokeData[w][weaponName], true))
        {
            weaponIndex = w;
            break;
        }
    }

    if (weaponIndex == -1)
    {
        SendClientMessage(playerid, COLOR_RED, "ไม่พบข้อมูลอาวุธในระบบ!");
        return 0;
    }
    PrintRepairItemsByIndex(playerid, weaponIndex);
    return 1;
}

Dialog:REPAIRE_WEAPON(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        new query[512];
        mysql_format(g_SQL, query, sizeof(query),
            "SELECT * FROM `inventory` WHERE `invOwner` = %d AND `invBroke` = 0.0 ORDER BY FIELD(invItem, '%s','%s','%s','%s','%s')", playerData[playerid][pID], weaponBrokeData[0][weaponName], weaponBrokeData[1][weaponName]
            , weaponBrokeData[2][weaponName], weaponBrokeData[3][weaponName], weaponBrokeData[4][weaponName]);
        mysql_tquery(g_SQL, query, "RepairWeapon", "dd", playerid, listitem);
    }
    return 1;
}
stock PrintRepairItemsByIndex(playerid, weaponIndex)
{
	if (weaponIndex < 0 || weaponIndex >= MAX_WEAPONS)
	{
		SendClientMessageEx(playerid, -1, "[ERROR] Weapon index %d ไม่ถูกต้อง", weaponIndex);
		return 0;
	}
    repairWeaponIndex[playerid] = weaponIndex;
	new str[1024];
	new tmp[128];
	format(str, sizeof(str), "อาวุธ: %s\n", weaponBrokeData[weaponIndex][weaponName]);
	for (new i = 0; i < MAX_ITEMS; i++)
	{
		format(tmp, sizeof(tmp), " - %s: %d\n", RepairItems[weaponIndex][i], RepairAmount[weaponIndex][i]);
		strcat(str, tmp, sizeof(str));
	}
	Dialog_Show(playerid, DIALOG_RP_CONFIRM, DIALOG_STYLE_MSGBOX,"ยืนยันการซ่อมอาวุธ",str,"ซ่อม", "ยกเลิก");

	return 1;
}
Dialog:DIALOG_RP_CONFIRM(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new weaponIndex = repairWeaponIndex[playerid];
        for (new i = 0; i < MAX_ITEMS-1; i++)
        {
            if (Inventory_Count(playerid, RepairItems[weaponIndex][i]) < RepairAmount[weaponIndex][i])
            {
                SendClientMessageEx(playerid, COLOR_RED, "คุณมี %s ไม่เพียงพอ", RepairItems[weaponIndex][i]);
                return 1;
            }
        }
        if (GetPlayerMoneyEx(playerid) < RepairAmount[weaponIndex][6])
        {
            SendClientMessageEx(playerid, COLOR_RED, "คุณมีเงินไม่เพียงพอ");
            return 1;
        }
        else
        {
            for (new i = 0; i < MAX_ITEMS-1; i++)
            {
                Inventory_Remove(playerid, RepairItems[weaponIndex][i], RepairAmount[weaponIndex][i]);
            }
            GivePlayerMoneyEx(playerid, -RepairAmount[weaponIndex][6]);
        }
        
		new query[512];
		mysql_format(g_SQL, query, sizeof(query), "UPDATE inventory SET invBroke = 100.0 WHERE invOwner = %d AND invItem = '%s' LIMIT 1",
			playerData[playerid][pID], weaponBrokeData[weaponIndex][weaponName]
		);
		mysql_tquery(g_SQL, query);
        new idw = Inventory_GetItemID(playerid, weaponBrokeData[weaponIndex][weaponName]); 
        invData[playerid][idw][invBroke] = 100;
        SendClientMessageEx(playerid, COLOR_GREEN, "คุณได้ซ่อมอาวุธ %s สำเร็จ", weaponBrokeData[weaponIndex][weaponName]);
	}
	return 1;
}
hook OnPlayerConnect(playerid)
{
	weaponCountState[playerid] = 0;
	weaponInvIdx[playerid] = -1;

	return 1;
}

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	if (damagedid != INVALID_PLAYER_ID)
	{
		if (weaponInvIdx[playerid] != -1)
		{
			if (weaponCountState[playerid] == weaponid 
				&& invData[playerid][weaponInvIdx[playerid]][invBroke] >= 0.5)
			{
				invData[playerid][weaponInvIdx[playerid]][invBroke] -= 0.5;

                new string[512];
                mysql_format(g_SQL, string, sizeof(string), "UPDATE `inventory` SET `invBroke` = %.2f WHERE `invOwner` = '%d' AND `invID` = '%d'", invData[playerid][weaponInvIdx[playerid]][invBroke], playerData[playerid][pID], invData[playerid][weaponInvIdx[playerid]][invID]);
                mysql_tquery(g_SQL, string);
                if (invData[playerid][weaponInvIdx[playerid]][invBroke] <= 0.0)
                {
                    ResetPlayerWeaponsEx(playerid);
                    SendClientMessage(playerid, 0xFF0000AA, "อาวุธของคุณพังแล้ว กรุณาซ่อมก่อนใช้งาน!");
                }
			}
		}
	}
	return 1;
}

PlayerClickItem(playerid, itemid, name[])
{
	if (itemid >= 0 && itemid < MAX_INVENTORY)
	{
		weaponInvIdx[playerid] = itemid;
	}
	return 1;
}

IsWeaponBroke(playerid, const name[])
{
	if (weaponInvIdx[playerid] != -1)
	{
		if (invData[playerid][weaponInvIdx[playerid]][invBroke] <= 0.0)
		{
			SendClientMessage(playerid, 0xFF0000AA, "อาวุธของคุณพัง กรุณาซ่อมก่อนใช้งาน!");
			weaponCountState[playerid] = 0;
            return 1;
		}
	}

	for (new i = 0; i < sizeof(weaponBrokeData); i++)
	{
		if (!strcmp(name, weaponBrokeData[i][weaponName], true))
		{
			weaponCountState[playerid] = weaponBrokeData[i][weaponId];
			break;
		}
	}
	return 0;
}


stock getname_inventory(const item[]) {
	new x;
    for (new i = 0; i < sizeof(itemData); i ++) {
        if(!strcmp(itemData[i][itemName], item, true)) {
            x = i;
            break;
        }
    }
    return x;
}

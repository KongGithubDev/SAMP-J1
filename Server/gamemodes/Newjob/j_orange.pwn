#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_ORANGE       	9
#define     ORANGEOBJECT       	15068
#define     ORANGETEXT           "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     ORANGENAME           "ส้ม"

static OrangeTake[MAX_PLAYERS];
enum ORANGE_DATA{
    orangeID,
    orangeObject,
    Float: orangePos[3],
    Text3D: orange3D,
    orange3DMSG[80],
    orangeOn
};

new const orangeData[MAX_ORANGE][ORANGE_DATA] ={
	{ 0, ORANGEOBJECT, { 1479.291992, -70.037094, 18.977657 }, Text3D: INVALID_3DTEXT_ID, ORANGETEXT, 0 },
	{ 1, ORANGEOBJECT, { 1447.264770, -72.870033, 18.908229 }, Text3D: INVALID_3DTEXT_ID, ORANGETEXT, 0 },
	{ 2, ORANGEOBJECT, { 1464.032104, -71.455307, 18.950044 }, Text3D: INVALID_3DTEXT_ID, ORANGETEXT, 0 },
	{ 3, ORANGEOBJECT, { 1442.441406, -54.012931, 21.263214 }, Text3D: INVALID_3DTEXT_ID, ORANGETEXT, 0 },
	{ 4, ORANGEOBJECT, { 1463.768798, -52.024955, 20.782144 }, Text3D: INVALID_3DTEXT_ID, ORANGETEXT, 0 },
	{ 5, ORANGEOBJECT, { 1479.602661, -53.245193, 20.256366 }, Text3D: INVALID_3DTEXT_ID, ORANGETEXT, 0 },
	{ 6, ORANGEOBJECT, { 1479.022583, -36.595081, 21.725208 }, Text3D: INVALID_3DTEXT_ID, ORANGETEXT, 0 },
	{ 7, ORANGEOBJECT, { 1462.439331, -37.583892, 22.326099 }, Text3D: INVALID_3DTEXT_ID, ORANGETEXT, 0 },
	{ 8, ORANGEOBJECT, { 1438.397216, -40.509784, 23.085929 }, Text3D: INVALID_3DTEXT_ID, ORANGETEXT, 0 }
};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(orangeData); i++){
		orangeData[i][orangeID] = CreateDynamicObject(orangeData[i][orangeObject], orangeData[i][orangePos][0], orangeData[i][orangePos][1], orangeData[i][orangePos][2], 0.0, 0.0, 0.0);
		orangeData[i][orange3D] = CreateDynamic3DTextLabel(orangeData[i][orange3DMSG], COLOR_GREEN, orangeData[i][orangePos][0], orangeData[i][orangePos][1], orangeData[i][orangePos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid){
	OrangeTake[playerid] = 0;
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
        for(new i = 0; i < sizeof orangeData; i++){   
			new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(orangeData[i][orangeID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)){
                if(IsValidDynamicObject(orangeData[i][orangeID])){
					if(OrangeTake[playerid] == 0){
                        
						new ammo = Inventory_Count(playerid, "ส้ม");
                    	if(Inventory_Count(playerid, "ส้ม") >= 50) // คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
                       	return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);

	                    orangeData[i][orangeOn] = 1;
		                TogglePlayerControllable(playerid, false);
		                ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 0, 0, 1);
		                defer PlayerOrangeUnfreeze[10*1000](playerid, i);
						OrangeTake[playerid] = 1;
                        StartProgress(playerid, 100, 0, 0);
		                return 1;
	                }
	                else {
	                    //SendClientMessage(playerid, COLOR_RED, "[[ระบบ]] Error OrangeJob Please wait."); //DeBug
	                }
                }
            }
		}
    }
	return 1;
}

Dialog:DIALOG_SELLORANGE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "ส้ม");
				new price = ammo*priceOrange;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ส้ม อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ส้ม {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ส้ม" , ammo);
		    }
		}
	}
	return 1;
}

ptask OrangeJob[1000](playerid){
	if(OrangeTake[playerid] == 1){
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 0, 0, 1);
		return 1;
	}
	return 1;
}

timer PlayerOrangeUnfreeze[1000](playerid, number){
	PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
	TogglePlayerControllable(playerid, true);
	ClearAnimations(playerid);
	OrangeTake[playerid] = 0;
	DestroyDynamicObject(orangeData[number][orangeID]);
	DestroyDynamic3DTextLabel(orangeData[number][orange3D]);
	orangeData[number][orangeOn] = 0;
	defer CreateOrangeObject(number);
	new ammo = Inventory_Count(playerid, "ส้ม");
    if(Inventory_Count(playerid, "ส้ม") >= 50) // คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);
	new id = Inventory_Add(playerid, "ส้ม", 1);
	if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[แจ้งเตือน] {ffffff}ความจุของกระเป๋าไม่เพียงพอ");
	
    SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff}คุณได้รับ {00FF00}ส้ม +1");
    return 1;
}

timer CreateOrangeObject[10000](number){
	orangeData[number][orangeID] = CreateDynamicObject(orangeData[number][orangeObject], orangeData[number][orangePos][0], orangeData[number][orangePos][1], orangeData[number][orangePos][2], 0.0, 0.0, 0.0);
	orangeData[number][orange3D] = CreateDynamic3DTextLabel(orangeData[number][orange3DMSG], COLOR_GREEN, orangeData[number][orangePos][0], orangeData[number][orangePos][1], orangeData[number][orangePos][2] + 1.5, 5.0);
}

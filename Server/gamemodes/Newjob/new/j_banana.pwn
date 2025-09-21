#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_BANANA       	9
#define     BANANAOBJECT       	15082
#define     BANANATEXT           "{FFFFFF}�� {FFFF00}N {FFFFFF}������"
#define     BANANANAME           "�����"

static BananaTake[MAX_PLAYERS];
enum BANANA_DATA{
    bananaID,
    bananaObject,
    Float: bananaPos[3],
    Text3D: banana3D,
    banana3DMSG[80],
    bananaOn
};

new const bananaData[MAX_BANANA][BANANA_DATA] ={
	{ 0, BANANAOBJECT, { -967.856018, -587.841979, 25.319290 }, Text3D: INVALID_3DTEXT_ID, BANANATEXT, 0 },
	{ 1, BANANAOBJECT, { -955.485900, -586.561950, 25.017330 }, Text3D: INVALID_3DTEXT_ID, BANANATEXT, 0 },
	{ 2, BANANAOBJECT, { -943.176391, -585.255920, 24.834999 }, Text3D: INVALID_3DTEXT_ID, BANANATEXT, 0 },
	{ 3, BANANAOBJECT, { -942.463195, -573.431579, 24.875003 }, Text3D: INVALID_3DTEXT_ID, BANANATEXT, 0 },
	{ 4, BANANAOBJECT, { -955.415649, -572.998291, 24.727951 }, Text3D: INVALID_3DTEXT_ID, BANANATEXT, 0 },
	{ 5, BANANAOBJECT, { -968.494079, -575.677795, 24.644989 }, Text3D: INVALID_3DTEXT_ID, BANANATEXT, 0 },
	{ 6, BANANAOBJECT, { -969.099426, -563.605590, 26.251501 }, Text3D: INVALID_3DTEXT_ID, BANANATEXT, 0 },
	{ 7, BANANAOBJECT, { -954.674072, -562.878784, 26.555675 }, Text3D: INVALID_3DTEXT_ID, BANANATEXT, 0 },
	{ 8, BANANAOBJECT, { -941.605285, -564.598937, 26.192867 }, Text3D: INVALID_3DTEXT_ID, BANANATEXT, 0 }
};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(bananaData); i++){
		bananaData[i][bananaID] = CreateDynamicObject(bananaData[i][bananaObject], bananaData[i][bananaPos][0], bananaData[i][bananaPos][1], bananaData[i][bananaPos][2], 0.0, 0.0, 0.0);
		bananaData[i][banana3D] = CreateDynamic3DTextLabel(bananaData[i][banana3DMSG], COLOR_GREEN, bananaData[i][bananaPos][0], bananaData[i][bananaPos][1], bananaData[i][bananaPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid){
	BananaTake[playerid] = 0;
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
        for(new i = 0; i < sizeof bananaData; i++){   
			new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(bananaData[i][bananaID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)){
                if(IsValidDynamicObject(bananaData[i][bananaID])){
					if(BananaTake[playerid] == 0){
                       
						new ammo = Inventory_Count(playerid, "�����");
                    	if(Inventory_Count(playerid, "�����") >= 50) //  ��ͨ�����ѹ�ѹ������� ��Ѻ������
                       		return SendClientMessageEx(playerid, COLOR_RED, "%d/50 �������", ammo);

	                    bananaData[i][bananaOn] = 1;
		                TogglePlayerControllable(playerid, false);
		                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		                defer PlayerBananaUnfreeze[10*1000](playerid, i);
						BananaTake[playerid] = 1;
                        StartProgress(playerid, 100, 0, 0);
		                return 1;
	                }
	                else {
	                    //SendClientMessage(playerid, COLOR_RED, "[[�к�]] Error BananaJob Please wait."); //DeBug
	                }
                }
            }
		}
    }
	return 1;
}

Dialog:DIALOG_SELLBANANA(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "�����");
				new price = ammo*priceBanana;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {FFFFFF}�س����� ����� ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� ����� {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "�����" , ammo);
		    }
		}
	}
	return 1;
}

ptask BananaJob[1000](playerid){
	if(BananaTake[playerid] == 1){
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		return 1;
	}
	return 1;
}

timer PlayerBananaUnfreeze[1000](playerid, number){
	PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
	TogglePlayerControllable(playerid, true);
	ClearAnimations(playerid);
	BananaTake[playerid] = 0;
	DestroyDynamicObject(bananaData[number][bananaID]);
	DestroyDynamic3DTextLabel(bananaData[number][banana3D]);
	bananaData[number][bananaOn] = 0;
	defer CreateBananaObject(number);
	new ammo = Inventory_Count(playerid, "�����");
    if(Inventory_Count(playerid, "�����") >= 50) // ��ͨ�����ѹ�ѹ������� ��Ѻ������
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 �������", ammo);
	new id = Inventory_Add(playerid, "�����", 1);
	if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {ffffff} �����آͧ�����������§��");
	
    SendClientMessage(playerid, COLOR_GREEN, "[ ����͹ ] {ffffff} �س���Ѻ {00FF00}����� +1");
    return 1;
}

timer CreateBananaObject[10000](number){
	bananaData[number][bananaID] = CreateDynamicObject(bananaData[number][bananaObject], bananaData[number][bananaPos][0], bananaData[number][bananaPos][1], bananaData[number][bananaPos][2], 0.0, 0.0, 0.0);
	bananaData[number][banana3D] = CreateDynamic3DTextLabel(bananaData[number][banana3DMSG], COLOR_GREEN, bananaData[number][bananaPos][0], bananaData[number][bananaPos][1], bananaData[number][bananaPos][2] + 1.5, 5.0);
}

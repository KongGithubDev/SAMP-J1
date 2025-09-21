#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

new GetStartjobDeliver1[MAX_PLAYERS];
new GetPlayerPickupBox1[MAX_PLAYERS];
new GivePlayerPickupBox1[MAX_PLAYERS];
new PlayerStartDelivery1[MAX_PLAYERS];
new CheckEnterPointDelivery1[MAX_PLAYERS];
new pizzaObject[MAX_VEHICLES];

new Float:RandomPointpizza[][] = 
{
    {1932.6237,-1776.3778,12.9832},
    {2033.4745,-1416.2494,16.5926},
    {1790.2375,-1915.2675,12.9918}, //เพิ่ม
    {1604.8274,-1708.1713,12.9593},
    {1568.5234,-1879.6793,13.1460}
};

hook OnGameModeInit()
{
    CreateDynamicPickup(1239, 23, 2104.9387,-1806.5181,13.5547);
	CreateDynamic3DTextLabel("จุดสมัครงานส่งของ:{FFFFFF} กดN\nเพื่อสมัครทำงาน", COLOR_GREEN, 2104.9387,-1806.5181,13.5547, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
    CreateDynamicPickup(1239, 23, 2097.8606,-1816.9528,13.3828);
	CreateDynamic3DTextLabel("จุดสมัครงานส่งของ:{FFFFFF} กดN\nเอาพิซซ่าไปใส่รถกดNอีกที", COLOR_GREEN, 2097.8606,-1816.9528,13.3828, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
	    if (IsPlayerInRangeOfPoint(playerid, 3.0, 2097.3540,-1816.5706,13.3828))
		{
			if(GetStartjobDeliver1[playerid] == 1)
			{
                PickupBoxDelivery1(playerid);
			}
            else
            {
                SendClientMessage(playerid, COLOR_YELLOW, "- คุณไม่ใช่พนักงานขนส่ง!!");
            }
		}

		for (new i = 1; i != MAX_VEHICLES; i ++) if (IsValidVehicle(i) && IsPlayerNearBoot(playerid, i))
		{
            if(GetPlayerPickupBox1[playerid] == 0)
                return SendClientMessage(playerid, COLOR_RED, "ไปหยิบกล่องก่อน");
			
            if (!IsGasVehicle1(i))
			 return SendClientMessage(playerid, COLOR_GREY, "คุณต้องอยู่ใกล้หลังรถ ขนของ เท่านั้น");

            if(GivePlayerPickupBox1[playerid] < 2)
            {
                new num = GetPlayerPickupBox1[playerid];
		        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		        GivePlayerPickupBox1[playerid] += num;
                GetPlayerPickupBox1[playerid] = 0;
		        RemovePlayerAttachedObject(playerid, 8);
                SendClientMessage(playerid, COLOR_RED, "ไปเอามาอีกถาด แล้วไปส่งกันเล้ยยย !");
            }
            if(GivePlayerPickupBox1[playerid] == 2)
            {
            PlayerStartDelivery1[playerid] = 1;
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
            //SetPlayerAttachedObject(playerid,4,3632,4,0.210000,-0.409999,0.105999,12.299999,-5.199997,2.099999,0.517000,0.607999,0.853000);
		    pizzaObject[i] = CreateDynamicObject(1582,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
            RemovePlayerAttachedObject(playerid, 8);
		    StartPlayerCheckPointDelivery1(playerid);
            SendClientMessage(playerid, COLOR_RED, "หยิบกล่องครบแล้ว!");
            }
		}
	    if (IsPlayerInRangeOfPoint(playerid, 3.0, 2105.2092,-1806.6708,13.5547)) 
	    {
        if (playerData[playerid][pLevel] < 0) 
			return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ต้องมีเวล 2 ขึ้นไป !");

        if(GetStartjobDeliver1[playerid] == 0)
        {
            GetStartjobDeliver1[playerid] = 1;
            SendClientMessage(playerid, COLOR_YELLOW, "- คุณได้เริ่มงาน ส่งพิซซ่า เรียบร้อยแล้ว");
            SetPlayerSkin(playerid, 155);
        }
        else if(GetStartjobDeliver1[playerid] == 1)
        {
            GetStartjobDeliver1[playerid] = 0;
            SendClientMessage(playerid, COLOR_YELLOW, "- คุณได้เลิกงานส่งพิซซ่าเรียบร้อยแล้ว");
        }
    }        
    }
    return 1;
}

PickupBoxDelivery1(playerid)
{
    if(GivePlayerPickupBox1[playerid] == 5)
        return SendClientMessage(playerid, COLOR_RED, "คุณหยิบกล่องครบ5กล่องแล้ว");

    if(PlayerStartDelivery1[playerid] == 1)
        return SendClientMessage(playerid, COLOR_RED, "คุณได้เริ่มงานแล้วไปส่งกล่องนั้นก่อน");

    if(GetPlayerPickupBox1[playerid] == 1)
        return SendClientMessage(playerid, COLOR_RED, "นำกล่องไปใส่รถ");

    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
    GetPlayerPickupBox1[playerid] += 1;
    SetPlayerAttachedObject(playerid,8,1582,4,0.345999,-0.554000,0.116999,0.000000,-95.599983,0.000000,0.850999,0.861000,1.000000);
    SendClientMessage(playerid, COLOR_YELLOW, "- คุณได้หยิบกล่องพิซซ่าเรียบร้อยแล้ว, โปรดนำมันไปใส่รถ");
    SendClientMessage(playerid, COLOR_YELLOW, "- กด 'N' เพื่อนำใส่รถ");
    return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
    if(CheckEnterPointDelivery1[playerid] == 1 && PlayerStartDelivery1[playerid] == 1) 
    {
        GetPlayerPickupBox1[playerid] = 0;
        GivePlayerPickupBox1[playerid] = 0;
        CheckEnterPointDelivery1[playerid] = 0;
        PlayerStartDelivery1[playerid] = 0;
        SendClientMessageEx(playerid, COLOR_YELLOW, "- คุณได้ส่งพิซซ่าสำเร็จและได้รับเงิน 250 บาท");
        GivePlayerExp(playerid, 5);
        SendClientMessage(playerid, COLOR_YELLOW, "ให้คุณกลับไปยังจุดรับกล่องเพื่อรับพิซซ่าและเริ่มส่งอีกครั้ง");
        GivePlayerMoneyEx(playerid, 250);
    }
    return 1;
}

StartPlayerCheckPointDelivery1(playerid)
{
    new rand = random(sizeof(RandomPointpizza));
    
    SetPlayerCheckpoint(playerid, RandomPointpizza[rand][0], RandomPointpizza[rand][1], RandomPointpizza[rand][2], 2.0);
    CheckEnterPointDelivery1[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "- ไปยังจุดสีแดง เพื่อส่งของ");
    return 1;
}

stock IsPlayerNearBoot(playerid, vehicleid)
{
	new
		Float:fX,
		Float:fY,
		Float:fZ;

	GetVehicleBoot(vehicleid, fX, fY, fZ);

	return (GetPlayerVirtualWorld(playerid) == GetVehicleVirtualWorld(vehicleid)) && IsPlayerInRangeOfPoint(playerid, 1.0, fX, fY, fZ);
}

stock GetVehicleBoot(vehicleid, &Float:x, &Float:y, &Float:z)
{
	if (!GetVehicleModel(vehicleid) || vehicleid == INVALID_VEHICLE_ID)
	    return (x = 0.0, y = 0.0, z = 0.0), 0;

	new
	    Float:pos[7]
	;
	GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, pos[0], pos[1], pos[2]);
	GetVehiclePos(vehicleid, pos[3], pos[4], pos[5]);
	GetVehicleZAngle(vehicleid, pos[6]);

	x = pos[3] - (floatsqroot(pos[1] + pos[1]) * floatsin(-pos[6], degrees));
	y = pos[4] - (floatsqroot(pos[1] + pos[1]) * floatcos(-pos[6], degrees));
 	z = pos[5];

	return 1;
}
stock IsGasVehicle1(vehicleid)
{
	switch (GetVehicleModel(vehicleid)) {
	    case 448: return 1;
	}
	return 0;
}
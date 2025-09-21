#include    <YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>


#define		BANANA_TIMERS		  5             //--> เวลา/วินาที
#define     BANANA_LIMITS         15            //--> จุดงานสูงสุด
#define     BANANA_COUNTS         60            //--> ไอเท็มสูงสุด
#define     BANANA_MODELS         11754         //--> ปรับโมเดลงาน
#define     BANANA_N_ITEM         "กล้วย"    //--> เปลี่ยนชื่อไอเท็ม

Float:GetBaDistance2D(Float:x1, Float:y1, Float:x2, Float:y2) 
{
	return floatsqroot(
		((x1 - x2) * (x1 - x2)) +
		((y1 - y2) * (y1 - y2))
	);
}

Float:BaGetAbsoluteAngle(Float:angle) 
{
	while(angle < 0.0) {
		angle += 360.0;
	}
	while(angle > 360.0) {
		angle -= 360.0;
	}
	return angle;
}

Float:GetAngleToPointBana(Float:fPointX, Float:fPointY, Float:fDestX, Float:fDestY) 
{
	return BaGetAbsoluteAngle(-(
		90.0 - (
			atan2(
				(fDestY - fPointY),
				(fDestX - fPointX)
			)
		)
	));
}
enum BANANA_DATAEX
{
    BananaID,
    BANANAModels,
    BananaTakeOn,
    Float: BananaPosX,
	Float: BananaPosY,
	Float: BananaPosZ,
    Float: BananaRotX,
	Float: BananaRotY,
	Float: BananaRotZ
};

new BananaTake[MAX_PLAYERS], 
    Autofarm_Banana[MAX_PLAYERS], 
    Autofarm_STBA[MAX_PLAYERS], 
    Timer:BananaTimer[MAX_PLAYERS]; 

new PlayerText:BananaTD[MAX_PLAYERS][2];

new const BananaData[BANANA_LIMITS][BANANA_DATAEX] =
{
	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -184.84500, -1418.12366, 5.07041, 0.000000, 0.000000, 0.000000 },
	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -209.04097, -1422.28760, 5.35367, 0.000000, 0.000000, -43.099998 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -235.49178, -1426.32959, 7.61486, 0.000000, 0.000000, -113.900001 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -261.15454, -1429.12842, 10.66180, 0.000000, 0.000000, 149.899978 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -188.41548, -1395.77161, 6.91360, 0.000000, 0.000000, 124.099937 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -214.73915, -1394.79968, 8.76976, -15.300000, 4.599999, 73.799957 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -234.46721, -1396.68005, 10.95452, -15.300000, 4.599999, 41.299957 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -261.63947, -1398.81177, 12.61481, -15.300000, 4.599999, -50.700038 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -286.23599, -1399.49438, 13.71340, -15.300000, 4.599999, 125.299926 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -287.64398, -1429.67078, 14.30984, -15.300000, 4.599999, -113.900115 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -287.79327, -1379.10474, 11.55473, -15.300000, 4.599999, -113.900115 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -262.15216, -1377.66931, 12.29498, -15.300000, 4.599999, 37.099910 },
	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -235.92728, -1377.94824, 11.59137, -15.300000, 4.599999, -72.400077 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -218.66705, -1377.12549, 9.10493, -15.300000, 4.599999, -125.900032 },
 	{ INVALID_STREAMER_ID, BANANA_MODELS, 0, -195.94620, -1376.99524, 7.09516, -15.300000, 4.599999, -125.900032 }
};

hook OnGameModeInit() 
{
	for(new i = 0; i < sizeof(BananaData); i++)
	{
		BananaData[i][BananaID] = CreateDynamicObject(BananaData[i][BANANAModels], BananaData[i][BananaPosX], BananaData[i][BananaPosY], BananaData[i][BananaPosZ], BananaData[i][BananaRotX], BananaData[i][BananaRotY], BananaData[i][BananaRotZ]);
	}
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
  	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        if (IsPlayerInRangeOfPoint(playerid, 50.0, -240.4013,-1391.4680,9.6609))
        {
            if (Autofarm_STBA[playerid] == 0)
            {
                Loaded_UIBanana(playerid);
            }
            else
            {
                Destroy_Banana(playerid);
            }
        }
    }  
    return 1;
}

timer Update_Banana[1000](playerid)
{
    if(Autofarm_STBA[playerid] == 1)
    {
        new 
            Float:PPos_X, Float:PPos_Y, Float:PPos_Z, Float:PPAngle;

        GetPlayerPos(playerid, PPos_X, PPos_Y, PPos_Z);

        PPAngle = (GetAngleToPointBana(PPos_X, PPos_Y, BananaData[Autofarm_Banana[playerid]][BananaPosX], BananaData[Autofarm_Banana[playerid]][BananaPosY]));

        if(GetBaDistance2D(BananaData[Autofarm_Banana[playerid]][BananaPosX], BananaData[Autofarm_Banana[playerid]][BananaPosY], PPos_X, PPos_Y) >= 5.0)
        {
            GetXYFromAngle(PPos_X, PPos_Y, PPAngle, 0.3);
            ApplyAnimation(playerid, "ped", "run_civi", 4.1, 1, 1, 1, 1, 0);
            SetFacingPoint(playerid, BananaData[Autofarm_Banana[playerid]][BananaPosX], BananaData[Autofarm_Banana[playerid]][BananaPosY]);
        }
        else if(GetBaDistance2D(BananaData[Autofarm_Banana[playerid]][BananaPosX], BananaData[Autofarm_Banana[playerid]][BananaPosY], PPos_X, PPos_Y) <= 3.0)
        {
            ClearAnimations(playerid);

            for(new i = 0; i < sizeof BananaData; i++)
            {
                GetDynamicObjectPos(BananaData[i][BananaID], BananaData[i][BananaPosX], BananaData[i][BananaPosY], BananaData[i][BananaPosZ]);

                if(IsPlayerInRangeOfPoint(playerid, 5.0, BananaData[i][BananaPosX], BananaData[i][BananaPosY], BananaData[i][BananaPosZ] + 0.5))
                {
                    if(IsValidDynamicObject(BananaData[i][BananaID]) && BananaData[i][BananaTakeOn] == 0)
                    {
                        if (Inventory_Count(playerid, BANANA_N_ITEM) >= BANANA_COUNTS) 
                            return SendClientMessageEx(playerid, 0xFF2847FF, "[ออโต้ฟาร์ม] {FFFFFF}แร่ของคุณเต็มกระเป๋าแล้ว ไม่สามารถเก็บได้อีก {FF2847}%d/%d", Inventory_Count(playerid, BANANA_N_ITEM), BANANA_COUNTS);

                        StartAutoProgress(playerid, 70, 0, i);
                        BananaData[i][BananaTakeOn] = 1;
                        stop BananaTimer[playerid];
                        BananaTake[playerid] = 1;
                        break;
                    }
                }
            }
            
        }
    }
    return 1;
}

Loaded_UIBanana(playerid)
{
    new strcts[64], value = random(BANANA_LIMITS-1);

    AutoFBAR[playerid] = CreatePlayerProgressBar(playerid, 18.000000, 252.000000, 93.000000, 15.500000, 0xFFCA00AA, 100.000000, 0);

    BananaTD[playerid][0] = CreatePlayerTextDraw(playerid, 2.000000, 121.000000, "autofarm:bananaEx");
    PlayerTextDrawFont(playerid, BananaTD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, BananaTD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, BananaTD[playerid][0], 123.000000, 186.500000);
    PlayerTextDrawSetOutline(playerid, BananaTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, BananaTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, BananaTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, BananaTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, BananaTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, BananaTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, BananaTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, BananaTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, BananaTD[playerid][0], 0);


    BananaTD[playerid][1] = CreatePlayerTextDraw(playerid, 62.000000, 224.800003, "0/100");
    PlayerTextDrawFont(playerid, BananaTD[playerid][1], 2);
    PlayerTextDrawLetterSize(playerid, BananaTD[playerid][1], 0.158333, 0.899999);
    PlayerTextDrawTextSize(playerid, BananaTD[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, BananaTD[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, BananaTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, BananaTD[playerid][1], 2);
    PlayerTextDrawColor(playerid, BananaTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, BananaTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, BananaTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, BananaTD[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, BananaTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, BananaTD[playerid][1], 0);

    format(strcts, sizeof(strcts), "%d/%d", Inventory_Count(playerid, BANANA_N_ITEM), BANANA_COUNTS);
    PlayerTextDrawSetString(playerid, BananaTD[playerid][1], strcts);

    PlayerTextDrawShow(playerid, BananaTD[playerid][0]);
    PlayerTextDrawShow(playerid, BananaTD[playerid][1]);
    ShowPlayerProgressBar(playerid, AutoFBAR[playerid]);

    BananaTimer[playerid] = repeat Update_Banana(playerid);
    Autofarm_Banana[playerid] = value;
    Autofarm_STBA[playerid] = 1;
    return 1;
}

Destroy_Banana(playerid)
{
    Autofarm_STBA[playerid] = 0;
    Autofarm_Banana[playerid] = 0;

    stop BananaTimer[playerid];

    if (BananaTake[playerid] == 1)
    {
        StopAutoProgress(playerid); 
    }

    PlayerTextDrawHide(playerid, BananaTD[playerid][0]);
    PlayerTextDrawDestroy(playerid, BananaTD[playerid][1]);

    
    RemovePlayerAttachedObject(playerid, 1);
    HidePlayerProgressBar(playerid, AutoFBAR[playerid]);
    DestroyPlayerProgressBar(playerid, AutoFBAR[playerid]);
    ClearAnimations(playerid);
    return 1;
}

Unfreeze_BananaFinish(playerid, number)
{
    new strcts[64];

	ClearAnimations(playerid);

	BananaTake[playerid] = 0;
	BananaData[number][BananaTakeOn] = 0;

    if (Autofarm_Banana[playerid] >= BANANA_LIMITS-1)
    {
        Autofarm_Banana[playerid] = 0;
    }
    if (Autofarm_Banana[playerid] <= BANANA_LIMITS-1)
    {
        Autofarm_Banana[playerid]++;
    }
    if (IsValidDynamicObject(BananaData[number][BananaID])) 
    {
        DestroyDynamicObject(BananaData[number][BananaID]);
        BananaData[number][BananaID] = INVALID_OBJECT_ID;
    }

	defer Banana_MinerObject(number);
	Inventory_Add(playerid, BANANA_N_ITEM, 1);
	BananaTimer[playerid] = repeat Update_Banana(playerid);

    format(strcts, sizeof(strcts), "%d/%d", Inventory_Count(playerid, BANANA_N_ITEM), BANANA_COUNTS);
    PlayerTextDrawSetString(playerid, BananaTD[playerid][1], strcts);
	return 1;
}

timer Banana_MinerObject[BANANA_TIMERS*1000](i) 
{
	BananaData[i][BananaTakeOn] = 0;
	BananaData[i][BananaID] = CreateDynamicObject(BananaData[i][BANANAModels], BananaData[i][BananaPosX], BananaData[i][BananaPosY], BananaData[i][BananaPosZ], BananaData[i][BananaRotX], BananaData[i][BananaRotY], BananaData[i][BananaRotZ]);
}

hook OnPlayerAutoFinish(playerid, objectid)
{
	if(BananaTake[playerid] == 1)
	{
    	Unfreeze_BananaFinish(playerid, objectid);
    }
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnPlayerAutoUpdate(playerid, progress, objectid)
{
	if(BananaTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}
hook OnPlayerDisconnect(playerid, reason)
{
	if (BananaTake[playerid] == 1)
	{
		StopAutoProgress(playerid);
	}
    if (Autofarm_STBA[playerid] == 1)
    {
        Destroy_Banana(playerid);
    }
	return 1;
}
hook OnPlayerConnect(playerid) 
{
    Autofarm_STBA[playerid] = 0;
    Autofarm_Banana[playerid] = 0;
    BananaTake[playerid] = 0;
    return 1;
}
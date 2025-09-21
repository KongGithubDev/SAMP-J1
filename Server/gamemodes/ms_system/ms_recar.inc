#include <YSI_Coding\y_hooks>

new RecarTime = 0;
new Text:ms_recarTD[3];

hook OnGameModeInit() {

    RecarTime = 0; 

    ms_recarTD[0] = TextDrawCreate(491.000000, 100.000000, "ms_hudserver:ms_recar");
	TextDrawFont(ms_recarTD[0], 4);
	TextDrawLetterSize(ms_recarTD[0], 0.600000, 2.000000);
	TextDrawTextSize(ms_recarTD[0], 148.000000, 84.000000);
	TextDrawSetOutline(ms_recarTD[0], 1);
	TextDrawSetShadow(ms_recarTD[0], 0);
	TextDrawAlignment(ms_recarTD[0], 1);
	TextDrawColor(ms_recarTD[0], -1);
	TextDrawBackgroundColor(ms_recarTD[0], 255);
	TextDrawBoxColor(ms_recarTD[0], 50);
	TextDrawUseBox(ms_recarTD[0], 1);
	TextDrawSetProportional(ms_recarTD[0], 1);
	TextDrawSetSelectable(ms_recarTD[0], 0);

	ms_recarTD[1] = TextDrawCreate(516.000000, 141.000000, "00:");
	TextDrawFont(ms_recarTD[1], 2);
	TextDrawLetterSize(ms_recarTD[1], 0.245833, 1.150000);
	TextDrawTextSize(ms_recarTD[1], 400.000000, 106.000000);
	TextDrawSetOutline(ms_recarTD[1], 0);
	TextDrawSetShadow(ms_recarTD[1], 0);
	TextDrawAlignment(ms_recarTD[1], 2);
	TextDrawColor(ms_recarTD[1], -1);
	TextDrawBackgroundColor(ms_recarTD[1], 255);
	TextDrawBoxColor(ms_recarTD[1], 50);
	TextDrawUseBox(ms_recarTD[1], 0);
	TextDrawSetProportional(ms_recarTD[1], 1);
	TextDrawSetSelectable(ms_recarTD[1], 0);

	ms_recarTD[2] = TextDrawCreate(532.000000, 141.000000, "00");
	TextDrawFont(ms_recarTD[2], 2);
	TextDrawLetterSize(ms_recarTD[2], 0.245833, 1.150000);
	TextDrawTextSize(ms_recarTD[2], 400.000000, 106.000000);
	TextDrawSetOutline(ms_recarTD[2], 0);
	TextDrawSetShadow(ms_recarTD[2], 0);
	TextDrawAlignment(ms_recarTD[2], 2);
	TextDrawColor(ms_recarTD[2], -1);
	TextDrawBackgroundColor(ms_recarTD[2], 255);
	TextDrawBoxColor(ms_recarTD[2], 50);
	TextDrawUseBox(ms_recarTD[2], 0);
	TextDrawSetProportional(ms_recarTD[2], 1);
	TextDrawSetSelectable(ms_recarTD[2], 0);

	return 1;
}

task StatsRecarTimer[1000]()
{
	
	if (RecarTime > 0) RecarTime --;
	if (RecarTime < 0) RecarTime = 0;

	return 1;
	
}

task TimeRecarShow[1000]() {

	new Timerecar[256];
    static
		hours,
		minutes,
		seconds;

	GetElapsedTime(RecarTime, hours, minutes, seconds);
	format(Timerecar, sizeof(Timerecar), "%02d :",minutes);
	TextDrawSetString(ms_recarTD[1], Timerecar);
	format(Timerecar, sizeof(Timerecar), "%02d",seconds);
	TextDrawSetString(ms_recarTD[2], Timerecar);
	
    return 1;
}

CMD:deletecar(playerid, number, params[])
{
    if (playerData[playerid][pAdmin] < 6)
	    return 1;

	SetTimerEx("RespawnCar", 1000, false, "d", 1);
	foreach (new i : Player) {
		ShowCarremove(i);
	}
	return 1;
}

task RecarAuto[1000]() {
	new Hour, Minute, Second;
	gettime(Hour, Minute, Second);

	if (Hour == 12 ) {
		if (Minute == 17 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				return 1;
			}
		}
	}
    if (Hour == 01 ) {
		if (Minute == 59 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				 
				return 1;
			}
		}
	}
	if (Hour == 03 ) {
		if (Minute == 59 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				 
				return 1;
			}
		}
	}
	if (Hour == 05 ) {
		if (Minute == 59 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				 
				return 1;
			}
		}
	}
	if (Hour == 07 ) {
		if (Minute == 59 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				RecarTime = 60*3;
				 
				
				return 1;
			}
		}
	}
	if (Hour == 09 ) {
		if (Minute == 59 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				RecarTime = 60*3;
				 
				return 1;
			}
		}
	}
	if (Hour == 12 ) {
		if (Minute == 59 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				RecarTime = 60*3;
				 
				return 1;
			}
		}
	}
	if (Hour == 15 ) {
		if (Minute == 59 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				RecarTime = 60*3;
				 
				return 1;
			}
		}
	}
	if (Hour == 18 ) {
		if (Minute == 59 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				RecarTime = 60*3;
				 
				return 1;
			}
		}
	}
    if (Hour == 21 ) {
		if (Minute == 59 ){
			if (Second == 1 ){
				SetTimerEx("RespawnCar", 1000, false, "d", 1);
				RecarTime = 60*3;
				 
				return 1;
			}
		}
	}

	return 1;
}
forward RespawnCar(number);
public RespawnCar(number)
{
	switch(number){
	    case 1:{
			SendClientMessageToAll(COLOR_ADMIN, "[รียานพาหนะ] {FFFFFF} อีก 3 นาทีข้างหน้า ระบบจะทำการรียานพาหนะ");
			SetTimerEx("RespawnCar", 60000, false, "d", 2);
			RecarTime = 3*60;
			foreach (new i : Player) {
				ShowCarremove(i);
			}
	    }
		case 2:{

			SendClientMessageToAll(COLOR_ADMIN, "[รียานพาหนะ] {FFFFFF} อีก 2 นาทีข้างหน้า ระบบจะทำการรียานพาหนะ");
			SetTimerEx("RespawnCar", 60000, false, "d", 3);

	    }
		case 3:{

			SendClientMessageToAll(COLOR_ADMIN, "[รียานพาหนะ] {FFFFFF} อีก 1 นาทีข้างหน้า ระบบจะทำการรียานพาหนะ");
			SetTimerEx("RespawnCar", 63000, false, "d", 4);

	    }
	    case 4:{
			new count;
			for (new i = 1; i < MAX_VEHICLES; i++) {
				foreach (new x : Player) {
					if (IsValidVehicle(i) && GetVehicleDriver(i) == INVALID_PLAYER_ID && IsVehicleOwner(x, i)) {
						//Car_RemoveAllItems(i);
						DespawnVehicle(i);
						DestroyVehicle(i);
						count ++;
					}
				}
			}            
			for (new i = 1; i != MAX_VEHICLES; i ++){
			    if (IsValidVehicle(i) && GetVehicleDriver(i) == INVALID_PLAYER_ID){
					//SetVehicleToRespawn(i);
                    DespawnVehicle(i);
					count++;
				}
			}
			foreach (new n : Player) {
				if(playerData[n][IsLoggedIn]){
					PlayerPlaySound(n, 1058, 0.0, 0.0, 0.0);
                    ClearPlayerChat(n, 20);
					HideCarremove(n);
				}
			}
            SendClientMessageToAllEx(COLOR_ADMIN, "[รียานพาหนะ] {FFFFFF} ระบบได้ทำการลบรถทั้งหมดในเซิฟเวอร์ เรียบร้อยแล้ว!!");
			print("[ RESPAWNCAR ] SYSTEM RESPAWNCAR START... !!!");
	    }
	}
    return 1;
}


stock ShowCarremove(playerid) {
	TextDrawShowForPlayer(playerid, ms_recarTD[0]);
	TextDrawShowForPlayer(playerid, ms_recarTD[1]);
	TextDrawShowForPlayer(playerid, ms_recarTD[2]);
	return 1;
}
stock HideCarremove(playerid) {
	TextDrawHideForPlayer(playerid, ms_recarTD[0]);
	TextDrawHideForPlayer(playerid, ms_recarTD[1]);
	TextDrawHideForPlayer(playerid, ms_recarTD[2]);
	return 1;
}

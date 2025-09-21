#include <YSI_Coding\y_hooks>

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_CTRL_BACK)
    {
        if(!playerData[playerid][pOnDuty]) return false;
        if(GetFactionType(playerid) == FACTION_MEDIC && playerData[playerid][pOnDuty] == true)
            return Dialog_Show(playerid, DIALOG_MENU_MEDIC, DIALOG_STYLE_LIST, "{FFFF00}เมนูหมอ", "{FFFFFF}+ รายชื่อผู้บาดเจ็บ\n+ ชุบ\n+ ฉีดยา", "ยืนยัน", "ยกเลิก");
    }
    return true;
}

Dialog:DIALOG_MENU_MEDIC(playerid, response, listitem, inputtext[]){
    if(response){
        switch(listitem){
            case 0:{
                OpenDialogMedic(playerid);
            }
            case 1:{
                Dialog_Show(playerid, DIALOG_CPR, DIALOG_STYLE_INPUT, "{FFFF00}เมนูหมอ", "{FFFFFF}ใส่ไอดีที่ต้องการจะชุบ", "ยืนยัน", "ยกเลิก");
            }
            case 2:{
                Dialog_Show(playerid, DIALOG_HEAL, DIALOG_STYLE_INPUT, "{FFFF00}เมนูหมอ", "{FFFFFF}ใส่ไอดีที่ต้องการจะฉีดยา", "ยืนยัน", "ยกเลิก");
            }
        }
    }
    return true;
}
OpenDialogMedic(playerid){
    new string[256], string2[256], count, var[32];
    foreach(new i : Player){
        if(playerData[i][pInjured]){   
			if(i == playerid) continue;
            format(string, sizeof(string), "(%d)%s\n",i, GetPlayerNameEx(i));
            format(var, sizeof(var), "dID%d", count);
            SetPVarInt(playerid, var, i);
            count ++;
        }
    }
    if(!count){   
        ErrorMsg(playerid, "ไม่มีใครบาดเจ็บ");
        return false;
    }
	strcat(string2, string);
    return Dialog_Show(playerid, DIALOG_MEDICAL, DIALOG_STYLE_LIST, "{FFFF00}เมนูหมอ", string2, "ตกลง", "ยกเลิก");
}
Dialog:DIALOG_MEDICAL(playerid, response, listitem, inputtext[]){
    if(response){
        new var[128];
        format(var, sizeof(var), "dID%d", listitem);
        new userid = GetPVarInt(playerid, var);
        new Float:X, Float:Y, Float:Z;
        GetPlayerPos(userid, X, Y, Z);
        SetPlayerCheckpoint(playerid, X, Y, Z, 5);
        ErrorMsg(userid, "หมอได้รับแคสคุณแล้วรอแปป");
    }
    else {
        Dialog_Show(playerid, DIALOG_MENU_MEDIC, DIALOG_STYLE_LIST, "{FFFF00}เมนูหมอ", "{FFFFFF}+ รายชื่อผู้บาดเจ็บ\n+ ชุบ\n+ ฉีดยา", "ยืนยัน", "ยกเลิก");
    }
	return true;
}
Dialog:DIALOG_CPR(playerid, response, listitem, inputtext[]){
    if(response){
        new userid = strval(inputtext);
        SetPVarInt(playerid, "userid", userid);
        Dialog_Show(playerid, DIALOG_CPR_2, DIALOG_STYLE_INPUT, "{FFFF00}เมนูหมอ", "{FFFFFF}ใส่ราคาที่จะชุบ", "ยืนยัน", "ยกเลิก");
    }
    else {
        Dialog_Show(playerid, DIALOG_MENU_MEDIC, DIALOG_STYLE_LIST, "{FFFF00}เมนูหมอ", "{FFFFFF}+ รายชื่อผู้บาดเจ็บ\n+ ชุบ\n+ ฉีดยา", "ยืนยัน", "ยกเลิก");
    }
    return true;
}
Dialog:DIALOG_CPR_2(playerid, response, listitem, inputtext[]){
    if(response){
        new price = strval(inputtext);
        new userid = GetPVarInt(playerid, "userid");
        if(userid == INVALID_PLAYER_ID) return false;
        if(userid == playerid) return false;
        if(IsPlayerInAnyVehicle(playerid) || IsPlayerInAnyVehicle(userid)) return false;
        if(!IsPlayerNearPlayer(playerid, userid, 1.0)) return false;
        if(!playerData[userid][pInjured]) return false;
        
        playerData[userid][pInjured] = 0;
        playerData[userid][pInjuredTime] = 0;
        GivePlayerMoneyEx(playerid, price);
        GivePlayerMoneyEx(userid, -price);
        SetPlayerHealth(userid, 20);
        TogglePlayerControllable(userid, true);

        ApplyAnimation(playerid, "MEDIC", "CPR", 4.1, 0, 0, 0, 0, 0, 1);
        ClearAnimations(userid);
        SetPVarInt(playerid, "userid", -1);
        PlayerTextDrawHide(userid, PlayerDeathTD[userid]);
    }
    else {
        Dialog_Show(playerid, DIALOG_MENU_MEDIC, DIALOG_STYLE_LIST, "{FFFF00}เมนูหมอ", "{FFFFFF}+รายชื่อผู้บาดเจ็บ\n+ ชุบ\n+ ฉีดยา", "ยืนยัน", "ยกเลิก");
    }
    return true;
}
Dialog:DIALOG_HEAL(playerid, response, listitem, inputtext[]){
    if(response){
        new userid = strval(inputtext);
        SetPVarInt(playerid, "userid", userid);
        Dialog_Show(playerid, DIALOG_HEAL_2, DIALOG_STYLE_INPUT, "{FFFF00}เมนูหมอ", "ใส่ราคาที่จะฉีดยา", "ยืนยัน", "ยกเลิก");
    }
    else {
        Dialog_Show(playerid, DIALOG_MENU_MEDIC, DIALOG_STYLE_LIST, "{FFFF00}เมนูหมอ", "{FFFFFF}+ รายชื่อผู้บาดเจ็บ\n+ ชุบ\n+ ฉีดยา", "ยืนยัน", "ยกเลิก");
    }
    return true;
}
Dialog:DIALOG_HEAL_2(playerid, response, listitem, inputtext[]){
    if(response){
        new price = strval(inputtext);
        new userid = GetPVarInt(playerid, "userid");
        if(userid == INVALID_PLAYER_ID) return false;
        if(userid == playerid) return false;
        if(IsPlayerInAnyVehicle(playerid) || IsPlayerInAnyVehicle(userid)) return false;
        if(!IsPlayerNearPlayer(playerid, userid, 1.0)) return false;
        GivePlayerMoneyEx(playerid, price);
        GivePlayerMoneyEx(userid, -price);
        SetPlayerHealth(userid, 100);
        SetPVarInt(playerid, "userid", -1);
    }
    else {
        Dialog_Show(playerid, DIALOG_MENU_MEDIC, DIALOG_STYLE_LIST, "{FFFF00}เมนูหมอ", "{FFFFFF}+ รายชื่อผู้บาดเจ็บ\n+ ชุบ\n+ ฉีดยา", "ยืนยัน", "ยกเลิก");
    }
    return true;
}
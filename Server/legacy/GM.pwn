/*
  ʤ�Ի����������Ѻ�����ҡ�������
  (MYSQL R41-4)
  ���� �к� Register/Login
  ��� ����Թ���� �ͧ������鹨ش�Դ
  
  �ҹ������૿�ء��

  �Ը����¡�����Թ����
  
  //--> ����Թ
  GivePlayerMoneyEx(playerid, �ӹǹ�Թ);
  
  �������è����¡��
  

*/

#include <a_samp>
#include <a_mysql>
#include <streamer>
#include <easyDialog>
//#include <progress2>
#include <Pawn.CMD>
#include <sscanf2>


#undef	 MAX_PLAYERS
#define	 MAX_PLAYERS			100

#define  YSI_NO_OPTIMISATION_MESSAGE
#define  YSI_NO_CACHE_MESSAGE
#define  YSI_NO_MODE_CACHE
#define  YSI_NO_HEAP_MALLOC
#define  YSI_NO_VERSION_CHECK

#include <YSI_Data\y_iterate>
#include <YSI_Coding\y_timers>


//--> ����� Localhost
#define  MYSQL_HOSTNAME		"127.0.0.1"
#define  MYSQL_USERNAME		"root"
#define  MYSQL_PASSWORD		""
#define  MYSQL_DATABASE		"AlexDev"

//--> �к�િ�����ŷء��
new PlayerSaveTime[MAX_PLAYERS];

//--> MySQL R41-4
new MySQL: Database,PlayerName[MAX_PLAYERS][30],PlayerIP[MAX_PLAYERS][17];
native WP_Hash(buffer[], len, const str[]); 

//--> �����
enum PlayerData 
{
	ID,
	Password[129],
	Money,
	ItemFree
};
new playerData[MAX_PLAYERS][PlayerData];

main(){
     print("Gamemode-Clean BY AlexDev");
}

public OnGameModeInit(){
    //--> MySQL R41-4
	new MySQLOpt: option_id = mysql_init_options();
	mysql_set_option(option_id, AUTO_RECONNECT, true); 
	Database = mysql_connect(MYSQL_HOSTNAME, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
	if (Database == MYSQL_INVALID_HANDLE || mysql_errno(Database) != 0){
		print("MYSQL ERROR : SERVER OFF");
		SendRconCommand("exit"); 
		return 1;
	}
	SetGameModeText("AlexDev 1.0.0");
	print("MySQL connection is successful.");
	
	//--> �к�િ�����ŷء��
	SetTimer("AutoSave", 1000, 1);
	
	return 1;
}

public OnGameModeExit(){
	return 1;
}

public OnPlayerConnect(playerid){
    //--> MySQL R41-4
	new query[140];
	GetPlayerName(playerid, PlayerName[playerid], 30); 
	GetPlayerIp(playerid, PlayerIP[playerid], 16);
	mysql_format(Database, query, sizeof(query), "SELECT `Password`, `ID` FROM `users` WHERE `Username` = '%e' LIMIT 0, 1", PlayerName[playerid]); // We are selecting the password and the ID from the player's name
	mysql_tquery(Database, query, "CheckPlayer", "i", playerid);
	PlayerLoad(playerid);
	return 1;
}
public OnPlayerDisconnect(playerid, reason){
	//Save ������ ���Ҽ������͡����
    SavePlayer(playerid);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	//--> �ش�Դ
	SetPlayerPos(playerid, 2628.3206,2348.0378,10.8203 );
	SetPlayerFacingAngle(playerid, 202.2866 );
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}


public OnPlayerUpdate(playerid){
	//--> �к�����Թ���� Cr. Tenka
	if (GetPlayerMoney(playerid) != playerData[playerid][Money]){
	    ResetPlayerMoney(playerid);
	    GivePlayerMoney(playerid, playerData[playerid][Money]);
	}
	return 1;
}

//--> �к�િ�����ŷء��
forward AutoSave();
public AutoSave(){
	foreach(new i: Player){
		if(IsPlayerConnected(i)){
		    if(PlayerSaveTime[i] == 1){
	    		SavePlayer(i);
			}
		}
	}
    return 1;
}

forward PlayerLoad(playerid);
public PlayerLoad(playerid){
	playerData[playerid][Money] = 0;
	playerData[playerid][ItemFree] = 0;
	PlayerSaveTime[playerid] = 0;
    return 1;
}

//--> �� ��� �ѭ�չ�� �� �����ѧ
forward CheckPlayer(playerid);
public CheckPlayer(playerid){
	new rows, string[150];
	cache_get_row_count(rows);
	if(rows) {
		cache_get_value_name(0, "Password", playerData[playerid][Password], 129);
		cache_get_value_name_int(0, "ID", playerData[playerid][ID]);
		format(string, sizeof(string), "{FFFFFF}�س�պѭ����������������\n\n��س�������ʼ�ҹ��ҹ��ҧ\n���ͷӡ����͡�Թ���������������");
		Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "({FFFFFF}{00FF13}��͡�Թ{00FF13}{FFFFFF})", string, "��͡�Թ", "");
	}
	else {
		format(string, sizeof(string), "{FFFFFF}�س�ѧ����պѭ������������\n\n��س�������ʼ�ҹ��ҹ��ҧ\n���ͷӡ����Ѥ���Ҫԡ ����������");
		Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "({FFFFFF}{FF0000}��Ѥ�{FF0000}{FFFFFF})", string, "��Ѥ�", "");
	}
	return 1;
}

//--> ��͡�Թ
Dialog:DIALOG_LOGIN(playerid, response, listitem, inputtext[]){
	if(!response)
		return Kick(playerid); 
	new password[129], query[100];
	WP_Hash(password, 129, inputtext); 
	if(!strcmp(password, playerData[playerid][Password])) {
		mysql_format(Database, query, sizeof(query), "SELECT * FROM `users` WHERE `Username` = '%e' LIMIT 0, 1", PlayerName[playerid]);
		mysql_tquery(Database, query, "LoadPlayer", "i", playerid);
	}
	else {
		Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "{FF0000}Wrong Password!\n{FFFFFF}Type your correct password below to continue and sign in to your account", "Login", "Exit");
		
	}
	return 1;
}

//--> ��Ѥ�
Dialog:DIALOG_REGISTER(playerid, response, listitem, inputtext[]){
	if(!response)
		return Kick(playerid);
	if(strlen(inputtext) < 3){
	   SendClientMessage(playerid, 0xFF0000, "�س������ʼ�ҹ�Դ �������Դ�Թ 3 �ͺ");
	   return CheckPlayer(playerid);
	}
	new query[300];
	WP_Hash(playerData[playerid][Password], 129, inputtext);
	mysql_format(Database, query, sizeof(query), "INSERT INTO `users` (`Username`, `Password`, `IP`, `Money`) VALUES ('%e', '%e', '%e', 0)", PlayerName[playerid], playerData[playerid][Password], PlayerIP[playerid]);
	mysql_pquery(Database, query, "RegisterPlayer", "i", playerid);
	return 1;
}

//--> ��Ŵ�����Ũҡ �ҹ������
forward LoadPlayer(playerid);
public LoadPlayer(playerid){
	cache_get_value_name_int(0, "Money", playerData[playerid][Money]);
	cache_get_value_name_int(0, "ItemFree", playerData[playerid][ItemFree]);
	PlayerSaveTime[playerid] = 1;
	FreeItem(playerid);
	//--> ���¡��OnplayerSpawn
    SpawnPlayer(playerid);
	return 1;
}

forward FreeItem(playerid);
public FreeItem(playerid){
	if(playerData[playerid][ItemFree] == 0)
	{
	  playerData[playerid][ItemFree] = 1;
	  GivePlayerMoneyEx(playerid, 1000);
	  SendClientMessage(playerid, -1, "[SERVER] �Թ�յ�͹�Ѻ���������������");
	  SendClientMessage(playerid, -1, "[!] �س�繼��������� ���Ѻ �Թ �ӹǹ $1000");
	}
	return 1;
}
//--> િ�����ż�����
forward SavePlayer(playerid);
public SavePlayer(playerid){
	new query[2048];
	mysql_format(Database, query, sizeof(query), "UPDATE `users` SET `Money` = '%d', `ItemFree` = '%d' WHERE `ID` = '%d'",
	playerData[playerid][Money],
	playerData[playerid][ItemFree],
	playerData[playerid][ID]);
	mysql_tquery(Database, query); 
	return 1;
}

//--> ���Ҽ�������Ѥ���Ҫԡ������
forward RegisterPlayer(playerid);
public RegisterPlayer(playerid){
    new string[150];
	playerData[playerid][ID] = cache_insert_id();
	printf("ID ��������Ѥ���������� SQL ID : %d", playerData[playerid][ID]);
	cache_get_value_name(0, "Password", playerData[playerid][Password], 129);
	cache_get_value_name_int(0, "ID", playerData[playerid][ID]);
	format(string, sizeof(string), "{FFFFFF}�س�պѭ����������������\n\n��س�������ʼ�ҹ��ҹ��ҧ\n���ͷӡ����͡�Թ���������������");
	Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "({FFFFFF}{00FF13}��͡�Թ{00FF13}{FFFFFF})", string, "��͡�Թ", "");
	return 1;
}

//--> �к�����Թ���� Cr. Tenka
GivePlayerMoneyEx(playerid, value){
	playerData[playerid][Money] += value;
	GivePlayerMoney(playerid, value);
	return 1;
}


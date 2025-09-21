//Ms
#include 	<YSI_Coding\y_hooks>

new StartSelectCraft[MAX_PLAYERS];

hook OnPlayerConnect(playerid){
	StartSelectCraft[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
	    if (IsPlayerInRangeOfPoint(playerid, 2.0, -0.0,0.0,0.0))
		{
			Dialog_Show(playerid, DIALOG_MENU_CRAFT, DIALOG_STYLE_LIST, "{FF00FF}[ คราฟอาวุธ ]", "\
			{FF00FF}[+] {FFFFFF}คราฟอาวุธ", "ตกลง", "ออก");          
	    } 
    }
	return 1;        
}

Dialog:DIALOG_MENU_CRAFT(playerid, response, listitem, inputtext[])
{  
	if(response)
	{
	    switch(listitem)
		{
			case 0:
			{		
                Dialog_Show(playerid, DIALOG_MENU_CRAFT1, DIALOG_STYLE_LIST, "{FF00FF}[ คราฟอาวุธ ]", "\
				{FF00FF}[+] {FFFFFF}สนับมือ\n\
                {FF00FF}[+] {FFFFFF}ไม้สนุ๊ก\n\
                {FF00FF}[+] {FFFFFF}ไม้เบสบอล\n\
                {FF00FF}[+] {FFFFFF}ไม้กอล์ฟ\n\
				{FF00FF}[+] {FFFFFF}คาตานะ\n\
				{FF00FF}[+] {FFFFFF}กุญแจตู้เซฟ\n\
				{FF00FF}[+] {FFFFFF}บลูปริ้นกุญแจตู้ ", "ตกลง", "<-");    
			}
			case 1:
			{
                SendClientMessage(playerid, COLOR_WHITE, "รออัพเดท");
			}
		}
	}
	return 1;
}

// คราฟอาวุธ
Dialog:DIALOG_MENU_CRAFT1(playerid, response, listitem, inputtext[])
{
	if(!response){
        Dialog_Show(playerid, DIALOG_MENU_CRAFT, DIALOG_STYLE_LIST, "{FF00FF}[ คราฟของต่างๆ ]", "\
        {FF00FF}[+] {FFFFFF}คราฟอาวุธ", "ตกลง", "ออก");           
    }    
	if(response)
	{
	    switch(listitem)
		{
			case 0:
			{	
                Dialog_Show(playerid, DIALOG_MENU_INFOCRAFT1, DIALOG_STYLE_LIST, "{FF00FF}[ สนับมือ ] ", "\
                {FF00FF}[+] {FFFFFF}สนับมือ | กดเพื่อคราฟ\n\
                {FF00FF}[+] {FFFFFF}INFO | สิ่งที่ต้องใช้ในการคราฟ", "ตกลง", "<-");
			}
            case 1:
			{
                Dialog_Show(playerid, DIALOG_MENU_INFOCRAFT2, DIALOG_STYLE_LIST, "{FF00FF}[ ไม้สนุ๊ก ]", "\
                {FF00FF}[+] {FFFFFF}ไม้สนุ๊ก | กดเพื่อคราฟ\n\
                {FF00FF}[+] {FFFFFF}INFO | สิ่งที่ต้องใช้ในการคราฟ", "ตกลง", "<-");
			}
			case 2:
			{
                Dialog_Show(playerid, DIALOG_MENU_INFOCRAFT3, DIALOG_STYLE_LIST, "{FF00FF}[ ไม้เบสบอล ]", "\
                {FF00FF}[+] {FFFFFF}ไม้เบสบอล | กดเพื่อคราฟ\n\
                {FF00FF}[+] {FFFFFF}INFO | สิ่งที่ต้องใช้ในการคราฟ", "ตกลง", "<-");
			}
 			case 3:
			{
                Dialog_Show(playerid, DIALOG_MENU_INFOCRAFT4, DIALOG_STYLE_LIST, "{FF00FF}[ ไม้กอล์ฟ ]", "\
                {FF00FF}[+] {FFFFFF}ไม้กอล์ฟ | กดเพื่อคราฟ\n\
                {FF00FF}[+] {FFFFFF}INFO | สิ่งที่ต้องใช้ในการคราฟ", "ตกลง", "<-");                
			}
			case 4: 
			{
                Dialog_Show(playerid, DIALOG_MENU_INFOCRAFT5, DIALOG_STYLE_LIST, "{FF00FF}[ คาตานะ ]", "\
                {FF00FF}[+] {FFFFFF}คาตานะ | กดเพื่อคราฟ\n\
                {FF00FF}[+] {FFFFFF}INFO | สิ่งที่ต้องใช้ในการคราฟ", "ตกลง", "<-");				
			}
			case 5: 
			{
                Dialog_Show(playerid, DIALOG_MENU_INFOCRAFT6, DIALOG_STYLE_LIST, "{FF00FF}[ กุญแจตู้เซฟ ]", "\
                {FF00FF}[+] {FFFFFF}กุญแจตู้เซฟ | กดเพื่อคราฟ\n\
                {FF00FF}[+] {FFFFFF}INFO | สิ่งที่ต้องใช้ในการคราฟ", "ตกลง", "<-");				
			}
			case 6: 
			{
                Dialog_Show(playerid, DIALOG_MENU_INFOCRAFT7, DIALOG_STYLE_LIST, "{FF00FF}[ บลูปริ้นกุญแจตู้ ]", "\
                {FF00FF}[+] {FFFFFF}บลูปริ้นกุญแจตู้ | กดเพื่อคราฟ\n\
                {FF00FF}[+] {FFFFFF}INFO | สิ่งที่ต้องใช้ในการคราฟ", "ตกลง", "<-");				
			}
		}
	}
	return 1;
}

// คราฟ สนับมือ
Dialog:DIALOG_MENU_INFOCRAFT1(playerid, response, listitem, inputtext[])
{   
	if(!response){
        Dialog_Show(playerid, DIALOG_MENU_CRAFT1, DIALOG_STYLE_LIST, "{FF00FF}[ คราฟอาวุธ ] ", "\
		{FF00FF}[+] {FFFFFF}สนับมือ\n\
        {FF00FF}[+] {FFFFFF}ไม้สนุ๊ก\n\
        {FF00FF}[+] {FFFFFF}ไม้เบสบอล\n\
        {FF00FF}[+] {FFFFFF}ไม้กอล์ฟ\n\
		{FF00FF}[+] {FFFFFF}คาตานะ\n\
		{FF00FF}[+] {FFFFFF}กุญแจตู้เซฟ\n\
		{FF00FF}[+] {FFFFFF}บลูปริ้นกุญแจตู้ ", "ตกลง", "<-");                
    }    
	if(response)
	{
	    switch(listitem)
		{
			case 0:
			{	
                Dialog_Show(playerid, DIALOG_CRAFT_SELECT1, DIALOG_STYLE_MSGBOX, "{FF00FF}[ Craft Weapon ]", "{FFFFFF}คุณต้องการคราฟ {00FFFF}'สนับมือ' {FFFFFF}หรือไม่", "คราฟ", "");
			}
			case 1:
			{
                new string[256];
                format(string, sizeof(string), "{FFFFFF}> {FF00FF}สนับมือ\n{00FFFF}ปูน [10]\n{00FFFF}สายไฟ [10]\n{00FFFF}แร่เหลือง [30]\n{00FFFF}แร่เขียว [30]\n{00FFFF}แร่ฟ้า [30]\n{00FFFF}แร่แดง [30]\n{00FFFF}เงินแดง [3000]");
                Dialog_Show(playerid, OUTINFO, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )", string, "<-", "");
			}
		}
	}
	return 1;
}

Dialog:DIALOG_CRAFT_SELECT1(playerid, response, listitem, inputtext[])
{
    if (response)
    {
		if (Inventory_Count(playerid, "ปูน") < 10)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  ปูน  ไม่เพียงพอ (10)");

		if (Inventory_Count(playerid, "สายไฟ") < 10)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  สายไฟ  ไม่เพียงพอ (10)");

		if (Inventory_Count(playerid, "แร่เหลือง") < 30)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เหลือง  ไม่เพียงพอ (30)");

		if (Inventory_Count(playerid, "แร่เขียว") < 30)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เขียว  ไม่เพียงพอ (30)");
		
		if (Inventory_Count(playerid, "แร่ฟ้า") < 30)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่ฟ้า  ไม่เพียงพอ (30)"); 

        if (Inventory_Count(playerid, "แร่แดง") < 30)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่แดง  ไม่เพียงพอ (30)"); 
		
        //if (playerData[playerid][pRedMoney] < 3000)
           // return ErrorMsg(playerid ,"[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 5,000 บาท");
		if (GetPlayerRedMoney(playerid) < 5000)
			return ErrorMsg(playerid, "[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 5,000 บาท");

		SendClientMessage(playerid, COLOR_CYAN, "[แจ้งเตือน]  {FFFFFF}คุณได้เริ่มต้นการคราฟ {FF00FF} สนับมือ ");
		StartProgress(playerid, 400, 0, 0);
		StartSelectCraft[playerid] = 1;								
	}
	return 1;
}

// คราฟ ไม้สนุ๊ก
Dialog:DIALOG_MENU_INFOCRAFT2(playerid, response, listitem, inputtext[])
{    
	if(!response){
        Dialog_Show(playerid, DIALOG_MENU_CRAFT1, DIALOG_STYLE_LIST, "{FF00FF}[ คราฟอาวุธ ]", "\
		{FF00FF}[+] {FFFFFF}สนับมือ\n\
        {FF00FF}[+] {FFFFFF}ไม้สนุ๊ก\n\
        {FF00FF}[+] {FFFFFF}ไม้เบสบอล\n\
        {FF00FF}[+] {FFFFFF}ไม้กอล์ฟ\n\
		{FF00FF}[+] {FFFFFF}คาตานะ\n\
		{FF00FF}[+] {FFFFFF}กุญแจตู้เซฟ\n\
		{FF00FF}[+] {FFFFFF}บลูปริ้นกุญแจตู้ ", "ตกลง", "<-");      
    }
	if(response)
	{
	    switch(listitem)
		{
			case 0:
			{	
                Dialog_Show(playerid, DIALOG_CRAFT_SELECT2, DIALOG_STYLE_MSGBOX, "{FF00FF}[ Craft Weapon ]", "{FFFFFF}คุณต้องการคราฟ {00FFFF}'ไม้สนุ๊ก' {FFFFFF}หรือไม่", "คราฟ", "");
			}
			case 1:
			{
                new string[256];
                format(string, sizeof(string), "{FFFFFF}> {FF00FF}ไม้สนุ๊ก\n{00FFFF}ปูน [30]\n{00FFFF}สายไฟ [30]\n{00FFFF}แร่เหลือง [70]\n{00FFFF}แร่เขียว [70]\n{00FFFF}แร่ฟ้า [70]\n{00FFFF}แร่แดง [70]\n{00FFFF}เงินแดง [3000]");
                Dialog_Show(playerid, OUTINFO, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )", string, "<-", "");
			}
		}
	}
	return 1;
}

Dialog:DIALOG_CRAFT_SELECT2(playerid, response, listitem, inputtext[])
{
    if (response)
    {
		if (Inventory_Count(playerid, "ปูน") < 30)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  ปูน  ไม่เพียงพอ (30)");

		if (Inventory_Count(playerid, "สายไฟ") < 30)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  สายไฟ  ไม่เพียงพอ (30)");

		if (Inventory_Count(playerid, "แร่เหลือง") < 70)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เหลือง  ไม่เพียงพอ (70)");

		if (Inventory_Count(playerid, "แร่เขียว") < 70)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เขียว  ไม่เพียงพอ (70)");
		
		if (Inventory_Count(playerid, "แร่ฟ้า") < 70)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่ฟ้า  ไม่เพียงพอ (70)"); 

        if (Inventory_Count(playerid, "แร่แดง") < 70)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่แดง  ไม่เพียงพอ (70)"); 
		
        //if (playerData[playerid][pRedMoney] < 3000)
            //return ErrorMsg(playerid ,"[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 5,000 บาท");

		if (GetPlayerRedMoney(playerid) < 3000)
			return ErrorMsg(playerid, "[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 3,000 บาท");

		SendClientMessage(playerid, COLOR_CYAN, "[แจ้งเตือน]  {FFFFFF}คุณได้เริ่มต้นการคราฟ {FF00FF} ไม้สนุ๊ก ");
		StartProgress(playerid, 400, 0, 0);
		StartSelectCraft[playerid] = 2;								
	}
	return 1;
}

// คราฟ ไม้เบสบอล
Dialog:DIALOG_MENU_INFOCRAFT3(playerid, response, listitem, inputtext[])
{    
	if(!response){
        Dialog_Show(playerid, DIALOG_MENU_CRAFT1, DIALOG_STYLE_LIST, "{FF00FF}[ คราฟอาวุธ ]", "\
		{FF00FF}[+] {FFFFFF}สนับมือ\n\
        {FF00FF}[+] {FFFFFF}ไม้สนุ๊ก\n\
        {FF00FF}[+] {FFFFFF}ไม้เบสบอล\n\
        {FF00FF}[+] {FFFFFF}ไม้กอล์ฟ\n\
		{FF00FF}[+] {FFFFFF}คาตานะ\n\
		{FF00FF}[+] {FFFFFF}กุญแจตู้เซฟ\n\
		{FF00FF}[+] {FFFFFF}บลูปริ้นกุญแจตู้ ", "ตกลง", "<-");                  
    }
	if(response)
	{
	    switch(listitem)
		{
			case 0:
			{	
                Dialog_Show(playerid, DIALOG_CRAFT_SELECT3, DIALOG_STYLE_MSGBOX, "{FF00FF}[ Craft Weapon ]", "{FFFFFF}คุณต้องการคราฟ {00FFFF}'ไม้เบสบอล' {FFFFFF}หรือไม่", "คราฟ", "");
			}
			case 1:
			{
                new string[256];
                format(string, sizeof(string), "{FFFFFF}> {FF00FF}ไม้เบสบอล\n{00FFFF}ปูน [40]\n{00FFFF}สายไฟ [40]\n{00FFFF}แร่เหลือง [100]\n{00FFFF}แร่เขียว [100]\n{00FFFF}แร่ฟ้า [100]\n{00FFFF}แร่แดง [100]\n{00FFFF}เงินแดง [3000]");
                Dialog_Show(playerid, OUTINFO, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )", string, "<-", "");
			}
		}
	}
	return 1;
}

Dialog:DIALOG_CRAFT_SELECT3(playerid, response, listitem, inputtext[])
{
    if (response)
    {
		if (Inventory_Count(playerid, "ปูน") < 40)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  ปูน  ไม่เพียงพอ (40)");

		if (Inventory_Count(playerid, "สายไฟ") < 40)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  สายไฟ  ไม่เพียงพอ (40)");

		if (Inventory_Count(playerid, "แร่เหลือง") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เหลือง  ไม่เพียงพอ (100)");

		if (Inventory_Count(playerid, "แร่เขียว") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เขียว  ไม่เพียงพอ (100)");
		
		if (Inventory_Count(playerid, "แร่ฟ้า") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่ฟ้า  ไม่เพียงพอ (100)"); 

        if (Inventory_Count(playerid, "แร่แดง") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่แดง  ไม่เพียงพอ (100)"); 
		
        //if (playerData[playerid][pRedMoney] < 3000)
            //return ErrorMsg(playerid ,"[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 5,000 บาท");

		if (GetPlayerRedMoney(playerid) < 3000)
			return ErrorMsg(playerid, "[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 3,000 บาท");

		SendClientMessage(playerid, COLOR_CYAN, "[แจ้งเตือน]  {FFFFFF}คุณได้เริ่มต้นการคราฟ {FF00FF} ไม้เบสบอล ");
		StartProgress(playerid, 400, 0, 0);
		StartSelectCraft[playerid] = 3;								
	}
	return 1;
}

// คราฟ ไม้กอล์ฟ
Dialog:DIALOG_MENU_INFOCRAFT4(playerid, response, listitem, inputtext[])
{
	if(!response){
        Dialog_Show(playerid, DIALOG_MENU_CRAFT1, DIALOG_STYLE_LIST, "{FF00FF}[	คราฟอาวุธ ]", "\
		{FF00FF}[+] {FFFFFF}สนับมือ\n\
        {FF00FF}[+] {FFFFFF}ไม้สนุ๊ก\n\
        {FF00FF}[+] {FFFFFF}ไม้เบสบอล\n\
        {FF00FF}[+] {FFFFFF}ไม้กอล์ฟ\n\
		{FF00FF}[+] {FFFFFF}คาตานะ\n\
		{FF00FF}[+] {FFFFFF}กุญแจตู้เซฟ\n\
		{FF00FF}[+] {FFFFFF}บลูปริ้นกุญแจตู้ ", "ตกลง", "<-");            
    }    
	if(response)
	{
	    switch(listitem)
		{
			case 0:
			{	
                Dialog_Show(playerid, DIALOG_CRAFT_SELECT4, DIALOG_STYLE_MSGBOX, "{FF00FF}[ Craft Weapon ]", "{FFFFFF}คุณต้องการคราฟ {00FFFF}'ไม้กอล์ฟ' {FFFFFF}หรือไม่", "คราฟ", "");
			}
			case 1:
			{
                new string[256];
                format(string, sizeof(string), "{FFFFFF}> {FF00FF}ไม้กอล์ฟ\n{00FFFF}ปูน [50]\n{00FFFF}สายไฟ [50]\n{00FFFF}แร่เหลือง [100]\n{00FFFF}แร่เขียว [100]\n{00FFFF}แร่ฟ้า [100]\n{00FFFF}แร่แดง [100]\n{00FFFF}เงินแดง [3000]");
                Dialog_Show(playerid, OUTINFO, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )", string, "<-", "");
			}
		}
	}
	return 1;
}

Dialog:DIALOG_CRAFT_SELECT4(playerid, response, listitem, inputtext[])
{
    if (response)
    {
		if (Inventory_Count(playerid, "ปูน") < 50)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  ปูน  ไม่เพียงพอ (50)");

		if (Inventory_Count(playerid, "สายไฟ") < 50)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  สายไฟ  ไม่เพียงพอ (50)");

		if (Inventory_Count(playerid, "แร่เหลือง") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เหลือง  ไม่เพียงพอ (100)");

		if (Inventory_Count(playerid, "แร่เขียว") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เขียว  ไม่เพียงพอ (100)");
		
		if (Inventory_Count(playerid, "แร่ฟ้า") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่ฟ้า  ไม่เพียงพอ (100)"); 

        if (Inventory_Count(playerid, "แร่แดง") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่แดง  ไม่เพียงพอ (100)"); 
		
        //if (playerData[playerid][pRedMoney] < 3000)
          //  return ErrorMsg(playerid ,"[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 5,000 บาท");
		
		if (GetPlayerRedMoney(playerid) < 3000)
			return ErrorMsg(playerid, "[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 3,000 บาท");

		SendClientMessage(playerid, COLOR_CYAN, "[แจ้งเตือน]  {FFFFFF}คุณได้เริ่มต้นการคราฟ {00FFFF} ไม้กอล์ฟ ");
		StartProgress(playerid, 400, 0, 0);
		StartSelectCraft[playerid] = 4;								
	}
	return 1;
}

// คราฟ คาตานะ 50%
Dialog:DIALOG_MENU_INFOCRAFT5(playerid, response, listitem, inputtext[])
{
	if(!response){
        Dialog_Show(playerid, DIALOG_MENU_CRAFT1, DIALOG_STYLE_LIST, "{FF00FF}[	คราฟอาวุธ ]", "\
		{FF00FF}[+] {FFFFFF}สนับมือ\n\
        {FF00FF}[+] {FFFFFF}ไม้สนุ๊ก\n\
        {FF00FF}[+] {FFFFFF}ไม้เบสบอล\n\
        {FF00FF}[+] {FFFFFF}ไม้กอล์ฟ\n\
		{FF00FF}[+] {FFFFFF}คาตานะ\n\
		{FF00FF}[+] {FFFFFF}กุญแจตู้เซฟ\n\
		{FF00FF}[+] {FFFFFF}บลูปริ้นกุญแจตู้ ", "ตกลง", "<-");          
    }    
	if(response)
	{
	    switch(listitem)
		{
			case 0:
			{	
                Dialog_Show(playerid, DIALOG_CRAFT_SELECT5, DIALOG_STYLE_MSGBOX, "{FF00FF}[ Craft Weapon ]", "{FFFFFF}คุณต้องการคราฟ {00FFFF}'คาตานะ'{FFFFFF}หรือไม่", "คราฟ", "");
			}
			case 1:
			{
                new string[256];
                format(string, sizeof(string), "{FFFFFF}> {FF00FF}คาตานะ\n{00FFFF}ปูน [100]\n{00FFFF}สายไฟ [100]\n{00FFFF}แร่เหลือง [100]\n{00FFFF}แร่เขียว [100]\n{00FFFF}แร่ฟ้า [100]\n{00FFFF}แร่แดง [100]\n{00FFFF}เงินแดง [3000]");
                Dialog_Show(playerid, OUTINFO, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )", string, "<-", "");
			}
		}
	}
	return 1;
}

Dialog:DIALOG_CRAFT_SELECT5(playerid, response, listitem, inputtext[])
{
    if (response)
    {
		if (Inventory_Count(playerid, "ปูน") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  ปูน  ไม่เพียงพอ (100)");

		if (Inventory_Count(playerid, "สายไฟ") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  สายไฟ  ไม่เพียงพอ (100)");

		if (Inventory_Count(playerid, "แร่เหลือง") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เหลือง  ไม่เพียงพอ (100)");

		if (Inventory_Count(playerid, "แร่เขียว") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เขียว  ไม่เพียงพอ (100)");
		
		if (Inventory_Count(playerid, "แร่ฟ้า") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่ฟ้า  ไม่เพียงพอ (100)"); 

        if (Inventory_Count(playerid, "แร่แดง") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่แดง  ไม่เพียงพอ (100)"); 
		
        //if (playerData[playerid][pRedMoney] < 3000)
           // return ErrorMsg(playerid ,"[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 5,000 บาท");

		if (GetPlayerRedMoney(playerid) < 3000)
			return ErrorMsg(playerid, "[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 3,000 บาท");

		SendClientMessage(playerid, COLOR_CYAN, "[แจ้งเตือน]  {FFFFFF}คุณได้เริ่มต้นการคราฟ {00FFFF} คาตานะ ");
		StartProgress(playerid, 400, 0, 0);
		StartSelectCraft[playerid] = 5;								
	}
	return 1;
}
// คราฟกุญแจตู้เซฟ
Dialog:DIALOG_MENU_INFOCRAFT6(playerid, response, listitem, inputtext[])
{
	if(!response){
        Dialog_Show(playerid, DIALOG_MENU_CRAFT1, DIALOG_STYLE_LIST, "{FF00FF}[	คราฟอาวุธ ]", "\
		{FF00FF}[+] {FFFFFF}สนับมือ\n\
        {FF00FF}[+] {FFFFFF}ไม้สนุ๊ก\n\
        {FF00FF}[+] {FFFFFF}ไม้เบสบอล\n\
        {FF00FF}[+] {FFFFFF}ไม้กอล์ฟ\n\
		{FF00FF}[+] {FFFFFF}คาตานะ\n\
		{FF00FF}[+] {FFFFFF}กุญแจตู้เซฟ\n\
		{FF00FF}[+] {FFFFFF}บลูปริ้นกุญแจตู้ ", "ตกลง", "<-");               
    }    
	if(response)
	{
	    switch(listitem)
		{
			case 0:
			{	
                Dialog_Show(playerid, DIALOG_CRAFT_SELECT6, DIALOG_STYLE_MSGBOX, "{FF00FF}[ Craft Weapon ]", "{FFFFFF}คุณต้องการคราฟ {00FFFF}'กุญแจตู้เซฟ'{FFFFFF}หรือไม่", "คราฟ", "");
			}
			case 1:
			{
                new string[256];
                format(string, sizeof(string), "{FFFFFF}> {FF00FF}กุญแจตู้เซฟ\n{00FFFF}ปูน [50]\n{00FFFF}สายไฟ [30]\n{00FFFF}แร่เหลือง [60]\n{00FFFF}แร่เขียว [60]\n{00FFFF}แร่ฟ้า [100]\n{00FFFF}แร่แดง [100]\n{00FFFF}เงินแดง [10000]\n{00FFFF}บลูปริ้นกุญแจตู้ [1]");
                Dialog_Show(playerid, OUTINFO, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )", string, "<-", "");
			}
		}
	}
	return 1;
}
//คราฟกุญแจตู้
Dialog:DIALOG_CRAFT_SELECT6(playerid, response, listitem, inputtext[])
{
    if (response)
    {
		if (Inventory_Count(playerid, "ปูน") < 50)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  ปูน  ไม่เพียงพอ (50)");

		if (Inventory_Count(playerid, "สายไฟ") < 30)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  สายไฟ  ไม่เพียงพอ (30)");

		if (Inventory_Count(playerid, "แร่เหลือง") < 60)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เหลือง  ไม่เพียงพอ (60)");

		if (Inventory_Count(playerid, "แร่เขียว") < 60)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เขียว  ไม่เพียงพอ (60)");
		
		if (Inventory_Count(playerid, "แร่ฟ้า") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่ฟ้า  ไม่เพียงพอ (100)"); 

        if (Inventory_Count(playerid, "แร่แดง") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่แดง  ไม่เพียงพอ (100)"); 
		
        //if (playerData[playerid][pRedMoney] < 10000)
            //return ErrorMsg(playerid ,"[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 10000 บาท");

		if (GetPlayerRedMoney(playerid) < 10000)
			return ErrorMsg(playerid, "[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 10000 บาท");

		if (Inventory_Count(playerid, "บลูปริ้นกุญแจตู้") < 1)
		return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  บลูปริ้นกุญแจตู้  ไม่เพียงพอ (1)");	

		SendClientMessage(playerid, COLOR_CYAN, "[แจ้งเตือน]  {FFFFFF}คุณได้เริ่มต้นการคราฟ {00FFFF} กุญแจตู้เซฟ ");
		StartProgress(playerid, 40, 0, 0);
		StartSelectCraft[playerid] = 6;								
	}
	return 1;
}
// คราฟบลูปริ้น
Dialog:DIALOG_MENU_INFOCRAFT7(playerid, response, listitem, inputtext[])
{
	if(!response){
        Dialog_Show(playerid, DIALOG_MENU_CRAFT1, DIALOG_STYLE_LIST, "{FF00FF}[	คราฟอาวุธ ]", "\
		{FF00FF}[+] {FFFFFF}สนับมือ\n\
        {FF00FF}[+] {FFFFFF}ไม้สนุ๊ก\n\
        {FF00FF}[+] {FFFFFF}ไม้เบสบอล\n\
        {FF00FF}[+] {FFFFFF}ไม้กอล์ฟ\n\
		{FF00FF}[+] {FFFFFF}คาตานะ\n\
		{FF00FF}[+] {FFFFFF}กุญแจตู้เซฟ\n\
		{FF00FF}[+] {FFFFFF}บลูปริ้นกุญแจตู้ ", "ตกลง", "<-");               
    }    
	if(response)
	{
	    switch(listitem)
		{
			case 0:
			{	
                Dialog_Show(playerid, DIALOG_CRAFT_SELECT7, DIALOG_STYLE_MSGBOX, "{FF00FF}[ Craft Weapon ]", "{FFFFFF}คุณต้องการคราฟ {00FFFF}'บลูปริ้นกุญแจตู้'{FFFFFF}หรือไม่", "คราฟ", "");
			}
			case 1:
			{
                new string[256];
                format(string, sizeof(string), "{FFFFFF}> {FF00FF}บลูปริ้นกุญแจตู้\n{00FFFF}ปูน [50]\n{00FFFF}สายไฟ [30]\n{00FFFF}แร่เหลือง [60]\n{00FFFF}แร่เขียว [60]\n{00FFFF}แร่ฟ้า [100]\n{00FFFF}แร่แดง [100]\n{00FFFF}เงินแดง [10000]");
                Dialog_Show(playerid, OUTINFO, DIALOG_STYLE_MSGBOX, "{00FFFF}( Info Craft )", string, "<-", "");
			}
		}
	}
	return 1;
}
//บลูปริ้นกุญแจตู้
Dialog:DIALOG_CRAFT_SELECT7(playerid, response, listitem, inputtext[])
{
    if (response)
    {
		if (Inventory_Count(playerid, "ปูน") < 50)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  ปูน  ไม่เพียงพอ (50)");

		if (Inventory_Count(playerid, "สายไฟ") < 30)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  สายไฟ  ไม่เพียงพอ (30)");

		if (Inventory_Count(playerid, "แร่เหลือง") < 60)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เหลือง  ไม่เพียงพอ (60)");

		if (Inventory_Count(playerid, "แร่เขียว") < 60)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่เขียว  ไม่เพียงพอ (60)");
		
		if (Inventory_Count(playerid, "แร่ฟ้า") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่ฟ้า  ไม่เพียงพอ (100)"); 

        if (Inventory_Count(playerid, "แร่แดง") < 100)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[แจ้งเตือน]  {FFFFFF}คุณมี  แร่แดง  ไม่เพียงพอ (100)"); 
		
        //if (playerData[playerid][pRedMoney] < 10000)
            //return ErrorMsg(playerid ,"[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 10000 บาท");
		
		if (GetPlayerRedMoney(playerid) < 10000)
			return ErrorMsg(playerid, "[แจ้งเตือน]  {FFFFFF}คุณมี 'เงินแดง' ไม่เพียงพอ ต้องการ 10000 บาท");

		SendClientMessage(playerid, COLOR_CYAN, "[แจ้งเตือน]  {FFFFFF}คุณได้เริ่มต้นการคราฟ {00FFFF} บลูปริ้นกุญแจตู้ ");
		StartProgress(playerid, 200, 0, 0);
		StartSelectCraft[playerid] = 7;								
	}
	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
	//--> สนับมือ
	if (StartSelectCraft[playerid] == 1)
	{
		new percent = random(50);
		switch (percent)
		{
			case 0..10:
			{
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ [ สนับมือ ]  สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} สนับมือ  {00FFFF} + 1");
				UrLogknucklesucceed(playerid);

				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 10");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 10");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 30 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 30 ");
                SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 30 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 3,000 บาท");


				Inventory_Add(playerid, "สนับมือ", 1);
				Inventory_Remove(playerid, "ปูน", 10);
				Inventory_Remove(playerid, "สายไฟ", 10);		
				Inventory_Remove(playerid, "แร่เหลือง", 30);
				Inventory_Remove(playerid, "แร่เขียว", 30);
				Inventory_Remove(playerid, "แร่ฟ้า", 30);
                Inventory_Remove(playerid, "แร่แดง", 30);
				//playerData[playerid][pRedMoney] -= 3000;
				GivePlayerRedMoney(playerid, -3000);
				StartSelectCraft[playerid] = 0;
			}
			case 11..50:
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 10");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 10");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 30 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 30 ");
                SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 30 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 3,000 บาท");

				Inventory_Remove(playerid, "ปูน", 10);
				Inventory_Remove(playerid, "สายไฟ", 10);		
				Inventory_Remove(playerid, "แร่เหลือง", 30);
				Inventory_Remove(playerid, "แร่เขียว", 30);
				Inventory_Remove(playerid, "แร่ฟ้า", 30);
                Inventory_Remove(playerid, "แร่แดง", 30);
				//playerData[playerid][pRedMoney] -= 3000;
				GivePlayerRedMoney(playerid, -3000);
				StartSelectCraft[playerid] = 0;
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ"); 
				UrLogknucklefail(playerid);
			}
		}
	}				
    //--> ไม้สนุ๊ก
	if (StartSelectCraft[playerid] == 2)
	{
		new percent = random(50);
		switch (percent)
		{
			case 0..10:
			{
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ  [ ไม้สนุ๊ก ]  {FFFFFF}สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ไม้สนุ๊ก  {00FFFF} + 1");
				UrLogpoolsucceed(playerid);

				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 70");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 70 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 70 ");
                SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 70 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 3,000 บาท");


				Inventory_Add(playerid, "ไม้สนุ๊ก", 1);
				Inventory_Remove(playerid, "ปูน", 30);
				Inventory_Remove(playerid, "สายไฟ", 30);		
				Inventory_Remove(playerid, "แร่เหลือง", 70);
				Inventory_Remove(playerid, "แร่เขียว", 70);
				Inventory_Remove(playerid, "แร่ฟ้า", 70);
                Inventory_Remove(playerid, "แร่แดง", 70);
				//playerData[playerid][pRedMoney] -= 3000;
				GivePlayerRedMoney(playerid, -3000);
				StartSelectCraft[playerid] = 0;
			}
			case 11..50:
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 70");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 70 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 70 ");
                SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 70 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 3,000 บาท");

				Inventory_Remove(playerid, "ปูน", 30);
				Inventory_Remove(playerid, "สายไฟ", 30);		
				Inventory_Remove(playerid, "แร่เหลือง", 70);
				Inventory_Remove(playerid, "แร่เขียว", 70);
				Inventory_Remove(playerid, "แร่ฟ้า", 70);
                Inventory_Remove(playerid, "แร่แดง", 70);
				//playerData[playerid][pRedMoney] -= 3000;
				GivePlayerRedMoney(playerid, -3000);
				StartSelectCraft[playerid] = 0;
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
				UrLogpoolfail(playerid);
			}
		}
	}				
	//--> ไม้เบสบอล
	if (StartSelectCraft[playerid] == 3)
	{
		new percent = random(100); // 0-99
		switch (percent)
		{
			case 0..39: // 40% สำเร็จ
			{
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ  [ ไม้เบสบอล ]  {FFFFFF}สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ไม้เบสบอล  {00FFFF} + 1");
				UrLogbaseballsucceed(playerid);

				Inventory_Add(playerid, "ไม้เบสบอล", 1);
			}
			case 40..99: // 60% ล้มเหลว
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
				UrLogbaseballfail(playerid);
			}
		}

		// หักของเหมือนกันทั้งสำเร็จ/ล้มเหลว
		SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 40");
		SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 40");
		SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 100");
		SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 100");
		SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 100");
		SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 100");
		SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 3,000 บาท");

		Inventory_Remove(playerid, "ปูน", 40);
		Inventory_Remove(playerid, "สายไฟ", 40);		
		Inventory_Remove(playerid, "แร่เหลือง", 100);
		Inventory_Remove(playerid, "แร่เขียว", 100);
		Inventory_Remove(playerid, "แร่ฟ้า", 100);
		Inventory_Remove(playerid, "แร่แดง", 100);
		//playerData[playerid][pRedMoney] -= 3000;
		GivePlayerRedMoney(playerid, -3000);

		StartSelectCraft[playerid] = 0;
	}
	//--> ไม้กอล์ฟ
	if (StartSelectCraft[playerid] == 4)
	{
		new percent = random(50);
		switch (percent)
		{
			case 0..10:
			{
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ  [ ไม้กอล์ฟ ]  {FFFFFF}สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ไม้กอล์ฟ  {00FFFF} + 1");
				UrLoggolfclubsucceed(playerid);

				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 50");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 50");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 100");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 100 ");
                SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 3,000 บาท");


				Inventory_Add(playerid, "ไม้กอล์ฟ", 1);
				Inventory_Remove(playerid, "ปูน", 50);
				Inventory_Remove(playerid, "สายไฟ", 50);		
				Inventory_Remove(playerid, "แร่เหลือง", 100);
				Inventory_Remove(playerid, "แร่เขียว", 100);
				Inventory_Remove(playerid, "แร่ฟ้า", 100);
                Inventory_Remove(playerid, "แร่แดง", 100);
				//playerData[playerid][pRedMoney] -= 3000;
				GivePlayerRedMoney(playerid, -3000);
				StartSelectCraft[playerid] = 0;
			}
			case 11..50:
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 50");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 50");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 100");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 100 ");
                SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 3,000 บาท");

				Inventory_Remove(playerid, "ปูน", 50);
				Inventory_Remove(playerid, "สายไฟ", 50);		
				Inventory_Remove(playerid, "แร่เหลือง", 100);
				Inventory_Remove(playerid, "แร่เขียว", 100);
				Inventory_Remove(playerid, "แร่ฟ้า", 100);
                Inventory_Remove(playerid, "แร่แดง", 100);
				//playerData[playerid][pRedMoney] -= 3000;
				GivePlayerRedMoney(playerid, -3000);
				StartSelectCraft[playerid] = 0;
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
				UrLoggolfclubfail(playerid);
			}
		}
	}	
	//--> คาตานะ
	if (StartSelectCraft[playerid] == 5)
	{
		new percent = random(100); // 0 - 99

		switch (percent)
		{
			case 0..29: // 30%
			{
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ  [ คาตานะ ]  {FFFFFF}สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} คาตานะ  {00FFFF} + 1");
				UrLogKatanasucceed(playerid);

				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 100");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 100");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 100");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 3,000 บาท");

				Inventory_Add(playerid, "คาตานะ", 1);
				Inventory_Remove(playerid, "ปูน", 100);
				Inventory_Remove(playerid, "สายไฟ", 100);		
				Inventory_Remove(playerid, "แร่เหลือง", 100);
				Inventory_Remove(playerid, "แร่เขียว", 100);
				Inventory_Remove(playerid, "แร่ฟ้า", 100);
				Inventory_Remove(playerid, "แร่แดง", 100);
				//playerData[playerid][pRedMoney] -= 3000;
				GivePlayerRedMoney(playerid, -3000);
				StartSelectCraft[playerid] = 0;
				
			}
			case 30..99: // 70%
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 100");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 100");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 100");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 3,000 บาท");

				Inventory_Remove(playerid, "ปูน", 100);
				Inventory_Remove(playerid, "สายไฟ", 100);		
				Inventory_Remove(playerid, "แร่เหลือง", 100);
				Inventory_Remove(playerid, "แร่เขียว", 100);
				Inventory_Remove(playerid, "แร่ฟ้า", 100);
				Inventory_Remove(playerid, "แร่แดง", 100);
				//playerData[playerid][pRedMoney] -= 3000;
				GivePlayerRedMoney(playerid, -3000);
				StartSelectCraft[playerid] = 0;
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
				UrLogKatanafail(playerid);
			}
		}
	}
	//--> กุญแจตู้เซฟ
	if (StartSelectCraft[playerid] == 6)
	{
		new percent = random(100); // 0 - 99

		switch (percent)
		{
			case 0..29: // 30%
			{
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ  [ กุญแจตู้เซฟ ]  {FFFFFF}สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} กุญแจตู้เซฟ  {00FFFF} + 1");

				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 50");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 60");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 60 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 5000 บาท");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} บลูปริ้นกุญแจตู้ {00FFFF} - 1 ");

				Inventory_Add(playerid, "กุญแจตู้เซฟ", 1);
				Inventory_Remove(playerid, "ปูน", 50);
				Inventory_Remove(playerid, "สายไฟ", 30);		
				Inventory_Remove(playerid, "แร่เหลือง", 60);
				Inventory_Remove(playerid, "แร่เขียว", 60);
				Inventory_Remove(playerid, "แร่ฟ้า", 100);
				Inventory_Remove(playerid, "แร่แดง", 100);
				Inventory_Remove(playerid, "บลูปริ้นกุญแจตู้", 1);
				//playerData[playerid][pRedMoney] -= 5000;
				GivePlayerRedMoney(playerid, -5000);
				StartSelectCraft[playerid] = 0;
				
			}
			case 30..99: // 70%
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 50");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 60");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 60 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 5000 บาท");

				Inventory_Remove(playerid, "ปูน", 50);
				Inventory_Remove(playerid, "สายไฟ", 30);		
				Inventory_Remove(playerid, "แร่เหลือง", 60);
				Inventory_Remove(playerid, "แร่เขียว", 60);
				Inventory_Remove(playerid, "แร่ฟ้า", 100);
				Inventory_Remove(playerid, "แร่แดง", 100);
				Inventory_Remove(playerid, "บลูปริ้นกุญแจตู้", 1);
				//playerData[playerid][pRedMoney] -= 5000;
				GivePlayerRedMoney(playerid, -5000);
				StartSelectCraft[playerid] = 0;
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
			}
		}
	}
    	//--> บลูปริ้นกุญแจตู้
	if (StartSelectCraft[playerid] == 7)
	{
		new percent = random(100); // 0 - 99

		switch (percent)
		{
			case 0..29: // 30%
			{
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} ยินดีด้วยคุณคราฟอาวุธ  [ บลูปริ้นกุญแจตู้ ]  {FFFFFF}สำเร็จ");
				SendClientMessage(playerid, COLOR_GREEN, "[แจ้งเตือน]  {FFFFFF} บลูปริ้นกุญแจตู้  {00FFFF} + 1");

				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 50");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 60");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 60 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 5000 บาท");

				Inventory_Add(playerid, "บลูปริ้นกุญแจตู้", 1);
				Inventory_Remove(playerid, "ปูน", 50);
				Inventory_Remove(playerid, "สายไฟ", 30);		
				Inventory_Remove(playerid, "แร่เหลือง", 60);
				Inventory_Remove(playerid, "แร่เขียว", 60);
				Inventory_Remove(playerid, "แร่ฟ้า", 100);
				Inventory_Remove(playerid, "แร่แดง", 100);
				//playerData[playerid][pRedMoney] -= 5000;
				GivePlayerRedMoney(playerid, -5000);
				StartSelectCraft[playerid] = 0;
				
			}
			case 30..99: // 70%
			{
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} ปูน  {00FFFF} - 50");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} สายไฟ {00FFFF} - 30");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เหลือง {00FFFF} - 60");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่เขียว {00FFFF} - 60 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่ฟ้า {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} แร่แดง {00FFFF} - 100 ");
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เงินแดง {00FFFF} - 5000 บาท");

				Inventory_Remove(playerid, "ปูน", 50);
				Inventory_Remove(playerid, "สายไฟ", 30);		
				Inventory_Remove(playerid, "แร่เหลือง", 60);
				Inventory_Remove(playerid, "แร่เขียว", 60);
				Inventory_Remove(playerid, "แร่ฟ้า", 100);
				Inventory_Remove(playerid, "แร่แดง", 100);
				//playerData[playerid][pRedMoney] -= 5000;
				GivePlayerRedMoney(playerid, -5000);
				StartSelectCraft[playerid] = 0;
				SendClientMessage(playerid, COLOR_RED, "[แจ้งเตือน]  {FFFFFF} เสียใจด้วย คุณล้มเหลวในการคราฟ");
			}
		}
	}
    return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(StartSelectCraft[playerid] == 1)
	{
		ApplyAnimation(playerid, "BD_FIRE", "BD_PANIC_LOOP", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(StartSelectCraft[playerid] == 2)
	{
		ApplyAnimation(playerid, "BD_FIRE", "BD_PANIC_LOOP", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(StartSelectCraft[playerid] == 3)
	{
		ApplyAnimation(playerid, "BD_FIRE", "BD_PANIC_LOOP", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(StartSelectCraft[playerid] == 4)
	{
		ApplyAnimation(playerid, "BD_FIRE", "BD_PANIC_LOOP", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}	
	if(StartSelectCraft[playerid] == 5)
	{
		ApplyAnimation(playerid, "BD_FIRE", "BD_PANIC_LOOP", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(StartSelectCraft[playerid] == 6)
	{
		ApplyAnimation(playerid, "BD_FIRE", "BD_PANIC_LOOP", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(StartSelectCraft[playerid] == 7)
	{
		ApplyAnimation(playerid, "BD_FIRE", "BD_PANIC_LOOP", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}			
	return Y_HOOKS_CONTINUE_RETURN_0;
}
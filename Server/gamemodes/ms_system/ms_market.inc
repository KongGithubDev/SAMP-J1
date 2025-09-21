#include <YSI_Coding\y_hooks>

hook OnGameModeInit(){
	CreateActor(2, 1129.0385,-1469.5271,15.7475,355.9472);
    Create3DTextLabel("{FF00FF}  MARKET ", -1, 1129.0385,-1469.5271,15.7475+1.0, 50.0, 0, 0);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, 1129.0385,-1469.5271,15.7475))
        {
            Dialog_Show(playerid, DIALOG_SHOPMERCHANT, DIALOG_STYLE_LIST, "{FF00FF}[ NEW MARKET ]",
            "[1] รังผึ่ง\n\
            [2] ส้ม\n\
            [3] ข้าว\n\
            [4] ปลาหมึก\n\
            [5] แร่เหลือง\n\
            [6] แร่เขียว\n\
            [7] แร่ฟ้า\n\
            [8] แร่แดง\n\
            [9] กล้วย\n\
            [10] กุ้งล็อบสเตอร์\n\
            [11] ทุเรียน\n\
            [12] กระบองเพชร\n\
            [13] ผักกาด\n\
            [14] ปลาทู\n\
            [15] ปลาแซลม่อน\n\
            [16] ปลานิล\n\
            [17] ปู\n\
            [18] กุ้ง\n\
            [19] คาร์บอน\n\
            [20] เศษไม้\n\
            [21] เศษเหล็ก","ตกลง","ยกเลิก");
        }
    }
    return 1;
}

Dialog:DIALOG_SHOPMERCHANT(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
			    Dialog_Show(playerid, DIALOG_SELLHONEY, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
				ชื่อรายการ\tราคา\n\
				รังผึ่ง\t{00FF00}$%d", "ขาย", "ออก", priceHoney);
            }
            case 1:
            {
                Dialog_Show(playerid, DIALOG_SELLORANGE, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                ส้ม\t{00FF00}$%d", "ขาย","ออก", priceOrange);
            }
            case 2:
            {
                Dialog_Show(playerid, DIALOG_SELLRICE, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
			    ชื่อรายการ\tราคา\n\
			    ข้าว\t{00FF00}$%d", "ขาย","ออก", priceRice);
            }
            case 3:
            {
                Dialog_Show(playerid, DIALOG_SELLSQUID, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                ปลาหมึก\t{00FF00}$%d", "ขาย","ออก", priceSquid);
            }
            case 4:
            {
                Dialog_Show(playerid, DIALOG_SELLMINING1, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                แร่เหลือง\t{00FF00}$%d", "ขาย","ออก", priceMining1);
            }
            case 5:
            {
                Dialog_Show(playerid, DIALOG_SELLMINING2, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                แร่เขียว\t{00FF00}$%d", "ขาย","ออก", priceMining2);
            }
            case 6:
            {
                Dialog_Show(playerid, DIALOG_SELLMINING3, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                แร่ฟ้า\t{00FF00}$%d", "ขาย","ออก", priceMining3);
            }
            case 7:
            {
                Dialog_Show(playerid, DIALOG_SELLMINING4, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                แร่แดง\t{00FF00}$%d", "ขาย","ออก", priceMining4);
            }
            
            case 8:
            {
                Dialog_Show(playerid, DIALOG_SELLBANANA, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                กล้วย\t{00FF00}$%d", "ขาย","ออก", priceBanana);
            }
            case 9:
            {
                Dialog_Show(playerid, DIALOG_SELLLOBSTER, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                กุ้งล็อบสเตอร์\t{00FF00}$%d", "ขาย","ออก", priceLobster);
            }
            case 10:
            {
                Dialog_Show(playerid, DIALOG_SELLDURIAN, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                ทุเรียน\t{00FF00}$%d", "ขาย","ออก", priceDurian);
            }
            case 11:
            {
                Dialog_Show(playerid, DIALOG_SELLCACTUS, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                กระบองเพชร\t{00FF00}$%d", "ขาย","ออก", priceCactus);
            }
            case 12:
            {
                Dialog_Show(playerid, DIALOG_SELLLETTUCE, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                ผักกาด\t{00FF00}$%d", "ขาย","ออก", priceLettuce);
            }

            case 13:
            {
                Dialog_Show(playerid, DIALOG_SELLFISHING1, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                ปลาทู\t{00FF00}$%d", "ขาย","ออก", pricefish1);
            }
            case 14:
            {
                Dialog_Show(playerid, DIALOG_SELLFISHING2, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                ปลาแซลม่อน\t{00FF00}$%d", "ขาย","ออก", pricefish2);
            }
            case 15:
            {
                Dialog_Show(playerid, DIALOG_SELLFISHING3, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                ปลานิล\t{00FF00}$%d", "ขาย","ออก", pricefish3);
            }
            case 16:
            {
                Dialog_Show(playerid, DIALOG_SELLFISHING4, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                ปู\t{00FF00}$%d", "ขาย","ออก", pricefish4);
            }
            case 17:
            {
                Dialog_Show(playerid, DIALOG_SELLFISHING5, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                กุ้ง\t{00FF00}$%d", "ขาย","ออก", pricefish5);
            }
            case 18:
            {
                Dialog_Show(playerid, DIALOG_SELLCOAL, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                คาร์บอน\t{00FF00}$%d", "ขาย","ออก", priceCoal);
            }
            case 19:
            {
                Dialog_Show(playerid, DIALOG_SELLWOOD, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                เศษไม้\t{00FF00}$%d", "ขาย","ออก", priceWood);
            }
            case 20:
            {
                Dialog_Show(playerid, DIALOG_SELLIRON, DIALOG_STYLE_TABLIST_HEADERS, "[รับซื้อสินค้า]", "\
                ชื่อรายการ\tราคา\n\
                เศษเหล็ก\t{00FF00}$%d", "ขาย","ออก", priceIron);
            }
            
        }
    }
    return 1;
}
#include    <a_samp>
#include	<YSI_Coding\y_hooks>
#include    <discord-connector>

//----LOG ATM----//
URLogAtmDEPOSIT(playerid,amount) //ฝากเงิน
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log ATM");
    format(str, sizeof str, "ผู้เล่น  %s ได้ฝากเงินจำนวน %s เข้าธนาคาร \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`",GetPlayerNameEx(playerid),FormatMoney(amount), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x0BFA00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401849231442051082"), embed);
    return 1;
}

URLogAtmWITHDRAW(playerid,amount) // ถอนเงิน
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log ATM");
    format(str, sizeof str, "ผู้เล่น  %s ได้ถอนเงินจำนวน %s ออกจากธนาคาร \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`",GetPlayerNameEx(playerid),FormatMoney(amount), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401849366888710224"), embed);
    return 1;
}

URLogAtmTRANSFER(playerid,amount) // โอนเงิน
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log ATM");
    format(str, sizeof str, "ผู้เล่น %s ได้โอนเงินจำนวน %s ให้กับ  %s ออกจากบัญชี\n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`",GetPlayerNameEx(playerid), FormatMoney(amount), GetPlayerNameEx(playerData[playerid][pTransfer]), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401849410916454452"), embed);
    return 1;
}

//=================================================================================================//

//----LOG CRAFTING----//
//สำเร็จ
UrLogknucklesucceed(playerid) //สนับมือ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ สนับมือ สำเร็จ \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634194295226488"), embed);
    return 1;
}

UrLogpoolsucceed(playerid) //ไม้พลู
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ ไม้พลู สำเร็จ \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634323165089902"), embed);
    return 1;
}

UrLogbaseballsucceed(playerid) //ไม้เบส
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ ไม้เบส สำเร็จ \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634444292653099"), embed);
    return 1;
}

UrLoggolfclubsucceed(playerid) //ไม้กอล์ฟ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ ไม้กอล์ฟ สำเร็จ \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634535937933342"), embed);
    return 1;
}

UrLogKatanasucceed(playerid) //คาตานะ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ คาตานะ สำเร็จ \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634630754635886"), embed);
    return 1;
}
//=================================================================================================//

//----LOG CRAFTING----//
//ล้มเหลว
UrLogknucklefail(playerid) //สนับมือ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ สนับมือ ล้มเหลว \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828529540304927"), embed);
    return 1;
}

UrLogpoolfail(playerid) //ไม้พลู
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ ไม้พลู ล้มเหลว \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828755198185553"), embed);
    return 1;
}

UrLogbaseballfail(playerid) //ไม้เบส
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ ไม้เบส ล้มเหลว \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828797879287868"), embed);
    return 1;
}

UrLoggolfclubfail(playerid) //ไม้กอล์ฟ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ ไม้กอล์ฟ ล้มเหลว \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828825003982858"), embed);
    return 1;
}

UrLogKatanafail(playerid) //คาตานะ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "ผู้เล่น %s ได้คราฟ คาตานะ ล้มเหลว \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828847145455697"), embed);
    return 1;
}
//=================================================================================================//

//LOG SHOP DONATE
UrLogShopDonate1(playerid) //บัตรเทรดอาวุธ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : บัตรเทรดอาวุธ \nจำนวน  : 1 \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413939757544898753"), embed);
    return 1;
}

UrLogShopDonate2(playerid) //กล่องตีอาวุธv1
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : กล่องตีอาวุธv1 \nจำนวน  : 1 \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413946196476559596"), embed);
    return 1;
}

UrLogShopDonate3(playerid) //กาชาปอง
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : กาชาปอง \nจำนวน  : 1 \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413946386151374899"), embed);
    return 1;
}

UrLogShopDonate4(playerid) //หมัดสายฟ้า
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : หมัดสายฟ้า \nจำนวน  : 1 \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413946663474561267"), embed);
    return 1;
}

UrLogShopDonate5(playerid) //รองเท้าหมา
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : รองเท้าหมา \nจำนวน  : 1 \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413947009408434226"), embed);
    return 1;
}

UrLogShopDonate6(playerid) //รถโดเนท BMW i8
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : BMW i8 \nจำนวน : 1 คัน \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413949149627420682"), embed);
    return 1;
}

UrLogShopDonate7(playerid) //รถโดเนท GTR R35
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : GTR R35 \nจำนวน : 1 คัน \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413949396814397570"), embed);
    return 1;
}

UrLogShopDonate8(playerid) //รถโดเนท McLaren 720s
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : McLaren 720s \nจำนวน : 1 คัน \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413949475524706374"), embed);
    return 1;
}

UrLogShopDonate9(playerid) //สกิน กล่องสกิน193
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : กล่องสกิน193 \nจำนวน : 1  \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413949937879613606"), embed);
    return 1;
}

UrLogShopDonate10(playerid) //สกิน กล่องสกิน75
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "ผู้ซื้อ : %s\nสินค้า : กล่องสกิน75 \nจำนวน : 1  \n\
	`วัน/เวลา : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413950016275349546"), embed);
    return 1;
}
///////////////////////////////////////////////////

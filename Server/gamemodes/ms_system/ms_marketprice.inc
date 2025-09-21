#include     <YSI_Coding\y_hooks>

new priceHoney;
new priceOrange ;
new priceRice ;
new priceSquid ;
new priceMining1 ;
new priceMining2 ;
new priceMining3 ;
new priceMining4 ;

new priceBanana;
new priceLobster;
new priceDurian;
new priceCactus;
new priceLettuce;

new pricefish1;
new pricefish2;
new pricefish3;
new pricefish4;
new pricefish5;

new priceCoal;
new priceWood;
new priceIron;

hook OnGameModeInit(){
    SetRandomPrice(); 
}
//ราคาตลาดโลก
forward SetRandomPrice();
public SetRandomPrice(){
    priceHoney = random(50)+10; //ซ้ายเพิ่ม ขวาน้อยสุด สุ่มราคา 30-100
    priceOrange = random(50)+10;
    priceRice = random(50)+10;
    priceSquid = random(50)+10;
    priceMining1 = random(50)+10;
    priceMining2 = random(50)+10;
    priceMining3 = random(50)+10;
    priceMining4 = random(50)+10;

    priceBanana = random(50)+10;
    priceLobster = random(50)+10;
    priceDurian = random(50)+10;
    priceCactus = random(50)+10;
    priceLettuce = random(50)+10;

    pricefish1 = random(30)+10;
    pricefish2 = random(30)+10;
    pricefish3 = random(30)+10;
    pricefish4 = random(30)+10;
    pricefish5 = random(30)+10;
    priceCoal = random(20)+5;
    priceWood = random(20)+5;
    priceIron = random(20)+5;

    return 1;
}
task Uptime[4000000]() { //ปรับเอาเลยอยากให้รีตอนไหน
    priceHoney = random(50)+10; //ซ้ายเพิ่ม ขวาน้อยสุด สุ่มราคา 30-100
    priceOrange = random(50)+10;
    priceRice = random(50)+10;
    priceSquid = random(50)+10;
    priceMining1 = random(50)+10;
    priceMining2 = random(50)+10;
    priceMining3 = random(50)+10;
    priceMining4 = random(50)+10;

    priceBanana = random(50)+10;
    priceLobster = random(50)+10;
    priceDurian = random(50)+10;
    priceCactus = random(50)+10;
    priceLettuce = random(50)+10;

    pricefish1 = random(30)+10;
    pricefish2 = random(30)+10;
    pricefish3 = random(30)+10;
    pricefish4 = random(30)+10;
    pricefish5 = random(30)+10;
    priceCoal = random(20)+5;
    priceWood = random(20)+5;
    priceIron = random(20)+5;

    SendClientMessageToAll(COLOR_YELLOW, "[ MAEKET ] ราคาของสินค้าแต่ละชิ้นถูกปรับเปลี่ยนแล้ว ");
    return 1;
}
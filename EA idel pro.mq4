//+------------------------------------------------------------------+
//|                                                            forex profitable.mq4 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                             https://www.waterforex.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019,Vasliliy Strukov"
#property link      "https://www.waterforex.com"
#property version   "3.00"
#property strict


int 授权;

double g_ima_1;
double g_ima_5;
double g_ima_3;
 double HighIn4 = 0;
 string EA = "钱柜商业版";
extern int Slippage = 3;
static int RecordTime;
static bool done=false;
extern int MagicNumber = 888888;
int SINGLE;
int
   total,                                                // 标准手数计算
   bb=0,                                                 // 1 = 可用Buy 定单
   ss=0; 
 double 
   max,                                                  // 波动顶风的最高价格
   min,                                                  // 波动谷底的最该价格
   lmax,                                                 // 限定价格
                                                         // 超出我们考虑卖出价
   lmin,                                                 // 购买
   Lot;   

extern int     lim=   1;                                 // 比率返回距离
extern int     prodvig=3;                                // 比率前进距离
extern double  Prots= 20;    
   double lasttime;
  double lastpri;
  double lastway;
  double lastlot;  

string eaComment = "";
 bool DongTaiKaiGuan=false ;   
 int   BoDongLu=59  ;   
 int   ZiShiYing=68  ;   
 int   KaiCangYinZi=10  ;   
 int   PingCangYinZi=15  ;   
 int   PingCangYinZi2=31  ;   
 int   SuDuYinZi=9  ;   
 int   YingLiYinZi=15  ;   
string waterfish=" 由于是电脑自动下单，可以保证更快的下单，平仓速度，可以更敏感地响应价格变动和趋势变动。电脑可以克服人性中的弱点，该买则买，该卖则卖，无犹豫，无贪心，赢则不狂妄，亏也不沮丧，避免了情绪化操作。电脑可以每天24小时不间断地监控行情，并在适当的时机和点位自动进出场，完全不用人工的干预，可以让您夜晚安枕入眠，白天安心从事别的工作。";
 string waterfisd=" 由于是电脑自动下单，可以保证更快的下单，平仓速度，可以更敏感地响应价格变动和趋势变动。电脑可以克服人性中的弱点，该买则买，该卖则卖，无犹豫，无贪心，赢则不狂妄，亏也不沮丧，避免了情绪化操作。电脑可以每天24小时不间断地监控行情，并在适当的时机和点位自动进出场，完全不用人工的干预，可以让您夜晚安枕入眠，白天安心从事别的工作。";
 string waterfish3=" 由于是电脑自动下单，可以保证更快的下单，平仓速度，可以更敏感地响应价格变动和趋势变动。电脑可以克服人性中的弱点，该买则买，该卖则卖，无犹豫，无贪心，赢则不狂妄，亏也不沮丧，避免了情绪化操作。电脑可以每天24小时不间断地监控行情，并在适当的时机和点位自动进出场，完全不用人工的干预，可以让您夜晚安枕入眠，白天安心从事别的工作。";
 
 int stage=1;

 bool scape=false ;   

extern string a="//---Basic parameters//";// ==============================


enum StrategyA  {Stochastic,RSI,MA};

extern StrategyA Strategy;

extern bool mybuy=True;//Trade Buy
extern bool sell=True;//Trade Sell
extern double Lots=0.01;//Start lots
extern bool riskmanagement=False;//Use Money Management
extern int Risk=1000;//Autolot,Free margin for each 0.01 Lots

extern double Multipiler=1.5;//Lot Multiplier
extern int Distance=200;
extern double MaxLot=100;//Max Lot
extern int TP=100;
extern int SL=0;
extern int TrailStart=600;//Trail Start,point(0.not use)
extern int TrailDistance=100;//Trail Step,points
extern int MaxSpred=200;//Max spread(0.not use)
extern int Start_Hour=0;
extern int End_Hour=0;
extern bool Flag_Out_Znachki=true;//Draw on-off
extern int  Magic=77777;//Magic EA
extern string s00="//--- Stochastic paremeters ---//";//=============================
extern int per_K=3;
extern int per_D=3;
extern int slow=3;
extern int MaMetod=3;
extern int pprice=1;//0.Low/High 烨?1.Close/Close.
extern int Level_Stoh_Up=80;//Up_Level_Stoch
extern int Level_Stoh_Down=20;//Down_Level_Stoch
extern string a1="//--- RSI ---//";//==============================================
extern int RSI_Period=5;
extern int Up_Level_RSI=70.0;
extern int Down_Level_RSI=30.0;
extern string s1="//--- 汤 parameters ---//";//==================================
extern int Ma_Period_S=242;//Period
extern int Ma_Metod_S=0;//Averaging method
extern string s2="//--- Panel Parametrs ---//";//===============================
extern int X1=10;
extern int Y1=100;
extern color Color_InfoPanel=14474460;//info panel background color
extern color Color_Border=11119017;//Border color
extern string  Font="Arial";
extern int FontSize=10;
extern color Color_Text=6908265;





 int   Tima=1  ;   
 int   Timb=19  ;   
 int   StopLos=114  ;   

 int       by_in_1 = 0;
 int       by_in_2 = 0;
 int       by_in_3 = 19828668;
 int       by_in_5 = 3;
 bool      by_bo_6 = true;
 double    by_do_7 = 0;
 double    by_do_8 = 0;
 double    by_do_9 = 0;
 double    by_do_10 = 0;
 int       by_in_11 = 10;
 int       by_in_12 = 0;
 int       by_in_13 = 0;
 double    by_do_14 = 0;
 double    by_do_15 = 0;
 double    by_do_16 = 0;
 int       by_in_17 = 0;
 double    by_do_18 = 0;
 double    by_do_19 = 0;
 double    by_do_20 = 0;
 int       by_in_21 = 0;
 int       by_in_22 = 0;
 double    by_do_23 = 0;
 double    by_do_24 = 0;
 double    by_do_25 = 0;
 double    by_do_26 = 0;
 double    by_do_27 = 0;
 double    by_do_28 = 0;
 double    by_do_29 = 0;
 double    by_do_30 = 0;
 double    by_do_31 = 0;
 double    by_do_32 = 0;
 double    by_do_33 = 0;
 double    by_do_34 = 0;
 double    by_do_35 = 0;
 double    by_do_36 = 0;
 long      by_lo_37 = 0;
 long      by_lo_38 = 0;
 long      by_lo_39 = 0;
 long      by_lo_40 = 0;
 long      by_lo_41 = 0;
 long      by_lo_42 = 0;
 long      by_lo_43 = 0;
 string    by_st_44;
 int       by_in_45 = 0;
 int       by_in_46 = 1;
 string    by_st_47;
 datetime  by_lo_49 = D'2027.03.02';
 bool      by_bo_51 = true;
 bool      by_bo_52 = true;


//----------------------------
datetime timeOfLastMarkedBar;

 int init ()
 {
 
 
 
 
 


 double HighIn4 = iHigh(Symbol(), 0, iHighest(Symbol(), 0, MODE_HIGH, 100, 1));
double LowIn2 = iLow(Symbol(), 0, iLowest(Symbol(), 0, MODE_LOW, 100, 1));


 
 
 
 
 
 
 
 Risk=Risk/100;
 timeOfLastMarkedBar = Time[1];
 
 string      dfz_st_1;
 int         dfz_in_2;
 string      dfz_st_3;
 int         dfz_in_4;
 uint        dfz_ui_5;
 uint        dfz_ui_6;
 uint        dfz_ui_7;
 bool        dfz_bo_8;
 bool        dfz_bo_9;
 bool        dfz_bo_10;
 bool        dfz_bo_11;
 long        dfz_lo_12;
 uint        dfz_ui_13;
 long        dfz_lo_14;
 long        dfz_lo_15;
 int         dfz_in_16;
 int         dfz_in_17;
 int         dfz_in_18;
 int         dfz_in_19;

//----------------------------

 dfz_bo_8 = false ;
 dfz_bo_9 = false ;
 dfz_bo_10 = false ;
 dfz_bo_11 = false ;
 
 by_do_14 = MathPow(0.1,Digits()) ;
 if ( ( Digits() == 5 || Digits() == 3 ) )
  {
  by_in_11 = 10 ;
  }
 if ( ( StringFind(Symbol(),"XAU",0) >= 0 || StringFind(Symbol(),"GOLD",0) >= 0 ) )
  {
  if ( Digits() == 2 )
   {
   by_in_11 = 10 ;
   }
  if ( Digits() == 3 )
   {
   by_in_11 = 100 ;
   }
  if ( Digits() == 4 )
   {
   by_in_11 = 1000 ;
  }}
 by_in_17 = MarketInfo(Symbol(),16) ;
 ChartSetInteger(0,40,1); 
 dfz_st_1 = "TradeButton" ;
 dfz_in_2 = 0 ;
 dfz_st_3 = "Arial" ;
 dfz_in_4 = 9 ;
 dfz_ui_5 = Lavender ;
 dfz_ui_6 = 0x575757 ;
 dfz_ui_7 = DimGray ;
 dfz_bo_8 = false ;
 dfz_bo_9 = false ;
 dfz_bo_10 = false ;
 dfz_bo_11 = false ;
 dfz_lo_12 = 0 ;
 dfz_ui_13 = 0x575757 ;
 dfz_lo_14 = 0 ;
 dfz_lo_15 = 0 ;
 ChartGetInteger(0,106,0,dfz_lo_14); 
 ChartGetInteger(0,107,0,dfz_lo_15); 
 dfz_in_16 = 330 ;
 dfz_in_17 = 230 ;
 dfz_in_18 = 5 ;
 dfz_in_19 = 5 ;
 ButtonCreate(0,"EURUSD",0,10,100,165,245,0,"",dfz_st_3,9,clrGainsboro,Color_InfoPanel,Color_Border,true,false,false,false,0); 
 ButtonCreate(0,"EURUSD2",0,10,100,165,30,0,"神经网络EA",dfz_st_3,12,clrWhite,Blue,clrWhite,false,false,false,false,0); //eaidel
 
ButtonCreate(0,"EURUSD3",0,15,160,155,30,0,"Strage "+stage+" Selected",dfz_st_3,9,clrWhite,clrSeaGreen,clrGray,false,false,false,false,0);  //strage select
ButtonCreate(0,"EURUSD4",0,15,200,75,28,0,"Trade Buy",dfz_st_3,9,clrWhite,clrSeaGreen,clrWhite,true,false,false,false,0); 
ButtonCreate(0,"EURUSD5",0,95,200,75,28,0,"Trade Sell",dfz_st_3,9,clrWhite,clrSeaGreen,clrWhite,false,false,false,false,0); 

ButtonCreate(0,"EURUSD16",0,15,230,75,20,0,"Start Hour",dfz_st_3,9,Black,Color_InfoPanel,Color_InfoPanel,false,false,true,true,0); 

ButtonCreate(0,"EURUSD17",0,95,230,75,20,0,"Eend Hour",dfz_st_3,9,Black,Color_InfoPanel,Color_InfoPanel,false,false,false,false,0);

ButtonCreate(0,"EURUSD6",0,15,250,75,28,0,Start_Hour,dfz_st_3,9,Black,clrWhite,clrWhite,false,false,false,false,0); 
ButtonCreate(0,"EURUSD7",0,95,250,75,28,0,End_Hour,dfz_st_3,9,Black,clrWhite,clrWhite,false,false,false,false,0);

ButtonCreate(0,"EURUSD6",0,15,250,75,28,0,"",dfz_st_3,9,Black,clrWhite,clrWhite,false,false,false,false,0); 
ButtonCreate(0,"EURUSD7",0,95,250,75,28,0,"",dfz_st_3,9,Black,clrWhite,clrWhite,false,false,false,false,0);

ButtonCreate(0,"EURUSD8",0,15,285,75,28,0,"Close Buy",dfz_st_3,9,clrWhite,clrDarkOrchid,clrWhite,false,false,false,false,0); 
ButtonCreate(0,"EURUSD9",0,95,285,75,28,0,"Close Sell",dfz_st_3,9,clrWhite,clrDarkOrchid,clrWhite,false,false,false,false,0);
ButtonCreate(0,"EURUSD10",0,15,315,155,25,0,"New Series顺水鱼",dfz_st_3,9,clrWhite,clrSeaGreen,clrGray,false,false,false,false,0);  //strage select
//ButtonCreate(0,"EURUSD326",0,10,100,165,30,0,"",dfz_st_3,9,Red,Blue,clrWhite,true,true,true,true,0); 
//ButtonCreate(0,"EURUSD372",0,10,100,165,30,0,"",dfz_st_3,9,Red,Blue,clrWhite,true,true,true,true,0); 
//ButtonCreate(0,"EURUSD382",0,10,100,165,30,0,"",dfz_st_3,9,Red,Blue,clrWhite,true,true,true,true,0); 
//ButtonCreate(0,"EURUSD392",0,10,100,165,30,0,"",dfz_st_3,9,Red,Blue,clrWhite,true,true,true,true,0); 
//ButtonCreate(0,"EURUSD3210",0,10,100,165,30,0,"",dfz_st_3,9,Red,Blue,clrWhite,true,true,true,true,0); 
   EventSetMillisecondTimer(60);
   
//---

 return(0); 
 }
//init
//---------------------  ----------------------------------------

 void OnTimer ()
 {
 
 
 
 
 
 
 
 
 

   HideTestIndicators(TRUE);
   g_ima_5 = iMA(Symbol(), 0, 5, 0, MODE_LWMA, PRICE_MEDIAN, 0);
   g_ima_3 = iMA(Symbol(), 0, 3, 0, MODE_LWMA, PRICE_MEDIAN, 0);
   g_ima_1 = iMA(Symbol(), 0, 1, 0, MODE_LWMA, PRICE_MEDIAN, 0);
   HideTestIndicators(FALSE);
double price;
if (OrdersTotal()<=0){

OrderSend(Symbol(),OP_BUY,Lots(),Ask,3,0,0,"",0,0,Red);// Откр
}
    for (int j= OrdersTotal() - 1; j >= 0; j--) {
        OrderSelect(j,SELECT_BY_POS, MODE_TRADES);
        if( lasttime<OrderOpenTime())
        {lasttime=OrderOpenTime();
        lastway=OrderType();
        lastlot=OrderLots();
        lastpri=OrderOpenPrice();
            }
    }  
      SINGLE=1;
        for (int s= OrdersTotal() - 1; s >= 0; s--) {
        OrderSelect(s,SELECT_BY_POS, MODE_TRADES);
        if( Bid<OrderOpenPrice()+110*Point && Bid >OrderOpenPrice()+110*Point)
        {lasttime=OrderOpenTime();
        lastway=OrderType();
        lastlot=OrderLots();
        lastpri=OrderOpenPrice();
        SINGLE=0;
            
            
            
    }  
    }
    
   if ( lastpri<Bid-80.0*Point  )
      if(SINGLE=1){
      if(lastway=OP_BUY)
    
     
OrderSend(Symbol(),OP_BUY,Lots(),Ask,3,0,0,"顺水的鱼外汇EA",0,0,Blue);// Откр
      if(lastway=OP_SELL)
      
OrderSend(Symbol(),OP_BUY,Lots(),Ask,3,0,0,"顺水的鱼外汇EA",0,0,Blue);// Откр
 
}
 
    
    
if ( lastpri>Bid+80.0*Point  )
     if(SINGLE=1){
       if(lastway=OP_SELL)
    
OrderSend(Symbol(),OP_SELL,Lots(),Bid,3,0,0,"顺水的鱼外汇EA",0,0,Red);// Откр
      if(lastway=OP_BUY)
      
OrderSend(Symbol(),OP_BUY,Lots(),Ask,3,0,0,"顺水的鱼外汇EA",0,0,Blue);// Откр
 
}



double HighIn4 = iHigh(Symbol(), 0, iHighest(Symbol(), 0, MODE_HIGH, 50,5));
double LowIn2 = iLow(Symbol(), 0, iLowest(Symbol(), 0, MODE_LOW, 50, 5));


if (Bid<=LowIn2-40.0*Point)
if (Bid>iLow(Symbol(),0,0)+3.0*Point)
{

CloseAllWinSell();

CloseAllWinBuy();

}

if (Bid>=HighIn4+40.0*Point)
if (Bid<iHigh(Symbol(),0,0)+3.0*Point)
{

CloseAllWinBuy();

CloseAllWinSell();

}


    for (int h= OrdersTotal() - 1; h >= 0; h--) {
        OrderSelect(h,SELECT_BY_POS, MODE_TRADES);
        if( TimeCurrent()-OrderOpenTime()>1065000000000)
        {
        
        if(OrderType()==OP_BUY)
            OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid,Digits),Slippage , Blue);
        else if(OrderType()==OP_SELL)
            OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask,Digits), Slippage, Red);
        
            }
    } 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
     if(ObjectGetInteger(0,"EURUSD4",OBJPROP_STATE)==1)
     {
     
     
          ObjectSetInteger(0,"EURUSD4",OBJPROP_BGCOLOR,clrSeaGreen);
      }
      else
      {
           ObjectSetInteger(0,"EURUSD4",OBJPROP_BGCOLOR,Red);
         
       }
       
       
            if(ObjectGetInteger(0,"EURUSD5",OBJPROP_STATE)==1)
     {
     
     
          ObjectSetInteger(0,"EURUSD5",OBJPROP_BGCOLOR,Red);
      }
      else
      {
           ObjectSetInteger(0,"EURUSD5",OBJPROP_BGCOLOR,clrSeaGreen);
         
       }
 
       
            if(ObjectGetInteger(0,"EURUSD10",OBJPROP_STATE)==1)
     {
     
     
          ObjectSetInteger(0,"EURUSD10",OBJPROP_BGCOLOR,Red);
      }
      else
      {
           ObjectSetInteger(0,"EURUSD10",OBJPROP_BGCOLOR,clrSeaGreen);
         
       }
       
       
       
       
       
            if(ObjectGetInteger(0,"EURUSD8",OBJPROP_STATE)==1)
     {
     
     
      closebuy();
      }

       
       
       
       
       
            if(ObjectGetInteger(0,"EURUSD9",OBJPROP_STATE)==1)
     {
     
     
      closesell();
      }

             
       
 
       
       
       
       
       
       
       
       
       
       
       
 
 
 
 int         dfz_in_1;
 int         dfz_in_2;
 double      dfz_do_3;
 double      dfz_do_4;
 double      dfz_do_5;
 double      dfz_do_6;
 double      dfz_do_7;
 long        dfz_lo_8;
 double      dfz_do_9;
 double      dfz_do_10;
 double      dfz_do_11;
 double      dfz_do_12;
 double      dfz_do_13;
 int         dfz_in_14;
 bool        dfz_bo_15;

//----------------------------
 int        aa_in_1;
 int        aa_in_2;
 int        aa_in_3;
 int        aa_in_4;
 int        aa_in_5;
 int        aa_in_6;
 int        aa_in_7;
 int        aa_in_8;
 int        aa_in_9;
 int        aa_in_10;
 int        aa_in_11;
 int        aa_in_12;
 int        aa_in_13;

 dfz_bo_15 = false ;
 aa_in_1 = 0;
 aa_in_2 = 0;
 aa_in_3 = 0;
 aa_in_4 = 0;
 aa_in_5 = 0;
 aa_in_6 = 0;
 aa_in_7 = 0;
 aa_in_8 = 0;
 aa_in_9 = 0;
 aa_in_10 = 0;
 aa_in_11 = 0;
 aa_in_12 = 0;
 aa_in_13 = 0;
 dfz_in_1 = 1;

 
     显示("af321d","Time Terminal:"+TimeToString(TimeCurrent(),TIME_SECONDS )  ,0,20,140,9,"Arial",Blue);

 
 
 
 
 if ( Period() == 5 )
  {
 
  }
 by_do_20 = MarketInfo(Symbol(),13) ;
 by_bo_51 = true ;
 if ( IsExpertEnabled() == 0 )
  {
  ObjectCreate("启动",OBJ_LABEL,0,0,0,0,0,0,0); 
  ObjectSetText("启动","",9,"Arial",Chocolate); 
  ObjectSet("启动",OBJPROP_CORNER,100); 
  ObjectSet("启动",OBJPROP_XDISTANCE,100); 
  ObjectSet("启动",OBJPROP_YDISTANCE,80); 
  by_bo_51 = false ;
  }
 else
  {
  if ( IsExpertEnabled() == 1 )
   {
   ObjectCreate("启动",OBJ_LABEL,0,0,0,0,0,0,0); 
   ObjectSetText("启动","",10,"Arial",Chocolate); 
   ObjectSet("启动",OBJPROP_CORNER,100); 
   ObjectSet("启动",OBJPROP_XDISTANCE,100); 
   ObjectSet("启动",OBJPROP_YDISTANCE,80); 
  }}
 if ( IsTradeAllowed() == 0 && IsExpertEnabled() == 1 )
  {
  ObjectCreate("启动",OBJ_LABEL,0,0,0,0,0,0,0); 
  ObjectSetText("启动","",9,"Arial",Chocolate); 
  ObjectSet("启动",OBJPROP_CORNER,100); 
  ObjectSet("启动",OBJPROP_XDISTANCE,100); 
  ObjectSet("启动",OBJPROP_YDISTANCE,80); 
  by_bo_51 = false ;
  }
 else
  {
  if ( IsTradeAllowed() == 1 )
   {
   ObjectCreate("启动",OBJ_LABEL,0,0,0,0,0,0,0); 
   ObjectSetText("启动","",10,"Arial",Chocolate); 
   ObjectSet("启动",OBJPROP_CORNER,100); 
   ObjectSet("启动",OBJPROP_XDISTANCE,100); 
   ObjectSet("启动",OBJPROP_YDISTANCE,80); 
   }}
 if ( ( ( IsTesting() == 1 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"GBPUSD",0) >= 0 ) || ( IsTesting() == 1 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"XAUUSD",0) >= 0 ) || ( IsTesting() == 1 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"GOLD",0) >= 0 ) || ( IsTesting() == 1 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"USDJPY",0) >= 0 ) || (IsTesting() == 1 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"GBPCAD",0) >= 0) ) )
  {
  ObjectCreate("回测",OBJ_LABEL,0,0,0,0,0,0,0); 
  ObjectSetText("回测","",9,"Arial",Chocolate); 
  ObjectSet("回测",OBJPROP_CORNER,100); 
  ObjectSet("回测",OBJPROP_XDISTANCE,100); 
  ObjectSet("回测",OBJPROP_YDISTANCE,200); 
  by_bo_51 = false ;
  }
 if ( ( ( IsTesting() == 0 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"GBPUSD",0) >= 0 ) || ( IsTesting() == 0 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"XAUUSD",0) >= 0 ) || ( IsTesting() == 0 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"GOLD",0) >= 0 ) || ( IsTesting() == 0 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"USDJPY",0) >= 0 ) || (IsTesting() == 0 && by_do_20>by_in_11 * 10 && StringFind(Symbol(),"GBPCAD",0) >= 0) ) )
  {
  ObjectCreate("点差",OBJ_LABEL,0,0,0,0,0,0,0); 
  ObjectSetText("点差","",10,"Consolas",Red); 
  ObjectSet("点差",OBJPROP_CORNER,CORNER_LEFT_UPPER); 
  ObjectSet("点差",OBJPROP_XDISTANCE,10); 
  ObjectSet("点差",OBJPROP_YDISTANCE,30); 
  ObjectCreate("点差2",OBJ_LABEL,0,0,0,0,0,0,0); 
  ObjectSetText("点差2","",10,"Consolas",Red); 
  ObjectSet("点差2",OBJPROP_CORNER,CORNER_LEFT_UPPER); 
  ObjectSet("点差2",OBJPROP_XDISTANCE,85); 
  ObjectSet("点差2",OBJPROP_YDISTANCE,30); 
  by_bo_6 = false ;
  Print(TimeToString(TimeCurrent(),5) + " " + by_do_20); 
  }
 else
  {
  ObjectCreate("点差",OBJ_LABEL,0,0,0,0,0,0,0); 
  ObjectSetText("点差","",10,"Consolas",DodgerBlue); 
  ObjectSet("点差",OBJPROP_CORNER,CORNER_LEFT_UPPER); 
  ObjectSet("点差",OBJPROP_XDISTANCE,10); 
  ObjectSet("点差",OBJPROP_YDISTANCE,30); 
  ObjectCreate("点差2",OBJ_LABEL,0,0,0,0,0,0,0); 
  ObjectSetText("点差2","",10,"Consolas",DodgerBlue); 
  ObjectSet("点差2",OBJPROP_CORNER,CORNER_LEFT_UPPER); 
  ObjectSet("点差2",OBJPROP_XDISTANCE,85); 
  ObjectSet("点差2",OBJPROP_YDISTANCE,30); 
  by_bo_6 = true ;
  }
 dfz_in_2 = TimeCurrent() ;
 dfz_do_3 = by_lo_49 ;
 by_do_18 = NormalizeDouble(MarketInfo(Symbol(),9),Digits()) ;
 by_do_19 = NormalizeDouble(MarketInfo(Symbol(),10),Digits()) ;
 dfz_do_4 = iHigh(NULL,0,iHighest(NULL,0,MODE_HIGH,ZiShiYing,2)) ;
 dfz_do_5 = iLow(NULL,0,iLowest(NULL,0,MODE_LOW,ZiShiYing,2)) ;
 dfz_do_6 = iHigh(NULL,0,iHighest(NULL,0,MODE_HIGH,SuDuYinZi,2)) ;
 dfz_do_7 = iLow(NULL,0,iLowest(NULL,0,MODE_LOW,SuDuYinZi,2)) ;
 CountTrades ( ); 
 dfz_lo_8 = iTime(NULL,0,1) ;
 dfz_do_9 = iClose(NULL,0,1) ;
 by_lo_38 = iTime(NULL,0,1) ;
 by_lo_40 = iTime(NULL,0,1) ;
 dfz_do_10 = iClose(NULL,0,1) ;
 dfz_do_11 = iHigh(NULL,0,iHighest(NULL,0,MODE_HIGH,SuDuYinZi,1)) ;
 dfz_do_12 = iLow(NULL,0,iLowest(NULL,0,MODE_LOW,SuDuYinZi,1)) ;
 if ( dfz_do_11 - dfz_do_10>0 )
  {
  dfz_do_13 = FXPRO1(dfz_do_11,dfz_do_9/*by_do_18*/,/*dfz_do_10,*/dfz_do_11,/*by_do_19,*/dfz_do_12) ;
  }
 if ( dfz_do_13==100 )
  {
  by_bo_51 = false ;
  by_bo_52 = false ;
  }
 else
  {
  by_bo_52 = true ;
  }
 if ( Period() == 15 )
  {
  by_lo_43 = 910 ;
  }
 else
  {
  if ( Period() == 30 )
   {
   by_lo_43 = 1810 ;
   }
  else
   {
   if ( Period() == 60 )
    {
    by_lo_43 = 3610 ;
    }
   else
    {
    if ( Period() == 240 )
     {
     by_lo_43 = 14410 ;
  }}}}
 if ( StringFind(Symbol(),"GBPCAD",0) != 0 )
  {
  if ( FXPRO2(by_bo_6,by_in_21,dfz_do_9,dfz_do_5,BoDongLu,by_in_11,by_do_14,dfz_do_13,KaiCangYinZi,dfz_do_9,dfz_do_7,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) && by_lo_37  !=  by_lo_38 && by_bo_51 == true && by_do_18<by_in_11 * 5 * by_do_14 + dfz_do_9 && dfz_in_1 == 1 )
   {
   OpenBuy(); 
   }
  if ( FXPRO3(by_bo_6,by_in_22,dfz_do_4,dfz_do_9,BoDongLu,by_in_11,by_do_14,dfz_do_13,KaiCangYinZi,dfz_do_9,dfz_do_6,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) && by_lo_39  !=  by_lo_40 && by_bo_51 == true && by_do_18>dfz_do_9 - by_in_11 * 5 * by_do_14 && dfz_in_1 == 1 )
   {
   OpenSell(); 
   }
  if ( FXPRO4(by_bo_6,by_in_21,by_do_32,by_do_32,by_do_19,by_in_11,by_do_14,dfz_do_9,dfz_do_4,dfz_do_5,dfz_do_5,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) && by_lo_37  !=  by_lo_38 && dfz_in_2 - dfz_lo_8 <= by_lo_43 && by_bo_51 == true && by_do_18<by_in_11 * 5 * by_do_14 + dfz_do_9 && dfz_in_1 == 1 )
   {
   OpenBuy(); 
   }
  if ( FXPRO5(by_bo_6,by_in_22,by_do_33,by_do_18,by_do_33,by_in_11,by_do_14,dfz_do_9,dfz_do_4,dfz_do_5,dfz_do_4,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) && by_lo_39  !=  by_lo_40 && dfz_in_2 - dfz_lo_8 <= by_lo_43 && by_bo_51 == true && by_do_18>dfz_do_9 - by_in_11 * 5 * by_do_14 && dfz_in_1 == 1 )
   {
   OpenSell(); 
  }}
 dfz_in_14 = TimeHour(TimeLocal()) ;
 dfz_bo_15 = false ;
 if ( IsTesting() == 1 && ( TimeHour(TimeCurrent()) <= Tima || TimeHour(TimeCurrent()) >= Timb ) )
  {
  dfz_bo_15 = true ;
  }
 else
  {
  if ( IsTesting() == 0 && dfz_in_14 >= 3 && dfz_in_14 <= 9 )
   {
   dfz_bo_15 = true ;
  }}
 if ( scape == true && StringFind(Symbol(),"GBPCAD",0) >= 0 && dfz_bo_15 == true )
  {
  if ( FXPRO2(by_bo_6,by_in_21,dfz_do_9,dfz_do_5,-1000,by_in_11,by_do_14,dfz_do_13,KaiCangYinZi,dfz_do_9,dfz_do_7,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) && by_lo_37  !=  by_lo_38 && by_bo_51 == true && dfz_do_6 - dfz_do_7<by_in_11 * 180 * by_do_14 && by_do_18<by_in_11 * 5 * by_do_14 + dfz_do_9 && dfz_in_1 == 1 )
   {
   OpenBuy(); 
   }
  if ( FXPRO3(by_bo_6,by_in_22,dfz_do_4,dfz_do_9,-1000,by_in_11,by_do_14,dfz_do_13,KaiCangYinZi,dfz_do_9,dfz_do_6,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) && by_lo_39  !=  by_lo_40 && by_bo_51 == true && dfz_do_6 - dfz_do_7<by_in_11 * 180 * by_do_14 && by_do_18>dfz_do_9 - by_in_11 * 5 * by_do_14 && dfz_in_1 == 1 )
   {
   OpenSell(); 
   }
  if ( FXPRO4(by_bo_6,by_in_21,by_do_32,by_do_32,by_do_19,by_in_11,by_do_14,1000,dfz_do_4,dfz_do_5,dfz_do_5,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) && by_lo_37  !=  by_lo_38 && dfz_in_2 - dfz_lo_8 <= by_lo_43 && by_bo_51 == true && by_do_18<by_in_11 * 5 * by_do_14 + dfz_do_9 && dfz_in_1 == 1 )
   {
   OpenBuy(); 
   }
  if ( FXPRO5(by_bo_6,by_in_22,by_do_33,by_do_18,by_do_33,by_in_11,by_do_14,-1000,dfz_do_4,dfz_do_5,dfz_do_4,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) && by_lo_39  !=  by_lo_40 && dfz_in_2 - dfz_lo_8 <= by_lo_43 && by_bo_51 == true && by_do_18>dfz_do_9 - by_in_11 * 5 * by_do_14 && dfz_in_1 == 1 )
   {
   OpenSell(); 
  }}
  
if (timeOfLastMarkedBar < dfz_lo_8) {
  
 if ( FXPRO6(by_in_21,dfz_do_9,dfz_do_6,dfz_do_13,PingCangYinZi,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) )
  {
  aa_in_2 = 0;
  for (aa_in_3 = OrdersTotal() - 1 ; aa_in_3 >= 0 ; aa_in_3=aa_in_3 - 1)
   {
   if ( OrderSelect(aa_in_3,SELECT_BY_POS,MODE_TRADES) && OrderSymbol() == Symbol() && OrderMagicNumber() == by_in_3 && OrderType() == aa_in_2 )
    {
    bool temp1 = OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),300,Yellow); 
    }
   }
  }
 if ( FXPRO7(by_in_22,dfz_do_9,dfz_do_7,dfz_do_13,PingCangYinZi,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) )
  {
  aa_in_4 = 1;
  for (aa_in_5 = OrdersTotal() - 1 ; aa_in_5 >= 0 ; aa_in_5=aa_in_5 - 1)
   {
   if ( OrderSelect(aa_in_5,SELECT_BY_POS,MODE_TRADES) && OrderSymbol() == Symbol() && OrderMagicNumber() == by_in_3 && OrderType() == aa_in_4 )
    {
    bool temp2 = OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),300,Yellow); 
    }
   }
  }
 if ( FXPRO8(by_in_21,dfz_do_9,by_do_32,YingLiYinZi,by_in_11,by_do_14,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) )
  {
  aa_in_6 = 0;
  for (aa_in_7 = OrdersTotal() - 1 ; aa_in_7 >= 0 ; aa_in_7=aa_in_7 - 1)
   {
   if ( OrderSelect(aa_in_7,SELECT_BY_POS,MODE_TRADES) && OrderSymbol() == Symbol() && OrderMagicNumber() == by_in_3 && OrderType() == aa_in_6 )
    {
    bool temp3 = OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),300,Yellow); 
    }
   }
  }
 if ( FXPRO9(by_in_22,dfz_do_9,by_do_33,YingLiYinZi,by_in_11,by_do_14,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) )
  {
  aa_in_8 = 1;
  for (aa_in_9 = OrdersTotal() - 1 ; aa_in_9 >= 0 ; aa_in_9=aa_in_9 - 1)
   {
   if ( OrderSelect(aa_in_9,SELECT_BY_POS,MODE_TRADES) && OrderSymbol() == Symbol() && OrderMagicNumber() == by_in_3 && OrderType() == aa_in_8 )
    {
    bool temp4 = OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),300,Yellow); 
    }
   }
  }
 if ( FXPRO10(by_in_21,by_do_27,dfz_do_13,PingCangYinZi2,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) )
  {
  aa_in_10 = 0;
  for (aa_in_11 = OrdersTotal() - 1 ; aa_in_11 >= 0 ; aa_in_11=aa_in_11 - 1)
   {
   if ( OrderSelect(aa_in_11,SELECT_BY_POS,MODE_TRADES) && OrderSymbol() == Symbol() && OrderMagicNumber() == by_in_3 && OrderType() == aa_in_10 )
    {
    bool temp5 = OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),300,Yellow); 
    }
   }
  }
 if ( FXPRO11(by_in_22,by_do_28,dfz_do_13,PingCangYinZi2,dfz_in_2,by_in_46,by_in_46,by_in_46,by_in_46,dfz_do_3) )
  {
  aa_in_12 = 1;
  for (aa_in_13 = OrdersTotal() - 1 ; aa_in_13 >= 0 ; aa_in_13=aa_in_13 - 1)
   {
   if ( OrderSelect(aa_in_13,SELECT_BY_POS,MODE_TRADES) && OrderSymbol() == Symbol() && OrderMagicNumber() == by_in_3 && OrderType() == aa_in_12 )
    {
    bool temp6 = OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),300,Yellow); 
    }
   }
  }
  
  timeOfLastMarkedBar = dfz_lo_8;
}
 ObjectCreate("sd2",OBJ_LABEL,0,0,0,0,0,0,0); 
 ObjectSetText("sd2","",9,"Arial",Magenta); 
 ObjectSet("sd2",OBJPROP_CORNER,10); 
 ObjectSet("sd2",OBJPROP_XDISTANCE,10); 
 ObjectSet("sd2",OBJPROP_YDISTANCE,60); 
 if ( by_bo_51 == false )
  {
  ObjectCreate("sd3",OBJ_LABEL,0,0,0,0,0,0,0); 
  ObjectSetText("sd3","",9,"Arial",Yellow); 
  ObjectSet("sd3",OBJPROP_CORNER,90); 
  ObjectSet("sd3",OBJPROP_XDISTANCE,105); 
  ObjectSet("sd3",OBJPROP_YDISTANCE,80); 
  ObjectDelete("多亏1"); 
  ObjectDelete("多数1"); 
  ObjectDelete("多量1"); 
  ObjectDelete("分界1"); 
  ObjectDelete("空亏1"); 
  ObjectDelete("空数1"); 
  ObjectDelete("空量1"); 
  ObjectDelete("多亏2"); 
  ObjectDelete("多数2"); 
  ObjectDelete("多量2"); 
  ObjectDelete("空亏2"); 
  ObjectDelete("空数2"); 
  ObjectDelete("空量2"); 
  }
 else
  {

  }


 }
//start
//---------------------  ----------------------------------------

 int deinit ()
 {

//----------------------------

 ObjectsDeleteAll(0,23); 
 ObjectDelete("EURUSD"); 
 ObjectDelete("EURUSD1"); 
 ObjectDelete("EURUSD3"); 
 ObjectDelete("EURUSD2"); 
  ObjectDelete("EURUSD4"); 
 ObjectDelete("EURUSD5"); 
 ObjectDelete("EURUSD6"); 
 ObjectDelete("EURUSD7"); 
  ObjectDelete("EURUSD8"); 
 ObjectDelete("EURUSD9"); 
 ObjectDelete("EURUSD10"); 
  ObjectDelete("EURUSD16"); 
 ObjectDelete("EURUSD17"); 

 ObjectDelete("点差"); 
 return(0); 
 }
//deinit
//---------------------  ----------------------------------------


//----------------------------


//----------------------------

 void OpenBuy ()
 {
 double      dfz_do_1;
 double      dfz_do_2;
 bool        dfz_bo_3;

//----------------------------

 dfz_bo_3 = false ;
 by_in_12 = -1 ;
 by_in_13 = 0 ;
 by_do_7 = 0 ;
 by_do_15 = 0 ;
 by_do_16 = 0 ;
 by_lo_37 = by_lo_38 ;
 dfz_do_1 = iHigh(NULL,0,iHighest(NULL,0,MODE_HIGH,ZiShiYing,2)) ;
 dfz_do_2 = iLow(NULL,0,iLowest(NULL,0,MODE_LOW,ZiShiYing,2)) ;
 if ( scape == true )
  {
  by_do_10 = NormalizeDouble(Ask - StopLos * by_in_11 * by_do_14,Digits()) ;
  }
 else
  {
  by_do_10 = NormalizeDouble(dfz_do_2,Digits()) ;
  }
 if ( riskmanagement == true )
  {
  by_do_7 = StringToDouble(DoubleToString(AccountEquity() * Risk / 1000000,2)) ;
  }
 else
  {
  by_do_7 = Lots ;
  }
 if ( Ask - dfz_do_2>by_in_11 * 110 * by_do_14 && DongTaiKaiGuan == true && scape  !=  true )
  {
  by_do_7 = by_do_7 * 1.6 ;
  }
 if ( by_do_7>50 )
  {
  by_do_7 = 50 ;
  }
 if ( by_do_7<0.01 )
  {
  by_do_7 = 0.01 ;
  }
  
  

  //显示("af3231"," 模拟测试可用，顺水的鱼外汇EA",0,500,170,12,"Arial",clrCornsilk);
  //显示("af3221"," 模拟测试可用，实盘登录官网.www.waterforex.com",0,500,190,12,"Arial",clrCornsilk);
 
 if (by_in_12 >= 0)  return;
 while (by_in_13 < 3)
  {
  by_do_15 = by_do_10 ;
  by_do_16 = NormalizeDouble(dfz_do_1 - dfz_do_2 + (dfz_do_1 + dfz_do_2) / 2,Digits()) ;
  by_in_12 = OrderSend(Symbol(),OP_BUY,by_do_7,Ask,by_in_5 * by_in_11,0,0,eaComment,by_in_3,0,DodgerBlue) ;
  if ( by_in_12 <  0 )
   {
   Print("下单错误 = ",GetLastError()); 
   }
  if ( by_in_12 > 0 && ( by_do_15!=0 || by_do_16!=0 ) && OrderSelect(by_in_12,SELECT_BY_TICKET,MODE_TRADES) )
   {
   dfz_bo_3 = OrderModify(OrderTicket(),OrderOpenPrice(),by_do_15,by_do_16,0,Yellow) ;
   if ( !(dfz_bo_3) )
    {
    Print("设置止损止盈失败=",GetLastError()); 
   }}
  Sleep(1000); 
  RefreshRates(); 
  by_in_13=by_in_13 + 1;
  if (by_in_12 >= 0)  return;
  }
 }
//OpenBuy
//---------------------  ----------------------------------------

 void OpenSell ()
 {
 double      dfz_do_1;
 double      dfz_do_2;
 bool        dfz_bo_3;

//----------------------------

 dfz_bo_3 = false ;
 by_in_12 = -1 ;
 by_in_13 = 0 ;
 by_do_8 = 0 ;
 by_do_15 = 0 ;
 by_do_16 = 0 ;
 by_lo_39 = by_lo_40 ;
 dfz_do_1 = iHigh(NULL,0,iHighest(NULL,0,MODE_HIGH,ZiShiYing,2)) ;
 dfz_do_2 = iLow(NULL,0,iLowest(NULL,0,MODE_LOW,ZiShiYing,2)) ;
 if ( scape == true )
  {
  by_do_10 = NormalizeDouble(StopLos * by_in_11 * by_do_14 + Bid,Digits()) ;
  }
 else
  {
  by_do_10 = NormalizeDouble(dfz_do_1,Digits()) ;
  }
 if ( riskmanagement == true )
  {
  by_do_8 = StringToDouble(DoubleToString(AccountEquity() * Risk / 1000000,2)) ;
  }
 else
  {
  by_do_8 = Lots ;
  }
 if ( dfz_do_1 - by_do_18>by_in_11 * 110 * by_do_14 && DongTaiKaiGuan == true && scape  !=  true )
  {
  by_do_8 = by_do_8 * 1.6 ;
  }
 if ( by_do_8>50 )
  {
  by_do_8 = 50 ;
  }
 if ( by_do_8<0.01 )
  {
  by_do_8 = 0.01 ;
  }
  
   // 显示("af3231"," SELLLOT"+ by_do_8,0,500,170,12,"Arial",clrCornsilk);
 if (by_in_12 >= 0)  return;
 while (by_in_13 < 3)
  {
  by_do_15 = by_do_10 ;
  by_do_16 = NormalizeDouble((dfz_do_1 + dfz_do_2) / 2 - (dfz_do_1 - dfz_do_2),Digits()) ;
  by_in_12 = OrderSend(Symbol(),OP_SELL,by_do_8,Bid,by_in_5 * by_in_11,0,0,eaComment,by_in_3,0,DeepPink) ;
  if ( by_in_12 <  0 )
   {
  // Print("下单错误 = ",GetLastError()); 
   }
  if ( by_in_12 > 0 && ( by_do_15!=0 || by_do_16!=0 ) && OrderSelect(by_in_12,SELECT_BY_TICKET,MODE_TRADES) )
   {
   dfz_bo_3 = OrderModify(OrderTicket(),OrderOpenPrice(),by_do_15,by_do_16,0,Yellow) ;
   if ( !(dfz_bo_3) )
    {
   // Print("设置止损止盈失败=",GetLastError()); 
   }}
  Sleep(1000); 
  RefreshRates(); 
  by_in_13=by_in_13 + 1;
  if (by_in_12 >= 0)  return;
  }
 }
//OpenSell
//---------------------  ----------------------------------------

 int CountTrades ()
 {
 int         dfz_in_1;

//----------------------------

 by_in_21 = 0 ;
 by_in_22 = 0 ;
 by_do_23 = 0 ;
 by_do_24 = 0 ;
 by_do_25 = 0 ;
 by_do_26 = 0 ;
 by_do_27 = 0 ;
 by_do_28 = 0 ;
 by_do_30 = 0 ;
 by_do_31 = 0 ;
 by_do_32 = 0 ;
 by_do_33 = 0 ;
 by_lo_41 = 0 ;
 by_lo_42 = 0 ;
 for (dfz_in_1 = 0 ; dfz_in_1 < OrdersTotal() ; dfz_in_1 = dfz_in_1 + 1)
  {
  if ( OrderSelect(dfz_in_1,SELECT_BY_POS,MODE_TRADES) && OrderSymbol() == Symbol() && OrderMagicNumber() == by_in_3 )
   {
   if ( OrderType() == 0 )
    {
    by_in_21=by_in_21 + 1;
    by_do_23 = by_do_23 + OrderLots() ;
    by_do_25 = OrderLots() ;
    by_do_27 = OrderProfit() + OrderCommission() + OrderSwap() + by_do_27 ;
    by_do_32 = OrderOpenPrice() ;
    by_lo_41 = OrderOpenTime() ;
    }
   else
    {
    if ( OrderType() == 1 )
     {
     by_in_22=by_in_22 + 1;
     by_do_24 = by_do_24 + OrderLots() ;
     by_do_26 = OrderLots() ;
     by_do_28 = OrderProfit() + OrderCommission() + OrderSwap() + by_do_28 ;
     by_do_33 = OrderOpenPrice() ;
     by_lo_42 = OrderOpenTime() ;
   }}}
  }
 return(0); 
 }
//CountTrades
//---------------------  ----------------------------------------

 void SetLable (string bsw_0, string bsw_1, int bsw_2, int bsw_3, int bsw_4, int bsw_5, string bsw_6, color bsw_7)
 {

//----------------------------

 ObjectCreate(bsw_0,OBJ_LABEL,0,0,0,0,0,0,0); 
 ObjectSetText(bsw_0,bsw_1,bsw_5,bsw_6,bsw_7); 
 ObjectSet(bsw_0,OBJPROP_CORNER,bsw_2); 
 ObjectSet(bsw_0,OBJPROP_XDISTANCE,bsw_3); 
 ObjectSet(bsw_0,OBJPROP_YDISTANCE,bsw_4); 
 }
//SetLable
//---------------------  ----------------------------------------

 bool ButtonCreate (const long bsw_0, const string bsw_1, const int bsw_2, const int bsw_3, const int bsw_4, const int bsw_5, const int bsw_6, const int bsw_7, const string bsw_8, const string bsw_9, const int bsw_10, const color bsw_11, const color bsw_12, const color bsw_13, const bool bsw_14, const bool bsw_15, const bool bsw_16, const bool bsw_17, const long bsw_18)
 {

//----------------------------

 if ( !(ObjectCreate(bsw_0,bsw_1,25,bsw_2,0,0)) )
  {
  return(false); 
  }
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_XDISTANCE,bsw_3); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_YDISTANCE,bsw_4); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_XSIZE,bsw_5); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_YSIZE,bsw_6); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_CORNER,bsw_7); 
 ObjectSetString(bsw_0,bsw_1,OBJPROP_TEXT,bsw_8); 
 ObjectSetString(bsw_0,bsw_1,OBJPROP_FONT,bsw_9); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_FONTSIZE,bsw_10); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_COLOR,bsw_11); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_BGCOLOR,bsw_12); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_BORDER_COLOR,bsw_13); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_BACK,bsw_15); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_STATE,bsw_14); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_SELECTABLE,bsw_16); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_SELECTED,bsw_16); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_HIDDEN,bsw_17); 
 ObjectSetInteger(bsw_0,bsw_1,OBJPROP_ZORDER,bsw_18); 
 return(true); 
 }
//ButtonCreate
//---------------------  ----------------------------------------

bool FXPRO2(bool a1, int a2, double a3, double a4, int a5, int a6, double a7, double a8
        , int a9, double a10, double a11, int a12, int a13, int a14, int a15
        , int a16, double a17) {
    if ( a1 != 1
      || a2 >= 1
      || (double)(a6 * a5) * a7 >= a3 - a4
      || (double)(a9 - 100) < a8
      || a11 <= a10
      || (double)a12 > a17)
    {
      return false;
    }
    return true;
}

bool FXPRO3(bool a1, int a2, double a3, double a4, int a5, int a6, double a7, double a8
        , int a9, double a10, double a11, int a12, int a13, int a14, int a15
        , int a16, double a17) {
    if ( a1 != 1
      || a2 >= 1
      || (double)(a6 * a5) * a7 >= a3 - a4
      || (double)-a9 > a8
      || a11 >= a10
      || (double)a12 > a17) {
        return false;
    }
    return true;
}        

bool FXPRO4(bool a1, int a2, double a3, double a4, double a5, int a6, double a7, double a8
        , double a9, double a10, double a11, int a12, int a13, int a14, int a15
        , int a16, double a17) {
    if ( a1 != 1
      || a2 >= 5
      || a3 <= 0.0
      || (double)(3 * a6) * a7 >= a4 - a5
      || 0.5 * ((a9 + a10) * 0.5 + a11) >= a8
      || (double)a12 > a17) {
     return false;
    }
    return true; 
}

bool FXPRO5(bool a1, int a2, double a3, double a4, double a5, int a6, double a7, double a8
        , double a9, double a10, double a11, int a12, int a13, int a14, int a15
        , int a16, double a17) {
    if ( a1 != 1
      || a2 >= 5
      || a3 <= 0.0
      || (double)(3 * a6) * a7 >= a4 - a5
      || 0.5 * ((a9 + a10) * 0.5 + a11) <= a8
      || (double)a12 > a17) {
     return false;
    }
    return true;
}

bool FXPRO6(int a1, double a2, double a3, double a4, int a5, int a6, int a7, int a8
        , int a9, int a10, double a11) {
    if ( a1 <= 0 
      || a3 >= a2 
      || (double)-a5 > a4 
      || (double)a6 > a11) {
     return false;
    }
    return true;
}

bool FXPRO7(int a1, double a2, double a3, double a4, int a5, int a6, int a7
        , int a8, int a9, int a10, double a11) {
    if ( a1 <= 0
      || a3 <= a2
      || (double)(a5 - 100) < a4
      || (double)a6 > a11) {
     return false;
    }
    return true; 
}  

//0 .00000.............................................................. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0 0 0................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................... 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.
bool FXPRO8(int a1, double a2, double a3, int a4, int a5, double a6, int a7, int a8
        , int a9, int a10, int a11, double a12) {
    if ( a1 <= 0
      || (double)(a5 * a4) * a6 + a3 >= a2
      || (double)a7 > a12) {
     return false;
    }
    return true;
}

bool FXPRO9(int a1, double a2, double a3, int a4, int a5, double a6, int a7, int a8
        , int a9, int a10, int a11, double a12) {
    if ( a1 <= 0
      || a3 - (double)(a5 * a4) * a6 <= a2
      || (double)a7 > a12) {
     return false;
    }
    return true;
}

bool FXPRO10(int a1, double a2, double a3, int a4, int a5, int a6, int a7, int a8
        , int a9, double a10) {
    if ( a1 <= 0 
      || a2 <= 0.0 
      || (double)-a4 > a3 
      || (double)a5 > a10) {
     return false;
   }
   return true;
}

bool FXPRO11(int a1, double a2, double a3, int a4, int a5, int a6, int a7, int a8, int a9, double a10) {
    if ( a1 <= 0
      || a2 <= 0.0
      || (double)(a4 - 100) < a3
      || (double)a5 > a10) {
     return false;
    }
    return true;
}

double FXPRO1(double a4, double a7, double a8, double a11)
{
  return (a4 - a7) * (-100.0) / (a8 - a11);
}


//+------------------------------------------------------------------+
void 显示(string LableName,//标签名称，如果显示多个文本，名称不能相同
          string LableDoc, //文本内容
          int    Corner,   //确定坐标原点0-左上角1-右上角2-左下角3-右下角-1-不显示 
          int    LableX,   //定义横坐标单位像素
          int    LableY,   //定义纵坐标单位像素
          int    DocSize,  //文本字号
          string DocStyle, //文本字体
          color  DocColor) //文本颜色
{ 
   int cnt = 0;
   if(Corner == -1) return; 
   for(cnt=0;cnt<ObjectsTotal();cnt++)
      if(ObjectName(cnt)==LableName) 
         break;//如果有对象名称，退出循环
   if(cnt==ObjectsTotal()) 
      ObjectCreate(LableName, OBJ_LABEL, 0, 0, 0);//新建对象
   ObjectSetText(LableName, LableDoc, DocSize, DocStyle,DocColor); //定义对象属性 
   ObjectSet(LableName, OBJPROP_CORNER, Corner); 
   ObjectSet(LableName, OBJPROP_XDISTANCE, LableX);  
   ObjectSet(LableName, OBJPROP_YDISTANCE, LableY);  
}  





void closesell() {
   for (int trade = OrdersTotal() - 1; trade >= 0; trade--) {
  bool    komoles=OrderSelect(trade, SELECT_BY_POS, MODE_TRADES);
      if (True) {
 {
     
            if (OrderType() == OP_SELL) 
            komoles=OrderClose(OrderTicket(), OrderLots(), Ask,30, Red);
         }
         Sleep(100);
      }
   }
}

void closebuy() {
   for (int trade = OrdersTotal() - 1; trade >= 0; trade--) {
     bool komoles=OrderSelect(trade, SELECT_BY_POS, MODE_TRADES);
      if (True) {
     {
            if (OrderType() == OP_BUY) 
   komoles=OrderClose(OrderTicket(), OrderLots(), Bid, 30, Blue);
 
         }
         Sleep(100);
      }
   }
}



void 报错组件(string a)
  {
   if(IsOptimization())
      return;

   int t=GetLastError();
   string 报警;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   if(t!=0)
      switch(t)
        {
         //case 0:报警="错误代码:"+0+"没有错误返回";break;
         //case 1:报警="错误代码:"+1+"没有错误返回但结果不明";break;
         //case 2:报警="错误代码:"+2+"一般错误";break;
         case 3:报警="错误代码:"+3+"无效交易参量";break;
         case 4:报警="错误代码:"+4+"交易服务器繁忙";break;
         case 5:报警="错误代码:"+5+"客户终端旧版本";break;
         case 6:报警="错误代码:"+6+"没有连接服务器";break;
         case 7:报警="错误代码:"+7+"没有权限";break;
         //case 8:报警="错误代码:"+8+"请求过于频繁";break;
         case 9:报警="错误代码:"+9+"交易运行故障";break;
         case 64:报警="错误代码:"+64+"账户禁止";break;
         case 65:报警="错误代码:"+65+"无效账户";break;
         // case 128:报警="错误代码:"+128+"交易超时";break;
         case 129:报警="错误代码:"+129+"无效价格";break;
         case 130:报警="错误代码:"+130+"无效停止";break;
         case 131:报警="错误代码:"+131+"无效交易量";break;
         case 132:报警="错误代码:"+132+"市场关闭";break;
         case 133:报警="错误代码:"+133+"交易被禁止";break;
         case 134:报警="错误代码:"+134+"资金不足";break;
         case 135:报警="错误代码:"+135+"价格改变";break;
         //case 136:报警="错误代码:"+136+"开价";break;
         case 137:报警="错误代码:"+137+"经纪繁忙";break;
         //case 138:报警="错误代码:"+138+"重新开价";break;
         case 139:报警="错误代码:"+139+"定单被锁定";break;
         case 140:报警="错误代码:"+140+"只允许看涨仓位";break;
         //case 141:报警="错误代码:"+141+"过多请求";break;
         //case 145:报警="错误代码:"+145+"因为过于接近市场，修改否定";break;
         //case 146:报警="错误代码:"+146+"交易文本已满";break;
         case 147:报警="错误代码:"+147+"时间周期被经纪否定";break;
         case 148:报警="错误代码:"+148+"开单和挂单总数已被经纪限定";break;
         case 149:报警="错误代码:"+149+"当对冲备拒绝时,打开相对于现有的一个单置";break;
         case 150:报警="错误代码:"+150+"把为反FIFO规定的单子平掉";break;
         case 4000:报警="错误代码:"+4000+"没有错误";break;
         case 4001:报警="错误代码:"+4001+"错误函数指示";break;
         case 4002:报警="错误代码:"+4002+"数组索引超出范围";break;
         case 4003:报警="错误代码:"+4003+"对于调用堆栈储存器函数没有足够内存";break;
         case 4004:报警="错误代码:"+4004+"循环堆栈储存器溢出";break;
         case 4005:报警="错误代码:"+4005+"对于堆栈储存器参量没有内存";break;
         case 4006:报警="错误代码:"+4006+"对于字行参量没有足够内存";break;
         case 4007:报警="错误代码:"+4007+"对于字行没有足够内存";break;
         //case 4008:报警="错误代码:"+4008+"没有初始字行";break;
         case 4009:报警="错误代码:"+4009+"在数组中没有初始字串符";break;
         case 4010:报警="错误代码:"+4010+"对于数组没有内存";break;
         case 4011:报警="错误代码:"+4011+"字行过长";break;
         case 4012:报警="错误代码:"+4012+"余数划分为零";break;
         case 4013:报警="错误代码:"+4013+"零划分";break;
         case 4014:报警="错误代码:"+4014+"不明命令";break;
         case 4015:报警="错误代码:"+4015+"错误转换(没有常规错误)";break;
         case 4016:报警="错误代码:"+4016+"没有初始数组";break;
         case 4017:报警="错误代码:"+4017+"禁止调用DLL ";break;
         case 4018:报警="错误代码:"+4018+"数据库不能下载";break;
         case 4019:报警="错误代码:"+4019+"不能调用函数";break;
         case 4020:报警="错误代码:"+4020+"禁止调用智能交易函数";break;
         case 4021:报警="错误代码:"+4021+"对于来自函数的字行没有足够内存";break;
         case 4022:报警="错误代码:"+4022+"系统繁忙 (没有常规错误)";break;
         case 4050:报警="错误代码:"+4050+"无效计数参量函数";break;
         case 4051:报警="错误代码:"+4051+"无效参量值函数";break;
         case 4052:报警="错误代码:"+4052+"字行函数内部错误";break;
         case 4053:报警="错误代码:"+4053+"一些数组错误";break;
         case 4054:报警="错误代码:"+4054+"应用不正确数组";break;
         case 4055:报警="错误代码:"+4055+"自定义指标错误";break;
         case 4056:报警="错误代码:"+4056+"不协调数组";break;
         case 4057:报警="错误代码:"+4057+"整体变量过程错误";break;
         case 4058:报警="错误代码:"+4058+"整体变量未找到";break;
         case 4059:报警="错误代码:"+4059+"测试模式函数禁止";break;
         case 4060:报警="错误代码:"+4060+"没有确认函数";break;
         case 4061:报警="错误代码:"+4061+"发送邮件错误";break;
         case 4062:报警="错误代码:"+4062+"字行预计参量";break;
         case 4063:报警="错误代码:"+4063+"整数预计参量";break;
         case 4064:报警="错误代码:"+4064+"双预计参量";break;
         case 4065:报警="错误代码:"+4065+"数组作为预计参量";break;
         case 4066:报警="错误代码:"+4066+"刷新状态请求历史数据";break;
         case 4067:报警="错误代码:"+4067+"交易函数错误";break;
         case 4099:报警="错误代码:"+4099+"文件结束";break;
         case 4100:报警="错误代码:"+4100+"一些文件错误";break;
         case 4101:报警="错误代码:"+4101+"错误文件名称";break;
         case 4102:报警="错误代码:"+4102+"打开文件过多";break;
         case 4103:报警="错误代码:"+4103+"不能打开文件";break;
         case 4104:报警="错误代码:"+4104+"不协调文件";break;
         case 4105:报警="错误代码:"+4105+"没有选择定单";break;
         case 4106:报警="错误代码:"+4106+"不明货币对";break;
         case 4107:报警="错误代码:"+4107+"无效价格";break;
         case 4108:报警="错误代码:"+4108+"无效定单编码";break;
         case 4109:报警="错误代码:"+4109+"不允许交易";break;
         case 4110:报警="错误代码:"+4110+"不允许长期";break;
         case 4111:报警="错误代码:"+4111+"不允许短期";break;
         case 4200:报警="错误代码:"+4200+"定单已经存在";break;
         case 4201:报警="错误代码:"+4201+"不明定单属性";break;
         //case 4202:报警="错误代码:"+4202+"定单不存在";break;
         case 4203:报警="错误代码:"+4203+"不明定单类型";break;
         case 4204:报警="错误代码:"+4204+"没有定单名称";break;
         case 4205:报警="错误代码:"+4205+"定单坐标错误";break;
         case 4206:报警="错误代码:"+4206+"没有指定子窗口";break;
         case 4207:报警="错误代码:"+4207+"定单一些函数错误";break;
         case 4250:报警="错误代码:"+4250+"错误设定发送通知到队列中";break;
         case 4251:报警="错误代码:"+4251+"无效参量- 空字符串传递到SendNotification()函数";break;
         case 4252:报警="错误代码:"+4252+"无效设置发送通知(未指定ID或未启用通知)";break;
         case 4253:报警="错误代码:"+4253+"通知发送过于频繁";break;
        }
        
        
        }
        
        
        
        void CloseAllOrder(){
    bool SucceedClose = FALSE;
    for (int j= OrdersTotal() - 1; j >= 0; j--) {
        OrderSelect(j,SELECT_BY_POS, MODE_TRADES);
        if(OrderType()==OP_BUY)
            OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid,Digits),Slippage , Blue);
        else if(OrderType()==OP_SELL)
            OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask,Digits), Slippage, Red);
    }
}

void CloseAllWinSell(){
    bool SucceedClose = FALSE;
    for (int j= OrdersTotal() - 1; j >= 0; j--) {
        OrderSelect(j,SELECT_BY_POS, MODE_TRADES);
        if (OrderType() == OP_SELL  && OrderProfit()>0) 
            SucceedClose=OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask,Digits), 
                Slippage, Red);
    }
}

void CloseAllWinBuy(){
    bool SucceedClose = FALSE;
    for (int j= OrdersTotal() - 1; j >= 0; j--) {
        OrderSelect(j,SELECT_BY_POS, MODE_TRADES);
        if (OrderType() == OP_BUY && OrderProfit()>0) 
            SucceedClose=OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid,Digits), 
                Slippage, Blue);
    }
}

double Lots()                                            // 标准手数的计算
   {
//============================================================================================
   Lot=NormalizeDouble(AccountEquity()*Prots/1000/1000,2);// 计算总的标准手数 
   double Min_Lot = MarketInfo(Symbol(), MODE_MINLOT);   // 允许最少的标准手数
   if (Lot == 0 ) Lot = Min_Lot;                         // 测试允许最少的标准手数
//============================================================================================
   return(Lot);
   }
//жжжжжжж
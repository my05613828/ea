//+------------------------------------------------------------------+
//|                                                       EA.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "@大树My05613828"
#property link      "https://www.eahub.cn/space-uid-8564.html"
#property version   "1.0"
#property  icon     "//Include//M5//logo.ico"

#include <m5/交易类.mqh>
//#include <m5/指标类.mqh>
class EA
  {
private:
   交易类            交易;
   //指标类            指标;

   string            symbol;
   int               magic_number;
   double            lot;

   double            sl_point;
   double            tp_point;

   string            start_time;
   string            end_time;

public:
   //---指标参数



   //---平单条件
   bool              close_long();
   bool              close_short();
   //---加单条件
   bool              open_long_next();
   bool              open_short_next();
   //---首单条件
   bool              open_long_first();
   bool              open_short_first();
   //---获取值
   void              get_value();
   //---工作函数
   void              working();
public:
                     EA();
                    ~EA();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
EA::EA()
  {
   start_time = "01:00:00";
   end_time = "23:30:00";

   symbol = Symbol();
   magic_number = 16880622;
   lot=0.01;
   sl_point=0;
   tp_point=0;

//初始化指标句柄
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
EA::~EA()
  {
  }
//+------------------------------------------------------------------+
void   EA::  get_value()
  {
//句柄至数组
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   EA::  working()
  {
   get_value();//--获取值
//---平仓
   bool close_long = close_long();
   bool close_short = close_short();

   if(close_long)
      交易.平多(symbol,magic_number,false);
   if(close_short)
      交易.平空(symbol,magic_number,false);

   bool time_chk = 交易.时间判断(start_time,end_time,TimeCurrent());
   if(time_chk)
     {
      //---做多
      bool open_long_first = open_long_first();
      bool open_long_next = open_long_next();
      if(open_long_next)
         交易.做多(symbol,lot,sl_point,tp_point,magic_number,"buy_next");
      if(open_long_first)
         交易.做多(symbol,lot,sl_point,tp_point,magic_number,"buy_first");

      //---做空
      bool open_short_first = open_short_first();
      bool open_short_next = open_short_next();
      if(open_short_next)
         交易.做空(symbol,lot,sl_point,tp_point,magic_number,"sell_next");
      if(open_short_first)
         交易.做空(symbol,lot,sl_point,tp_point,magic_number,"sell_first");
     }//time_chk
  }
//+----------------------------------------
bool      EA::      close_long()
  {


   bool chk =0;
   return chk;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool      EA::    close_short()
  {
   bool chk = 0;
   return chk;
  }
//----------------------------
//+------------------------------------------------------------------+
bool           EA::     open_long_next()
  {

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool          EA::     open_short_next()
  {

   return false;
  }
//+------------------------------------------------------------------+
bool           EA::     open_long_first()
  {

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool          EA::     open_short_first()
  {

   return false;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+

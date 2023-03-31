// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookTicker _$BookTickerFromJson(Map<String, dynamic> json) => BookTicker()
  ..symbol = json['symbol'] as String
  ..bidPrice = json['bidPrice'] as String
  ..bidQty = json['bidQty'] as String
  ..askPrice = json['askPrice'] as String
  ..askQty = json['askQty'] as String;

Map<String, dynamic> _$BookTickerToJson(BookTicker instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'bidPrice': instance.bidPrice,
      'bidQty': instance.bidQty,
      'askPrice': instance.askPrice,
      'askQty': instance.askQty,
    };

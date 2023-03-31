import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'book_ticker.g.dart';

@JsonSerializable()
class BookTicker {
  BookTicker();

  late String symbol;
  late String bidPrice;
  late String bidQty;
  late String askPrice;
  late String askQty;

  factory BookTicker.formJson(Map<String, dynamic> json) =>
      _$BookTickerFromJson(json);

  Map<String, dynamic> toJson() => _$BookTickerToJson(this);

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
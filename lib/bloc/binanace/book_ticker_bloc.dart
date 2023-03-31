import 'package:flutter/material.dart';
import 'package:flutter_app_arch/repo/binance_repo.dart';

import '../../model/book_ticker.dart';
import '../../model/http_response.dart';
import '../base/bloc.dart';
import '../base/bloc_state.dart';

part 'book_ticker_event.dart';

part 'book_ticker_state.dart';

class BookTickerBloc extends Bloc<BookTickerEvent, BookTickerState> {
  BookTickerBloc() : super(BookTickerInitial()) {
    on<BookTickerFetch>(_fetch);
  }

  static const int _pageSize = 5;
  static const int _pageLast = 6;
  final BinanceRepo _repo = BinanceRepo();
  late List<BookTicker> _data;

  void _fetch(BookTickerFetch event, Emitter<BookTickerState> emit) async {
    var pageKey = event.page;
    List<BookTicker> result;
    if (pageKey == 0) {
      HttpResponse response = await _repo.fetchBookTicker();
      if (response.isSuccess) {
        _data = response.data;
        result = _data.getRange(0, _pageSize).toList();
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        emit(BookTickerFailure(response));
        return;
      }
    } else {
      result = _data
          .getRange((event.page * _pageSize) + 1,
              (event.page * _pageSize) + _pageSize)
          .toList();
    }
    await Future.delayed(const Duration(milliseconds: 500));
    if (pageKey == _pageLast) {
      emit(BookTickerFailure(HttpResponse()));
    } else {
      emit(BookTickerSuccess(
          HttpResponse(), pageKey + 1, pageKey == _pageLast, result));
    }
  }
}

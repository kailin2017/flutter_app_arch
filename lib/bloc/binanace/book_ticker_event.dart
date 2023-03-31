part of 'book_ticker_bloc.dart';

@immutable
abstract class BookTickerEvent {}

class BookTickerFetch extends BookTickerEvent {
  final int page;

  BookTickerFetch(this.page);
}
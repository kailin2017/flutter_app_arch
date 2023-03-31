part of 'book_ticker_bloc.dart';

@immutable
abstract class BookTickerState {}

class BookTickerInitial extends BookTickerState {}

class BookTickerSuccess extends BookTickerState with BlocHttpSuccess {
  final int nextPageKey;
  final bool isLastPage;
  final List<BookTicker> list;
  @override
  final HttpResponse response;

  BookTickerSuccess(this.response, this.nextPageKey, this.isLastPage,
      this.list);
}

class BookTickerFailure extends BookTickerState with BlocHttpFailure {
  @override
  final HttpResponse response;

  BookTickerFailure(this.response);
}

class BookTickerRedirect extends BookTickerState with BlocHttpRedirect {
  @override
  final HttpResponse response;

  BookTickerRedirect(this.response);
}

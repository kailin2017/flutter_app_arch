import 'package:flutter/material.dart';
import 'package:flutter_app_arch/bloc/binanace/book_ticker_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../bloc/base/bloc.dart';
import '../model/book_ticker.dart';
import '../utils/locale_helper.dart';

class PagingPage extends StatelessWidget {
  const PagingPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BaseBlocProvider(create: (context) => BookTickerBloc(), child: _PagingPage());
}

class _PagingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PagingState();
}

class _PagingState extends State<_PagingPage> {

  final PagingController<int, BookTicker> _controller =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _controller.addPageRequestListener((pageKey) {
      BlocProvider.of<BookTickerBloc>(context).add(BookTickerFetch(pageKey));
    });
  }

  @override
  Widget build(BuildContext context) =>
      BaseBlocListener<BookTickerBloc, BookTickerState>(
          listener: (context, state) {
            if (state is BookTickerSuccess) {
              if (state.isLastPage) {
                _controller.appendLastPage(state.list);
              } else {
                _controller.appendPage(state.list, state.nextPageKey);
              }
            }
          },
          child: _buildList());

  Widget _buildList() => Scaffold(
      appBar: AppBar(
        title: Text(LocaleHelper().localizations(context).pagingTitle),
      ),
      body: PagedListView<int, BookTicker>(
        pagingController: _controller,
        builderDelegate: PagedChildBuilderDelegate<BookTicker>(
          itemBuilder: (context, item, index) => _buildListItem(
            item,
          ),
        ),
      ));

  Widget _buildListItem(BookTicker bookTicker) => Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
          border: Border.all(color: Colors.blueAccent, width: 2.0)),
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      padding: const EdgeInsets.all(8),
      child: Text(
        '${bookTicker.symbol}\nBid : ${bookTicker.bidPrice} / ${bookTicker.bidQty}\nASK : ${bookTicker.askPrice} / ${bookTicker.askQty}',
      ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

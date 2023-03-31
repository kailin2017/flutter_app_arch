
import '../model/book_ticker.dart';
import '../model/http_response.dart';
import '../utils/http_helper.dart';

class BinanceRepo {
  Future fetchBookTicker() async {
    HttpResponse response = await HttpHelper().get("api/v3/ticker/bookTicker");
    if (response.isSuccess) {
      var data = response.data
          .map<BookTicker>((e) => BookTicker.formJson(e))
          .toList();
      response.data = data;
    }
    return response;
  }
}

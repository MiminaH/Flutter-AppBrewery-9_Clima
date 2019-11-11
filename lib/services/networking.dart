import 'package:http/http.dart' as http;
// http package has no classes, instead gives only access to methods & variables (eg. get() or Response).
// no need to create an object http of package class.
// can be confusing (won't know where get() comes from)
// use 'as' keyword after package to use package name later in code.
// http.get() --> shows that get() comes from http package.

import 'dart:convert';
// decoding data from JSON or XML

// made class flexible
// not only to fetch weather data, but does any Networking related task.
class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      // using dart.convert package to decode JSON data & get wanted value
      // jsonDecode returns a dynamic DataType, hence we use var
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}

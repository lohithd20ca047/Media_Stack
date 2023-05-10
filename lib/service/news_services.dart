import 'package:dio/dio.dart';

import '../model/news_model.dart';

var mediaUrl =
    'http://api.mediastack.com/v1/news?access_key=89194bda1f5499ecebea8740ce1752ca';

Future<List<Datum>> listOfNews() async {
  var datas = <Datum>[];
  var dio = Dio();
  var response = await dio.get(mediaUrl);
  if (response.statusCode == 200) {
    var mediaDatas = response.data['data'];
    for (var mediaData in mediaDatas) {
      var dataObj = Datum.fromJson(mediaData);
      datas.add(dataObj);
    }
  }
  return datas;
}

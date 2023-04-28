import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
class WebServices {

static Logger logger = Logger();

  // Method to fetch latest news
  static Future<Response> fetchLatestNews () async{
    try{
      String string = "india";
      DateTime now =  DateTime.now().subtract(const Duration(days: 1));
    DateTime date =  DateTime(now.year, now.month, now.day);

    var dateS = date.toString();
    var touse = dateS.substring(0, 10);
    
      var response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=${string}&from=${touse}&sortBy=publishedAt&apiKey=868784cb8f1b4b9b90339f1bf87ee00a"));


      logger.log(Level.info, "Response code: ${response.statusCode} /n The response body was: ${response.body}");

      return response;
    }catch(e){
      logger.log(Level.error, "Failed to make api call ${e.toString()}" );

      rethrow;
    }
  }
}
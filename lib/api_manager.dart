import 'dart:convert';

import 'package:http/http.dart';
import 'package:sport/soccermodel.dart';

class SoccerApi {
  final String apiURL =
      "https://v3.football.api-sports.io/fixtures?season=2021&league=39";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "fb8d2e22108c332586b6cd23f7e478ea"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiURL), headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    }
    return body;
  }
}

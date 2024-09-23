import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/config/constants.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/weather_model.dart';

class Repo {
  Future<NewsModel?> fetchNews({required String query}) async {
    const String apiKey = 'd1895e31ed7546608b66b8c677c55757';
    final String url =
        'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return newsModelFromJson(response.body);
      } else {
        print('Failed to load news: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching news: $e');
      return null;
    }
  }

  Future<String?> fetchPexelsImageUrl(String query) async {
    String apiKey =
        Constants.pexelApiKey; // Replace with your actual Pexels API key

    String image = "";
    const int perPage = 1;

    final Uri url = Uri.parse(
        'https://api.pexels.com/v1/search?query=$query&per_page=$perPage');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['photos'] != null && data['photos'].isNotEmpty) {
          final photo = data['photos'][0];

          image = await photo['src']['original'] as String ?? "";

          return image;
        } else {
          print('No images found for query: $query');
          return image;
        }
      } else {
        print('Failed to fetch image: ${response.statusCode}');
        return image;
      }
    } catch (e) {
      print('Error fetching image: $e');
      return image;
    }
  }

  Future<WeatherModel> fetchWeatherData({required Position postion}) async {
    final response = await http.get(Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/${postion.latitude},${postion.latitude}?key=${Constants.weatherApiKey}'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON

      try {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } catch (e) {
        print("exception occured parsinggggg $e");
        return WeatherModel.fromJson(jsonDecode(response.body));
      }
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load weather data');
    }
  }
}

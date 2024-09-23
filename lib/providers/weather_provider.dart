import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/weather_model.dart';
import 'package:news_app/repo/repo.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;
  NewsModel? newsModel;
  String unit;
  String? query;
  WeatherProvider(
      {this.weatherModel, this.newsModel, this.unit = "Celcius", this.query});

  void changeCelcius({required String newUnit}) {
    unit = newUnit;
    print("updated type");
    notifyListeners();
  }

  void getNews({required String newQuery}) async {
    final newNewModel = await Repo().fetchNews(query: query ?? "");
    query = newQuery;
    newsModel = newNewModel;
    notifyListeners();
  }

  void getWeather({required Position position}) async {
    final newWeatherModel = await Repo().fetchWeatherData(postion: position);

    print("got weather ...........");

    weatherModel = newWeatherModel;
    notifyListeners();
  }
}

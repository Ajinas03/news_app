import 'package:flutter/material.dart';
import 'package:news_app/providers/weather_provider.dart';
import 'package:news_app/screens/current_weather_card.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/widgets/fore_cast_card.dart';
import 'package:news_app/screens/widgets/news_card.dart';
import 'package:news_app/screens/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isCelcius =
        context.watch<WeatherProvider>().unit.toLowerCase() == "celcius";
    final size = MediaQuery.of(context).size;
    final weather = context.watch<WeatherProvider>().weatherModel;

    final news = context.watch<WeatherProvider>().newsModel;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: weather == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const CurrentWeatherCard(),
                        SizedBox(
                          width: size.width,
                          // height: 50,
                          height: size.height / 5,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // shrinkWrap: true,
                              itemCount: weather.days?.length,
                              itemBuilder: (context, index) {
                                return Visibility(
                                    visible: index != 0 && index < 6,
                                    child: ForeCastCard(
                                        data: weather.days?[index]));
                              }),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextWidget(
                            text: "News",
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: ListView.builder(
                              itemCount: 10,
                              //  news?.articles?.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final item = news?.articles?[index];
                                return NewsCard(item: item);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

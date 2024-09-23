import 'package:flutter/material.dart';
import 'package:news_app/providers/weather_provider.dart';
import 'package:news_app/screens/widgets/radio_button_widget.dart';
import 'package:news_app/screens/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> units = ["Celcius", "Fahrenheit"];
    final List<String> category = [
      "Depressing",
      "Fear",
      "Winning And Happiness"
    ];
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: "Settings",
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: "Units",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                ListView.builder(
                    itemCount: units.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RadioButtonWidget(
                          title: units[index],
                          isSelected: context
                                  .watch<WeatherProvider>()
                                  .unit
                                  .toLowerCase() ==
                              units[index].toLowerCase(),
                          onPressed: () {
                            context
                                .read<WeatherProvider>()
                                .changeCelcius(newUnit: units[index]);
                          });
                    }),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: "News Category",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                ListView.builder(
                    itemCount: category.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RadioButtonWidget(
                          title: category[index],
                          isSelected: context
                                  .watch<WeatherProvider>()
                                  .query
                                  ?.toLowerCase() ==
                              category[index].toLowerCase(),
                          onPressed: () {
                            context
                                .read<WeatherProvider>()
                                .getNews(newQuery: category[index]);
                          });
                    })
              ],
            ))
          ],
        ),
      ),
    );
  }
}

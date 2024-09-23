import 'package:flutter/material.dart';
import 'package:news_app/config/utils.dart';
import 'package:news_app/providers/weather_provider.dart';
import 'package:news_app/screens/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CurrentWeatherCard extends StatefulWidget {
  const CurrentWeatherCard({super.key});

  @override
  State<CurrentWeatherCard> createState() => _CurrentWeatherCardState();
}

class _CurrentWeatherCardState extends State<CurrentWeatherCard> {
  @override
  Widget build(BuildContext context) {
    const String rainingImage =
        "https://imgs.search.brave.com/FgQmttLpoLGCGk4xLAem41RudFcdX0D9yAUZRPw6AXw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91c2Fn/aWYuY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy9yYWlueS0xNi5n/aWY.gif";
    const String clearSky =
        "https://imgs.search.brave.com/R2mVeZAWHc06wrmuoKEfZ8WuBFIS-H8IIGn0fNGxF0s/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YTEuZ2lwaHkuY29t/L21lZGlhL3YxLlky/bGtQVGM1TUdJM05q/RXhNWFZ1Ym5OM2JE/ZzJhMnhvTkdWamJu/RnVPSGczY0hRek9X/cHJlRzUwTjJJMWN6/UTFlbTFpYmlabGNE/MTJNVjluYVdaelgz/TmxZWEpqYUNaamRE/MW4vdTAxaW9DZTZH/OFVSRy8yMDAuZ2lm.gif";

    final data = context.watch<WeatherProvider>().weatherModel?.days?[0];
    final isCelcius =
        context.watch<WeatherProvider>().unit.toLowerCase() == "celcius";
    final size = MediaQuery.of(context).size;
    bool isClearSky =
        false; // You might want to set this based on some condition

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6,
        child: Stack(
          children: [
            Container(
              height: size.height / 3.6,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage(isClearSky ? clearSky : rainingImage))),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text:
                            Utils.formatEpochToDay(data?.datetimeEpoch ?? 0000),
                        color: isClearSky
                            ? Colors.black.withOpacity(0.8)
                            : Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        fontSize: 30,
                      ),
                      TextWidget(
                        text: isCelcius
                            ? "${Utils.fahrenheitToCelsius(data?.temp).toStringAsFixed(0)}°C "
                            : "${data?.temp.toString()}°F ",
                        color: isClearSky
                            ? Colors.black.withOpacity(0.7)
                            : Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        fontSize: 55,
                      ),
                    ],
                  ),
                  SizedBox(
                    child: ListTile(
                      horizontalTitleGap: 0,
                      minVerticalPadding: 0,
                      contentPadding: const EdgeInsets.all(0),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextWidget(
                          text: data?.conditions?.name
                                  .toString()
                                  .replaceAll("_", " ") ??
                              "",
                          color: isClearSky
                              ? Colors.black.withOpacity(0.9)
                              : Colors.white.withOpacity(0.6),
                        ),
                      ),
                      subtitle: TextWidget(
                        text: data?.description.toString() ?? "",
                        color: isClearSky
                            ? Colors.black.withOpacity(0.9)
                            : Colors.white.withOpacity(0.6),
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final weatherProvider =
          Provider.of<WeatherProvider>(context, listen: false);
      final data = weatherProvider.weatherModel?.days?[0];
      if (data != null) {
        weatherProvider.getNews(
            newQuery: Utils().classifyTemperature(data.temp));
      }
    });
  }
}

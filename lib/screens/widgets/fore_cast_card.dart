import 'package:flutter/material.dart';
import 'package:news_app/config/utils.dart';
import 'package:news_app/models/weather_model.dart';
import 'package:news_app/providers/weather_provider.dart';
import 'package:news_app/screens/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ForeCastCard extends StatelessWidget {
  final CurrentConditions? data;
  const ForeCastCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const String rainingImage =
        "https://imgs.search.brave.com/FgQmttLpoLGCGk4xLAem41RudFcdX0D9yAUZRPw6AXw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91c2Fn/aWYuY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy9yYWlueS0xNi5n/aWY.gif";

    const String clearSky =
        "https://imgs.search.brave.com/R2mVeZAWHc06wrmuoKEfZ8WuBFIS-H8IIGn0fNGxF0s/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YTEuZ2lwaHkuY29t/L21lZGlhL3YxLlky/bGtQVGM1TUdJM05q/RXhNWFZ1Ym5OM2JE/ZzJhMnhvTkdWamJu/RnVPSGczY0hRek9X/cHJlRzUwTjJJMWN6/UTFlbTFpYmlabGNE/MTJNVjluYVdaelgz/TmxZWEpqYUNaamRE/MW4vdTAxaW9DZTZH/OFVSRy8yMDAuZ2lm.gif";
    const String suNny = "";
    bool isClearSky = false;
    final size = MediaQuery.of(context).size;
    final isCelcius =
        context.watch<WeatherProvider>().unit.toLowerCase() == "celcius";

    return SizedBox(
      height: 50,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 6,
          child: Stack(
            children: [
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            isClearSky ? clearSky : rainingImage))),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextWidget(
                        text: Utils.formatEpochToDay(data?.datetimeEpoch),
                        color: isClearSky
                            ? Colors.black.withOpacity(0.8)
                            : Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        fontSize: 30,
                      ),
                    ),
                    Flexible(
                      child: TextWidget(
                        text: isCelcius
                            ? "${Utils.fahrenheitToCelsius(data?.temp).toStringAsFixed(0)}°C "
                            : "${data?.temp.toString()}°F ",
                        color: isClearSky
                            ? Colors.black.withOpacity(0.7)
                            : Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        fontSize: 30,
                      ),
                    ),
                    Flexible(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

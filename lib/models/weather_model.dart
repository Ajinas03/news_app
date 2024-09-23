// // To parse this JSON data, do
// //
// //     final weatherModel = weatherModelFromJson(jsonString);

// import 'dart:convert';

// final conditionsValues = EnumValues({
//   "Clear": Conditions.CLEAR,
//   "Overcast": Conditions.OVERCAST,
//   "Partially cloudy": Conditions.PARTIALLY_CLOUDY,
//   "Rain, Overcast": Conditions.RAIN_OVERCAST,
//   "Rain, Partially cloudy": Conditions.RAIN_PARTIALLY_CLOUDY
// });

// final iconValues = EnumValues({
//   "clear-day": Icon.CLEAR_DAY,
//   "clear-night": Icon.CLEAR_NIGHT,
//   "cloudy": Icon.CLOUDY,
//   "fog": Icon.FOG,
//   "partly-cloudy-day": Icon.PARTLY_CLOUDY_DAY,
//   "partly-cloudy-night": Icon.PARTLY_CLOUDY_NIGHT,
//   "rain": Icon.RAIN
// });

// final sourceValues =
//     EnumValues({"comb": Source.COMB, "fcst": Source.FCST, "obs": Source.OBS});

// // EnumValues<StationElement>? stationElementValues = EnumValues({
// //   "D4699": StationElement.D4699,
// //   "D8868": StationElement.D8868,
// //   "KDAA": StationElement.KDAA,
// //   "KDCA": StationElement.KDCA,
// //   "KHEF": StationElement.KHEF,
// //   "KIAD": StationElement.KIAD,
// //   "KJYO": StationElement.KJYO
// // });

// WeatherModel weatherModelFromJson(String str) =>
//     WeatherModel.fromJson(json.decode(str));

// String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

// enum Conditions {
//   CLEAR,
//   OVERCAST,
//   PARTIALLY_CLOUDY,
//   RAIN_OVERCAST,
//   RAIN_PARTIALLY_CLOUDY
// }

// class CurrentConditions {
//   String? datetime;
//   dynamic datetimeEpoch;
//   dynamic temp;
//   dynamic feelslike;
//   dynamic humidity;
//   dynamic dew;
//   dynamic precip;
//   dynamic precipprob;
//   dynamic snow;
//   dynamic snowdepth;
//   List<Icon>? preciptype;
//   dynamic windgust;
//   dynamic windspeed;
//   dynamic winddir;
//   dynamic pressure;
//   dynamic visibility;
//   dynamic cloudcover;
//   dynamic solarradiation;
//   dynamic solarenergy;
//   dynamic uvindex;
//   Conditions? conditions;
//   Icon? icon;
//   List<StationElement>? stations;
//   Source? source;
//   String? sunrise;
//   dynamic sunriseEpoch;
//   String? sunset;
//   dynamic sunsetEpoch;
//   dynamic moonphase;
//   dynamic tempmax;
//   dynamic tempmin;
//   dynamic feelslikemax;
//   dynamic feelslikemin;
//   dynamic precipcover;
//   dynamic severerisk;
//   String? description;
//   List<CurrentConditions>? hours;

//   CurrentConditions({
//     this.datetime,
//     this.datetimeEpoch,
//     this.temp,
//     this.feelslike,
//     this.humidity,
//     this.dew,
//     this.precip,
//     this.precipprob,
//     this.snow,
//     this.snowdepth,
//     this.preciptype,
//     this.windgust,
//     this.windspeed,
//     this.winddir,
//     this.pressure,
//     this.visibility,
//     this.cloudcover,
//     this.solarradiation,
//     this.solarenergy,
//     this.uvindex,
//     this.conditions,
//     this.icon,
//     this.stations,
//     this.source,
//     this.sunrise,
//     this.sunriseEpoch,
//     this.sunset,
//     this.sunsetEpoch,
//     this.moonphase,
//     this.tempmax,
//     this.tempmin,
//     this.feelslikemax,
//     this.feelslikemin,
//     this.precipcover,
//     this.severerisk,
//     this.description,
//     this.hours,
//   });

//   factory CurrentConditions.fromJson(Map<String, dynamic> json) =>
//       CurrentConditions(
//         datetime: json["datetime"],
//         datetimeEpoch: json["datetimeEpoch"],
//         temp: json["temp"]?.toDouble(),
//         feelslike: json["feelslike"]?.toDouble(),
//         humidity: json["humidity"]?.toDouble(),
//         dew: json["dew"]?.toDouble(),
//         precip: json["precip"]?.toDouble(),
//         precipprob: json["precipprob"]?.toDouble(),
//         snow: json["snow"],
//         snowdepth: json["snowdepth"],
//         preciptype: json["preciptype"] == null
//             ? []
//             : List<Icon>.from(
//                 json["preciptype"]?.map((x) => iconValues.map[x])),
//         windgust: json["windgust"]?.toDouble(),
//         windspeed: json["windspeed"]?.toDouble(),
//         winddir: json["winddir"]?.toDouble(),
//         pressure: json["pressure"]?.toDouble(),
//         visibility: json["visibility"]?.toDouble(),
//         cloudcover: json["cloudcover"]?.toDouble(),
//         solarradiation: json["solarradiation"]?.toDouble(),
//         solarenergy: json["solarenergy"]?.toDouble(),
//         uvindex: json["uvindex"],
//         conditions: conditionsValues.map[json["conditions"]],
//         icon: iconValues.map[json["icon"]],
//         // stations: json["stations"] == null
//         //     ? []
//         //     : List<StationElement>.from(
//         //         json["stations"].map((x) => stationElementValues?.map[x])),
//         source: sourceValues.map[json["source"]],
//         sunrise: json["sunrise"],
//         sunriseEpoch: json["sunriseEpoch"],
//         sunset: json["sunset"],
//         sunsetEpoch: json["sunsetEpoch"],
//         moonphase: json["moonphase"]?.toDouble(),
//         tempmax: json["tempmax"]?.toDouble(),
//         tempmin: json["tempmin"]?.toDouble(),
//         feelslikemax: json["feelslikemax"]?.toDouble(),
//         feelslikemin: json["feelslikemin"]?.toDouble(),
//         precipcover: json["precipcover"]?.toDouble(),
//         severerisk: json["severerisk"],
//         description: json["description"],
//         hours: json["hours"] == null
//             ? []
//             : List<CurrentConditions>.from(
//                 json["hours"].map((x) => CurrentConditions.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "datetime": datetime,
//         "datetimeEpoch": datetimeEpoch,
//         "temp": temp,
//         "feelslike": feelslike,
//         "humidity": humidity,
//         "dew": dew,
//         "precip": precip,
//         "precipprob": precipprob,
//         "snow": snow,
//         "snowdepth": snowdepth,
//         "preciptype": preciptype == null
//             ? []
//             : List<dynamic>.from(
//                 preciptype?.map((x) => iconValues.reverse[x]) ?? []),
//         "windgust": windgust,
//         "windspeed": windspeed,
//         "winddir": winddir,
//         "pressure": pressure,
//         "visibility": visibility,
//         "cloudcover": cloudcover,
//         "solarradiation": solarradiation,
//         "solarenergy": solarenergy,
//         "uvindex": uvindex,
//         "conditions": conditionsValues.reverse[conditions],
//         "icon": iconValues.reverse[icon],
//         // "stations": stations == null
//         //     ? []
//         //     : List<dynamic>.from(
//         //         stations?.map((x) => stationElementValues?.reverse[x]) ?? []),
//         "source": sourceValues.reverse[source],
//         "sunrise": sunrise,
//         "sunriseEpoch": sunriseEpoch,
//         "sunset": sunset,
//         "sunsetEpoch": sunsetEpoch,
//         "moonphase": moonphase,
//         "tempmax": tempmax,
//         "tempmin": tempmin,
//         "feelslikemax": feelslikemax,
//         "feelslikemin": feelslikemin,
//         "precipcover": precipcover,
//         "severerisk": severerisk,
//         "description": description,
//         "hours": hours == null
//             ? []
//             : List<dynamic>.from(hours?.map((x) => x.toJson()) ?? []),
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k)) ?? {};
//     return reverseMap;
//   }
// }

// enum Icon {
//   CLEAR_DAY,
//   CLEAR_NIGHT,
//   CLOUDY,
//   FOG,
//   PARTLY_CLOUDY_DAY,
//   PARTLY_CLOUDY_NIGHT,
//   RAIN,
// }

// enum Source { COMB, FCST, OBS }

// enum StationElement {
//   D4699,
//   D8868,
//   KDAA,
//   KDCA,
//   KHEF,
//   KIAD,
//   KJYO,
// }

// class StationValue {
//   dynamic distance;
//   dynamic latitude;
//   dynamic longitude;
//   dynamic useCount;
//   StationElement? id;
//   String? name;
//   dynamic quality;
//   dynamic contribution;

//   StationValue({
//     this.distance,
//     this.latitude,
//     this.longitude,
//     this.useCount,
//     this.id,
//     this.name,
//     this.quality,
//     this.contribution,
//   });

//   factory StationValue.fromJson(Map<String, dynamic> json) => StationValue(
//         distance: json["distance"],
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         useCount: json["useCount"],
//         // id: json["id"] != null ? stationElementValues?.map[json["id"]] : null,
//         name: json["name"],
//         quality: json["quality"],
//         contribution: json["contribution"],
//       );

//   Map<String, dynamic> toJson() => {
//         "distance": distance,
//         "latitude": latitude,
//         "longitude": longitude,
//         "useCount": useCount,
//         // "id": id != null ? stationElementValues?.reverse[id] : null,
//         "name": name,
//         "quality": quality,
//         "contribution": contribution,
//       };
// }

// class WeatherModel {
//   dynamic queryCost;
//   dynamic latitude;
//   dynamic longitude;
//   String? resolvedAddress;
//   String? address;
//   String? timezone;
//   dynamic tzoffset;
//   String? description;
//   List<CurrentConditions>? days;
//   List<dynamic>? alerts;
//   Map<String, StationValue>? stations;
//   CurrentConditions? currentConditions;

//   WeatherModel({
//     this.queryCost,
//     this.latitude,
//     this.longitude,
//     this.resolvedAddress,
//     this.address,
//     this.timezone,
//     this.tzoffset,
//     this.description,
//     this.days,
//     this.alerts,
//     this.stations,
//     this.currentConditions,
//   });

//   factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
//         queryCost: json["queryCost"],
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         resolvedAddress: json["resolvedAddress"],
//         address: json["address"],
//         timezone: json["timezone"],
//         tzoffset: json["tzoffset"],
//         description: json["description"],
//         days: json["days"] == null
//             ? []
//             : List<CurrentConditions>.from(
//                 json["days"].map((x) => CurrentConditions.fromJson(x))),
//         alerts: json["alerts"] == null
//             ? []
//             : List<dynamic>.from(json["alerts"].map((x) => x)),
//         stations: Map.from(json["stations"]).map((k, v) =>
//             MapEntry<String, StationValue>(k, StationValue.fromJson(v))),
//         currentConditions: json["currentConditions"] == null
//             ? null
//             : CurrentConditions.fromJson(json["currentConditions"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "queryCost": queryCost,
//         "latitude": latitude,
//         "longitude": longitude,
//         "resolvedAddress": resolvedAddress,
//         "address": address,
//         "timezone": timezone,
//         "tzoffset": tzoffset,
//         "description": description,
//         "days": days == null
//             ? []
//             : List<dynamic>.from(days?.map((x) => x.toJson()) ?? []),
//         "alerts": alerts == null
//             ? []
//             : List<dynamic>.from(alerts?.map((x) => x) ?? []),
//         "stations": Map.from(stations ?? {})
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "currentConditions": currentConditions?.toJson(),
//       };
// }
import 'dart:convert';

final conditionsValues = EnumValues({
  "Clear": Conditions.CLEAR,
  "Overcast": Conditions.OVERCAST,
  "Partially cloudy": Conditions.PARTIALLY_CLOUDY,
  "Rain, Overcast": Conditions.RAIN_OVERCAST,
  "Rain, Partially cloudy": Conditions.RAIN_PARTIALLY_CLOUDY
});

final iconValues = EnumValues({
  "clear-day": Icon.CLEAR_DAY,
  "clear-night": Icon.CLEAR_NIGHT,
  "cloudy": Icon.CLOUDY,
  "fog": Icon.FOG,
  "partly-cloudy-day": Icon.PARTLY_CLOUDY_DAY,
  "partly-cloudy-night": Icon.PARTLY_CLOUDY_NIGHT,
  "rain": Icon.RAIN
});

final sourceValues =
    EnumValues({"comb": Source.COMB, "fcst": Source.FCST, "obs": Source.OBS});

EnumValues<StationElement>? stationElementValues = EnumValues({
  "D4699": StationElement.D4699,
  "D8868": StationElement.D8868,
  "KDAA": StationElement.KDAA,
  "KDCA": StationElement.KDCA,
  "KHEF": StationElement.KHEF,
  "KIAD": StationElement.KIAD,
  "KJYO": StationElement.KJYO
});

WeatherModel? weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String? weatherModelToJson(WeatherModel? data) => json.encode(data?.toJson());

enum Conditions {
  CLEAR,
  OVERCAST,
  PARTIALLY_CLOUDY,
  RAIN_OVERCAST,
  RAIN_PARTIALLY_CLOUDY
}

class CurrentConditions {
  String? datetime;
  dynamic datetimeEpoch;
  dynamic temp;
  dynamic feelslike;
  dynamic humidity;
  dynamic dew;
  dynamic precip;
  dynamic precipprob;
  dynamic snow;
  dynamic snowdepth;
  List<Icon?>? preciptype;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic visibility;
  dynamic cloudcover;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  Conditions? conditions;
  Icon? icon;
  List<StationElement?>? stations;
  Source? source;
  String? sunrise;
  dynamic sunriseEpoch;
  String? sunset;
  dynamic sunsetEpoch;
  dynamic moonphase;
  dynamic tempmax;
  dynamic tempmin;
  dynamic feelslikemax;
  dynamic feelslikemin;
  dynamic precipcover;
  dynamic severerisk;
  String? description;
  List<CurrentConditions?>? hours;

  CurrentConditions({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.conditions,
    this.icon,
    this.stations,
    this.source,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.tempmax,
    this.tempmin,
    this.feelslikemax,
    this.feelslikemin,
    this.precipcover,
    this.severerisk,
    this.description,
    this.hours,
  });

  factory CurrentConditions.fromJson(Map<String, dynamic>? json) =>
      CurrentConditions(
        datetime: json?["datetime"],
        datetimeEpoch: json?["datetimeEpoch"],
        temp: json?["temp"]?.toDouble(),
        feelslike: json?["feelslike"]?.toDouble(),
        humidity: json?["humidity"]?.toDouble(),
        dew: json?["dew"]?.toDouble(),
        precip: json?["precip"]?.toDouble(),
        precipprob: json?["precipprob"]?.toDouble(),
        snow: json?["snow"],
        snowdepth: json?["snowdepth"],
        preciptype: json?["preciptype"] == null
            ? []
            : List<Icon?>.from(
                json!["preciptype"].map((x) => iconValues.map[x])),
        windgust: json?["windgust"]?.toDouble(),
        windspeed: json?["windspeed"]?.toDouble(),
        winddir: json?["winddir"]?.toDouble(),
        pressure: json?["pressure"]?.toDouble(),
        visibility: json?["visibility"]?.toDouble(),
        cloudcover: json?["cloudcover"]?.toDouble(),
        solarradiation: json?["solarradiation"]?.toDouble(),
        solarenergy: json?["solarenergy"]?.toDouble(),
        uvindex: json?["uvindex"],
        conditions: json?["conditions"] != null
            ? conditionsValues.map[json!["conditions"]]
            : null,
        icon: json?["icon"] != null ? iconValues.map[json!["icon"]] : null,
        stations: json?["stations"] == null
            ? []
            : List<StationElement?>.from(
                json!["stations"].map((x) => stationElementValues?.map[x])),
        source:
            json?["source"] != null ? sourceValues.map[json!["source"]] : null,
        sunrise: json?["sunrise"],
        sunriseEpoch: json?["sunriseEpoch"],
        sunset: json?["sunset"],
        sunsetEpoch: json?["sunsetEpoch"],
        moonphase: json?["moonphase"]?.toDouble(),
        tempmax: json?["tempmax"]?.toDouble(),
        tempmin: json?["tempmin"]?.toDouble(),
        feelslikemax: json?["feelslikemax"]?.toDouble(),
        feelslikemin: json?["feelslikemin"]?.toDouble(),
        precipcover: json?["precipcover"]?.toDouble(),
        severerisk: json?["severerisk"],
        description: json?["description"],
        hours: json?["hours"] == null
            ? []
            : List<CurrentConditions?>.from(
                json!["hours"].map((x) => CurrentConditions.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "datetime": datetime,
        "datetimeEpoch": datetimeEpoch,
        "temp": temp,
        "feelslike": feelslike,
        "humidity": humidity,
        "dew": dew,
        "precip": precip,
        "precipprob": precipprob,
        "snow": snow,
        "snowdepth": snowdepth,
        "preciptype": preciptype == null
            ? []
            : List<dynamic>.from(
                preciptype?.map((x) => iconValues.reverse[x]) ?? []),
        "windgust": windgust,
        "windspeed": windspeed,
        "winddir": winddir,
        "pressure": pressure,
        "visibility": visibility,
        "cloudcover": cloudcover,
        "solarradiation": solarradiation,
        "solarenergy": solarenergy,
        "uvindex": uvindex,
        "conditions":
            conditions != null ? conditionsValues.reverse[conditions] : null,
        "icon": icon != null ? iconValues.reverse[icon] : null,
        "stations": stations == null
            ? []
            : List<dynamic>.from(
                stations?.map((x) => stationElementValues?.reverse[x]) ?? []),
        "source": source != null ? sourceValues.reverse[source] : null,
        "sunrise": sunrise,
        "sunriseEpoch": sunriseEpoch,
        "sunset": sunset,
        "sunsetEpoch": sunsetEpoch,
        "moonphase": moonphase,
        "tempmax": tempmax,
        "tempmin": tempmin,
        "feelslikemax": feelslikemax,
        "feelslikemin": feelslikemin,
        "precipcover": precipcover,
        "severerisk": severerisk,
        "description": description,
        "hours": hours == null
            ? []
            : List<dynamic>.from(hours?.map((x) => x?.toJson()) ?? []),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

enum Icon {
  CLEAR_DAY,
  CLEAR_NIGHT,
  CLOUDY,
  FOG,
  PARTLY_CLOUDY_DAY,
  PARTLY_CLOUDY_NIGHT,
  RAIN,
}

enum Source { COMB, FCST, OBS }

enum StationElement {
  D4699,
  D8868,
  KDAA,
  KDCA,
  KHEF,
  KIAD,
  KJYO,
}

class StationValue {
  dynamic distance;
  dynamic latitude;
  dynamic longitude;
  dynamic useCount;
  StationElement? id;
  String? name;
  dynamic quality;
  dynamic contribution;

  StationValue({
    this.distance,
    this.latitude,
    this.longitude,
    this.useCount,
    this.id,
    this.name,
    this.quality,
    this.contribution,
  });

  factory StationValue.fromJson(Map<String, dynamic>? json) => StationValue(
        distance: json?["distance"],
        latitude: json?["latitude"]?.toDouble(),
        longitude: json?["longitude"]?.toDouble(),
        useCount: json?["useCount"],
        id: json?["id"] != null ? stationElementValues?.map[json!["id"]] : null,
        name: json?["name"],
        quality: json?["quality"],
        contribution: json?["contribution"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "latitude": latitude,
        "longitude": longitude,
        "useCount": useCount,
        "id": id != null ? stationElementValues?.reverse[id] : null,
        "name": name,
        "quality": quality,
        "contribution": contribution,
      };
}

class WeatherModel {
  dynamic queryCost;
  dynamic latitude;
  dynamic longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  dynamic tzoffset;
  String? description;
  List<CurrentConditions?>? days;
  List<dynamic>? alerts;
  Map<String, StationValue?>? stations;
  CurrentConditions? currentConditions;

  WeatherModel({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.description,
    this.days,
    this.alerts,
    this.stations,
    this.currentConditions,
  });

  factory WeatherModel.fromJson(Map<String, dynamic>? json) => WeatherModel(
        queryCost: json?["queryCost"],
        latitude: json?["latitude"]?.toDouble(),
        longitude: json?["longitude"]?.toDouble(),
        resolvedAddress: json?["resolvedAddress"],
        address: json?["address"],
        timezone: json?["timezone"],
        tzoffset: json?["tzoffset"],
        description: json?["description"],
        days: json?["days"] == null
            ? []
            : List<CurrentConditions?>.from(
                json!["days"].map((x) => CurrentConditions.fromJson(x))),
        alerts: json?["alerts"] == null
            ? []
            : List<dynamic>.from(json!["alerts"].map((x) => x)),
        stations: json?["stations"] == null
            ? {}
            : Map.from(json!["stations"]).map((k, v) =>
                MapEntry<String, StationValue?>(k, StationValue.fromJson(v))),
        currentConditions: json?["currentConditions"] == null
            ? null
            : CurrentConditions.fromJson(json!["currentConditions"]),
      );

  Map<String, dynamic> toJson() => {
        "queryCost": queryCost,
        "latitude": latitude,
        "longitude": longitude,
        "resolvedAddress": resolvedAddress,
        "address": address,
        "timezone": timezone,
        "tzoffset": tzoffset,
        "description": description,
        "days": days == null
            ? []
            : List<dynamic>.from(days?.map((x) => x?.toJson()) ?? []),
        "alerts": alerts == null
            ? []
            : List<dynamic>.from(alerts?.map((x) => x) ?? []),
        "stations": stations == null
            ? {}
            : Map.from(stations ?? {})
                .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
        "currentConditions": currentConditions?.toJson(),
      };
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mysky1/constants/api_key.dart';
import 'package:mysky1/helper_functions/thermostat_color.dart';
import 'package:mysky1/models/weather_model.dart';
import 'package:mysky1/pages/splash_screen.dart';
import 'package:mysky1/services/weather_services.dart';

class WeatherConditionPage extends StatefulWidget {
  final String cityName;
  const WeatherConditionPage({super.key, required this.cityName});

  @override
  State<WeatherConditionPage> createState() => _WeatherConditionPageState();
}

class _WeatherConditionPageState extends State<WeatherConditionPage> {
// api key
  final _weatherService = WeatherServices(api_key);
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // get the current city
    String cityName = widget.cityName;

    // get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  // weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/weatherAnimations/default.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/weatherAnimations/cloud.json';
      case 'mist':
        return 'assets/weatherAnimations/mist.json';
      case 'smoke':
        return 'assets/weatherAnimations/fogandsmoke.json';
      case 'haze':
        return 'assets/weatherAnimations/haze.json';
      case 'dust':
        return 'assets/weatherAnimations/dust.json';
      case 'fog':
        return 'assets/weatherAnimations/fogandsmoke.json';
      case 'rain':
        return 'assets/weatherAnimations/rain.json';
      case 'drizzle rain':
        return 'assets/weatherAnimations/rain.json';
      case 'shower rain':
        return 'assets/weatherAnimations/rain.json';
      case 'thunderstorm':
        return 'assets/weatherAnimations/thunder.json';
      case 'clear':
        return 'assets/weatherAnimations/sunny.json';
      default:
        return 'assets/weatherAnimations/default.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    double temp = _weather?.temperature ?? 0.0;
    if (_weather == null) {
      return SplashScreen();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: thermostatColor(temp, 100)!,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              thermostatColor(temp, 100)!,
              thermostatColor(temp, 200)!,
              thermostatColor(temp, 300)!,
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                _weather?.cityName ?? "City not found",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: thermostatColor(temp, 500),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Lottie.asset(
                  getWeatherAnimation(_weather?.mainCondition),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                _weather?.mainCondition ?? "Data not available",
                style: (_weather?.mainCondition != null)
                    ? const TextStyle(fontSize: 30, fontWeight: FontWeight.w500)
                    : const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.thermostat,
                            size: 35,
                            color: thermostatColor(temp, 600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Icon(
                            CupertinoIcons.drop,
                            color: thermostatColor(temp, 600),
                            size: 35,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Icon(
                            Icons.wind_power_rounded,
                            color: thermostatColor(temp, 600),
                            size: 35,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Temperature',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Humidity',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Wind Speed',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            ': ',
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ': ',
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ': ',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_weather?.temperature ?? "Data not available"} °C",
                            style: (_weather?.mainCondition != null)
                                ? const TextStyle(
                                    fontSize: 23,
                                  )
                                : const TextStyle(
                                    fontSize: 18,
                                  ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${_weather?.humidity ?? "Data not available"} %",
                            style: (_weather?.mainCondition != null)
                                ? const TextStyle(fontSize: 23)
                                : const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${_weather?.windSpeed ?? "Data not available"} m/s",
                            style: (_weather?.mainCondition != null)
                                ? const TextStyle(
                                    fontSize: 23,
                                  )
                                : const TextStyle(
                                    fontSize: 18,
                                  ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

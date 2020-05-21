import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const kApiKey = 'd4a9d6444f7784fc3c80cae78d414838';
const kOWM = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$kOWM?q=$cityName&appid=$kApiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.findLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$kOWM?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    var data = await networkHelper.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

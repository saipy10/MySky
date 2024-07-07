# MySky

Welcome to the MySky! This is a Flutter-based application that provides real-time weather updates for various locations. It uses a modern, user-friendly interface to display current weather conditions, forecasts, and more.

## Features

- **OpenWeather API Integration**: The app fetches real-time weather data from the OpenWeather API.
- **Real-time Weather Data**: Get the latest weather updates for your current location or any city worldwide.
- **Temperature**: View the current temperature in Celsius.
- **Wind Speed**: Get current wind speed information.
- **Humidity**: See the current humidity level.
- **Search Functionality**: Easily search for weather information in different cities.
- **Dynamic Backgrounds**: Background changes based on the current weather condition.
- **Interactive UI**: Enjoy a smooth and engaging user interface.

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of [Flutter](https://flutter.dev/docs/get-started/install).
- You have an API key from [OpenWeather](https://openweathermap.org/api).

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/saipy10/weather-app.git
   cd weather-app
   ```

2. **Get dependencies:**

   ```bash
   flutter pub get
   ```

3. **Configure API key:**

   Open `lib/constants` add file `api_key.dart` and write following

   ```dart
   final String apiKey = 'YOUR_API_KEY';
   ```

4. **Run the app:**

   ```bash
   flutter run
   ```

## Project Structure

- `lib/`
  - `main.dart`: The main entry point of the application.
  - `pages/`: Contains the different pages of the app (e.g., home, weather).
  - `services/`: Contains services for fetching weather data.
  - `helper_functions/`: Contains reusable UI components.
  - `models/`: Contains data models for weather information.

## Usage

- **Viewing Current Weather**: On launching the app, it will show the weather for your current location.
- **Searching for a City**: Use the search bar to find weather information for a specific city.

## Contributing

Contributions are always welcome! Here’s how you can help:

1. Fork the project.
2. Create your feature branch: `git checkout -b feature/AmazingFeature`.
3. Commit your changes: `git commit -m 'Add some AmazingFeature'`.
4. Push to the branch: `git push origin feature/AmazingFeature`.
5. Open a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Contact

If you have any questions or suggestions, feel free to open an issue or contact me directly at [sairaj10adhav@gmail.com](mailto:sairaj10adhav@gmail.com).

---

Thank you for using MySky!

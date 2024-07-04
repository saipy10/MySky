import 'package:flutter/material.dart';
import 'package:mysky1/pages/weather_condition_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/myskyer.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "How's Your Sky?",
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.height * 0.3,
                    child: TextField(
                      controller: cityController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        labelText: "Search city",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Enter city here",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherConditionPage(
                              cityName: cityController.text.toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherConditionPage(
                            cityName: cityController.text.toString(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

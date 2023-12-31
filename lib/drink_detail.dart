import 'package:flutter/material.dart';
import 'package:flutter_application_cocktail_project/main.dart';

class DrinkDetail extends StatelessWidget {
  final drink;
  const DrinkDetail({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.grey])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(drink["strDrink"]),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: drink["idDrink"],
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "ID : ${drink["idDrink"]}",
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                "${drink["strDrink"]}",
                style: const TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

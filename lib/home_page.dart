import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_cocktail_project/drink_detail.dart';
import 'package:flutter_application_cocktail_project/main.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail';
  var response, drinks;
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    response = await http.get(Uri.parse(api));

    drinks = jsonDecode(response.body)['drinks'];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.grey])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Cocktail app'),
            elevation: 0,
          ),
          body: Center(
              child: response != null
                  ? ListView.builder(
                      itemCount: drinks.length,
                      itemBuilder: (context, index) {
                        var drink = drinks[index];
                        return ListTile(
                          leading: Hero(
                            tag: drink["idDrink"],
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(drink[
                                      "strDrinkThumb"] ??
                                  "https://precisionpharmacy.net/wp-content/themes/apexclinic/images/no-image/No-Image-Found-400x264.png"),
                            ),
                          ),
                          title: Text(
                            "${drink["strDrink"]}",
                            style: const TextStyle(
                                fontSize: 22, color: Colors.white),
                          ),
                          subtitle: Text(
                            "${drink["idDrink"]}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrinkDetail(
                                          drink: drink,
                                        )));
                          },
                        );
                      })
                  : const CircularProgressIndicator())),
    );
  }
}

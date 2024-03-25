import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var message = "Loading…";
  Future<void> _initFilm() async {
    const url = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films";
    try {
      setState(() => message = "Loading, please wait…"); // Uncompleted
      var response = await http.get(Uri.parse(url));
      setState(() => message = response.body); // Completed with a value
    } catch (error) {
      setState(() => message = error.toString()); //Completed with an error
    }
  }

  void initState() {
    super.initState();
    _initFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Studio Ghibli Films"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Text(message)
                )
            ),
          ],
        ),
      ),
    );
  }
}
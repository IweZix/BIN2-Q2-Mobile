import 'package:flutter/material.dart';

class Laureate extends StatelessWidget {
  final String firstname, lastname, motivation;

  const Laureate({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.motivation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 500,
            child: Column(
              children: [
                Text(
                  motivation,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "$firstname $lastname",
                  textAlign: TextAlign.justify,
                )
              ],
            )));
  }
}

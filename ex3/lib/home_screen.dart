import 'package:ex3/note.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> notes = defaultNotes;

  final controllerTitle = TextEditingController();

  final controllerDescription = TextEditingController();

  final title = null;
  final description = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Exercice 3'),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            // Display default notes
            Expanded(
              child: Center(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: defaultNotes.length * 2 - 1, // Account for dividers
                    itemBuilder: (context, index) {
                      if (index.isOdd) {
                        return const Divider(); // Add a divider for odd indices
                      }
                      final itemIndex = index ~/ 2; // Adjusted index for actual items
                      return ListTile(
                        title: Text(defaultNotes[itemIndex].titre),
                        subtitle: Text(defaultNotes[itemIndex].description),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              notes.removeAt(itemIndex);
                            });
                          },
                        )
                      );
                    },
                  ),
                ),
              ),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: controllerTitle,
                    decoration: const InputDecoration(labelText: "Enter title"),
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? "title can't be empty"
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: controllerDescription,
                    decoration: const InputDecoration(labelText: "Enter description"),
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? "description can't be empty"
                          : null;
                    },
                  ),
                  const SizedBox(width: 50.0),
                  ElevatedButton(
                    child: const Text('Ajouter'),
                    onPressed: () {
                      setState(() {
                        notes.add(Note(
                          titre: controllerTitle.text,
                          description: controllerDescription.text
                        ));
                        controllerTitle.text = "";
                        controllerDescription.text = "";
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

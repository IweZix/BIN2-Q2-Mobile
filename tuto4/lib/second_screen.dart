import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _FirstScreenState();
}
class _FirstScreenState extends State<SecondScreen> {
  var nbClicks = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          context.go("/", extra: nbClicks);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Second screen"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Hello from second screen."),
              const SizedBox(height: 16),
              Text("There were $nbClicks clicks."),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => setState(() => nbClicks++),
                child: const Text("click me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
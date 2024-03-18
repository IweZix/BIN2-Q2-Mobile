import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/views/form_screen.dart';
import '/views/list_screen.dart';
import '/views/article_screen.dart';
import '/models/article.dart';
import '/view_model/changer_view_model.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const ListScreen();
      },
    ),
    GoRoute(
      path: '/form',
      builder: (context, state) {
        return const FormScreen();
      },
    ),
    GoRoute(
      path: '/article/:id',
      builder: (context, state) {
        final article = state.extra as Article;
        return ArticleScreen(article: article);
      },
    ),
  ],
);

void main() {
  runApp(ChangeNotifierProvider<ChangerViewModel>(
    create: (context) => ChangerViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Exercice 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

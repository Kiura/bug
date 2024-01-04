import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'main.g.dart';

void main() {
  runApp(const MyApp());
}

class NavigationService {
  static GlobalKey<NavigatorState> routerKey =
      GlobalKey<NavigatorState>(debugLabel: 'routerKey');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: "/",
      navigatorKey: NavigationService.routerKey,
      routes: $appRoutes,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

@TypedGoRoute<HomePageRoute>(path: '/')
@immutable
class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  build(BuildContext context, GoRouterState state) =>
      const HomePage(title: 'Home');
}

@TypedGoRoute<AccountPageRoute>(path: '/account')
@immutable
class AccountPageRoute extends GoRouteData {
  const AccountPageRoute();

  @override
  build(BuildContext context, GoRouterState state) =>
      const Account(title: 'Account');
}

class Account extends StatelessWidget {
  final String title;
  const Account({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are in the account page',
            ),
          ],
        ),
      ),
    );
    ;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_boiler_plate/feature/user/user.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_boiler_plate/protected_page.dart';
import 'theme.dart';
import 'color_schemes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const libraryTheme = LibraryTheme();
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: libraryTheme.toThemeData(lightColorScheme),
        darkTheme: libraryTheme.toThemeData(darkColorScheme),
        themeMode: ThemeMode.system,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  static final storage = FlutterSecureStorage();

  checkToken() async {
    String token = await storage.read(key: "token") ?? "";
    await ref.read(userModel).getUserInfo();
    print(ref.read(userState).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text("login"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupPage()),
              );
            },
            child: const Text("signup"),
          ),
          FilledButton(onPressed: checkToken, child: Text("check token")),
          FilledButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProtectedPage()));
              },
              child: Text("go to protected page")),
          FilledButton(
              onPressed: () async {
                await ref.read(userModel).logout();
              },
              child: Text("logout"))
        ]),
      ),
    );
  }
}

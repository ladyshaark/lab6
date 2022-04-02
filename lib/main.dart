import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Возвращение значения'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/two');
              },
              child: const Text(
                'Приступить к выбору',
              )),
        ],
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String yes = 'Да';
  String no = 'Нет';

  String _id;
  SecondScreen({String id = ""}) : _id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите вариант')),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(yes),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  yes,
                  style: const TextStyle(fontSize: 20),
                )),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(no),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  no,
                  style: const TextStyle(fontSize: 20),
                )),
          ])),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => const MainScreen(),
      '/two': (BuildContext context) => SecondScreen()
    },
    onGenerateRoute: (routeSettings) {
      var path = routeSettings.name!.split('/');

      if (path[1] == "two") {
        return MaterialPageRoute(
          builder: (context) => SecondScreen(id: path[2]),
          settings: routeSettings,
        );
      }
    },
  ));
}

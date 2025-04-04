import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int guess;
  int checkFlag = 0;

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    guess = randomInt();
  }

  int randomInt() {
    return DateTime.now().millisecondsSinceEpoch % 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('My Session App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You are in the Demons, there is only one way out now ...',
            ),
            Container(
                padding: const EdgeInsets.all(16),
                width: 250,
                child: TextFormField(
                  controller: textController,
                  keyboardType: TextInputType.number,
                )),
            ElevatedButton(
              onPressed: () {
                int result = int.parse(textController.text);
                if (result == guess) {
                  checkFlag = 2;
                } else if (result < guess) {
                  checkFlag = -1;
                } else if (result > guess) {
                  checkFlag = 1;
                }
                setState(() {});
              },
              child: Text('Check'),
            ),
            const SizedBox(height: 8),
            Visibility(
                visible: [0].contains(checkFlag),
                child: Text('Start guessing ...')),
            Visibility(
                visible: [-1].contains(checkFlag), child: Text('I am Higher')),
            Visibility(
                visible: [1].contains(checkFlag), child: Text('I am Lower')),
            Visibility(
                visible: [2].contains(checkFlag), child: Text('Got It !')),
          ],
        ),
      ),
    );
  }
}

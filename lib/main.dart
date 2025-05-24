import 'package:flutter/material.dart';
import 'package:lesson5/destination_like.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 5',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lesson 5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _textController = TextEditingController.fromValue(
      TextEditingValue(text: "Initial value"),
      );
  final _keyForm = GlobalKey<FormState>();
  final _firstFieldKey = GlobalKey<FormFieldState>();
  final _secondFieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    // You can add any initialization logic here if needed
    _textController.addListener(() {
      debugPrint('New controller text: ${_textController.text}');
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void onButtonPress() {
    setState(() {
      _counter += 5;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              DestinationLike(
                key: const Key("destination_like"),
              ),
              ElevatedButton(onPressed: 
                onButtonPress, 
                child: Text("Do you like me?")),
              TextField(
                controller: _textController,
                onChanged: (text) {
                  print("Text changed: $text");
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 20),
              getForm(_keyForm),
              
              const SizedBox(height: 20),
              IconButton(
                onPressed: () {
                  if (_keyForm.currentState?.validate() ?? false) {
                    debugPrint('Form is valid');
                    debugPrint('First field value: ${_firstFieldKey.currentState?.value}');
                    debugPrint('Second field value: ${_secondFieldKey.currentState?.value}');
                    debugPrint('Text field value: ${_textController.text}');
                  } else {
                    debugPrint('Form is invalid');
                  }
                },
                icon: const Icon(Icons.check),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  Widget getForm(GlobalKey<FormState> keyForm) {
    return Form(
      key: keyForm,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              key: _firstFieldKey,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Field',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              key: _secondFieldKey,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Second Field',
              ),
            ),
          ),
          Builder(
            builder: (BuildContext subContext) => TextButton(
              onPressed: () {
                final valid = Form.of(subContext).validate();
                print("valid: $valid");

                if (valid) {
                  debugPrint('First field value: ${_firstFieldKey.currentState?.value}');
                  debugPrint('Second field value: ${_secondFieldKey.currentState?.value}');
                }
              },
              child: const Text("Validate"),
            ),
          )
        ],
      ),
    );
  }
}
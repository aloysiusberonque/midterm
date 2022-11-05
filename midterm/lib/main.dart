import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstScreen> {
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = myController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            text: textToSend,
          ),
        ));
  }

  TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFEDC01),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    // Title
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'MESSAGE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    // Text Field
                    TextField(
                        style: const TextStyle(height: 1, fontSize: 16),
                        decoration: const InputDecoration(
                          hintText: "Enter message here",
                          labelText: "Message",
                          isDense: true,
                        ),
                        controller: myController),
                    // Proceed button container
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: GestureDetector(
                              child: ButtonTheme(
                                  minWidth: 100.0,
                                  height: 50.0,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: const Color(0xffFEDC01),
                                    ),
                                    child: const Text('Proceed',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      _sendDataToSecondScreen(context);
                                    },
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String text;
  // Receive data from the FirstScreen as a parameter
  HomePage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Second Screen"),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      // Menu Selection
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Your message",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

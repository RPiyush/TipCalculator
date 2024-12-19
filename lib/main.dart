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
      title: 'Tip Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
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
      home: const TipC(),
    );
  }
}

class TipC extends StatefulWidget {
  const TipC({super.key});

  @override
  State<TipC> createState() => _TipCState();
}

class _TipCState extends State<TipC> {
  int _numberOfPerson = 1;

  void increment() {
    setState(() {
      _numberOfPerson++;
    });
  }

  void decrement() {
    if (_numberOfPerson > 1) {
      setState(() {
        _numberOfPerson--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData Object
    var theme = Theme.of(context);
    // Theme Style Object
    final style = theme.textTheme.titleMedium?.copyWith(
        color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tip Calculator"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: theme.colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text("Total Per Person", style: style),
                  Text(
                    "\$20.00",
                    style: style?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontSize: theme.textTheme.displaySmall?.fontSize),
                  ),
                ],
              ),
            ),
          ),
          // Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border:
                    Border.all(color: theme.colorScheme.primary, width: 2.0),
              ),
              // Input Text
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print(value);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Split",
                          style: theme.textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            IconButton(
                                color: theme.colorScheme.primary,
                                onPressed: decrement,
                                icon: const Icon(Icons.remove)),
                            Text(
                              "$_numberOfPerson",
                              style: theme.textTheme.titleMedium,
                            ),
                            IconButton(
                                color: theme.colorScheme.primary,
                                onPressed: increment,
                                icon: const Icon(Icons.add))
                          ],
                        )
                      ],
                    ),
                  ),
                  // === TIP Section ==
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tip",
                          style: theme.textTheme.titleMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "\$20",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Split Money Widget
            ),
          )
        ],
      ),
    );
  }
}

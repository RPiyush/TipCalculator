import 'package:flutter/material.dart';
import 'package:tip_calculator/widgets/input_bill_text_field.dart';
import 'package:tip_calculator/widgets/person_counter.dart';
import 'package:tip_calculator/widgets/split_persons.dart';
import 'package:tip_calculator/widgets/tip_section.dart';
import 'package:tip_calculator/widgets/tip_slider.dart';

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
  double _tipPercent = 0;
  double _billAmount = 0.0;
  double _totalBillPerperson = 0.0;
  double _tipAmount = 0;

  void increment() {
    setState(() {
      _numberOfPerson++;
    });
    calculateTip();
  }

  void decrement() {
    if (_numberOfPerson > 1) {
      setState(() {
        _numberOfPerson--;
      });
    }
    calculateTip();
  }

  void calculateTip() {
    _tipAmount = 0;
    if (_tipPercent > 0) {
      _tipAmount = _billAmount * (_tipPercent);
    }
    setState(() {
      _totalBillPerperson = (_billAmount + _tipAmount) / _numberOfPerson;
    });
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
          PersonCounter(
            theme: theme,
            style: style,
            billAmount: _totalBillPerperson,
          ),
          // Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border:
                    Border.all(color: theme.colorScheme.primary, width: 2.0),
              ),
              // Input Text
              child: Column(
                children: [
                  InputBillTextField(
                    onValueChange: (value) {
                      _billAmount = double.parse(value);
                      calculateTip();
                    },
                    billAmount: _billAmount.toString(),
                  ),
                  SplitPersons(
                    theme: theme,
                    numberOfPerson: _numberOfPerson,
                    onDecrement: decrement,
                    onIncrement: increment,
                  ),
                  // === TIP Section ==
                  TipSection(theme: theme, tipValue: _tipAmount),
                  Text("${(_tipPercent * 100).round()}%"),
                  TipSlider(
                    tipPercent: _tipPercent,
                    onValueChanged: (double value) {
                      setState(() {
                        _tipPercent = value;
                        calculateTip();
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

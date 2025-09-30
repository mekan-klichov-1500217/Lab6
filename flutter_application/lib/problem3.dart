import 'package:flutter/material.dart';

// Task 1
class SwitchManager extends StatefulWidget {
  const SwitchManager({super.key});

  @override
  State<SwitchManager> createState() => _SwitchManagerState();
}

class _SwitchManagerState extends State<SwitchManager> {
  bool _isActive = false;

  void _handleSwitchChanged(bool newValue) {
    setState(() {
      _isActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("The Switch is: ${_isActive ? "ON" : "OFF"}"),
        InteractiveSwitch(
          isActive: _isActive,
          onChanged: _handleSwitchChanged,
        ),
      ],
    );
  }
}

class InteractiveSwitch extends StatelessWidget {
  final bool isActive;
  final ValueChanged<bool> onChanged;

  const InteractiveSwitch({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isActive,
      onChanged: onChanged,
    );
  }
}

// Task 2
class GreetingParent extends StatefulWidget {
  const GreetingParent({super.key});

  @override
  State<GreetingParent> createState() => _GreetingParentState();
}

class _GreetingParentState extends State<GreetingParent> {
  String _name = "Guest";

  @override
  Widget build(BuildContext context) {
    return Center(child: Greeting(name: _name));
  }
}

class Greeting extends StatelessWidget {
  final String name;
  const Greeting({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text("Hello, $name", style: const TextStyle(fontSize: 20));
  }
}

// Task 3
class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _celsius = 0.0;

  void _updateCelsius(String input) {
    setState(() {
      _celsius = double.tryParse(input) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CelsiusInput(onChanged: _updateCelsius),
          const SizedBox(height: 20),
          FahrenheitDisplay(celsius: _celsius),
        ],
      ),
    );
  }
}

class CelsiusInput extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const CelsiusInput({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Enter Celsius",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}

class FahrenheitDisplay extends StatelessWidget {
  final double celsius;
  const FahrenheitDisplay({super.key, required this.celsius});

  @override
  Widget build(BuildContext context) {
    final fahrenheit = celsius * 9 / 5 + 32;
    return Text("Fahrenheit: $fahrenheit",
        style: const TextStyle(fontSize: 18));
  }
}

// Task 4
class SurveyApp extends StatefulWidget {
  const SurveyApp({super.key});

  @override
  State<SurveyApp> createState() => _SurveyAppState();
}

class _SurveyAppState extends State<SurveyApp> {
  double _satisfaction = 5.0;

  String get message {
    if (_satisfaction < 3) return "Awful";
    if (_satisfaction < 7) return "Okay";
    return "Great!";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: _satisfaction,
          min: 0,
          max: 10,
          divisions: 10,
          label: _satisfaction.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _satisfaction = value;
            });
          },
        ),
        Text("Satisfaction: $message",
            style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}

// Task 5
class Grandparent extends StatefulWidget {
  const Grandparent({super.key});

  @override
  State<Grandparent> createState() => _GrandparentState();
}

class _GrandparentState extends State<Grandparent> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Counter: $_counter", style: const TextStyle(fontSize: 20)),
        Parent(counter: _counter, onIncrement: _increment),
      ],
    );
  }
}

class Parent extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;
  const Parent({super.key, required this.counter, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Child(onIncrement: onIncrement);
  }
}

class Child extends StatelessWidget {
  final VoidCallback onIncrement;
  const Child({super.key, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onIncrement,
      child: const Text("Increment"),
    );
  }
}

class Problem3 extends StatelessWidget {
  const Problem3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: SwitchManager(),
        // child: GreetingParent(),
        // child: TemperatureConverter(),
        // child: SurveyApp(),
        child: Grandparent(),
      ),
    );
  }
}
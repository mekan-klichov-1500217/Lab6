import 'package:flutter/material.dart';

// Task 2
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter with Increment & Decrement")),
      body: Center(
        child: Text(
          "Count: $_counter",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

// Task 3
class ToggleVisibility extends StatefulWidget {
  const ToggleVisibility({super.key});

  @override
  State<ToggleVisibility> createState() => _ToggleVisibilityState();
}

class _ToggleVisibilityState extends State<ToggleVisibility> {
  bool _isVisible = true;

  void _toggle() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Toggle Visibility")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isVisible)
              const Text("Hello, I am visible!",
                  style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggle,
              child: const Text("Toggle"),
            ),
          ],
        ),
      ),
    );
  }
}

// Task 4
class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _items = [];

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Item List")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter item",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _addItem, child: const Text("Add Item")),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(_items[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Task 5
class ColorBoxPage extends StatefulWidget {
  const ColorBoxPage({super.key});

  @override
  State<ColorBoxPage> createState() => _ColorBoxPageState();
}

class _ColorBoxPageState extends State<ColorBoxPage> {
  Color _color = Colors.red;

  void _setColor(Color color) {
    setState(() {
      _color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color Box")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: _color,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => _setColor(Colors.red),
                    child: const Text("Red")),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () => _setColor(Colors.green),
                    child: const Text("Green")),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () => _setColor(Colors.blue),
                    child: const Text("Blue")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Problem2 extends StatelessWidget {
  const Problem2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: CounterPage(),
        // child: ToggleVisibility(),
        // child: ItemListPage(),
        child: ColorBoxPage(),
      ),
    );
  }
}

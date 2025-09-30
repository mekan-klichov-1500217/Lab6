import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// CounterModel for Task 3
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// UserModel for Task 2
class UserModel extends ChangeNotifier {
  String _username = "Guest";
  String get username => _username;

  void setAdmin() {
    _username = "Admin";
    notifyListeners();
  }

  void setUsername(String name) {
    _username = name;
    notifyListeners();
  }
}

// ThemeModel for Task 4
class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  bool get isDarkMode => _isDark;

  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

// TodoListModel for Task 5
class TodoListModel extends ChangeNotifier {
  final List<String> _tasks = [];
  List<String> get tasks => List.unmodifiable(_tasks);

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}

// Task 2
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 2 — UserModel (Provider)')),
      body: Center(
        child: Consumer<UserModel>(
          builder: (context, user, child) => Text(
            'Username: ${user.username}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<UserModel>(context, listen: false).setAdmin(),
        child: const Icon(Icons.edit),
      ),
    );
  }
}

// Task 3
class ExtendedCounterScreen extends StatelessWidget {
  const ExtendedCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 3 — Extended Counter')),
      body: Center(
        child: Consumer<CounterModel>(
          builder: (context, counter, child) => Text(
            'Count: ${counter.count}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'dec',
            onPressed: () => Provider.of<CounterModel>(context, listen: false).decrement(),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'inc',
            onPressed: () => Provider.of<CounterModel>(context, listen: false).increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () => Provider.of<CounterModel>(context, listen: false).reset(),
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

// Task 4
class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 4 — Theme Switcher')),
      body: Center(
        child: Consumer<ThemeModel>(
          builder: (context, theme, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                theme.isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 12),
              Switch(
                value: theme.isDarkMode,
                onChanged: (_) => theme.toggle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Task 5
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 5 — Todo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      Provider.of<TodoListModel>(context, listen: false).addTask(_controller.text);
                      _controller.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TodoListModel>(
              builder: (context, todo, child) => ListView.builder(
                itemCount: todo.tasks.length,
                itemBuilder: (context, index) {
                  final task = todo.tasks[index];
                  return ListTile(
                    title: Text(task),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => Provider.of<TodoListModel>(context, listen: false).removeTask(index),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Problem4 extends StatelessWidget {
  const Problem4({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => TodoListModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: 
              // const CounterScreen(),
              // const UserScreen(),
              // const ExtendedCounterScreen(),
              // const ThemeScreen(),
              const TodoScreen(),
        ),
      ),
    );
  }
}

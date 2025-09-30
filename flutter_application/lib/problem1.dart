import 'package:flutter/material.dart';

// Task 2
class ProductCard extends StatelessWidget {
  final String productName;
  final double price;

  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_bag),
        title: Text(productName),
        subtitle: Text("\$${price.toStringAsFixed(2)}"),
      ),
    );
  }
}

// Task 3
class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false; // stays false (non-interactive)

  @override
  Widget build(BuildContext context) {
    return Icon(
      _isLiked ? Icons.favorite : Icons.favorite_border,
      color: Colors.red,
      size: 32,
    );
  }
}

// Task 4
class InteractiveLikeButton extends StatefulWidget {
  const InteractiveLikeButton({super.key});

  @override
  State<InteractiveLikeButton> createState() => _InteractiveLikeButtonState();
}

class _InteractiveLikeButtonState extends State<InteractiveLikeButton> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
        size: 32,
      ),
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;
        });
      },
    );
  }
}

// Task 5
class UsernameForm extends StatefulWidget {
  const UsernameForm({super.key});

  @override
  State<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends State<UsernameForm> {
  String _userName = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter username"),
            onChanged: (value) {
              setState(() {
                _userName = value;
              });
            },
          ),
          const SizedBox(height: 16),
          Text("Current username: $_userName"),
        ],
      ),
    );
  }
}


class Problem1 extends StatelessWidget {
  const Problem1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Problem 1")),
      body: Center(
        // child: ProductCard(productName: "Laptop", price: 999.99),
        // child: LikeButton(),
        // child: InteractiveLikeButton(),
        child: UsernameForm(),
      ),
    );
  }
}
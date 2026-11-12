import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomButtonsScreen(),
    ),
  );
}

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  const ButtonType(this.color);
}

enum IconPosition {
  left,
  right,
}

class CustomButtonsScreen extends StatelessWidget {
  const CustomButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom buttons'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              iconPosition: IconPosition.left,
            ),
            SizedBox(height: 15),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              iconPosition: IconPosition.right,
              type: ButtonType.secondary,
            ),
            SizedBox(height: 15),
            CustomButton(
              label: 'Account',
              icon: Icons.account_tree,
              iconPosition: IconPosition.right,
              type: ButtonType.disabled,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final Widget iconWidget = Icon(icon, color: Colors.black54, size: 20);
    final Widget textWidget = Text(
      label,
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: iconPosition == IconPosition.left
              ? [iconWidget, const SizedBox(width: 10), textWidget]
              : [textWidget, const SizedBox(width: 10), iconWidget],
        ),
      ),
    );
  }
}


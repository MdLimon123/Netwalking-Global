import 'package:flutter/material.dart';
import 'package:netwalking_global/views/base/bottom_menu..dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(2),
    );
  }
}

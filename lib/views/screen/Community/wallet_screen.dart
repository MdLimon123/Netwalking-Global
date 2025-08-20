import 'package:flutter/material.dart';
import 'package:netwalking_global/views/base/bottom_menu..dart';


class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomMenu(1),
    );
  }
}

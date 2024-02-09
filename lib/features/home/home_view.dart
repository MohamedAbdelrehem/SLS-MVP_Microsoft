import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/utils/assets.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/chat_view_body.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/home_view_body.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/settings_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 1;
  final List<Widget> _pages = const [
    SettingsViewBody(),
    HomeViewBody(),
    ChatViewBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: kBGColor,
            title: Image(
              height: 150,
              image: AssetImage(AssetsData.logoMini),
            ),
          ),
        ),
      ),
      backgroundColor: kBGColor,
      bottomNavigationBar: curvedBottomNav(),
      body: SafeArea(
        child: _pages[_selectedIndex], // Display current page based on index
      ),
    );
  }

  CurvedNavigationBar curvedBottomNav() {
    return CurvedNavigationBar(
      index: _selectedIndex, // Set initial selected index
      backgroundColor: kBGColor,
      color: kPrimaryColor,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) => setState(() => _selectedIndex = index),
      items: const [
        Icon(Icons.settings, color: Colors.white),
        Icon(Icons.home, color: Colors.white),
        Icon(Icons.chat, color: Colors.white),
      ],
    );
  }
}

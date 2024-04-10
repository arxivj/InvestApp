import 'package:flutter/material.dart';
import 'package:untitled/page/home.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => setState(() {
          selectedIndex = index;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          NavigationDestination(
            icon: Icon(Icons.spatial_tracking),
            label: "Untitled",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
            Center(child: Home()),
            Center(child: Text("Search")),
            Center(child: Text("Favorite")),
            Center(child: Text("Untitled")),
            Center(child: Text("Settings")),
          ],
        ),
      ),
    );
  }
}

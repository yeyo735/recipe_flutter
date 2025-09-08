import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final navigationDestinations = [
  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
  NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites'),
  NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
  NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
  NavigationDestination(icon: Icon(Icons.logout), label: 'Logout'),
];

// Cupertino navigation destinations
final cupertinoDestinations = [
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: 'Favorites'),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profile'),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.arrow_right_circle), label: 'Logout'),
];
import 'package:flutter/material.dart';
import 'package:map_app/screens/home_screen.dart';
import 'package:map_app/screens/tester.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ldagwcnjcklkptfefdoj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxkYWd3Y25qY2tsa3B0ZmVmZG9qIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzgxNTU5MzUsImV4cCI6MTk5MzczMTkzNX0.PbAehLineTNrl-5nenGvQkOo3Foa4H2f6OUcErj8Two',
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _selectedColor = appTheme.scaffoldBackgroundColor;

  void _setBackgroundColor(int index) {
    switch (index) {
      case 0:
        setState(() {
          _selectedColor = appTheme.scaffoldBackgroundColor;
        });

      case 1:
        setState(() {
          _selectedColor = Color(0xFFFDFDFD);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Platform',
      theme: appTheme,
      // darkTheme: darkAppTheme,  -> implement in 'material_constants.dart'...
      home: Material(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200), // Adjust duration as needed
          color: _selectedColor, // Background color
          child: HomeScreen(
            onTabChanged: _setBackgroundColor,
          ),
        ),
      ),
    );
  }
}

final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFF6A75D8), // Primary color
  scaffoldBackgroundColor: Color(0xFF232323), // Background color

  // appBarTheme: AppBarTheme(
  //   color: Color(0xFF232323),  // Background color for app bar
  // ),
  highlightColor: Color(0xFFD6DAFF), // Highlight color
  unselectedWidgetColor: Color(0xFFD9D9D9), // Another color
  indicatorColor: Color(0xFF232323),
  // ... other properties
);

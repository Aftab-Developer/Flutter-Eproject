import 'package:app/screens/SplachScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,  
      ],
      builder: (context) => const HomeScreen(),
    ),
  );
}
class HomeScreen extends StatelessWidget  {
  const HomeScreen({super.key});

  @override  
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false, 
      theme:  ThemeData(
        fontFamily: 'Poppins', 
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.blue , 
          selectionHandleColor: Colors.blue

        )
      ),
      title: "Splach Screen", 
      color: Colors.white,
      home:SplachScreen(),
    ) ;
  }
}  

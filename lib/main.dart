// import 'package:amazon_clone_app/constants/global_variables.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Amazon clone',
//       theme: ThemeData(
//         scaffoldBackgroundColor: GlobalVariables.backgroundColor,
//         colorScheme: ColorScheme.light(
//           primary: GlobalVariables.secondaryColor,
//           ),
//         appBarTheme: AppBarTheme(
//           elevation: 0,
//           iconTheme: IconThemeData(color: Colors.black),
//         ),
//       ),

//       home: Scaffold(
//         appBar: AppBar(title: Center(child: Text("Hello"))),
//         body: Column(
//           children: [
//             Center(child: const Text('Flutter Demo Home Page')),
//             ElevatedButton(onPressed: () {}, child: Text("Button")),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_app/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: ColorScheme.light(
          primary:
              GlobalVariables
                  .secondaryColor, // This will be used for AppBar and ElevatedButton
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor:
              GlobalVariables.secondaryColor, // Explicitly set AppBar color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalVariables.secondaryColor,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Hello"))),
        body: Column(
          children: [
            Center(child: const Text('Flutter Demo Home Page')),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AuthScreen.routName);
                  },
                  child: Text("Button"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

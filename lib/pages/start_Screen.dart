import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
   final void Function() copySwitchScreen;
  const StartScreen({super.key,
   required this.copySwitchScreen
  
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Image.asset('lib/assets/Qlogo.png',
        
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: OutlinedButton.icon(
            
            onPressed: () {
              setState(() {
                widget.copySwitchScreen();
              });
            },
            icon: Icon(Icons.arrow_forward,
            
            ),
            label: Text('Start-Quez',
            
            ),
          ),
        )
      
      ]),
    );
  }
}

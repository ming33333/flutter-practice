import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint(' Icon ');
            },
            icon: const Icon(Icons.info_outline),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/elephant.jpeg'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            // Container(
            //   margin: const EdgeInsets.all(10.0),
            //   padding: const EdgeInsets.all(10.0),
            //   color: Colors.blueGrey,
            //   width: double.infinity,
            //   child: const Center(
            //     child: Text(
            //       'Awesome Elephant',
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSwitch ? Colors.blueGrey : Colors.amber),
              onPressed: () {
                debugPrint('Elevated button');
              },
              child: const Text('Elevated button'),
            ),
            // OutlinedButton(
            //   onPressed: () {
            //     debugPrint('Outlined button');
            //   },
            //   child: const Text('Outlined button'),
            // ),
            TextButton(
              onPressed: () {
                debugPrint('Text button');
              },
              child: const Text('Text button'),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque, //allow whole row to be detected
              onTap: () {
                debugPrint('Row Widget');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blueGrey,
                  ),
                  Text(' Row Widget '),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blueGrey,
                  )
                ],
              ),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitch = newBool;
                  });
                }),
            Checkbox(
                value: isCheckBox,
                onChanged: (bool? newBool) {
                  isCheckBox = newBool;
                }),
            Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzTYho5uexXFm_XMaZiBNRQJ1i9EzWnUCCjQ&usqp=CAU")
          ],
        ),
      ),
    );
  }
}

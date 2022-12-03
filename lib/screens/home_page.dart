import 'package:flutter/material.dart';
import 'package:healthy_buddy_companion_app/screens/video_call_screen.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                const Text(
                  'Healthy Buddy Companion App',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                LottieBuilder.asset('assets/video-call.json'),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Masukan Nama Kamu",
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                TextFormField(
                  controller: _idController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Masukan ID Panggilan",
                  ),
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return VideoCallScreen(
                            conferenceID: _idController.text,
                            name: _nameController.text);
                      },
                    ));
                    _idController.clear();
                    _nameController.clear();
                  },
                  child: const Text('Mulai Panggilan'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

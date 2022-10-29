import 'package:ceosi_app/constants/app_names.dart';
import 'package:ceosi_app/constants/colors.dart';
import 'package:ceosi_app/constants/images.dart';
import 'package:ceosi_app/widgets/button_widget.dart';
import 'package:ceosi_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyAccent,
        leading: Builder(
            builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              coesiIcon,
              width: 60,
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonWidget(
              borderRadius: 20,
              onPressed: () {},
              buttonHeight: 100,
              buttonWidth: 300,
              textWidget: const BoldTextWidget(
                  color: Colors.white, fontSize: 15, text: juneApp),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              borderRadius: 20,
              onPressed: () {},
              buttonHeight: 100,
              buttonWidth: 300,
              textWidget: const BoldTextWidget(
                  color: Colors.white, fontSize: 15, text: carlApp),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              borderRadius: 20,
              onPressed: () {},
              buttonHeight: 100,
              buttonWidth: 300,
              textWidget: const BoldTextWidget(
                  color: Colors.white, fontSize: 15, text: chloieApp),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              borderRadius: 20,
              onPressed: () {},
              buttonHeight: 100,
              buttonWidth: 300,
              textWidget: const BoldTextWidget(
                  color: Colors.white, fontSize: 15, text: lanceApp),
            ),
          ],
        ),
      ),
    );
  }
}

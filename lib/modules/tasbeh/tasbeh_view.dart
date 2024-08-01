import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/setting_provider.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  int counter = 0;
  String text = "سبحان الله";
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          height: 350,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                left: 190,
                top: 10,
                child: Image.asset(
                  provider.isDark()
                      ? "assets/images/head_sebha_dark.png"
                      : "assets/images/head_sebha_logo.png",
                  width: 75,
                  height: 100,
                ),
              ),
              Positioned(
                top: 45,
                child: AnimatedRotation(
                  turns: rotationAngle,

                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    provider.isDark()
                        ? "assets/images/body_sebha_dark.png"
                        : "assets/images/body_sebha_logo.png",
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text("عدد التسبيحات",
              style: theme.textTheme.bodyMedium?.copyWith(
                  color: provider.isDark() ? Colors.white : Colors.black)),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          width: 70,
          height: 81,
          decoration: BoxDecoration(
              color: provider.isDark() ? const Color(0xFF141A2E) : const Color(0xFFB7935F),
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            "$counter",
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          alignment: Alignment.center,
          width: 137,
          height: 51,
          decoration: BoxDecoration(
              color: provider.isDark()
                  ? theme.primaryColorDark
                  : theme.primaryColor,
              borderRadius: BorderRadius.circular(25)),
          child: TextButton(
            onPressed: () {
              counter++;
              rotationAngle += 1 / 50;
              textChanger();
              setState(() {});
            },
            child: Text(
              text,
              style: TextStyle(
                  color: provider.isDark() ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 25),
            ),
          ),
        )
      ],
    );
  }

  void textChanger() {
    if (counter == 33 && text == "سبحان الله") {
      text = "الحمد لله";
      counter = 0;
    } else if (counter == 33 && text == "الحمد لله") {
      text = "الله اكبر";
      counter = 0;
    } else if (counter == 33 && text == "الله اكبر") {
      text = "سبحان الله";
      counter = 0;
    }
  }
}

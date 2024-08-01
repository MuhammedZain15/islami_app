import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/setting_provider.dart';

class radioview extends StatefulWidget {
  const radioview({super.key});

  @override
  State<radioview> createState() => _radioviewState();
}

class _radioviewState extends State<radioview> {
  IconData icon = Icons.play_arrow;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 130,
        ),
        Image.asset(
          "assets/images/radio_image.png",
          scale: 1,
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          alignment: Alignment.center,
          child: Text("إذاعة القرآن الكريم", style: theme.textTheme.bodyMedium?.copyWith(
              color: provider.isDark()?Colors.white:Colors.black
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon:  Icon(
                Icons.skip_previous,
                size: 50,
                color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                if (icon == Icons.play_arrow) {
                  icon = Icons.pause;
                } else {
                  icon = Icons.play_arrow;
                }
                setState(() {});
              },
              icon: Icon(
                icon,
                size: 50,
                 color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon:  Icon(
                Icons.skip_next,
                size: 50,
                 color: provider.isDark()?theme.primaryColorDark:theme.primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}

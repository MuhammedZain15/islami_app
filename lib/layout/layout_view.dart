import 'package:flutter/material.dart';
import 'package:islami_app/core/setting_provider.dart';
import 'package:islami_app/modules/hadeth/hadeth_view.dart';
import 'package:islami_app/modules/quran/quran_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modules/radio/radio_view.dart';
import 'package:islami_app/modules/setting/setting_view.dart';

import 'package:provider/provider.dart';

import '../modules/tasbeh/tasbeh_view.dart';

class layOutView extends StatefulWidget {
  const layOutView({super.key});

  static const String routeName = "layout";

  @override
  State<layOutView> createState() => _layOutViewState();
}

class _layOutViewState extends State<layOutView> {
  int selectedindex = 0;

  List<Widget> ScreenList = [
    QuranView(),
    HadethView(),
    const TasbehView(),
    const radioview(),
    const settingview(),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getHomeBackground()),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            lang.islami,
            style: TextStyle(
              color: provider.isDark() ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: ScreenList[selectedindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (value) {
            selectedindex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon:
                    const ImageIcon(AssetImage("assets/images/icon_quran.png")),
                label: lang.quran),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage("assets/images/icon_hadeth.png")),
                label: lang.hadeth),
            BottomNavigationBarItem(
                icon:
                    const ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                label: lang.tasbeh),
            BottomNavigationBarItem(
                icon:
                    const ImageIcon(AssetImage("assets/images/icon_radio.png")),
                label: lang.radio),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: lang.settings),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/modules/quran/quran_view.dart';
import 'package:provider/provider.dart';

import '../../core/setting_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranDetailsView extends StatefulWidget {
  const QuranDetailsView({super.key});

  static const String routeName = "quranDetails";

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;

    if (content.isEmpty) loadAsset(data.SuraNumber);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              provider.getHomeBackground(),
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.islami),
        ),
        body: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 10),
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 20),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? const Color(0xFF141A2E).withOpacity(0.85)
                : const Color(0xFFF8F8F8).withOpacity(0.85),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      textAlign: TextAlign.center,
                      "  سورة ${data.SuarName}  ",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: provider.isDark()
                            ? theme.primaryColorDark
                            : Colors.black,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.play_circle_fill_rounded,
                    color: provider.isDark()
                        ? theme.primaryColorDark
                        : Colors.black,
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Row(
                    children: [
                      Text(
                        "(${index + 1})",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                          height: 1.8,
                          color: provider.isDark()
                              ? theme.primaryColorDark
                              : Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          versesList[index],
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(

                            height: 1.8,
                            color: provider.isDark()
                                ? theme.primaryColorDark
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  itemCount: versesList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String content = "";
  List<String> versesList = [];

  Future<void> loadAsset(String SuraNumber) async {
    content = await rootBundle.loadString('assets/files/$SuraNumber.txt');
    versesList = content.trim().split("\n");
    setState(() {});
  }
}

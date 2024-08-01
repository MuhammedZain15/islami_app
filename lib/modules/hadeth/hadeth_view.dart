import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core/setting_provider.dart';
import 'hadeth_details_view.dart';

class HadethView extends StatefulWidget {
  HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<HadethModel> AllHadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    if (AllHadeth.isEmpty) loadHadeth();
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/hadeth_logo.png"),
        const Divider(),
        Text(
            textAlign: TextAlign.center,
            "الأحاديث",
            style: theme.textTheme.bodyMedium),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadethDetailsView.routeName,
                    arguments: HadethModel(
                        AllHadeth[index].title, AllHadeth[index].content));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AllHadeth[index].title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: provider.isDark() ? Colors.white : Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            itemCount: AllHadeth.length,
          ),
        )
      ],
    );
  }

  Future<void> loadHadeth() async {
    String hadeth = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = hadeth.split("#");
    for (int i = 0; i < ahadeth.length; i++) {
      String hadethOne = ahadeth[i];
      List<String> hadethLines = hadethOne.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      HadethModel hadethModel = HadethModel(title, content);
      AllHadeth.add(hadethModel);
    }
    setState(() {});
  }
}

class HadethModel {
  String title;

  List<String> content;

  HadethModel(this.title, this.content);
}

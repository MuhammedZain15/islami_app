import 'package:flutter/material.dart';
import 'package:islami_app/modules/hadeth/hadeth_view.dart';
import 'package:provider/provider.dart';

import '../../core/setting_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethDetailsView extends StatefulWidget {
  const HadethDetailsView({super.key});

  static const String routeName = "hadethview";

  @override
  State<HadethDetailsView> createState() => _HadethDetailsViewState();
}

class _HadethDetailsViewState extends State<HadethDetailsView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var data = ModalRoute.of(context)?.settings.arguments as HadethModel;
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.getHomeBackground()), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.islami),
        ),
        body: Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, bottom: 80, top: 20),
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 20),
          decoration: BoxDecoration(
              color: provider.isDark()
                  ? const Color(0xFF141A2E).withOpacity(0.85)
                  : const Color(0xFFF8F8F8).withOpacity(0.85),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    data.title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: provider.isDark()
                          ? theme.primaryColorDark
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    "${data.content}",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      color: provider.isDark()
                          ? theme.primaryColorDark
                          : Colors.black,
                    ),
                  ),
                  itemCount: data.content.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/setting_provider.dart';

class settingview extends StatefulWidget {
  const settingview({super.key});

  @override
  State<settingview> createState() => _settingviewState();
}

class _settingviewState extends State<settingview> {
  var languagesList = ["English", "عربي"];
  var themeList = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            lang.language,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomDropdown<String>(
            items: languagesList,
            initialItem: provider.currentLanguageCode == "en"
                ? languagesList[0]
                : languagesList[1],
            onChanged: (value) {
              if (value == "English") {
                provider.changeLanguageCode("en");
              }
              if (value == "عربي") {
                provider.changeLanguageCode("ar");
              }
            },
            decoration: CustomDropdownDecoration(
                closedFillColor:
                    provider.isDark() ? const Color(0xFF141A2E) : Colors.white,
                expandedFillColor:
                    provider.isDark() ? const Color(0xFF141A2E) : Colors.white,
                closedSuffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color:
                      provider.isDark() ? theme.primaryColorDark : Colors.black,
                ),
                expandedSuffixIcon: Icon(
                  Icons.arrow_drop_up,
                  color:
                      provider.isDark() ? theme.primaryColorDark : Colors.black,
                )),
          ),
          Text(
            lang.mode,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomDropdown<String>(
            hintText: 'Select job role',
            items: themeList,
            initialItem: provider.currentThemeMode == ThemeMode.light
                ? themeList[0]
                : themeList[1],
            onChanged: (value) {
              if (value == "Light") {
                provider.changeThemeMode(ThemeMode.light);
              }
              if (value == "Dark") {
                provider.changeThemeMode(ThemeMode.dark);
              }
            },
            decoration: CustomDropdownDecoration(
                closedFillColor:
                    provider.isDark() ? const Color(0xFF141A2E) : Colors.white,
                expandedFillColor:
                    provider.isDark() ? const Color(0xFF141A2E) : Colors.white,
                closedSuffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color:
                      provider.isDark() ? theme.primaryColorDark : Colors.black,
                ),
                expandedSuffixIcon: Icon(
                  Icons.arrow_drop_up,
                  color:
                      provider.isDark() ? theme.primaryColorDark : Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/setting_provider.dart';
import '../quran_view.dart';
class SuraTitleWidget extends StatelessWidget {
  const SuraTitleWidget({super.key, required this.data,});
  final SuraData data ;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(textAlign: TextAlign.center,
             data.SuraNumber,
              style: theme.textTheme.bodyMedium?.copyWith(
                  color: provider.isDark()?Colors.white:Colors.black
              )),
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(
            thickness: 2,
          ),
        ),
        Expanded(
          child: Text(
              textAlign: TextAlign.center, data.SuarName, style: theme.textTheme.bodyMedium?.copyWith(
              color: provider.isDark()?Colors.white:Colors.black
          )),
        ),
    
      ],
    );

  }
}

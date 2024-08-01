import 'package:flutter/material.dart';
import 'package:islami_app/modules/quran/quran_details_view.dart';
import 'package:islami_app/modules/quran/widgets/sura_title_widget.dart';
import 'package:provider/provider.dart';

import '../../core/setting_provider.dart';

class QuranView extends StatelessWidget {
  QuranView({super.key});

  final List<String> SuarNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/qur2an_screen_logo.png"),
        const Divider(),
        Row(
          children: [
            Expanded(
                child: Text(
                    textAlign: TextAlign.center,
                    "عدد السورة",
                    style: theme.textTheme.bodyMedium)),
            const SizedBox(
              height: 40,
              child: VerticalDivider(
                thickness: 2,
              ),
            ),
            Expanded(
              child: Text(
                  textAlign: TextAlign.center,
                  "إسم السورة",
                  style: theme.textTheme.bodyMedium),
            ),
          ],
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  QuranDetailsView.routeName,
                  arguments: SuraData(
                    SuarName: SuarNames[index],
                    SuraNumber: (index + 1).toString(),

                  ),

                );
              },
              child: SuraTitleWidget(
                data: SuraData(
                  SuarName: SuarNames[index],
                  SuraNumber: (index + 1).toString(),
                ),
              ),
            ),
            itemCount: SuarNames.length,
          ),
        )
      ],
    );
  }
}

class SuraData {
  final String SuarName;
  final String SuraNumber;

  SuraData({required this.SuarName, required this.SuraNumber});
}


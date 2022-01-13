import 'package:flutter/material.dart';

class Constant {
  // Constant Colors
  static const app_primary_color = Color(0xFFFFFFFF);
  static const app_primary_contrast_color = Color(0xFF002651);
  static const app_yellow_color = Color(0xFFf4ca0f);
  // static const app_primary_contrast_color = Color(0xFF669203);
  static const app_primary_contrast_color_light = Color(0xFF03b7a3);
  // static const app_primary_contrast_color_light = Color(0xFF89C208);

  // Font Sizes
  static final double h1 = 50.0;
  static final double h2 = 30.0;
  static final double h3 = 25.0;
  static final double h4 = 20.0;
  static final double h5 = 18.0;
  static final double h6 = 16.0;
  static final double h7 = 14.0;

  // Button Font Sizes
  static final double app_button_font_size = 20.0;
  static final double app_button_height = 35.0;
  static final double app_button_min_width = 35.0;
  static final double app_button_max_width = 35.0;

  // Font Weight If Bold
  static final FontWeight app_font_weight = FontWeight.w600;
  static final FontWeight app_normal_font_weight = FontWeight.w300;
  static final FontWeight app_medium_font_weight = FontWeight.w400;

  // Text Letter Spacing
  static final double app_max_letter_spacing = 5.0;
  static final double app_normal_letter_spacing = 2.0;

  // Border Radius
  static final double app_button_border_radius = 40.0;
  static final double app_bottom_bar_border_radius = 45.0;
  static final double app_text_fields_border_radius = 45.0;
  static final double app_cards_border_radius = 20.0;
  static final double app_headers_border_radius = 50.0;

  // Icon Sizes
  static final double app_bottom_bar_icon_size = 25.0;

  // Constant Values
  static const double TWO_PI = 3.14 * 2;

  // For String Date
  List<String> month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  // For Months Only
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  // Durood List
  Map<String, dynamic> duroodList = {
    'Durood-e-Ibrahimi':
        'اَللّٰھُمَّ صَلِّ عَلٰی مُحَمَّدٍ وَّعَلٰٓی اٰلِ مُحَمَّدٍ کَمَا صَلَّیْتَ عَلٰٓی اِبْرَاھِیْمَ وَعَلٰٓی اٰلِ اِبْرَاھِیْمَ اِنَّکَ حَمِیْدٌ مَّجِیْدٌ اَللّٰھُمَّ بَارِکْ عَلٰی مُحَمَّدٍ وَّعَلٰٓی اٰلِ مُحَمَّدٍ کَمَا بَارَکْتَ عَلٰٓی اِبْرَاھِیْمَ وَعَلٰٓی اٰلِ اِبْرَاھِیْمَ اِنَّکَ حَمِیْدٌ مَّجِیْدٌ',
    'Durood-e-Nahariya':
        'اللَّهُمَّ صَلِّ صَلَاةً كَامِلَةً ❁ وَسَلِّمْ سَلَامًا تَامًّا ❁ عَلَىٰ سَيِّدِنَا مُحَمَّدٍ الَّذِي تَنْحَلُّ بِهِ الْعُقَدُ ❁ وَتَنْفَرِجُ بِهِ الْكُرَبُ ❁ وَتُقْضَىٰ بِهِ الْحَوَائِجُ ❁ وَتُنَالُ بِهِ الرَّغَائِبُ وَحُسْنُ الْخَوَاتِمِ ❁ وَيُسْتَسْقَى الْغَمَامُ بِوَجْهِهِ الْكَرِيمِ ❁ وَعَلىٰ آلِهِ وَصَحْبِهِ ❁ فِي كُلِّ لَمْحَةٍ وَنَفَسٍ بِعَدَدِ كُلِّ مَعْلُومٍ لَكَ',
    'Durood-e-Muqaddas':
        'إِنَّ اللَّهَ وَمَلَائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ ۚ يَا أَيُّهَا الَّذِينَ آمَنُوا صَلُّوا عَلَيْهِ وَسَلِّمُوا تَسْلِيمًا',
    'DUROOD-E-SHAFI’I':
        'اللَّهُمَّ صَلَّى عَلَى مُحَمَّدٍ عَدَدَ مَا ذَكَرَهُ الذَّاكِرُونَ وَغَفَلَ عَنْ ذِكْرِهِ الْغَافِلونَ',
    'DUROOD-E-TUNAJJINA':
        'اللَّهُمَّ صَلِّ عَلَىٰ سَيِّدِنَا مُحَمَّدٍ صَلَاةً تُنْجِينَا بِهَا مِنْ جَمِيعِ الْأَهْوَالِ وَالْآفَاتِ ❁ وَتَقْضِى لَنَا بِهَا جَمِيعَ الْحَاجَاتِ ❁ وَتُطَهِّرُنَا بِهَا مِنْ جَمِيعِ السَّيِّئَاتِ❁ وَتَرْفَعُنَا بِهَا عِنْدَكَ أَعْلَى الدَّرَجَاتِ ❁ وَتُبَلِّغُنَا بِهَا أَقْصَى الْغَايَاتِ ❁ مِنْ جَمِيعِ الْخَيْرَاتِ ❁ فِي الْحَيَاةِ وَبَعْدَ الْمَمَاتِ',
  };
}

import 'package:flutter/material.dart';

class Constant {
  // Constant Colors
  static const app_primary_color = Color(0xFFFFFFFF);
  static const app_primary_contrast_color = Color(0xFF004953);
  // static const app_primary_contrast_color = Color(0xFF669203);
  static const app_primary_contrast_color_light = Color(0xFF008080);
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
  static final double app_button_height = 60.0;
  static final double app_button_min_width = 250.0;
  static final double app_button_max_width = 300.0;

  // Font Weight If Bold
  static final FontWeight app_font_weight = FontWeight.w600;
  static final FontWeight app_normal_font_weight = FontWeight.w300;

  // Text Letter Spacing
  static final double app_max_letter_spacing = 5.0;
  static final double app_normal_letter_spacing = 2.0;

  // Border Radius
  static final double app_button_border_radius = 40.0;
  static final double app_bottom_bar_border_radius = 45.0;
  static final double app_text_fields_border_radius = 20.0;
  static final double app_cards_border_radius = 20.0;
  static final double app_headers_border_radius = 50.0;

  // Icon Sizes
  static final double app_bottom_bar_icon_size = 25.0;

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
}

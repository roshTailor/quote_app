import 'package:flutter/material.dart';

import '../screen/picQuote.dart';

List<Map<String, dynamic>> list = [];

List<Map<String, dynamic>> uniqueList = [
  {
    'bgImg':
        'https://images.unsplash.com/photo-1517867065801-e20f409696b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGxvdmUlMjBiYWNrZ3JvdW5kc3xlbnwwfHwwfHw%3D&w=1000&q=80'
  },
  {
    'bgImg':
        'https://images.unsplash.com/photo-1517867065801-e20f409696b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGxvdmUlMjBiYWNrZ3JvdW5kc3xlbnwwfHwwfHw%3D&w=1000&q=80'
  },
  {
    'bgImg':
        'https://images.unsplash.com/photo-1517867065801-e20f409696b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGxvdmUlMjBiYWNrZ3JvdW5kc3xlbnwwfHwwfHw%3D&w=1000&q=80'
  },
  {
    'bgImg':
        'https://images.unsplash.com/photo-1517867065801-e20f409696b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGxvdmUlMjBiYWNrZ3JvdW5kc3xlbnwwfHwwfHw%3D&w=1000&q=80'
  },
];

List<Map<String, dynamic>> category = [
  {
    'catName': 'Categories',
    'icon': Icons.widgets_rounded,
    'color': const Color(0xffA7727D),
    'route': "Category",
  },
  {
    'catName': 'Pic Quotes',
    'icon': Icons.image_rounded,
    'color': const Color(0xff4355B6),
    'route': 'PicQuote',
  },
  {
    'catName': 'Latest Quotes',
    'icon': Icons.local_attraction_rounded,
    'color': const Color(0xffD3756B),
    'route': "Categories",
  },
  {
    'catName': 'Articles',
    'icon': Icons.article_rounded,
    'color': const Color(0xff61876E),
    'route': "Categories",
  },
];

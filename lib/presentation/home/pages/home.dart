import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/presentation/home/widgets/header.dart';
import 'package:ecommerce_app/presentation/home/widgets/new_in.dart';
import 'package:ecommerce_app/presentation/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/categories.dart';
import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Header(),
            24.h.ph,
            const SearchField(),
            24.h.ph,
            const Categories(),
            24.h.ph,
            const TopSelling(),
            24.h.ph,
            const NewIn(),
            110.h.ph,
          ],
        ),
      ),
    );
  }
}

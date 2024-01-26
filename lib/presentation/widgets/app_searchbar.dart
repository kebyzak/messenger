import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/generated/l10n.dart';
import 'package:messenger_app/theme/app_colors.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const AppSearchBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.strokeColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 0, 8),
          child: CupertinoSearchTextField(
            backgroundColor: Colors.transparent,
            controller: controller,
            placeholder: S.of(context).search,
            placeholderStyle: const TextStyle(
              color: AppColors.grayColor,
            ),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: AppColors.grayColor,
            ),
          ),
        ),
      ),
    );
  }
}

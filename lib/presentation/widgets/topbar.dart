import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb and defaultTargetPlatform
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const TopBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    required Function() onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCupertino =
        !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS);
    if (isCupertino) {
      return CupertinoNavigationBar(
        middle: Text(title),
        leading:
            showBackButton
                ? CupertinoNavigationBarBackButton(
                  previousPageTitle: 'Back',
                  onPressed: Navigator.of(context).pop,
                )
                : null,
      );
    } else {
      return AppBar(
        title: Text(title),
        centerTitle: true,
        leading:
            showBackButton
                ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                )
                : null,
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

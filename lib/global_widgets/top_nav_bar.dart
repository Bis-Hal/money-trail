import 'package:flutter/material.dart';
import 'package:money_trail/global_widgets/notification_bell.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(
        "Money trail",
        style: StringUtilsStyle.getHeadingFive(),
      ),
      actions:  const [
        NotificationBell()
      ],
    );
  }
}

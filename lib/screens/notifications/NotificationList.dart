import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_trail/global_widgets/notification_item.dart';
import 'package:money_trail/global_widgets/tag.dart';
import 'package:money_trail/screens/main_controller.dart';
import 'package:money_trail/utils/constant/colors.dart';
import 'package:money_trail/utils/constant/dime.dart';
import 'package:money_trail/utils/constant/font_constant.dart';
import 'package:money_trail/utils/styles/text_styles.dart';

import '../../global_widgets/notification_bell.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Money trail",
            style: StringUtilsStyle.getHeadingFive(),
          ),
          actions: const [NotificationBell()],
        ),
        body: Column(
          children: [
           NotificationItem()
          ],
        ),
      ),
    );
  }
}

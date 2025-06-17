import 'package:flutter/material.dart';
import '../../../core/colors_manager.dart';




  @override
  Widget build(BuildContext context) {
        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                indicatorColor: ColorsManager.primary,
                ),
            ],
          ),
    );
  }
}

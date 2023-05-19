import 'package:crossover_test/screens/home_screen/widgets/timer.dart';
import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      color: Colors.black.withOpacity(0.90),
      child: SafeArea(
        child: Row(children: [
          Icon(
            Icons.timer,
            color: Colors.white.withOpacity(0.6),
            size: 25,
          ),
          const ElapsedTime(),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: TabBar(
                indicatorWeight: 3,
                dividerColor: Colors.transparent,
                automaticIndicatorColorAdjustment: true,
                isScrollable: false,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text('Following',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15,
                            fontWeight: tabController.index == 0
                                ? FontWeight.bold
                                : FontWeight.normal)),
                  ),
                  Tab(
                    child: Text('For You',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15,
                            fontWeight: tabController.index == 1
                                ? FontWeight.bold
                                : FontWeight.normal)),
                  )
                ],
                controller: tabController),
          ),
          const Spacer(),
          const Icon(
            Icons.search,
            color: Colors.white,
            size: 25,
          ),
        ]),
      ),
    );
  }
}

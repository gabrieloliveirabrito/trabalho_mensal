import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../controllers/index.dart';
import 'work_days/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabalho Mensal'),
        elevation: 5,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Observer(
          builder: (context) => IndexedStack(
            index: controller.selectedTab,
            children: const [
              Text('1'),
              WorkDayView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (context) => BottomNavigationBar(
          currentIndex: controller.selectedTab,
          onTap: (index) => controller.selectedTab = index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Trabalhos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              label: 'Dias trabalhados',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.summarize),
              label: 'Relatórios',
            ),
          ],
        ),
      ),
    );
  }
}

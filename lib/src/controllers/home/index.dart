import 'package:mobx/mobx.dart';

part 'index.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  int selectedTab = 0;
}

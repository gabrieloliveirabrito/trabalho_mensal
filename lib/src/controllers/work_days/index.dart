import 'package:mobx/mobx.dart';
part 'index.g.dart';

class WorkDaysController = _WorkDaysController with _$WorkDaysController;

abstract class _WorkDaysController with Store {
  @observable
  DateTime? _selectedDate;

  @computed
  DateTime get selectedDate => _selectedDate ?? DateTime.now();

  set selectedDate(DateTime value) {
    _selectedDate = value;
  }
}

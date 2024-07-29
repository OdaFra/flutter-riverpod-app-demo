import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'states_providers.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 5;

  void increaseByOne() {
    state++;
  }
}

//DarkMode -- boolean default false
// void toggleDarkMode()

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;
  void toggleDarkMode() {
    state = !state;
  }
}

//Username =>String
//Default Melissa Flores
//changeName(String Name)
//usernameProvider.notifier.changeName(RandomGenerator.getRandomName())

@Riverpod(keepAlive: true)
class UserName extends _$UserName {
  @override
  String build() => 'Nahomi';

  void changeName(String name) {
    state = name;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hola Mundo';
}

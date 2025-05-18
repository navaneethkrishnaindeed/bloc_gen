part of 'example_bloc.dart';

@generateStates
abstract class _$$ExampleState {
  final bool? isLoading = false;
  final int counter = 0;
  final String? data = "You have pushed the button this many times:";
  final String? dss = null;
  final Iterable<String> iterable = [];
  final List<String> listNm = List.generate(10, (index) => 'item $index');
  final Map<String, int> mapgenerate = Map<String, int>.fromEntries(
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
        .map((e) => MapEntry<String, int>(e, int.parse(e))),
  );
  final Map<String?, String?> list = {};
  final List<bool> selectedDays = [];
  final Map<dynamic, dynamic>? test = {};
}

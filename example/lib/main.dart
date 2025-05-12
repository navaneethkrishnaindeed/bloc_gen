import 'package:example/app/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ExampleBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocSelector<ExampleBloc, ExampleState, String?>(
              selector: (state) {
                return state.data;
              },
              builder: (context, state) {
                return Text(
                  state ?? "Null Value applied",
                );
              },
            ),
            BlocSelector<ExampleBloc, ExampleState, int>(
              selector: (state) {
                return state.counter;
              },
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            BlocSelector<ExampleBloc, ExampleState, Map<dynamic, dynamic>?>(
              selector: (state) {
                return state.test;
              },
              builder: (context, state) {
                return Text(
                  state.toString(),
                );
              },
            ),
            Center(
              child: SizedBox(
                height: 200,
                child: BlocSelector<ExampleBloc, ExampleState, List<String>>(
                  selector: (state) {
                    return state.listNm;
                  },
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        return Text(state[index]);
                      },
                    );
                  },
                ),
              ),
            ),
            BlocSelector<ExampleBloc, ExampleState, Map<String, int>>(
              selector: (state) {
                return state.mapgenerate;
              },
              builder: (context, state) {
                return Text(state.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              _counter++;
              context.setExampleBlocState(counter: _counter);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          // SizedBox(
          //   width: 15,
          // ),
          // FloatingActionButton(
          //   onPressed: () {
          //     _counter--;
          //     context.setExampleBlocState(
          //         selectedDays: [false],
          //         data: "fdsfdsfdsfdsd",
          //         conter: _counter);
          //   },
          //   tooltip: 'Decrement',
          //   child: const Icon(Icons.remove),
          // ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              context.setExampleBlocState(
                data: "jhfuyfuf",
              );
              context.setExampleBlocState(test: null, data: null);
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.clear),
          ),
          FloatingActionButton(
            onPressed: () {
              context.setExampleBlocState(
                test: {},
              );
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.text_snippet),
          ),
        ],
      ),
    );
  }
}

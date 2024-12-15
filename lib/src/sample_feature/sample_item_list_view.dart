import 'package:counter_skelton/bloc/counter_bloc.dart';
import 'package:counter_skelton/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatefulWidget {
  SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  @override
  void initState() {
    super.initState();

    context.read<CounterBloc>().add(CounterInitialCounter());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state is CounterIncrementSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Sample Items'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text(state.newValue.toString())),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context
                    .read<CounterBloc>()
                    .add(CounterIncrement(state.newValue));
              },
              child: Icon(Icons.add),
            ),
          );
        } else if (state is CounterLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Text("No data"),
            ],
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tif_assignment/src/data/model/event/event.dart';
import 'package:tif_assignment/src/presentation/widgets/widgets.dart';
import 'package:tif_assignment/src/ui/ui.dart';

class EventList extends StatelessWidget {
  const EventList({
    super.key,
    required this.data,
  });

  final List<Event> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) => EventCard(
        key: Key(
          'home_event_$index',
        ),
        event: data[index],
      ),
      separatorBuilder: (context, index) =>
          AppTheme.of(context).appSpacings.vertical12,
    );
  }
}

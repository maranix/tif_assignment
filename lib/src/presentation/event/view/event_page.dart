import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tif_assignment/src/constants.dart';
import 'package:tif_assignment/src/data/repository/event/event.dart';
import 'package:tif_assignment/src/feature/event/event.dart';
import 'package:tif_assignment/src/presentation/event/widgets/widgets.dart';
import 'package:tif_assignment/src/presentation/widgets/widgets.dart';
import 'package:tif_assignment/src/ui/theme.dart';

part 'event_view.dart';

class EventPage extends StatelessWidget {
  const EventPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final repository = context.read<EventRepository>();

    return BlocProvider(
      create: (context) => EventBloc(
        repository: repository,
      )..add(EventFetched(id: id)),
      child: const _EventView(),
    );
  }
}

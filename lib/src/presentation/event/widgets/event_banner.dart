import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif_assignment/src/feature/event/event.dart';

class EventBanner extends StatelessWidget {
  const EventBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) => switch (state) {
        EventLoaded() => Ink.image(
            fit: BoxFit.cover,
            image: NetworkImage(
              state.data.content.data.bannerImage,
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

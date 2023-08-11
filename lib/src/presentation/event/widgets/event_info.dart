import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tif_assignment/src/constants.dart';
import 'package:tif_assignment/src/feature/event/event.dart';
import 'package:tif_assignment/src/presentation/widgets/widgets.dart';
import 'package:tif_assignment/src/ui/ui.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) => switch (state) {
        EventLoaded() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.data.content.data.title,
                style: AppTheme.of(context).textStyles.eventTitle,
              ),
              AppTheme.of(context).appSpacings.vertical16,
              _EventInfoItem(
                key: const Key('organizer'),
                backgroundColor: Colors.transparent,
                icon: Ink.image(
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                  image: NetworkImage(state.data.content.data.organiserIcon),
                ),
                children: [
                  Text(
                    state.data.content.data.organiserName,
                    style: AppTheme.of(context).textStyles.eventInfoTitle,
                  ),
                  Text(
                    'Organizer',
                    style: AppTheme.of(context).textStyles.eventInfoSubTitle,
                  ),
                ],
              ),
              AppTheme.of(context).appSpacings.vertical22_32,
              _EventInfoItem(
                key: const Key('schedule'),
                backgroundColor: AppTheme.of(context).primaryColorAccent,
                icon: SvgPicture.asset(
                  Assets.calendar,
                  colorFilter: ColorFilter.mode(
                    AppTheme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                  height: 30,
                  width: 30,
                ),
                children: [
                  Text(
                    DateFormat('dd MMMM, yyyy')
                        .format(state.data.content.data.dateTime),
                    style: AppTheme.of(context).textStyles.eventInfoTitle,
                  ),
                  Text(
                    '${DateFormat('EEEE').format(state.data.content.data.dateTime)}, ${DateFormat('h:mma').format(state.data.content.data.dateTime)} - ${DateFormat('h:mma').format(state.data.content.data.dateTime.add(const Duration(hours: 5)))}',
                    style: AppTheme.of(context).textStyles.eventInfoSubTitle,
                  ),
                ],
              ),
              AppTheme.of(context).appSpacings.vertical19,
              _EventInfoItem(
                key: const Key('location'),
                backgroundColor: AppTheme.of(context).primaryColorAccent,
                icon: Padding(
                  padding: AppTheme.of(context).appPaddings.horizontal4,
                  child: SvgPicture.asset(
                    Assets.location,
                    colorFilter: ColorFilter.mode(
                      AppTheme.of(context).primaryColor,
                      BlendMode.srcIn,
                    ),
                    height: 30,
                    width: 30,
                  ),
                ),
                children: [
                  Text(
                    state.data.content.data.venueName,
                    style: AppTheme.of(context).textStyles.eventInfoTitle,
                  ),
                  Text(
                    '${state.data.content.data.venueCity}, ${state.data.content.data.venueCountry}',
                    style: AppTheme.of(context).textStyles.eventInfoSubTitle,
                  )
                ],
              ),
              AppTheme.of(context).appSpacings.vertical33,
              Text(
                'About Event',
                style: AppTheme.of(context).textStyles.eventDescriptionTitle,
              ),
              AppTheme.of(context).appSpacings.vertical8,
              Text(state.data.content.data.description)
            ],
          ),
        EventFailed() => Center(
            child: Text(state.message),
          ),
        _ => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
      },
    );
  }
}

class _EventInfoItem extends StatelessWidget {
  const _EventInfoItem({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.children,
  });

  final Color backgroundColor;
  final Widget icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedIcon(
          backgroundColor: backgroundColor,
          child: icon,
        ),
        AppTheme.of(context).appSpacings.horizontal6,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        )
      ],
    );
  }
}

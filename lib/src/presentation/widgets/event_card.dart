import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tif_assignment/src/constants.dart';
import 'package:tif_assignment/src/data/model/model.dart';
import 'package:tif_assignment/src/presentation/event/event.dart';
import 'package:tif_assignment/src/ui/ui.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final Event event;

  void _defaultOnTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventPage(id: event.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppTheme.of(context).backgroundColor,
        borderRadius: AppTheme.of(context).appBorderRadius,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF575C8A).withOpacity(0.36),
            offset: const Offset(0, 10),
            blurRadius: 35,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: AppTheme.of(context).appBorderRadius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _defaultOnTap(context),
          child: Padding(
            padding: AppTheme.of(context).appPaddings.cardPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: AppTheme.of(context).appBorderRadius,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            event.bannerImage,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AppTheme.of(context).appSpacings.horizontal18,
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('E, MMM d • h:mm a').format(event.dateTime),
                        style: AppTheme.of(context).textStyles.cardSchedule,
                      ),
                      AppTheme.of(context).appSpacings.vertical5,
                      Text(
                        event.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.of(context).textStyles.cardTitle,
                      ),
                      AppTheme.of(context).appSpacings.vertical11,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: AppTheme.of(context).appPaddings.top2_5,
                            child: SvgPicture.asset(
                              Assets.mapPin,
                              height: 14,
                              width: 14,
                            ),
                          ),
                          AppTheme.of(context).appSpacings.horizontal6,
                          Flexible(
                            child: Text(
                              '${event.venueName} • ${event.venueCity}, ${event.venueCountry}',
                              style:
                                  AppTheme.of(context).textStyles.cardSubtitle,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

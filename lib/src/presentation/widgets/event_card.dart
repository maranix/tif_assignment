import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tif_assignment/src/constants.dart';
import 'package:tif_assignment/src/ui/ui.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    this.onTap,
  });

  final String event;
  final VoidCallback? onTap;

  static _defaultOnTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.of(context).backgroundColor,
      borderRadius: AppTheme.of(context).appBorderRadius,
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: InkWell(
        onTap: () => onTap != null ? onTap!() : _defaultOnTap(context),
        child: Padding(
          padding: AppTheme.of(context).appPaddings.cardPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: AspectRatio(
                  aspectRatio: 0.9,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: AppTheme.of(context).appBorderRadius,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://unsplash.com/photos/Q5GnQxjX7Jk/download?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjkxNjQ4OTYxfA&force=true&w=1920',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AppTheme.of(context).appSpacings.horizontal18,
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wed, Apr 28 • 5:30 PM',
                      style: AppTheme.of(context).textStyles.cardSchedule,
                    ),
                    AppTheme.of(context).appSpacings.vertical5,
                    Text(
                      'Jo Malone London’s Mother’s Day Presents',
                      maxLines: 2,
                      style: AppTheme.of(context).textStyles.cardTitle,
                    ),
                    AppTheme.of(context).appSpacings.vertical11,
                    Row(
                      children: [
                        SvgPicture.asset(Assets.mapPin),
                        Text(
                          '\t\tRadius Gallery • Santa Cruz, CA',
                          maxLines: 2,
                          style: AppTheme.of(context).textStyles.cardSubtitle,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tif_assignment/src/data/model/event/event.dart';
import 'package:tif_assignment/src/data/model/event/search_all_events_response.dart';
import 'package:tif_assignment/src/presentation/event/event.dart';
import 'package:tif_assignment/src/ui/theme.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
    required this.data,
  });

  final SearchAllEventsResponse data;

  @override
  Widget build(BuildContext context) {
    if (data.content.data.isEmpty) {
      return const Center(
        child: Text('No matching results found'),
      );
    } else {
      return Padding(
        padding: AppTheme.of(context).appPaddings.defaultPadding,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: data.content.data.length,
                itemBuilder: (context, index) => _SearchResultCard(
                  key: Key(
                    'search_result_$index',
                  ),
                  event: data.content.data[index],
                ),
                separatorBuilder: (context, index) =>
                    AppTheme.of(context).appSpacings.vertical12,
              ),
            )
          ],
        ),
      );
    }
  }
}

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({
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
                        style:
                            AppTheme.of(context).textStyles.searchCardSchedule,
                      ),
                      AppTheme.of(context).appSpacings.vertical5,
                      Text(
                        event.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.of(context).textStyles.searchCardTitle,
                      ),
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

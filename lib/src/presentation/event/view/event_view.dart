part of 'event_page.dart';

class _EventView extends StatelessWidget {
  const _EventView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            expandedHeight: kToolbarHeight * 4,
            flexibleSpace: Stack(
              children: [
                const EventBanner(),
                SafeArea(
                  child: Padding(
                    padding: AppTheme.of(context).appPaddings.defaultPadding,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: AppTheme.of(context).appPaddings.right13,
                            child: SvgPicture.asset(
                              Assets.arrowLeft,
                            ),
                          ),
                        ),
                        Text(
                          'Event Details',
                          style: AppTheme.of(context)
                              .textStyles
                              .appBarTitle
                              .copyWith(color: Colors.white),
                        ),
                        const Spacer(),
                        DecoratedIcon(
                          backgroundColor: Colors.white54,
                          child: SvgPicture.asset(
                            Assets.bookmark,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: AppTheme.of(context).appPaddings.defaultPadding,
                    child: const EventInfo(),
                  ),
                  AppTheme.of(context).appSpacings.vertical33,
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const GradientCTAButton(text: 'Book Now'),
    );
  }
}

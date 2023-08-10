part of 'home_page.dart';

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: AppTheme.of(context)
              .appPaddings
              .defaultPadding
              .copyWith(top: 0, bottom: 0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Text(
                  'Events',
                  style: AppTheme.of(context).textStyles.appBarTitle,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.searchIcon,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.moreIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding:
            AppTheme.of(context).appPaddings.defaultPadding.copyWith(bottom: 0),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => switch (state) {
            HomeLoaded() => EventList(
                data: state.data.content.data,
              ),
            HomeFailed() => Center(
                child: Text(state.message),
              ),
            _ => const Center(
                child: CircularProgressIndicator.adaptive(),
              )
          },
        ),
      ),
    );
  }
}

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

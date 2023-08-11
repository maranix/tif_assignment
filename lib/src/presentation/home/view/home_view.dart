part of 'home_page.dart';

class _HomeView extends StatelessWidget {
  const _HomeView();

  void _onSearchIconPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }

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
                  onPressed: () => _onSearchIconPressed(context),
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
        padding: AppTheme.of(context)
            .appPaddings
            .defaultPadding
            .copyWith(top: 0, bottom: 0),
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

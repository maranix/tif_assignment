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
        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (context, index) => EventCard(
            key: Key(
              index.toString(),
            ),
            event: '',
          ),
          separatorBuilder: (context, index) =>
              AppTheme.of(context).appSpacings.vertical12,
        ),
      ),
    );
  }
}

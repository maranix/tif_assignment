part of 'search_page.dart';

class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: AppTheme.of(context)
                .appPaddings
                .defaultPadding
                .copyWith(top: 0, bottom: 0),
            child: AppSearchBar(
              onSubmit: (value) => context.read<SearchBloc>().add(
                    SearchFetched(query: value),
                  ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) => switch (state) {
          SearchInitial() => const Center(
              child: Text(
                'Search for something to see results',
              ),
            ),
          SearchLoaded() => SearchResults(
              data: state.data,
            ),
          SearchFailed() => Center(
              child: Text(state.message),
            ),
          _ => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif_assignment/src/data/repository/repository.dart';
import 'package:tif_assignment/src/feature/search/search.dart';
import 'package:tif_assignment/src/presentation/search/widgets/widgets.dart';
import 'package:tif_assignment/src/ui/theme.dart';

part 'search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.read<EventRepository>();

    return BlocProvider(
      create: (context) => SearchBloc(repository: repository),
      child: const _SearchView(),
    );
  }
}

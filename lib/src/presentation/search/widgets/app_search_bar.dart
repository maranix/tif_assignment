import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tif_assignment/src/constants.dart';
import 'package:tif_assignment/src/ui/theme.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    required this.onSubmit,
  });

  final void Function(String) onSubmit;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      cursorColor: AppTheme.of(context).primaryColor,
      cursorWidth: 1,
      onFieldSubmitted: widget.onSubmit,
      decoration: InputDecoration(
        icon: SvgPicture.asset(
          Assets.searchIcon,
          colorFilter: ColorFilter.mode(
            AppTheme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
        hintText: 'Type Event Name',
        border: InputBorder.none,
      ),
    );
  }
}

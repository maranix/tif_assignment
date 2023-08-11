import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tif_assignment/src/constants.dart';
import 'package:tif_assignment/src/feature/event/event.dart';
import 'package:tif_assignment/src/ui/ui.dart';

class GradientCTAButton extends StatelessWidget {
  const GradientCTAButton({
    super.key,
    this.text = 'Book Now',
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  void _defaultOnPressed() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) => switch (state) {
        EventLoaded() => DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppTheme.of(context).appLinearGradient,
            ),
            child: Padding(
              padding: AppTheme.of(context).appPaddings.floatingButtonPadding,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: AppTheme.of(context).appBorderRadius,
                  ),
                  backgroundColor: AppTheme.of(context).primaryColor,
                ),
                onPressed: onPressed ?? _defaultOnPressed,
                child: Padding(
                  padding:
                      AppTheme.of(context).appPaddings.primaryButtonPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      Text(
                        text,
                        style:
                            AppTheme.of(context).textStyles.primaryButtonStyle,
                      ),
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color(0xFF3D56F0),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: AppTheme.of(context).appPaddings.all10_55,
                          child: SvgPicture.asset(
                            Assets.arrowRight,
                            height: 13,
                            width: 13,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

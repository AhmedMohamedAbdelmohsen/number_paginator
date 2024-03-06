import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';

class PaginatorButton extends StatelessWidget {
  /// Callback for button press.
  final VoidCallback? onPressed;

  final Color background;

  /// The child of the button.
  final Widget child;

  /// Whether the button is currently selected.
  final bool selected;

  /// Creates an instance of [PaginatorButton].
  const PaginatorButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.selected = false, required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = InheritedNumberPaginator
        .of(context)
        .config;
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color:background,
            border: Border.all(color: const Color(0xFFF1F1F1),), // Grey border
            borderRadius: BorderRadius.circular(
                8), // Adjust the radius as needed
          ),
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: _backgroundColor(context, selected),
              foregroundColor: _foregroundColor(context, selected),
              textStyle: config.buttonTextStyle,
              padding: config.buttonPadding,
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Color? _backgroundColor(BuildContext context, bool selected) =>
      selected
          ? (InheritedNumberPaginator
          .of(context)
          .config
          .buttonSelectedBackgroundColor ??
          Theme
              .of(context)
              .colorScheme
              .secondary)
          : InheritedNumberPaginator
          .of(context)
          .config
          .buttonUnselectedBackgroundColor;

  Color? _foregroundColor(BuildContext context, bool selected) =>
      selected
          ? (InheritedNumberPaginator
          .of(context)
          .config
          .buttonSelectedForegroundColor ??
          Colors.white)
          : InheritedNumberPaginator
          .of(context)
          .config
          .buttonUnselectedForegroundColor;
}

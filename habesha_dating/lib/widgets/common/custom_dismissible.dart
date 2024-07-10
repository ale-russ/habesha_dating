import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../themes/app_colors.dart';

class CustomDismissibleCard extends ConsumerStatefulWidget {
  const CustomDismissibleCard({
    super.key,
    required this.child,
    required this.onDelete,
    required this.onNotification,
  });

  final Widget child;
  final VoidCallback onDelete;
  final VoidCallback onNotification;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomDismissibleCardState();
}

class _CustomDismissibleCardState extends ConsumerState<CustomDismissibleCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _moveAnimation;
  double _dragExtent = 0;
  Timer? _resetTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _moveAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-0.3, 0))
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragExtent += details.delta.dx;
      _dragExtent = _dragExtent.clamp(-100.0, 20.0);
      _controller.value = _dragExtent.abs() / 100;
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dragExtent <= -50) {
      // reveal action buttons
      _controller.forward();
      _startRestTimer();
    } else {
      _resetPosition();
    }
  }

  void _startRestTimer() {
    _resetTimer?.cancel();
    _resetTimer = Timer(const Duration(seconds: 2), _resetPosition);
  }

  void _resetPosition() {
    _resetTimer?.cancel();
    _controller.reverse();
    setState(() {
      _dragExtent = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      onHorizontalDragStart: (_) {
        setState(() {
          _dragExtent = 0;
        });
        _controller.value = 0;
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.darkErrorColor),
                    child: const Icon(
                      CupertinoIcons.bell,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: widget.onNotification,
                ),
                IconButton(
                  icon: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.darkErrorColor),
                    child: const Icon(CupertinoIcons.delete,
                        color: AppColors.secondaryLight),
                  ),
                  onPressed: widget.onDelete,
                )
              ],
            ),
          ),
          SlideTransition(
            position: _moveAnimation,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

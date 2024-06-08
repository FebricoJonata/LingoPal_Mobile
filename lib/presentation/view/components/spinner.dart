import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  final bool isLoading;

  const Spinner({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();

    return Stack(
      children: [
        Container(
          color: Colors.black54,
          child: const Center(
            child: CircularProgressIndicator(
              color:
                  Colors.green, // Replace with MyColors.primaryGreen if defined
            ),
          ),
        ),
      ],
    );
  }
}

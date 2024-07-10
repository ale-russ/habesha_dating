import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Motto extends StatelessWidget {
  const Motto({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Connect ',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontSize: kIsWeb ? 52 : 36,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Text(
            'friends',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontSize: kIsWeb ? 52 : 36,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Text(
            'easily &',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontSize: kIsWeb ? 52 : 36,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Text(
            'quickly',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontSize: kIsWeb ? 52 : 36,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              Text(
                'Our platform is the perfect way to stay ',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white70,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                ' connected with friends and family.',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white70,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

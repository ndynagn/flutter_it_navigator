import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PrimaryCard extends StatelessWidget {
  const PrimaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Ink(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://rostec.ru/upload/iblock/17d/a4934o90jxz8bdlf35l8x2pdsewvp7m0.JPG',
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white),
              ),
              const Gap(24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'data',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(12),
                  Text(
                    'data',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Colors.black.withOpacity(.4),
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

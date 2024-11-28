import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PrimaryCard extends StatelessWidget {
  const PrimaryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.isVacancy = false,
    required this.onTap,
    this.onAddTap,
    this.isAdded = false,
  });

  final String title;
  final String subtitle;
  final String image;
  final bool isVacancy;
  final GestureTapCallback? onTap;
  final VoidCallback? onAddTap;
  final bool isAdded;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: isVacancy ? 170 : 120,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
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
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                ),
              ),
              const Gap(24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isVacancy) ...[
                          IconButton(
                            onPressed: onAddTap,
                            icon: Icon(
                              isAdded
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_outlined,
                              color: isAdded ? Colors.red : null,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const Gap(12),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.black.withOpacity(.4),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (isVacancy) ...[
                      const Gap(12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          backgroundColor: const WidgetStatePropertyAll(
                            Color(0xFF8C8C8C),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          child: Text('Сотрудничество'),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

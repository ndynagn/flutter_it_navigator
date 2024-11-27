import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.place,
    required this.members,
  });

  final String image;
  final String title;
  final String date;
  final String place;
  final int members;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Ink(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 250,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.transparent,
                    label: Row(
                      children: [
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.lightGreen.shade400,
                        ),
                        const Gap(4),
                        const Text(
                          'Online',
                          style: TextStyle(color: Colors.lightGreen),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                children: [
                  Text(
                    place,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16,),
                  ),
                  const Spacer(),
                  const Icon(Icons.group),
                  const Gap(4),
                  Text(
                    members.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16,),
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
    required this.title,
    required this.date,
    required this.place,
    required this.members,
  });

  final String title;
  final String date;
  final String place;
  final int members;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 250,
            ),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Chip(
                  label: Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.lightGreen.shade400,
                      ),
                      Gap(4),
                      Text(
                        'Online',
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
            Gap(12),
            Row(
              children: [
                Text(
                  place,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Spacer(),
                Icon(Icons.group),
                Gap(4),
                Text(
                  members.toString(),
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

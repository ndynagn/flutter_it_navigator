import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/primary_card.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          const Gap(12),
          const Center(
            child: Text(
              'Имя Фамилия',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              '@itboy2005',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(.5),
              ),
            ),
          ),
          const Gap(12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              textAlign: TextAlign.center,
              'Flutter - Developer, GMT +6, Dio, Retrofit, BloC, RiverPod, Dagger, Hilt',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Gap(12),
          const ListTile(
            leading: CircleAvatar(
              radius: 6,
              backgroundColor: Colors.black,
            ),
            title: Text(
              'ОАЭ/Дубай',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
              radius: 6,
              backgroundColor: Colors.black,
            ),
            title: Text(
              '19 лет',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Новости пользователя',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: PrimaryCard(
                  title: 'Новость ${index + 1}',
                  subtitle: 'Интересная новость',
                  image: 'https://via.placeholder.com/150', // Замените на действительный URL изображения
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Gap(12);
            },
            itemCount: 5,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/screens/companies_list/companies_list_screen.dart';
import 'package:flutter_it_navigator/src/screens/education_list/education_list_screen.dart';
import 'package:flutter_it_navigator/src/screens/events_list/events_list_screen.dart';
import 'package:flutter_it_navigator/src/screens/news_list/news_list_screen.dart';

class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key});

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const screens = [
      NewsListScreen(),
      CompaniesListScreen(),
      EducationListScreen(),
      EventsListScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
            ),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cases_outlined,
            ),
            label: 'Компании',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
            ),
            label: 'Образование',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_outlined,
            ),
            label: 'Мероприятия',
          ),
        ],
      ),
    );
  }
}

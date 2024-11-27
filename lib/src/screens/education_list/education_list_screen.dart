import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/models/education_company_response.dart';
import 'package:flutter_it_navigator/src/common/primary_card.dart';
import 'package:flutter_it_navigator/src/screens/profile/profile_screen.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

class EducationListScreen extends StatefulWidget {
  const EducationListScreen({super.key});

  @override
  State<EducationListScreen> createState() =>
      _EducationListScreenState();
}

class _EducationListScreenState extends State<EducationListScreen> {
  late final Dio _dio;
  bool _isLoading = true;
  DioException? _error;
  List<EducationCompanyResponse> _companies = [];

  @override
  void initState() {
    _dio = GetIt.I.get<Dio>();
    super.initState();
    _fetchCompanies();
  }

  Future<void> _fetchCompanies() async {
    try {
      _isLoading = true;

      final response = await _dio.get<List<dynamic>>('/education-companies/');

      setState(() {
        _companies = List.generate(
          response.data!.length,
          (index) => EducationCompanyResponse.fromJson(
            response.data![index],
          ),
        );
      });
    } on DioException catch (e) {
      setState(() {
        _error = e;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text('Образование'),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FiltersScreen(),
                  fullscreenDialog: true,
                ),
              ),
              icon: const Icon(
                Icons.sort_outlined,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                  fullscreenDialog: true,
                ),
              ),
              icon: const Icon(
                Icons.person_outlined,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        if (_isLoading)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              top: false,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
          )
        else if (_error != null)
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_error!.response!.statusCode} '
                    '${_error!.response!.statusMessage!}',
                  ),
                ],
              ),
            ),
          )
        else
          SliverList.separated(
            itemCount: _companies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: PrimaryCard(
                  title: _companies[index].name,
                  subtitle: _companies[index].description,
                  image: _companies[index].image,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Gap(12);
            },
          ),
        const SliverGap(12),
      ],
    );
  }
}

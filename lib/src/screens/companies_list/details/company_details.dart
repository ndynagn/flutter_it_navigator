import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/models/vacancy_response.dart';
import 'package:flutter_it_navigator/src/common/primary_card.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  late final Dio _dio;
  bool _isLoading = true;
  DioException? _error;
  List<VacancyResponse> _vacancies = [];

  @override
  void initState() {
    _dio = GetIt.I.get<Dio>();
    super.initState();
    _fetchVacancies();
  }

  Future<void> _fetchVacancies() async {
    try {
      _isLoading = true;

      final response = await _dio.get<List<dynamic>>('/vacancies/');

      final unsortedVacancies =
          response.data!.map((e) => VacancyResponse.fromJson(e)).toList();

      final sortedVacancies = unsortedVacancies
        ..removeWhere((e) => e.idCompany != widget.id);

      setState(() {
        _vacancies = sortedVacancies;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вакансии'),
      ),
      body: CustomScrollView(
        slivers: [
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
              itemCount: _vacancies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: PrimaryCard(
                    title: _vacancies[index].name,
                    subtitle: _vacancies[index].experience,
                    image: _vacancies[index].image,
                    onTap: () {},
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Gap(12);
              },
            ),
          const SliverGap(12),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/primary_elevated_button.dart';

void showCreateNews(BuildContext context) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);

  void checkButtonState() {
    isButtonEnabled.value = titleController.text.isNotEmpty && contentController.text.isNotEmpty;
  }

  titleController.addListener(checkButtonState);
  contentController.addListener(checkButtonState);

  showModalBottomSheet(

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    context: context,
    builder: (BuildContext context) {

      return Container(
        height: double.maxFinite,
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Добавление',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    Text(
                      'Заголовок',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: 'Британские ученые выяснили...'
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Содержание',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    TextField(
                      controller: contentController,
                      maxLines: 6,
                      decoration: InputDecoration(
                          hintText: 'Описание'
                      ),
                    ),
                    SizedBox(height: 12,),
                    ValueListenableBuilder<bool>(
                      valueListenable: isButtonEnabled,
                      builder: (context, isEnabled, child) {
                        return PrimaryElevatedButton(
                          onPressed: isEnabled ? () {
                            // Действие при нажатии на кнопку
                          } : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              Text(
                                'Добавить',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

import 'package:bloc_expenses_tracker/screens/add_expense/blocs/language_bloc/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageToggle extends StatelessWidget {
  final Locale locale;

  const LanguageToggle({super.key, required this.locale});

  Future<void> _changeLocale(String localeCode, BuildContext context) async {
    if (localeCode == locale.languageCode) return;

    final languageBloc = context.read<LanguageBloc>();
    languageBloc.add(
      ChangeLanguage(
          locale: localeCode == 'vi' ? const Locale('vi') : const Locale('en')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28, // chiều cao tổng thể của toggle
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(16),
        borderColor: Colors.grey,
        selectedBorderColor: Colors.blue,
        fillColor: Colors.grey.shade200,
        selectedColor: Colors.blue,
        constraints: const BoxConstraints(
          minHeight: 28,
          minWidth: 36, // kích thước từng nút
        ),
        isSelected: [
          locale.languageCode == 'en',
          locale.languageCode == 'vi',
        ],
        onPressed: (int index) {
          final localeCode = index == 0 ? "en" : "vi";
          _changeLocale(localeCode, context);
        },
        children: const [
          Text(
            "EN",
            style: TextStyle(fontSize: 10),
          ),
          Text(
            "VI",
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

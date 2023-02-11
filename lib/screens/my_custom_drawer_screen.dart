import 'package:flutter/material.dart';

import '../config/bloc_export.dart';
import '../generated/l10n.dart';

class MyCustomDrawer extends StatelessWidget {
  const MyCustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: 300.0,
      child: Center(
        child: BlocBuilder<ServicesBloc, ServicesState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 100.0),
                Row(
                  children: [
                    Text(S.of(context).dark_mode),
                    Switch(
                        value: state.isDark,
                        onChanged: (value) {
                          // context
                          //     .read<ServicesBloc>()
                          //     .add(ChangeModeThemeEvent());
                        }),
                    Text(S.of(context).light_mode),
                  ],
                ),
                Row(
                  children: [
                    Text(S.of(context).arabic),
                    Switch(
                        value: state.languageIsEnglish,
                        onChanged: (value) {
                          context
                              .read<ServicesBloc>()
                              .add(const ChangeLanguageEvent());
                        }),
                    Text(S.of(context).english),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

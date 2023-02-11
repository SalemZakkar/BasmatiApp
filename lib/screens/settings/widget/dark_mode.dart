import 'package:basic_project/config/bloc_export.dart';
import 'package:flutter/material.dart';

class DarkModeButton extends StatefulWidget {
  const DarkModeButton({Key? key}) : super(key: key);

  @override
  State<DarkModeButton> createState() => _DarkModeButtonState();
}

class _DarkModeButtonState extends State<DarkModeButton> {
  late bool dark;
  @override
  void initState() {
    dark = context.read<ServicesBloc>().state.isDark;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServicesBloc, ServicesState>(
        listener: (context, state) {
          if (state is GetServicesPrefEvent) {
            dark = state.isDark;
          }
          if (state is ChangeThemeModeState) {
            dark = state.isDark;
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 110,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(18)),
          alignment: Alignment.center,
          child: ListTile(
            leading: const Icon(Icons.color_lens),
            title: Text(
              "الوضع الليلي",
              style: Theme.of(context).textTheme.headline1,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                    value: true,
                    groupValue: dark,
                    onChanged: (value) {
                      setState(() {
                        dark = true;
                      });
                      context
                          .read<ServicesBloc>()
                          .add(const ChangeModeThemeEvent());
                    }),
                Text(
                  "تشغيل",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  width: 30,
                ),
                Radio(
                    value: false,
                    groupValue: dark,
                    onChanged: (value) {
                      setState(() {
                        dark = false;
                      });
                      context
                          .read<ServicesBloc>()
                          .add(const ChangeModeThemeEvent());
                    }),
                Text(
                  "إيقاف",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:traviling_app/widget/custom_drawer.dart';

class FilterView extends StatefulWidget {
  static const screenRoute = '/filters';

  final Function saveFilter;
  final Map<String, bool> currentFiltres;

  const FilterView(this.currentFiltres, this.saveFilter);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool _summer = false;
  bool _winter = false;
  bool _family = false;
  @override
  void initState() {
    _summer = widget.currentFiltres['summer'] ?? false;
    _winter = widget.currentFiltres['winter'] ?? false;
    _family = widget.currentFiltres['family'] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('الفلتره'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFiltres = {
                  'summer': _summer,
                  'winter': _winter,
                  'famliy': _family,
                };
                widget.saveFilter(selectedFiltres);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                    'الرحلات الصيفية',
                    'اظهار الرحلات في الصيف فقط',
                    _summer,
                    (value) {
                      setState(
                        () {
                          _summer = value;
                        },
                      );
                    },
                  ),
                  buildSwitchListTile(
                    'الرحلات الشتويه',
                    'اظهار الرحلات في الشتاء فقط',
                    _winter,
                    (value) {
                      setState(
                        () {
                          _winter = value;
                        },
                      );
                    },
                  ),
                  buildSwitchListTile(
                    'الرحلات العائليه',
                    'اظهار الرحلات للعائلات فقط',
                    _family,
                    (value) {
                      setState(
                        () {
                          _family = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  SwitchListTile buildSwitchListTile(
    String title,
    String subTitle,
    bool currentValue,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: onChanged,
    );
  }
}

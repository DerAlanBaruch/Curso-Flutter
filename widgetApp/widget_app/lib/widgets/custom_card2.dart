import 'package:flutter/material.dart';
import 'package:widget_app/themes/app_theme.dart';

class CustomCard2 extends StatelessWidget {
  final String imgUrl;
  final String? title;
  const CustomCard2({Key? key, required this.imgUrl, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        shadowColor: AppTheme.primary.withOpacity(0.5),
        elevation: 30,
        child: Column(
          children: [
            FadeInImage(
              image: AssetImage(imgUrl),
              placeholder: const AssetImage('assets/loading.gif'),
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
            ),
            if (title != null)
              Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding:
                      const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  child: Text(title!))
          ],
        ));
  }
}

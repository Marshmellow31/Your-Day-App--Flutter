import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      bottom: bottom,
      actions: actions ??
          [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {},
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBRNTI1WS3W_g86aQ4obvwlWwmtAKn1Y4hgve_JQjEjzboAALxs-6xiZ_IE8KLuPleJKsTz5Hc--4vO_3Vt1ER93WLSXF8gW9GsvY4fPYrbqI70ZJHRFwUxRWUiVwYLBiBUr9HneRkd_25U9gfgSBE44muZTBtYSS7cCGOiLScqmWgVAAOkjA1M5Jwbae66-9eWjRe1fA22OeVd13SjXOPMMseSiTQwAtms_B3nx_Sp4SZypxDvbMaC5K1FDtOX0HCJzrdnNPpRu-eC'),
              ),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}

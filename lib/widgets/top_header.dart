import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Profile',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(50),
        ),
        child: PopupMenuButton(
          itemBuilder: (context) {
            return [
              for (int i = 0; i < 1; i++) ...{
                PopupMenuItem(
                  onTap: onTap,
                  child: ListTile(
                    leading: Icon(Icons.arrow_back_ios),
                    title: Text('Back'),
                  ),
                ),
              },
            ];
          },
        ),
        // child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ),
    );
  }
}


import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

final clothesListTile = [
  'https://i.imgur.com/ZKGofuB.jpeg',
  'https://i.imgur.com/wXuQ7bm.jpeg',
  'https://i.imgur.com/R3iobJA.jpeg',
  'https://i.imgur.com/9LFjwpI.jpeg',
];

class CustomListTile extends StatelessWidget {
  final int index;
  const CustomListTile({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: Duration(milliseconds: 500),
      from: 30,
      child: ListTile(
        tileColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(7),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(7),
          child: FadeInImage(
              fit: BoxFit.contain,
              placeholder: AssetImage('assets/images/not-found.jpg'),
              image: NetworkImage( clothesListTile[index], )
          ),
        ),
        title: Text('Name'),
        subtitle: Text('Price'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add)),
            Text('10'),
            IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever, color: Colors.redAccent,)),
          ],
        ),
      ),
    );
  }
}
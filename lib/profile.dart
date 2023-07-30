import 'package:aithinkism/upcoming.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset("images/startans.png"),
        Row(
          children: [
            Spacer(),
            Text(
              "Hello User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Spacer(),
          ],
        ),
        Row(
          children: [
            Spacer(),
            Text(
              "Welcome to Didi Ki Kaksha",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Spacer(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => upcoming(),
                ),
              );
            },
            child: Container(
              width: 350,
              height: 60,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.share,
                    size: 32,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Share",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  color: Color(0xFF60bcfa)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => upcoming(),
                ),
              );
            },
            child: Container(
              width: 350,
              height: 60,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.devices_other_rounded,
                    size: 32,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Certificate",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                color: Color(0xFF60bcfa),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => upcoming(),
                ),
              );
            },
            child: Container(
              width: 350,
              height: 60,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.settings,
                    size: 32,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                color: Color(0xFF60bcfa),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: Container(
            width: 350,
            height: 60,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.logout,
                  size: 32,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Logout",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              color: Color(0xFF60bcfa),
            ),
          ),
        ),
      ],
    );
  }
}

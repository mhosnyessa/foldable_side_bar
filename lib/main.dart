import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FSBStatus drawerStatus;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            drawerStatus = drawerStatus == FSBStatus.FSB_CLOSE
                ? FSBStatus.FSB_OPEN
                : FSBStatus.FSB_CLOSE;
          });
        }),
        body: Center(
          child: FoldableSidebarBuilder(
            drawerBackgroundColor: Colors.blue,
            status: drawerStatus,
            drawer: CustomDrawer(),
            screenContents: MyHomePage(
              pressed: () {
                setState(() {
                  drawerStatus = drawerStatus == FSBStatus.FSB_CLOSE
                      ? FSBStatus.FSB_OPEN
                      : FSBStatus.FSB_CLOSE;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double drawerWidth = MediaQuery.of(context).size.width * 0.6;
    //final double drawerHeight = MediaQuery.of(context).size.height * 0.8;
    return Container(
      color: Colors.grey[350],
      width: drawerWidth,
      //height: drawerHeight,
      child: Column(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://wonderfulengineering.com/wp-content/uploads/2013/11/HD-apple-Wallpapers-7.jpg'),
              ////not working at all
              ///Idon't know why
              ///
              ///
              ///
              ///
              //backgroundImage: AssetImage('assets/me.png'),
              radius: (drawerWidth / 2) * 0.5,
              //backgroundColor: Colors.blue,
            ),
          ),
          Text(
            "Muhammed Hosny",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          // ListView(
          //   children: [
          //     ListTile(
          //       title: Text("listTile"),
          //       leading: Icon(Icons.login),
          //     ),
          //   ],
          // ),
          ListTile(
            title: Text("listTile"),
            leading: Icon(Icons.login),
          ),
          ListTile(
            title: Text("listTile"),
            leading: Icon(Icons.login),
          ),
          ListTile(
            title: Text("listTile"),
            leading: Icon(Icons.login),
          ),
          ListTile(
            title: Text("listTile"),
            leading: Icon(Icons.login),
          ),
        ],
      ),
      // child: Column(
      //   children: [
      //     DrawerHeader(
      //         child: CircleAvatar(
      //       radius: (drawerWidth / 2) * 0.5,
      //       backgroundColor: Colors.blue,
      //     )),
      //     ListView(children: [
      //       ListTile(
      //         title: Text("listTile num 1"),
      //       ),
      //       ListTile(
      //         title: Text("listTile num 2"),
      //       ),
      //       ListTile(
      //         title: Text("listTile num 3"),
      //       ),
      //     ])
      //   ],
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final VoidCallback pressed;
  MyHomePage({@required this.pressed});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              widget.pressed();
            },
          ),
          title: Text("home page"),
        ),
        body: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage:NetworkImage(
                  'https://wonderfulengineering.com/wp-content/uploads/2013/11/HD-apple-Wallpapers-7.jpg'),
              ),
              title: Text("Friend name", style: TextStyle(
                color: Colors.blue,
              ),),
              subtitle: Row(
                children: [
                  Text("Today at 19:25"),
                  SizedBox(width: 15,),
                  Icon(Icons.circle_notifications)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

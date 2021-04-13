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
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(
            (){
              drawerStatus = drawerStatus == FSBStatus.FSB_CLOSE? FSBStatus.FSB_OPEN: FSBStatus.FSB_CLOSE;
            }
          );

          
        }),
              body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.blue,
          drawer: CustomDrawer(),
          screenContents: MyHomePage(), // Your Screen Widget
          status: drawerStatus,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("home page"),
        ),
        body: Center(
          child: Text("this is the next page"),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
       width: 400.0,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  // why can't I make the radius greater than 70
                  // //why my image is not working
                  backgroundColor: Colors.redAccent,
                  child: Image.asset("assets/me.png"),
                ),
                Image(
                  image: AssetImage("assets/john.png"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "muhammed hosny",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text("contact me"),
                  leading: Icon(
                    Icons.handyman_outlined,
                  ),
                ),
                ListTile(
                  title: Text("contact me"),
                  leading: Icon(
                    Icons.handyman_outlined,
                  ),
                ),
                ListTile(
                  title: Text("contact me"),
                  leading: Icon(
                    Icons.handyman_outlined,
                  ),
                ),
                ListTile(
                  title: Text("contact me"),
                  leading: Icon(
                    Icons.handyman_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

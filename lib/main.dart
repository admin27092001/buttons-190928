import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fondo.jpeg'),
                      fit: BoxFit.fill),
                ),
              ),
              title: Text(
                'Practica botones Adolfo M-190928',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30, fontFamily: "Arial", color: Colors.white),
              ),
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Alumno",
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    text: "Información",
                    icon: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    text: "Materias",
                    icon: Icon(
                      Icons.school,
                      color: Colors.white,
                    ),
                  )
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            Alumno(),
            Informacion(),
            Materias(),
          ],
          controller: _tabController,
        ),
      ),
      floatingActionButton: Column(
        // padding: const EdgeInsets.symmetric(vertical: 10.0),
        // child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.supervised_user_circle),
            backgroundColor: Color.fromARGB(255, 208, 255, 0),
            onPressed: () {
              _tabController.animateTo(0,
                  curve: Curves.bounceInOut,
                  duration: Duration(milliseconds: 10));

              _scrollViewController.animateTo(
                  _scrollViewController.position.minScrollExtent,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.decelerate);

              _scrollViewController
                  .jumpTo(_scrollViewController.position.maxScrollExtent);
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.info),
            backgroundColor: Color.fromARGB(255, 219, 142, 27),
            onPressed: () {
              _tabController.animateTo(1,
                  curve: Curves.bounceInOut,
                  duration: Duration(milliseconds: 10));

              _scrollViewController.animateTo(
                  _scrollViewController.position.minScrollExtent,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.decelerate);

              _scrollViewController
                  .jumpTo(_scrollViewController.position.maxScrollExtent);
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.school_sharp),
            backgroundColor: Color.fromARGB(255, 204, 12, 162),
            onPressed: () {
              _tabController.animateTo(2,
                  curve: Curves.bounceInOut,
                  duration: Duration(milliseconds: 10));

              _scrollViewController.animateTo(
                  _scrollViewController.position.minScrollExtent,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.decelerate);

              _scrollViewController
                  .jumpTo(_scrollViewController.position.maxScrollExtent);
            },
          ),
        ],
      ),
      // ),
    );
  }
}

class Alumno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        // width: MediaQuery.of(context).size.width * 2.5,
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(2.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Color.fromARGB(255, 112, 177, 189),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/foto.png',
                            height: 125,
                            width: 500,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Adolfo Melendez Rodriguez"),
                          Text("190928"),
                          Text("dofo.27092001@gmail.com")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Color.fromARGB(255, 224, 111, 111),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        Text("Adolfo Melendez Rodriguez"),
                        Text("190928"),
                        Text("adolfo.melendezrodriguez@utxicotepec.edu.mx"),
                        Text("CURP MERA 010927HPLLDDA3"),
                        Text("Carrera Ingenieria en desarollo de software"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Materias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 500.0,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Color.fromARGB(255, 244, 247, 105),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        Text(
                          "Materia",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Desarrollo de aplicaciones Multiplataforma",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Docente",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "M.T.I. Marco Antonio Ramirez Hernandez",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Horario",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Viernes 06:30pm-08:30pm",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''",
                          style:
                              TextStyle(color: Color.fromARGB(255, 199, 1, 1)),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Materia",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Aplicaciones web progresivas",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Docente",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "M.T.I. Ivan Eduardo Garcia Quintero",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Horario",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "sabado 09:00am-11:00am",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

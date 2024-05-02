import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

const double FONT_SIZE = 18;
const double NUM_SIZE = 45;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Year Countdown',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final p1= AudioPlayer();



  @override
  void initState() {
    super.initState(); 

    startPeriodicTask(); 
  }

   int day = 0;
   int hour = 0;
   int min = 0;
   int sec = 0;


   void startPeriodicTask() {
  // Duration of the interval
  const duration = Duration(seconds: 1);
  Timer.periodic(duration, (Timer timer) {

    setState(() {
      updateTime();
      
             p1.play(AssetSource('sound/tic.wav'));
    });
    
  });
}

  void updateTime() {

    setState(() {
      
    });

    DateTime now = DateTime.now();
    DateTime newYear = DateTime(2025, 3, 20, 00, 00, 00);
    Duration difference = newYear.difference(now);
    var gap = difference.inMilliseconds;
    const secondInMill = 1000;
    const minuteInMill = secondInMill * 60;
    const hourInMill = minuteInMill * 60;
    const dayInMill = hourInMill * 24;

    day = (gap / dayInMill).floor();
    hour = ((gap % dayInMill) / hourInMill).floor();
    min = ((gap % hourInMill) / minuteInMill).floor();
    sec = ((gap % minuteInMill) / secondInMill).floor();
  }

  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.sizeOf(context).height / 2) + 50;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Image(
              image: AssetImage('assets/images/sand-time.jpg'),
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
              opacity: AlwaysStoppedAnimation(0.7),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff5713FF),
                    Color(0xff000000),
                  ],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
                backgroundBlendMode: BlendMode.multiply,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 5),
              child: const Text(
                "Next Year Countdown",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Center(
                                child: Text(
                              day.toString(),
                              style: const TextStyle(
                                fontSize: NUM_SIZE,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          const Text(
                            'DAYS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_SIZE,
                            ),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   width: 25,
                      // ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child:  Center(
                              child: Text(hour.toString(),
                                  style: const TextStyle(
                                    fontSize: NUM_SIZE,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                          const Text(
                            'HOURS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_SIZE,
                            ),
                          )
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Center(
                                child: Text(min.toString(),
                                    style: TextStyle(
                                      fontSize: NUM_SIZE,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ),
                          const Text(
                            'MINUTES',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_SIZE,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child:  Center(
                                child: Text(sec.toString(),
                                    style: TextStyle(
                                      fontSize: NUM_SIZE,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ),
                          const Text(
                            'SECONDS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_SIZE,
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
            Positioned(
              child:IconButton(onPressed: (){
                
                if(p1.volume == 0){
                  p1.setVolume(1); 
                }else{
                  p1.setVolume(0); 
                }
              }, icon: Icon(p1.volume == 0? Icons.volume_off : Icons.volume_up)))
          ],
        ),
      ),
    );
  }
}

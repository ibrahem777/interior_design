import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interior_design_app/src/models/prayer_time.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../../../../utils/my_colors.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({Key key}) : super(key: key);

  @override
  _PrayerTimeScreenState createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();

  }
  void getTimes(){
   // final myCoordinates = Coordinates(23.9088, 89.1220); // Replace with your own location lat, lng.
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(userCoordinate, params);
    times.add(PrayerTime(name: 'الفجر',time: prayerTimes.fajr));
    times.add(PrayerTime(name: 'الظهر',time: prayerTimes.dhuhr));
    times.add(PrayerTime(name: 'العصر',time: prayerTimes.asr));
    times.add(PrayerTime(name: 'المغرب',time: prayerTimes.maghrib));
    times.add(PrayerTime(name: 'العشاء',time: prayerTimes.isha));
  }
  Future<void> getUserLocation({isInit= true}) async {

    Location location = Location.instance;
    bool isGpsEnabled = await location.requestService();
    if (!isGpsEnabled ) {
      return;
    }

    PermissionStatus permissionStatus = await location.requestPermission();

    if (permissionStatus == PermissionStatus.denied||permissionStatus==PermissionStatus.deniedForever)
    {
      return;
    }

    LocationData data = await location.getLocation();
    userCoordinate=Coordinates(data.latitude, data.longitude);
    getTimes();
    setState(() {
      isFetchingCoordinates=false;
    });


  }
  List<PrayerTime> times=[];
  Coordinates userCoordinate;
  bool isFetchingCoordinates=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:fSecondaryColor ,
        title: const Text('مواعيد الصلاة'),
          elevation: 0,
      ),
body:
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w)+ EdgeInsets.only(top: 30.0.h),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child:isFetchingCoordinates?Center(child: const CircularProgressIndicator(),): Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context,index)=>Divider(
                    color:fSecondaryColor ,
                  ),
                  itemBuilder:(context,index)=>Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Text( DateFormat('HH:mm',).format(times[index].time),style: TextStyle(
                            fontSize: 18.sp,
                            color: fSecondaryColor
                        ),),
                        Text(times[index].name,style: TextStyle(
                            fontSize: 18.sp,
                            color: fSecondaryColor
                        ),),

                      ],),
                  ),

                  itemCount: times.length,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

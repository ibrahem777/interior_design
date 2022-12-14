import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:interior_design_app/src/models/service.dart';
import 'package:interior_design_app/src/utils/constants.dart';
import 'package:interior_design_app/src/utils/my_colors.dart';
import 'package:interior_design_app/src/views/components/custom_btn_component.dart';

class ServiceItemWidget extends StatelessWidget {
 final Service item;
  const ServiceItemWidget({
    Key key,
    this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network( item.imgUrl,
              width: 120.w,
              height: double.infinity,
              fit: BoxFit.fill,
            ),

          ),
          SizedBox(width: 5.w,),
          Expanded(child: Row(

            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(item.name??''
                      ,style: TextStyle(
                        fontSize: 14.sp,
                      ),),
                    Text(item.description??''
                      ,style: TextStyle(
                        fontSize: 12.sp,
                      ),),
                    Text('interior Design'
                      ,style: TextStyle(
                          fontSize: 10.sp,
                          color: fTextColor
                      ),),

                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Text('${item.price??''} EG'
                    ,style: TextStyle(
                        fontSize: 18.sp,
                        color: fSecondaryColor
                    ),),
                  RatingBarIndicator(
                    rating:
                    item.rate.toDouble(),
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    itemCount: 4,
                    itemSize: 17.0.w,
                    direction: Axis.horizontal,
                  ),
                  CustomBtnComponent(
                    title: 'BOOK',
                    onTap: (){},
                  ),
                ],
              ),


            ],
          ),)

        ],
      ),
    );
  }
}


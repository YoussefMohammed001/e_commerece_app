import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteBloc(sl())..add(GetFavEvent()),
      child: BlocBuilder<FavouriteBloc, FavState>(

        builder: (context, state) {

          return  Scaffold(
            appBar: AppBar(
              title: const Text('Saved Items',style: TextStyle(color: Colors.white),),
              backgroundColor: AppColors.primary,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
body: state.getFavRequest == RequestState.loading ? const Center(child:
CircularProgressIndicator(color: AppColors.primary,)) : ListView.builder(
  itemCount: state.productDetailsEntities.length,
  itemBuilder: (context, index) {
  return Container(
    margin: EdgeInsets.all(10.sp),
    padding: EdgeInsets.all(10.sp),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade200,
      ),
      borderRadius: BorderRadius.circular(15.sp),
    ),
    child: InkWell(
      onTap: () {
        push(context, ProductDetailsScreen(id:state.productDetailsEntities[index].favEntities.id.toInt()));
      },
      child: Row(

        children: [
          AppImage(imageUrl: state.productDetailsEntities[index].favEntities.image, width: 20.w, height: 10.h),
          SizedBox(width: 2.w,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(state.productDetailsEntities[index].favEntities.name),
              Row(
                children: [

                  Text(state.productDetailsEntities[index].favEntities.price.toString(),style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 2.w,),
                  Text(state.productDetailsEntities[index].favEntities.oldPrice.toString(),
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(width: 2.w,),
                  Container(
                    padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(

                        color: AppColors.primary.withOpacity(.5),
                        borderRadius:  BorderRadius.circular(10.sp)
                      ),
                      child: Text(" "+ state.productDetailsEntities[index].favEntities.discount.toString() + "%" + " ",style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15.sp
                      ),)),

                ],
              ),

            ],
          )),
          IconButton(onPressed: (){
           FavouriteBloc(sl()).add(EditFavEvent(state.productDetailsEntities[index].favEntities.id.toString()));

              state.productDetailsEntities.removeAt(index);

              setState(() {

              });



          }, icon: const Icon(Icons.favorite,color: AppColors.primary,))

        ],
      ),
    ),
  );
},),

          );
        },
      ),
    );
  }
}

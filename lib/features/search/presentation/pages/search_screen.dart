import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerece_app/features/search/presentation/manager/search_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatefulWidget {


  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  final bloc = SearchBloc(sl());


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(SearchEvent(title: ' ')),

      child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.primary,
          toolbarHeight: 0,
        ),
        body: Column(
          children: [
            Container(


              color: AppColors.primary,
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(

                    hintText: "Search For Product",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search, color: Colors.white,),
                    border: UnderlineInputBorder()
                ),
                onFieldSubmitted: (value)  {
                  setState(() {
                    bloc.add(SearchEvent(title: value));

                  });
                },


              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {

    if(bloc.state.requestState == RequestState.loading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }else {
      return Expanded(
        child: ListView.builder(
            itemCount: state.productDetailsEntities.length,
            itemBuilder: (context, index) =>
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 15.sp,horizontal: 20.sp),
                  child: InkWell(
                    onTap: () {
                      push(context,
                          ProductDetailsScreen(
                            id: state.productDetailsEntities[index].id
                                .toInt(),));

                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AppImage(
                                imageUrl: state.productDetailsEntities[index].image
                                    .toString(),
                                width: double.infinity.w,
                                height: 6.h,
                                topLeftRadius: 16.sp,
                                topRightRadius: 16.sp,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(state.productDetailsEntities[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  Text(state.productDetailsEntities[index].description,style: TextStyle(fontSize: 14.sp),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                ],
                              ),
                              flex: 3,

                            ),

                          ],
                        ),
                        SizedBox(height: 1.h,),
                        Divider(thickness: 5.sp,color: AppColors.primary,)

                      ],
                    ),
                  ),
                )),
      );
    }
              },
            )


          ],
        ),
      ),
    );
  }
}

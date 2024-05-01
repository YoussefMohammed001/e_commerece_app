import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerece_app/features/search/presentation/manager/search_bloc.dart';
import 'package:flutter/material.dart';
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
  String lastEnteredText = '';
  bool changeSearchIcon = false;
  List<String> myList = MyShared.getStringAsList(
    key: MySharedKeys.searchList,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          toolbarHeight: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.primary,
              child: TextFormField(
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Search For Product",
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: InkWell(
                      onTap: () {
                        if (changeSearchIcon == true) {
                          pop(context);
                        }
                      },
                      child: Icon(
                        changeSearchIcon == false
                            ? Icons.search
                            : Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    border: const UnderlineInputBorder()),
                onFieldSubmitted: (value) async {
                  bloc.add(SearchEvent(title: value));
                  changeSearchIcon = true;
                  await MyShared.addStringToList(
                      key: MySharedKeys.searchList, value: value);
                  setState(() {});
                },
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (controller.text.isEmpty && myList.isNotEmpty) {
                  return Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'YOUR RECENT SEARCHES',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    color: AppColors.grey),
                              ),
                              Divider(
                                thickness: 3.sp,
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.sp),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.history,
                                          color: AppColors.grey,
                                          size: 3.h,
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          myList[index],
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.dark),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                            onTap: () {
                                              MyShared.removeStringFromList(
                                                  key: MySharedKeys.searchList,
                                                  value: myList[index]);
                                              setState(() {
                                                myList.removeAt(index);
                                              });
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: AppColors.primary,
                                              size: 3.h,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Divider(
                                      thickness: 2.5.sp,
                                      color: AppColors.grey,
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: myList.length,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (controller.text.isEmpty && myList.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: Text(
                          "You Have no search history",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: AppColors.grey),
                        ),
                      ),
                    ),
                  );
                }
                if (bloc.state.requestState == RequestState.loading) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
                if (bloc.state.requestState == RequestState.success &&
                    state.productDetailsEntities.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: Text(
                          "You Have to search for a valid item",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: AppColors.grey),
                        ),
                      ),
                    ),
                  );
                }
                if (bloc.state.requestState == RequestState.success &&
                    state.productDetailsEntities.isNotEmpty) {
                  return Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 14.sp,
                            bottom: 7.sp,
                            left: 13.sp,
                            right: 13.sp,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "Results",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const Text("("),
                                  Text(
                                    "${state.productDetailsEntities.length}",
                                    style: const TextStyle(
                                        color: AppColors.primary),
                                  ),
                                  const Text(")"),
                                ],
                              ),
                              Divider(
                                thickness: 3.sp,
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.productDetailsEntities.length,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      push(
                                          context,
                                          ProductDetailsScreen(
                                            id: state
                                                .productDetailsEntities[index]
                                                .id
                                                .toInt(),
                                          ));
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: AppImage(
                                                imageUrl: state
                                                    .productDetailsEntities[
                                                        index]
                                                    .image
                                                    .toString(),
                                                width: double.infinity.w,
                                                height: 6.h,
                                                topLeftRadius: 16.sp,
                                                topRightRadius: 16.sp,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    state
                                                        .productDetailsEntities[
                                                            index]
                                                        .name,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.sp),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    state
                                                        .productDetailsEntities[
                                                            index]
                                                        .description,
                                                    style: TextStyle(
                                                        fontSize: 14.sp),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 3.sp,
                                          color: AppColors.grey,
                                        )
                                      ],
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

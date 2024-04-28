import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/product_item.dart';
import 'package:e_commerece_app/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
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
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate:

           SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisExtent: 58.sp,
            crossAxisSpacing: 0.3,
            mainAxisSpacing: 0.3,          ),
          itemBuilder: (context, index) {
            return ProductItem(
              productName: state.productDetailsEntities[index].name,
              productImage: state.productDetailsEntities[index].image
                  .toString(),
              productPrice: state.productDetailsEntities[index].price
                  .toString(),
              productOldPrice: state.productDetailsEntities[index]
                  .oldPrice.toString(),
              productDiscount: state.productDetailsEntities[index]
                  .discount.toString(),
              onItemTap: () {
                push(context,
                    ProductDetailsScreen(
                      id: state.productDetailsEntities[index].id
                          .toInt(),));
              },
              onFavTap: () {
                FavouriteBloc(sl()).add(
                    EditFavEvent(state.productDetailsEntities[index]
                        .id.toString()));
                state.productDetailsEntities[index].inFavorites =
                !state.productDetailsEntities[index].inFavorites;
                setState(() {});
              },
              isInFav: state.productDetailsEntities[index]
                  .inFavorites,
              id: state.productDetailsEntities[index].id.toInt(),
              index: index,
            );
          },
          itemCount: state.productDetailsEntities.length,
        ),
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

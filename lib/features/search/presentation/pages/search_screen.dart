import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/widgets/product_item.dart';
import 'package:e_commerece_app/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:e_commerece_app/features/search/presentation/manager/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context) => SearchBloc(sl()),

      child: SafeArea(
        

        child: Scaffold(
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {



                return Column(
                  children: [
                    Container(



                      color: AppColors.primary,
                      child: TextFormField(
                        controller: controller,
                         decoration: InputDecoration(
                           border: UnderlineInputBorder()
                         ),
                        onChanged: (value){




                          SearchBloc(sl()).add(SearchEvent(title: value));
                          setState(() {
                          });


                        },


                      ),
                    ),
               Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:

                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ProductItem(
                            productName: state.productDetailsEntities[index].name,
                            productImage: state.productDetailsEntities[index].image.toString(),
                            productPrice: state.productDetailsEntities[index].price.toString(),
                            productOldPrice: state.productDetailsEntities[index].oldPrice.toString(),
                            productDiscount: state.productDetailsEntities[index].discount.toString(),
                            onItemTap: () {
                              push(context,
                                  ProductDetailsScreen(id: state.productDetailsEntities[index].id
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
                            isInFav: state.productDetailsEntities[index].inFavorites,
                            id: state.productDetailsEntities[index].id.toInt(),
                            index: index,
                          );
                        },
                        itemCount: state.productDetailsEntities.length,
                      ),
                    )





                  ],
                );

            },
          ),
        ),
      ),
    );
  }
}

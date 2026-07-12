import 'package:e_commerece_app/api/mapper/cart/add_product_mapper.dart';
import 'package:e_commerece_app/api/models/response/cart/add/add_data_cart_dto.dart';
import 'package:e_commerece_app/domain/entities/response/cart/add/add_data_cart.dart';

extension AddDataCartMapper on AddDataCartDto{
  AddDataCart toAddDataCart(){
    return AddDataCart(
      id: id,
      cartOwner: cartOwner,
      createdAt: createdAt,
      // todo :  List<AddProductDto> =>  List<AddProduct>
      products: products?.map((proDto) => proDto.toAddProduct()).toList()??[],
      totalCartPrice: totalCartPrice,
      updatedAt: updatedAt,
      v: v,
    );
  }
}
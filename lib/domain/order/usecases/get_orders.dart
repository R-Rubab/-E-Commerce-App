import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/domain/order/repository/order.dart';
import 'package:ecommerce_app/service_locator.dart';

class GetOrdersUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({dynamic params}) async {
    return sl<OrderRepository>().getOrders();
  }

}
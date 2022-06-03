import 'package:ecommerce_app/modules/dashboard/modal/kicker_model.dart';

class ApiResult {
  //Let's assume following data from api result
  final List<KickerModal> allKickerModals = [
    KickerModal(
        kickerImage: 'images/klipartz 1.png',
        kickerName: 'Nike Air Pegasus',
        kickerPrice: 200.99,
        kickerStars: 4.5,
        kickerSales: 1200),
    KickerModal(
        kickerImage: 'images/klipartz 2.png',
        kickerName: 'Jordan Jump XV',
        kickerPrice: 120.99,
        kickerStars: 4,
        kickerSales: 5000),
    KickerModal(
        kickerImage: 'images/klipartz 5.png',
        kickerName: 'Nike Raptor',
        kickerPrice: 260.99,
        kickerStars: 5,
        kickerSales: 1800),
    KickerModal(
        kickerImage: 'images/klipartz 6.png',
        kickerName: 'Basketball Jordans',
        kickerPrice: 110.99,
        kickerStars: 4.5,
        kickerSales: 8000)
  ];
}

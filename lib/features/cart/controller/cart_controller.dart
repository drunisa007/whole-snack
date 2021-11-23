import 'package:get/get.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';

class CartController extends GetxController{

  ///for add to cart list

  RxList<TempAddToCartModel>  mAddToCartList = RxList();
  RxDouble totalPrice = RxDouble(0.0);
  RxInt deliveryFee = RxInt(0);
  RxInt grandTotal = RxInt(0);
  RxInt progressBarRealWidth = RxInt(0);
  RxInt progressBarSizeBoxWidth = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    mAddToCartList.addAll(zAddToCartList);
    calculatePrice();
  }


  addNewCart(TempAddToCartModel mNewModel){
    mAddToCartList.add(mNewModel);
    calculatePrice();
    mAddToCartList.refresh();
  }

  removeOldCart(int index){
    mAddToCartList.removeAt(index);
    calculatePrice();
    mAddToCartList.refresh();
  }


  addNewCount(int index){
   mAddToCartList[index].count = mAddToCartList[index].count+1;
   calculatePrice();
   mAddToCartList.refresh();

  }

  removeNewCount(int index){
    if(mAddToCartList[index].count>1){
      mAddToCartList[index].count = mAddToCartList[index].count-1;
      calculatePrice();
      mAddToCartList.refresh();
    }
  }

  calculatePrice(){
    totalPrice.value = 0;
    for(TempAddToCartModel mModel in  mAddToCartList){
      double tempPrice = double.parse(mModel.itemPackage.price.trim())*mModel.count;
      totalPrice.value = totalPrice.value+ tempPrice;
    }
    calculateDeliveryFee(totalPrice.value);


  }

  calculateDeliveryFee(double newValue){
    if(newValue>0&&newValue<=3000){
      deliveryFee.value = 1000;
      progressBarRealWidth.value =  10;
      progressBarSizeBoxWidth.value= 40;
    }
    else if(newValue>3000&&newValue<=5000){
      deliveryFee.value = 500;
      progressBarRealWidth.value =  43;
      progressBarSizeBoxWidth.value= 67;
    }
    else if(newValue==0.0){
      deliveryFee.value = 0;
      progressBarRealWidth.value =  0;
      progressBarSizeBoxWidth.value= 0;
    }
    else{
      progressBarRealWidth.value =  73;
      progressBarSizeBoxWidth.value= 100;
      deliveryFee.value = -1;
    }
    calculateGrandTotal(totalPrice.value);
  }

  calculateGrandTotal(calculateTotal){
    if(deliveryFee.value>0){
      double tempValue =  calculateTotal+deliveryFee.value.toDouble();
      grandTotal.value  = tempValue.toInt();
    }
    else if(calculateTotal==0){
    grandTotal.value = 0;
    }
    else{
      grandTotal.value = calculateTotal;
    }

  }


}
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';

class CartController extends GetxController{

  ///for add to cart list

  RxList<TempAddToCartModel>  mAddToCartList = RxList();
  RxDouble totalPrice = RxDouble(0.0);
  RxInt deliveryFee = RxInt(0);
  RxInt deliveryStatus = RxInt(0); //0 app start state
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
  }

  removeOldCart(int index){
    mAddToCartList.removeAt(index);
    calculatePrice();
  }


  addNewCount(int index){
    TempAddToCartModel mModel = mAddToCartList[index];
    mModel.count = mModel.count+1;
    mAddToCartList[index] = mModel;
    calculatePrice();
  }

  removeNewCount(int index){
    if(mAddToCartList[index].count>1){
      TempAddToCartModel mModel = mAddToCartList[index];
      mModel.count = mModel.count-1;
      mAddToCartList[index] = mModel;
      calculatePrice();
    }
  }

  calculatePrice(){
    totalPrice.value = 0;
    for(TempAddToCartModel mModel in  mAddToCartList){
      double tempPrice = double.parse(mModel.itemPackage.price.trim())*mModel.count;
      totalPrice.value = totalPrice.value+ tempPrice;
    }
    calculateDeliveryFee();


  }

  calculateDeliveryFee(){

    double newValue = totalPrice.value;

    if(newValue>0&&newValue<=3000){
      deliveryFee.value = 1000;
      deliveryStatus.value = 1; /// between 3000 status
      progressBarRealWidth.value =  10;
      progressBarSizeBoxWidth.value= 40;
    }
    else if(newValue>3000&&newValue<=5000){
      deliveryFee.value = 500;
      deliveryStatus.value = 2; /// between 5000 status
      progressBarRealWidth.value =  43;
      progressBarSizeBoxWidth.value= 67;
    }
    else if(newValue>5000){
      deliveryFee.value = 0;
      deliveryStatus.value = 3; ///above 5000
      progressBarRealWidth.value =  73;
      progressBarSizeBoxWidth.value= 100;
    }
    else{
      progressBarRealWidth.value =  0;
      progressBarSizeBoxWidth.value= 0;
      deliveryFee.value = 0;
      deliveryStatus.value = -1;/// o state
    }
    calculateGrandTotal();
  }

  calculateGrandTotal(){
    if(deliveryFee.value>0){
      double tempValue =  totalPrice.value+deliveryFee.value.toDouble();
      grandTotal.value  = tempValue.toInt();
    }
    else{
      grandTotal.value = totalPrice.value.toInt();
    }
  }


}
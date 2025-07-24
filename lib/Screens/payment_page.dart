import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:slide_to_act/slide_to_act.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> valueKey=GlobalKey<FormState>();
  String cardNumber='';
  String expiryDate='';
  String cvvCode='';
  String cardHolderName='';
  bool isCVVFocused=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,fontSize: 24),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: false,
              onCreditCardWidgetChange: (value){

              },
            bankName: "Askari Bank",
            cardType: CardType.mastercard,
            isHolderNameVisible: true,
            isSwipeGestureEnabled: false,
          ),
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (value){
               setState(() {
                 cardNumber=value.cardNumber;
                 cardHolderName=value.cardHolderName;
                 cvvCode=value.cvvCode;
                 expiryDate=value.expiryDate;
               });
              },
              formKey: valueKey
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SlideAction(
              sliderButtonIcon: Icon(CupertinoIcons.money_dollar,color: Colors.white,),
              submittedIcon: Icon(Icons.done),
                  innerColor: Theme.of(context).colorScheme.primary,
                  outerColor: Theme.of(context).colorScheme.secondary,
                  text: "Slide to Pay",
                  borderRadius: 8,
                  onSubmit:(){
                    showDialog(context: context, builder: (ctx)=>AlertDialog(
                      content: Text("Payment Successfull"),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      actions: [
                        IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.done,
                              color: Theme.of(context).colorScheme.primary,
                            )
                        )
                      ],
                    )
                    );
                    Navigator.pop(context);
                    return null;
                  } ,
            ),
          ),

          const SizedBox(height: 80,)
        ],
      ),
    );
  }
}

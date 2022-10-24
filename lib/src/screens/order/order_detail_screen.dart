import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/utility/button.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';

import '../../constants/constants.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      appBar: getAppBar(context),
      body: getDetail(context),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        'Order Detail',
        style: AppTextStyle.headline1.copyWith(color: whiteColor),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop(false);
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
    );
  }

  Widget getDetail(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPaddin),
          margin: const EdgeInsets.all(defaultPaddin),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultPaddin),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#221022001',
                    style: AppTextStyle.title2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Date: 12-Jan-22',
                    style: AppTextStyle.title2,
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPaddin,
              ),
              DataTable(
                columns: title(),
                rows: rows(),
                headingRowColor: MaterialStateProperty.resolveWith((states) {
                  return primaryGrayColor;
                }),
                headingRowHeight: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  color: primaryGrayColor,
                  borderRadius: BorderRadius.circular(defaultPaddin),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(defaultPaddin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: AppTextStyle.headline2,
                      ),
                      Text(
                        '8',
                        style: AppTextStyle.headline2,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: AppButton.button1('Cancel',
                    onTap: () {},
                    backgroundColor: secondGraydColor,
                    leftIcon: Icons.close),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: AppButton.button1('Accept',
                    onTap: () {}, leftIcon: Icons.done),
              ),
            ],
          ),
        )
      ],
    );
  }

  List<DataColumn> title() {
    return [
      DataColumn(
          label: Text(
        'Item',
        style: AppTextStyle.headline2,
      )),
      DataColumn(
          label: Text(
        'Qty',
        style: AppTextStyle.headline2,
      )),
      DataColumn(
          label: Text(
        'Amount',
        style: AppTextStyle.headline2,
      ))
    ];
  }

  List<DataRow> rows() {
    return [
      DataRow(cells: [
        DataCell(Text(
          'data1',
          style: AppTextStyle.title2,
        )),
        DataCell(Text(
          'data2',
          style: AppTextStyle.title2,
        )),
        DataCell(Text(
          'data3',
          style: AppTextStyle.title2,
        )),
      ]),
      DataRow(cells: [
        DataCell(Text(
          'data1',
          style: AppTextStyle.title2,
        )),
        DataCell(Text(
          'data2',
          style: AppTextStyle.title2,
        )),
        DataCell(Text(
          'data3',
          style: AppTextStyle.title2,
        )),
      ]),
      DataRow(cells: [
        DataCell(Text(
          'data1',
          style: AppTextStyle.title2,
        )),
        DataCell(Text(
          'data2',
          style: AppTextStyle.title2,
        )),
        DataCell(Text(
          'data3',
          style: AppTextStyle.title2,
        )),
      ]),
    ];
  }
}

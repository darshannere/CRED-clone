import 'Categories.dart';

final categories = [
  {
    'type': 'MONEY',
    'contents': [
      Category('mint', 'Mint', 'grow your savings, 3x faster'),
      Category('bank accounts', 'BankAccounts', 'check your bank balance'),
      Category('Scan n Pay', 'ScanNPay', 'ability to scan n pay on UPI QRs'),
    ],
  },
  {
    'type': 'BENEFITS',
    'contents': [
      Category('rewards', 'Rewards',
          'reedem coins or cashbacks, discounts and more'),
      Category('refer & earn', 'Refer',
          'assured cashback for bringingfriends to CRED'),
      Category('coins', 'Coins', 'use coinds to clain rewards and other posts'),
      Category('vouchers', 'Vouchers', 'description'),
      Category('brand offers', 'BrandOffer', 'description'),
    ],
  },
  {
    'type': 'BILLS',
    'contents': [
      Category('utility & all bills', 'Utility', 'sd'),
      Category('credi card bills', 'Credit', 'description'),
      Category('house rent', 'House', 'description'),
      Category('education fees test', 'Education', 'description'),
    ]
  }
];

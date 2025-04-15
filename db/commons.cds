namespace ayushdb.commons;
using { Currency } from '@sap/cds/common';

type Gender: String(1) enum{
    male = 'M';
    female = 'F';
    undisclosed = 'U';
}

type AmountT: Decimal(10, 2)@(
    semantic.amount.currencyCode: 'CURRENCY_CODE',
    sap.unit: 'CURRENCY_CODE' 
);

type PhoneNumber : String(15)
  @assert.pattern: {
    regex: '^\\+?[0-9]{10,15}$',
    message: 'Invalid phone number format. Use +<country_code><number>'
  }
  @title: 'Phone Number'
  @label: 'Contact Number';

type EmailAddress : String(100)
  @assert.pattern: {
    regex: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$',
    message: 'Invalid email format. Example: user@example.com'
  }
  @title: 'Email Address'
  @label: 'Email';

   
aspect Amount: {
    CURRENCY: Currency;
    NET_AMOUNT: AmountT @(title: 'Net Amount');
    GROSS_AMOUNT: AmountT @(title: 'Gross Amount');
    TAX_AMOUNT: AmountT @(title: 'Tax Amount');
}

type Guid : String(32);



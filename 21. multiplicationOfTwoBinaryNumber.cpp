#include <iostream>
#include <bits/stdc++.h>
using namespace std;

int binaryToDecimal(int binary)
{
    int decimal = 0, remainder, product = 1;
    while (binary != 0)
    {
        remainder = binary % 10;
        decimal = decimal + (remainder * product);
        binary = binary / 10;
        product *= 2;
    }
    return decimal;
}

int main()
{
    int multiplier, multiplicand, n = 16;

    cout << "Enter Multiplier : ";
    cin >> multiplier;
    int multiplierInDecimal = binaryToDecimal(multiplier);

    cout << "Enter Multiplicand : ";
    cin >> multiplicand;
    int multiplicandInDecimal = binaryToDecimal(multiplicand);

    bitset<8> mcand(multiplicandInDecimal);
    bitset<8> mplier(multiplierInDecimal), prod;

    for (int i = 0; i < n; i++)
    {
        if (mcand[0] == 1)
        {
            int carry = 0;
            for (int i = 0; i < n; i++)
            {
                bitset<2> result(prod[i] + mplier[i] + carry);
                prod[i] = result[0];
                carry = result[1];
            }
        }
        mcand >>= 1;
        mplier <<= 1;
    }
    cout << "The product in Binary : " << prod << endl;
    cout << "The product in Decimal : " << prod.to_ulong() << endl;
    return 0;
}

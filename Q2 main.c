#include <msp430.h> 


/**
 * main.c
 */
int sum(int One, int Two);
//float b = 1.3;

void main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    __delay_cycles(1);
    int a = 0b1000000000000000;
    __delay_cycles(1);
    int b = 0b1000100010001000;

    int overflow;

    overflow = sum(a,b);


    while(1);

    return 0;
}

int sum(int One, int Two)
{
    return One + Two;
}

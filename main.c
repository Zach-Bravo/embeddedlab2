#include <msp430.h> 

float b = 1.3;

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	__delay_cycles(1);

    unsigned char c = 0x0f;
    unsigned char d = 0x0a;

    int a = 3;

    a += 1;

    b -= 1;

    if(c | d)
    {
        c = d;
        d = 0;
    }

    if(c & d)
    {
        c = -d;
        d = d * 2;
    }

    while(1);

    return 0;
}

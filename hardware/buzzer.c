#include<LPC214x.h>
void delay(unsigned long int);
void main()
{
    unsigned int number=0x01000000;
    IO1DIR=0x0F000000;
    while(1)
    {
        if((IO0PIN & 0x00008000))
        {
            while(!(IO0PIN & 0x00008000));
            IO1SET=number;
            delay(200);
            IO1CLR=number;
            delay(200);
        }

        else if((IO0PIN & 0x00008000))
        {
            while((IO0PIN & 0x00008000));
            IO1CLR=number;
        }
    }
}
void delay(unsigned long int count1)
{
    while(count1 > 0)
    {
        count1--;   // Loop Decrease Counter
    }
}

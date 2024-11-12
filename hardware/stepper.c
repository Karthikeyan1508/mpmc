#include <LPC214X.h>
void  delay();

void delay()
{
    int i,j;
    for(i=0; i<0xff; i++)
        for(j=0; j<0x25; j++);
}

int main()
{
    IO0DIR=0x000F0000;
    while(1)
    {
        IO0PIN=0x00080000;
        delay();
        IO0PIN=0x00040000;
        delay();
        IO0PIN=0x00020000;
        delay();
        IO0PIN=0x00010000;
        delay();
    }
}



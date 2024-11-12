#include <LPC214x.H>
void delay_led(unsigned long int);
int main(void)
{
    IO0DIR = 0x000007FC;
    while(1)
    {
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000604;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x000007E4;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000648;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000618;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000730;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000690;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000680;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x0000063C;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000600;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000630;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000620;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000780;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x000006C4;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000708;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x000006C0;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
        IO0SET = 0x000006E0;
        delay_led(150000);
        IO0CLR = 0x00000FFF;
    }
}
void delay_led(unsigned long int count1)
{
    while(count1 > 0)
    {
        count1--;
    }
}

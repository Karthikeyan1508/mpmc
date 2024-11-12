#include<lpc21xx.h>
int main()
{
  int a=3, b=7, and, or, xor,not;
  and=a&b;
  or=a|b;
  xor=a^b;
  not=~a;
  return 0;
}

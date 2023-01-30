#include <stdio.h>
// SOLUTION FILE

main()
{
  int var_int;                    // 2
  char var_char;
  double var_dub;

  unsigned char uchar1, uchar2;   // 3
  signed char schar1, schar2;

  int x, y;                       // 4

  char i;                         // 5
  char shift_char;

  int a[10] = {0,10,20,30,40,50,60,70,80,90};    // 6

  int b[10], c[10];               // 7
  int *ip, *ip2;
  int j, k;

  char AString[] = "HAL";           // 8

  // 1 -- change "World" to your name
  printf("\n\n PART 1 ---------\n");

  printf("\n Hello Nicholas! \n");

  // 2 -- find sizes of the other C datatypes
  printf("\n\n PART 2 ----------\n");

  var_int = 21;
  var_char = 'a';
  var_dub = 21.0;

  printf("\n size of data type int = %d ", sizeof(var_int));
  printf("\n size of data type int = %d ", sizeof(var_char));
  printf("\n size of data type int = %d ", sizeof(var_dub));

  // 3 -- explore signed versus unsigned datatypes and their interactions
  printf("\n\n PART 3 ----------\n");

  uchar1 = 0xFF;
  uchar2 = 0xFE;
  schar1 = 0xFF;
  schar2 = 0xFE;

  printf("\n uchar1 = %d ", uchar1);
  printf("\n schar1 = %d ", schar1);

  // uchar1 and schar1 have different outputs becuase they were intialized as different variable types. schar is a signed integer so it is represented in 2s complement so if the first bit is a 1 then the value is negative.

  

  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;



  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");

  shift_char = 15;
  i = 1;

  printf("\n shift_char << %d = %d", i, shift_char << i);


  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = a;
  printf("\nstart %d %d %d %d %d %d %d \n",
	 a[0], *(ip), *(ip+1), *ip++, *ip, *(ip+3), *(ip-1));


  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n");


  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  printf("\n %s \n", AString);



  // 9 -- address calculation
  printf("\n\n PART 9 ----------\n");
  for (k = 0; k < 10; k++) b[k] = a[k];         // direct reference to array element

  ip = a;
  ip2 = b;
  for (k = 0; k < 10; k++) *ip2++ = *ip++;     // indirect reference to array element

  // all done
  printf("\n\n ALL DONE\n");
}
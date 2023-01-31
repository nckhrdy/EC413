#include <stdio.h>
#include <string.h>
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

  char AString[] = "HAL 60";           // 8

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

  uchar1 = 0xFF; //255
  uchar2 = 0xFE; //254
  schar1 = 0xFF; //-1
  schar2 = 0xFE; //-2

  printf("\n uchar1 = %d ", uchar1);
  printf("\n schar1 = %d ", schar1);
  //printf("\n schar1 = %d ", schar2);

  // uchar1 and schar1 have different outputs becuase they were intialized as different variable types. schar is a signed integer so it is represented in 2s complement so if the first bit is a 1 then the value is negative.

 //compare uchar
  if ( uchar1 > uchar2 ) {
    printf("\n uchar1 is larger ");
  }
  else {
    printf("\n uchar2 is larger ");
  }
  if ( uchar1 == uchar2 )
  {
    printf("\n uchar1 and uchar2 have the same value ");
  }

  //compare schar
  if ( schar1 > schar2 ) {
    printf("\n schar1 is larger ");
  }
  else {
    printf("\n schar2 is larger ");
  }
  if ( schar1 == schar2 )
  {
    printf("\n schar1 and schar2 have the same value ");
  }

  //compare mix of schar and uchar
  if ( uchar1 > schar1 ) {
    printf("\n uchar1 is larger ");
  }
  else {
    printf("\n schar1 is larger ");
  }

  //adding schar and uchar
  printf("\n The sum of schar1 and schar2 = %d ", (schar1 + schar2));
  printf("\n The sum of uchar1 and uchar2 = %d ", (uchar1 + uchar2));

  //The output of these operations is what I expected as if it is a signed int, then it is adding adding the to values but one is negated which acts as subtraction
  printf("\n The sum of schar1 and uchar1 = %d ", (schar1 + uchar1));
  //The output is what I expected the addition to be. It added the two values with one being negated which acted as a subtraction

  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;
  //false output
  printf("\n Boolean False = %d ", (x == y));
  // true output
  printf("\n Boolean True = %d ", (x != y));
  // size of boolean expression
  printf("\n Boolean Size = %d bytes", sizeof(x == y));

  //& v && operators
  printf("\n Boolean & = %d ", (x & y));
  printf("\n Boolean && = %d ", (x && y));

  //~ v ! operators
  printf("\n Boolean ~ = %d ", (~x)); //not 01 = 10
  printf("\n Boolean ! = %d ", (!x)); //not x = 0
  

  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");

  shift_char = 15;
  i = 2;

  printf("\n shift_char << %d = %d", i, shift_char << i); //shifting bits left 2
  printf("\n shift_char << %d = %d", i, shift_char >> i); //shifting bits right 2

  //shift larger than 3
  printf("\n shift_char << %d = %d", i, shift_char << 4); 

  //if you shift left more than 3 places you are simply appending 0s to the binary value

  //shift larger than 7
  printf("\n shift_char << %d = %d", i, shift_char << 8);

  //value again increases, if you shift more than 3 or 7 to the right you will reach 0 

  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = a;
  printf("\nstart %d %d %d %d %d %d %d \n",
	 a[0], *(ip), *(ip+1), *ip++, *ip, *(ip+3), *(ip-1));

  //want  (10 10 20 10 20 50 10)

  //new shifted array using pointers
  printf("\nstart %d %d %d %d %d %d %d \n",
	 (a[0])+10, *(ip), *(ip+1), *ip++, *ip, *(ip+3), *(ip-1));

  printf("\n The size of the integer pointer data type is %d ", sizeof(&ip));

  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n\n");

  //reverse using No pointers
  int n = 10;
  for (int i = 0, j = n - 1; i < n / 2; i++, j--)
  {
    int temp = a[i];
    b[j] = a[i];
    b[i] = a[j];
    a[j] = temp;
  }
  //printing b[]
  for (int i = 0; i < n; i++) {
    printf(" %d ", b[i]);
  }

  //reverse using pointers
  int *start = a;
  int *end = a + n - 1;
  int *cstart = c + n - 1;

  while (start <= end) {
    *cstart = *start;
    start++;
    cstart--;
  }

  for (int i = 0; i < n; i++)
  {
    printf("%d ", c[i]);
  }

  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  for (int i = 0; i <= strlen(AString); i++)
  {
    printf("%c = %d \n ", AString[i]+1, AString[i]+1);
  }


  printf("\n %s \n", AString);

  //inside the for loop, iterating up until the last slot of the array we see that the value 0 is output. The value 0 is stored at the end of the char array to serve as a terminator 

  //adding 1 to each character changes the letter and value tht is then output

  //adding 60 after the last char results in the addition of a letter after the null character

  for (int i = 0; i <= strlen(AString); i++)
  {
    printf("%c = %d \n ", AString[i], AString[i]);
    if ( i == strlen(AString))
    {
      printf("%c = %d \n", AString[i - 1] + 60, AString[i - 1] + 60);
    }
  }

  // 9 -- address calculation
  printf("\n\n PART 9 ----------\n");
  for (k = 0; k < 10; k++) b[k] = a[k];         // direct reference to array element

  ip = a;
  ip2 = b;
  for (k = 0; k < 10; k++) {
    *ip2++ = *ip++;
    printf("\n %d , %d ", &ip, &ip2);
  } // indirect reference to array element

  // all done
  printf("\n\n ALL DONE\n");
}
#include <stdio.h>


int main()
{

    unsigned int A[] = {0, 100, 200}; /* Initialize array A, 4 byte elements*/

    printf("Storage size for int : %d bytes \n", sizeof(int));

    unsigned int *temp0, *temp1; /* Declare pointer variables */

    temp0 = (unsigned int *) &A + 1; /* Address of A[1] to temp0 */

    printf("A[1] = %d \n", *temp0);


    
temp1 = &A; /* Address of A[0] to temp1 */

    printf("A[0] = %d \n", *temp1);



    A[1] = temp1; /* store temp1 to A[1] */

    printf("temp1 = %d \n", temp1);



    temp0 = A[1]; /* load A[1] to temp0 */

    printf("temp0 = %d \n", temp1);



    unsigned int f = (unsigned int) temp0 + (unsigned int) temp1;

    printf("f = %d \n", f); /* set f equal to temp1 + temp2 */


    
return 0;

}
#include<stdio.h>
#include<stdlib.h>

/* Contents of the file sos.c */
/* Calculates the square of integer X */

int sq (int x) {
	return x*x;
}

/* Calculates the sum of squares of a integers Y and Z */

int sos (int y, int z) {
	return sq(y) + sq(z);
}

/* Reads two integer inputs from command line
and displays result of SOS program */
int main (int argn, char** argv) {

	int a = atoi(argv[1]);
	int b = atoi(argv[2]);
	printf("sos(%i,%i)=%i\n", a, b, sos(a,b));

}

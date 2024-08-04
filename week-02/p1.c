#include<stdio.h>
#include<stdlib.h>

int main (int argn, char** argv) {

	int i; /* uninitialized integer variable */
	int j = 42;
	int k = -1;
	int a[3] = {17,342,-273};
	float f = 1234.5678;
	int* p = &j; /* &a denotes the address of a in memory. */
	char* s = "abcdefg";

	/**********************************************************************/
	/* Typical things we expect to do: */

	printf("-----------------------------------------------------------\n");
	printf("i = %i (signed int); %u (unsigned int); %x (hex);\n\n", i, i, i);
	printf("j = %i (signed int); %u (unsigned int); %x (hex);\n\n", j, j, j);
	printf("k = %i (signed int); %u (unsigned int); %x (hex);\n\n", k, k, k);

	for (i=0; i<3; i++) {
		printf("a[%i] = %i (signed int); %u (unsigned int); %x (hex);\n", i, a[i], a[i], a[i]);
	}

	printf("i = %i (signed int); %u (unsigned int); %x (hex);\n\n", i, i, i);
	printf("f = %f (floating point); %e (scientific notation);\n\n", f, f);

	/* p denotes the address of an integer variable; *p denotes its contents */
	printf("p = %u (unsigned int); %x (hex);\n", p, p);
	printf("*p = %i (signed int); %u (unsigned int); %x (hex);\n\n", *p, *p, *p);

	/* s denotes the address of an char/string variable; *s denotes its contents */
	printf("s = %u (unsigned int); %x (hex); %s (string);\n", s, s, s);
	printf("*s = %c (char);\n\n", *s);

	/* More printf statements will be added here later */
	
}

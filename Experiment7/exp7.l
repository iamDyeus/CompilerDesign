/* PROBLEM STATEMENT 7: Design a LEX Code to remove the comments from any C-Program (in.c ) given at run time and store into ‘out.c’ file. */
%{
    #include <stdio.h>
    #include <stdlib.h>
    int count = 0; // To count comments
%}
%%
"//".*   { count++; }
"/*"[^*]*"*"*[^*/]*"*/" { count++; }
.|\n    { fprintf(yyout, "%s", yytext);
	  printf ("%s",yytext); }

%%
int yywrap() {
    return 1;
}
int main() {
    FILE *f1, *f2;
    f1 = fopen("inp.c", "r");
    if (!f1) {
        printf("Error: Cannot open input file.\n");
        return 1;
    }
    yyin = f1; 
    f2 = fopen("out.c", "w");
    if (!f2) {
        printf("Error: Cannot open output file.\n");
        fclose(f1);
        return 1;
    }
    yyout = f2;  
    yylex();
    printf("The number of comments removed: %d\n", count);
    fclose(f1);
    fclose(f2);

    return 0;
}

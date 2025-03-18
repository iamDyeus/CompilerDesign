/*  Design a LEX Code to count and print the number of total characters, words, white spaces, and lines in a given 'Input.txt' file.  */

%{
#include <stdio.h>
#include <stdlib.h>

FILE *yyin, *yyout;    
int tc = 0; // total character count
int wc = 0; // words count
int ws_c = 0; // white space count
int lc = 0; // line count
%}

%%
[a-zA-Z]+   { wc++; tc += yyleng; }
[ \t]       { ws_c++; tc++; }
\n          { lc++; tc++; }
[^0-9a-zA-Z \t] { tc++; }
.           { tc++; }
%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Usage: %s <input file> <output file>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    yyout = fopen(argv[2], "w");
    
    if (!yyin || !yyout) {
        printf("Error opening file(s)\n");
        return 1;
    }
    
    yylex();
    
    fprintf(yyout, "Total Characters: %d\n", tc);
    fprintf(yyout, "Total Lines: %d\n", lc);
    fprintf(yyout, "Total Words: %d\n", wc);
    fprintf(yyout, "Total White Spaces: %d\n", ws_c);
    
    fclose(yyin);
    fclose(yyout);
    
    return 0;
}
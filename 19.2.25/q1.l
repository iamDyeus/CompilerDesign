%{
#include <stdio.h>

extern FILE *yyin;
%}

%%

"<"[^<>]*">"  ;   // Ignore HTML-like tags
.             { putchar(yytext[0]); } // Print other characters

%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Error opening file");
        return 1;
    }

    yylex();  // Process the file

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}
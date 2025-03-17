%{
    #include <stdio.h>
    #include <string.h>

    extern FILE *yyin;
    void printToken(const char* type, const char* value);
%}

%%
"int"|"float"|"while"|"if"|"else"  { printToken("KEYWORD", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*=   { printToken("IDENTIFIER", yytext); }
[{}();,]    { printToken("SEPARATOR", yytext); }
[ \t\n]     { /* Ignore */ }
.           { /* Ignore other symbols */ }
%%

void printToken(const char* type, const char* value) {
    printf("%s: %s\n", type, value);
}

int yywrap() {
    return 1;
}

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

    printf("Tokenizing input file...\n");
    yylex();

    fclose(yyin);
    return 0;
}

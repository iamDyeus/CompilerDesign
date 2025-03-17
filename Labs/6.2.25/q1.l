%{
#include <stdio.h>
%}

%%
[A-Za-z]+    { printf("Your name is: %s\n", yytext); }
.            { /* Ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter your name: ");
    yylex();
    return 0;
}


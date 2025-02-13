/*
Write a lex program for valid identifier from a given input. 
[a-zA-Z0-9_]+
*/

/* Definition section */
%{
    #include <stdio.h>
    #include <stdbool.h>

    bool isValid = false;
%}

/* Rules section */
%%
[a-zA-Z_][a-zA-Z0-9_]*   { 
    printf("Valid Identifier: %s\n", yytext);
}
.                        { 
    printf("Invalid Character: %s\n", yytext); 
}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter Input: ");
    yylex();
    
    if(isValid) 
        printf("Valid Identifiers Found.\n");
    else        
        printf("No Valid Identifiers Found.\n");
    
    return 0;
}

/* Lex program to validate email addresses */

%{
    #include <stdio.h>
    #include <stdbool.h>

    bool isValid = false;
%}

/* Rules section */
%%
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6} { 
    printf("Valid Email: %s\n", yytext);
    isValid = true;
}
.   { /* Ignoring invalid characters */ }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter Input: ");
    yylex();
    
    if (isValid) 
        printf("Valid Emails Found.\n");
    else 
        printf("No Valid Emails Found.\n");

    return 0;
}

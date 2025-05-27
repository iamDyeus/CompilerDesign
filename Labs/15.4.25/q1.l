%{
#include <stdio.h>

char c1, c2, c3;
%}

%s S1 S2 S3

%%

<INITIAL>[ab]     { c1 = yytext[0]; BEGIN(S1); }
<S1>[ab]          { c2 = yytext[0]; BEGIN(S2); }
<S2>[ab]          { c3 = yytext[0]; BEGIN(S3); }
<S3>[ab]          { c1 = c2; c2 = c3; c3 = yytext[0]; }
\n                {
                    if (c1 == 'a')
                        printf("Accepted\n");
                    else
                        printf("Rejected\n");
                    BEGIN(INITIAL);
                 }

.                 { }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}


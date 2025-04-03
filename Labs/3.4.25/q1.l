%{
#include <stdio.h>
%}

%s A B INV

%%

<INITIAL>1 { BEGIN(A); }
<INITIAL>0 { BEGIN(B); }
<INITIAL>[^O|^1|^\n] { BEGIN(INV); }
<INITIAL>\n { BEGIN(INITIAL); printf("NOT ACCEPTED\n"); }

<A>[0|1] { BEGIN(A); }	
<A>[^O|^1|^\n] { BEGIN(INV); }
<A>\n { BEGIN(INITIAL); printf("ACCEPTED\n"); }

<B>[0|1] { BEGIN(B); }
<B>[^O|^1|^\n] { BEGIN(INV); }
<B>\n { BEGIN(INITIAL); printf("NOT ACCEPTED\n"); }

<INV>[^\n] { BEGIN(INV); }
<INV>\n { BEGIN(INITIAL); printf("INVALID\n"); }

%%

int main() {
    printf("Enter binary input (Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
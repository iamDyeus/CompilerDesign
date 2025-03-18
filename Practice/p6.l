/* Check for EVEN A and EVEN B in a DFA using regular expression */

%{
# include "stdio.h"
# include "stdlib.h"    
%}

%%
^(aa|bb|(ab|ba)(aa|bb)*(ab|ba))*$    {printf("\nString Accepted!\n");}
.*  {printf("String Rejected!");}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
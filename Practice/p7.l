/* Check for EVEN A and EVEN B in a DFA using regular expression uisng File Handling */

%{
# include "stdio.h"
# include "stdlib.h"    
FILE *yyout;
%}

%%
^(aa|bb|(ab|ba)(aa|bb)*(ab|ba))*$    {fprintf(yyout,"\nString Accepted : %s\n",yytext);}
.*  {fprintf(yyout,"String Rejected : %s",yytext);}
%%

int main(int argc, char * argv[]){
    yyout = fopen("p7-output.txt","w");
    yylex();
    fclose(yyout);
    return 0;
}

int yywrap(){
    return 1;
}
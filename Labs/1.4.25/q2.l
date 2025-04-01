%{
    # include "stdio.h"
    # include "stdlib.h"
    int isEvenA = 0;
    int isEvenB = 0;
%}


%%
"a" {
    if (isEvenA==1) {
        isEvenA = 0;
    } else {
        isEvenA = 1;
    }
}
"b" {
    if (isEvenB==1) {
        isEvenB = 0;
    } else {
        isEvenB = 1;
    }
}
%%


int main(){
    yylex();
    if (isEvenA==0 && isEvenB==0) {
        printf("String Accepted\n");
    } else {
        printf("String Rejected\n");
    }
    return 0;
}

int yywrap(){
    return 1;
}
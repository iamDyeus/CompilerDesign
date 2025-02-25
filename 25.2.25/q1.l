%{
    # include "stdio.h"
    // extern FILE *yyin;
    int countA=0, countB=0;
    
%}

%%
"aA" {countA++;}
"bB" {countB++;}
.    {/* Ignore any other */}
%%

int yywrap(){return 1;}

// int main(int argc, char *argv[]){
//     if (argc < 2) {
//         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
//         return 1;
//     }

//     yyin = fopen(argv[1], "r");
//     if (!yyin) {
//         perror("Error opening file");
//         return 1;
//     }

//     yylex();

//     fclose(yyin);
//     return 0;
// }

int main(){
    printf("Enter Your String -->\n>> ");
    yylex();
    if(countA % 2 == 0 && countB % 2 == 0){
        printf("String Accepted!\n");
    } else printf("String Rejected!\n");
    return 0;
}
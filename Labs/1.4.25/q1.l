%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    FILE *yyout;
%}

%%

"<"[^>]+">"      { printf("Removed opening tag: %s\n", yytext); }  
"</\\s*[^>]+\\s*>" { printf("Removed Closing tag: %s\n", yytext); }  
.                { 
                     fprintf(yyout, "%s", yytext);  
                 }

%%

int main() { 

    yyout = fopen("p1-output.txt", "w");
    if (!yyout) {
        perror("Error opening output file");
        return 1;
    }

    yylex();

    fclose(yyout);

    return 0;
}

int yywrap() {
    return 1;
}

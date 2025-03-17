%{
    #include<stdio.h>
    #include<string.h>
    char key[100] = "", op[100] = "", sep[100] = "", iden[100] = "";  
    int check_unique(char [],char [], int);
%}

%%

"int"|"float"|"while"|"if"|"else" {
    if(!check_unique(key,yytext,yyleng)){
        strcat(key," ");
        strcat(key,yytext);
    };
}

"+"|"="|"<="|"=="|"*"|"++" {
    if(!check_unique(op,yytext,yyleng)){
        strcat(op," ");
        strcat(op,yytext);
    };
}

"{"|"}"|";"|"("|")" {
    if(!check_unique(sep,yytext,yyleng)){
        strcat(sep," ");
        strcat(sep,yytext);
    };
}

[a-zA-Z_][a-zA-Z_0-9]* {
    if(!check_unique(iden,yytext,yyleng)){
        strcat(iden," ");
        strcat(iden,yytext);
    };
}

%%

int yywrap(){
    return 1;
}

int check_unique(char arr[],char text[],int len){
    int i,j;
    int arr_len = strlen(arr);
    for(i = 0; i <= arr_len - len; i++){
        if(arr[i] == text[0]){
            for(j = 1; j < len; j++){
                if(arr[i + j] != text[j])
                    break;
            }
            if(j == len && (arr[i + j] == ' ' || arr[i + j] == '\0')){
                return 1; // Found match
            }
        }
    }
    return 0; // No match found
}

int main(){
    yylex();
    printf("\nKeywords : ");
    puts(key);
    printf("\nOperators : ");
    puts(op);
    printf("\nSeparators : ");
    puts(sep);
    printf("\nIdentifiers : ");
    puts(iden);
    return 0;
}

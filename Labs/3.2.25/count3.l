%{
    int count=0;
%}

%% 
.   {
        if (count %2 ==0) putchar(yytext[0]);
        count++;
    }
%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}

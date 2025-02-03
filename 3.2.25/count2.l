%{
    int count=0;
%}

%% 
[a-zA-Z+] {count++;}
%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    printf("Number of Characters: %d\n",count);
    return 0;
}
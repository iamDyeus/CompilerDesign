%{
    #include<stdio.h>
    #include<string.h>
    char res[100] = ""; 
%}
%%
[ ]+        {strcat(res,"_");}  
.           {strcat(res,yytext);}
%%

int yywrap(){
    return 1;
}

int main(){
    FILE* ptr = fopen("in.txt","r");
    FILE* itr = fopen("out.txt","w");
    if(!ptr || !itr){
        printf("Error Opening File\n");
        return 0;
    } 
    yyin = ptr;
    yylex(); 
    fprintf(itr,"%s",res);
    fclose(itr);
    fclose(ptr);
    return 0;
}
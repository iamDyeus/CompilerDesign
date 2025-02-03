%{
int a = 0;
int b = 0;
int c = 0;
int d = 0; 
%}


%%

\n             { a++; }    
[ ]            { b++; }   
[ \t]          { c++; }  
.              { d++; }    

%%
int yywrap(){
    return 1;
}
int main() {
    yylex();
    printf("Newlines: %d\n", a);
    printf("Spaces: %d\n", b);
    printf("Tabs: %d\n", c);
    printf("Characters: %d\n", d);
    return 0;
}

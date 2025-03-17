/* Design a LEX Code to count the number of lines, space, tab-meta character, and rest of characters in each Input pattern. */

%{
    # include "stdio.h"
    int lines=0, spaces=0, tabs=0 , rest=0;
%}

%%  
\n    {lines++;}  
" "   {spaces++;}  
\t    {tabs++;}  
.     {rest++;}  
%%

int yywrap(){ return 1; }

int main(){
    yylex();
    printf("Lines: %d,\nTabs: %d,\nSpaces: %d,\nRest Characters: %d,\n", lines, tabs, spaces, rest);
    return 0;
}
